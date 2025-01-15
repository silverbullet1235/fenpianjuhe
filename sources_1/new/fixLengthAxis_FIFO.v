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

// 有改动


module fixLengthAxis_FIFO #(
	parameter   DATA_IN_WIDTH   = 32                    ,// 32位
				BYTE_NUM_IN     = DATA_IN_WIDTH/8       ,// 8B
				DATA_OUT_WIDTH  = 32                    ,// 32位
				BYTE_NUM_OUT    = DATA_OUT_WIDTH/8       ,// 8B
				DATA_IN_DEPTH   = 8192                  ,// 8192
				FIFO_DEPTH_WIDTH= $clog2(DATA_IN_DEPTH) //13 二为底的对数上取整
) (
	input                               clk             ,
	input                               rst_n           ,
	input   [FIFO_DEPTH_WIDTH+1:0]      frameLength     ,
	input   [DATA_IN_WIDTH-1:0]         Din             ,
	input                               Din_valid       ,
	output  [DATA_OUT_WIDTH-1:0]        o_axis_tdata    ,
	output  [BYTE_NUM_OUT-1:0]          o_axis_tkeep    ,
	output                              o_axis_tvalid   ,
	output                              o_axis_tlast    ,// 最后一个时钟周期标志
	input                               o_axis_tready    // 准备信号，由下游模块驱动，表示是否准备好接收数据。
);

wire    [DATA_OUT_WIDTH-1:0]    Dout                ;
wire    [FIFO_DEPTH_WIDTH-1:0]  fifoCount           ;// FIFO 中当前存储的数据量
reg     [FIFO_DEPTH_WIDTH+1:0]  frameLength_reg     , frameLength_temp  ;
reg     [31:0]                  fifoDoutCount       , fifoDoutCount_reg ;// fifoDoutCount跟踪已输出的字节数，用于判断是否达到帧结束

always @(posedge clk ) begin
	frameLength_reg     <= &frameLength ? frameLength_reg : frameLength      ;// 当frameLength为全1时，frameLength_reg不更新为frameLength的值
	// if( &frameLength && ~&frameLength_reg ) frameLength_temp <= frameLength_reg ;
	if( !rst_n ) begin
		fifoDoutCount      <= 32'hFFFFFFFF      ;
		fifoDoutCount_reg  <= 'd0               ;
	end else begin
		if( { fifoCount, 2'd0} < frameLength && ~|fifoCount[FIFO_DEPTH_WIDTH-1-:3] && fifoDoutCount >= frameLength )//fifoCount最高的3位全为0，fifoCount*4小于frameLength,fifoDoutCount却大于等于frameLength （fifoCount最高的3位全为0，fifoCount*4小于frameLength）这位两部分的条件存在的原因是什么
			fifoDoutCount  <= 32'hFFFFFFFF      ;
		// else if( fifoDoutCount < frameLength && ~&frameLength || fifoDoutCount < frameLength_reg && &frameLength && o_axis_tready ) //fifoDoutCount小于frameLength且frameLength中有0，或者fifoDoutCount小于frameLength_reg，且frameLength为1，且下游模块准备好接收数据
		else if( fifoDoutCount < frameLength && ~&frameLength || fifoDoutCount < frameLength_reg && &frameLength && o_axis_tready ) // 此处条件有点不对，查一下前半部分条件与o_axis_tready的联系
				// 此处条件为rd_en拉高
			fifoDoutCount   <= fifoDoutCount + 32'd4  ;
		else if( { fifoCount, 2'd0} >= frameLength )    fifoDoutCount   <= 'd0                              ;
		else                                            fifoDoutCount   <= fifoDoutCount                    ;
		fifoDoutCount_reg  <= fifoDoutCount ;
	end
end

// always @(posedge clk ) begin
//     if( !rst_n ) begin
//         fifoDoutCount      <= 'd0      ;
//         fifoDoutCount_reg  <= 'd0      ;
//     end else begin
//         if( |fifoDoutCount )                                fifoDoutCount      <= fifoDoutCount - (|fifoDoutCount && o_axis_tready) ;
//         else if( fifoCount >= frameLength && Din_valid )    fifoDoutCount      <= frameLength                                       ;
//         else                                                fifoDoutCount      <= fifoDoutCount                                     ;
//         fifoDoutCount_reg  <= fifoDoutCount ;
//     end
// end

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
	// .rd_en       ( |fifoDoutCount && o_axis_tready       ), //i
	.Dout        ( Dout                 ), //o
	.fifo_full   (                      ), //o
	.fifo_empty  (                      ), //o
	.fifo_count  ( fifoCount            )  //o
);

assign o_axis_tdata  = Dout                                                         ;
assign o_axis_tkeep  = 'b1111                                                       ;
// assign o_axis_tvalid = fifoDoutCount_reg < frameLength && o_axis_tready                          ;
assign o_axis_tvalid = (fifoDoutCount_reg < frameLength && ~&frameLength || fifoDoutCount_reg < frameLength_reg && &frameLength) && o_axis_tready                          ;
// assign o_axis_tlast  = (fifoDoutCount_reg == frameLength - 4 && fifoDoutCount == frameLength) && o_axis_tready ;
assign o_axis_tlast  = (fifoDoutCount_reg == frameLength - 4 && fifoDoutCount == frameLength || &frameLength && fifoDoutCount == frameLength_reg) && o_axis_tready && o_axis_tvalid ;
// assign o_axis_tvalid = |fifoDoutCount_reg && o_axis_tready                          ;
// assign o_axis_tlast  = fifoDoutCount_reg == 'd1 && ~|fifoDoutCount && o_axis_tready ;
endmodule