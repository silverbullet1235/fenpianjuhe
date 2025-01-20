`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/20 08:23:23
// Design Name: 
// Module Name: fixLengthAxis_FIFO
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
/* 写入逻辑：Din_valid为高时，输入数据写入 FIFO
数据读取逻辑：输出数据时，根据 fifoDoutCount 和 frameLength 判断是否允许读取；在 fifoDoutCount 小于 frameLength 时，允许输出数据并增加 fifoDoutCount。
当 fifoDoutCount 达到 frameLength 时，设置 o_axis_tlast，标记当前帧结束。
根据 o_axis_tready 控制输出，确保下游模块准备好接收数据时才发送 */
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module fixLengthAxis_FIFO #(
	parameter   DATA_IN_WIDTH   = 32                    ,
				BYTE_NUM_IN     = DATA_IN_WIDTH/8       ,
				DATA_OUT_WIDTH  = 32                    ,
				BYTE_NUM_OUT    = DATA_OUT_WIDTH/8      ,
				DATA_IN_DEPTH   = 8192                  ,
				FIFO_DEPTH_WIDTH= $clog2(DATA_IN_DEPTH)
) (
	input                               clk             ,
	input                               rst_n           ,
	input   [FIFO_DEPTH_WIDTH+1:0]      frameLength     ,
	input   [DATA_IN_WIDTH-1:0]         Din             ,
	input                               Din_valid       ,
	output  [DATA_OUT_WIDTH-1:0]        o_axis_tdata    ,
	output  [BYTE_NUM_OUT-1:0]          o_axis_tkeep    ,
	output                              o_axis_tvalid   ,
	output                              o_axis_tlast    ,
	input                               o_axis_tready    
);

wire    [DATA_OUT_WIDTH-1:0]    Dout                ;
wire    [FIFO_DEPTH_WIDTH-1:0]  fifoCount           ;
reg     [FIFO_DEPTH_WIDTH+1:0]  frameLength_reg     , frameLength_temp  ;
reg     [31:0]                  fifoDoutCount       , fifoDoutCount_reg ;

always @(posedge clk ) begin
	frameLength_reg     <= &frameLength ? frameLength_reg : frameLength      ;
	if( !rst_n ) begin
		fifoDoutCount      <= 32'hFFFFFFFF      ;
		fifoDoutCount_reg  <= 'd0               ;
	end else begin
		if( { fifoCount, 2'd0} < frameLength && ~|fifoCount[FIFO_DEPTH_WIDTH-1-:3] && fifoDoutCount >= frameLength )
			fifoDoutCount  <= 32'hFFFFFFFF      ;
		else if( fifoDoutCount < frameLength && ~&frameLength || fifoDoutCount < frameLength_reg && &frameLength && o_axis_tready )
			fifoDoutCount   <= fifoDoutCount + 32'd4  ;
		else if( { fifoCount, 2'd0} >= frameLength )    fifoDoutCount   <= 'd0                              ;
		else                                            fifoDoutCount   <= fifoDoutCount                    ;
		fifoDoutCount_reg  <= fifoDoutCount ;
	end
end
xpmFifoSync #(
	.WRITE_DATA_WIDTH  ( DATA_IN_WIDTH      ),
	.READ_DATA_WIDTH   ( DATA_OUT_WIDTH     ),
	.FIFO_WRITE_DEPTH  ( DATA_IN_DEPTH      ),
	.FIFO_DEPTH_WIDTH  ( FIFO_DEPTH_WIDTH   )
) u_xpmFifoSync_frame (
	.clk         ( clk                  ), //i
	.rst_n       ( rst_n                ), //i
	.Din         ( Din                  ), //i
	.wr_en       ( Din_valid            ), //i
	.rd_en       (  fifoDoutCount < frameLength && ~&frameLength || fifoDoutCount < frameLength_reg && &frameLength && o_axis_tready  ), //i
	.Dout        ( Dout                 ), //o
	.fifo_full   (                      ), //o
	.fifo_empty  (                      ), //o
	.fifo_count  ( fifoCount            )  //o
);
assign o_axis_tdata  = Dout                                                         ;
assign o_axis_tkeep  = 'b1111                                                       ;
assign o_axis_tvalid = (fifoDoutCount_reg < frameLength && ~&frameLength || fifoDoutCount_reg < frameLength_reg && &frameLength) && o_axis_tready                          ;
assign o_axis_tlast  = (fifoDoutCount_reg == frameLength - 4 && fifoDoutCount == frameLength || &frameLength && fifoDoutCount == frameLength_reg) && o_axis_tready && o_axis_tvalid ;
endmodule