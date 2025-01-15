`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/12 17:54:51
// Design Name: 
// Module Name: fpjhRece
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fpjhRece (
    input wire         clk,             
    input wire         rst,             
    
    // 输入AXIS接口
	input wire				i_axis_tvalid	,
    input wire		[31:0]	i_axis_tdata	,    
    input wire		[3:0]	i_axis_tkeep	,    
    input wire				i_axis_tlast	,    
    output wire				i_axis_tready	,   
    
    // 输出AXIS接口
    output wire				o_axis_tvalid	,
    output wire		[31:0]  o_axis_tdata	,
    output wire		[3:0]   o_axis_tkeep	,
    output wire				o_axis_tlast	,
    input wire				o_axis_tready	,
    output reg		[31:0]	o_length = 'd0	
);

reg 		Dy1dinNd	= 'd0		; // data	
reg [31:0]	Dy1dinData	= 'd0	; // keep	
reg [3:0]	Dy1dinKeep	= 'd0	; // valid	
reg 		Dy1dinLast	= 'd0	; // last	

// FIFO接口信号
reg			fifo1DataRd = 'd0;
wire        fifo1DataValid;
wire [31:0] fifo1DataOut;
wire [3:0]  fifo1KeepOut;
wire        fifo1DataLast;
wire        fifo1Full;
wire        fifo1Empty;
wire [12:0] fifo1DataCount;
fifo_Fpjh_data_1 fifoFpjhData1 (
	.clk        (clk),
	.srst       (rst),
	.din        ({i_axis_tlast, i_axis_tkeep, i_axis_tdata}), // [36:0]
	.wr_en      (i_axis_tvalid),
	.rd_en      (fifo1DataRd),
	.dout       ({fifo1DataLast, fifo1KeepOut, fifo1DataOut}), // [36:0]
	.full       (fifo1Full),
	.empty      (fifo1Empty),
	.valid      (fifo1DataValid),
	.data_count (fifo1DataCount) // 连接如果需要
);

// 添加计数器记录输入数据的时钟周期数
reg [31:0] dinCnt = 'd0;
reg [15:0]	frameType_16Bit			= 'd0; // 0000：无可选字段；0001：帧聚合选项
reg [6:0]	dataFragCnt_rd			= 'd0;          // 分片计数
reg			fragdone_rd				= 'd0;            // 分片是否结束
reg [11:0]	frameAggrOffset_length	= 'd0;         // 帧聚合偏移长度（之前累计发了多少长度）
reg [11:0]	fragment_length			= 'd0;     // 片长度 fragment_length 数据分片域的长度，最大为841字节
reg [11:0]	fragmentLengthAddhead	= 'd0;     // 片长度 + 帧头帧尾
reg [31:0] aggrCnt = 'd0; // 聚合帧个数计数
reg [31:0] frameType_1Bit_Reg = 'd0; // 聚合帧个数计数
// wire		readFIFO1_wrEn		;
// wire [31:0]	readFIFO1_din			;
reg			readFIFO1_rdEn		= 'd0;
wire [31:0]	readFIFO1_Dout		;
reg [3:0]	readFIFO1_DoutIndex	= 'd0;
wire [3:0]	readFIFO1_index		;

readChange_FIFO readFIFO(
    .clk         (clk					),
    .rst_n       (!rst					),
    .Din         (fifo1DataOut			),
    .Din_index   (readFIFO1_DoutIndex	),
    .wr_en       (fifo1DataValid		),
    .rd_en       (readFIFO1_rdEn		),
    .Dout        (readFIFO1_Dout		),
    .index       (readFIFO1_index		)
);
reg [31:0] fifoc1DataOut_Dy1 = 'd0;
reg [15:0] dataSliceState = 'd0;
// 添加状态定义
localparam IDLE = 4'd0;
localparam READ_FRAME_TYPE = 4'd1;
localparam READ_HEADER = 4'd2;
localparam SEND_DATA = 4'd3;
localparam WAIT_END = 4'd4;

// 添加新的寄存器来跟踪总字节数和已处理字节数
reg [11:0] total_bytes_to_read = 'd0;
reg [11:0] bytes_processed = 'd0;
reg [11:0] fifo_read_cycles = 'd0;
reg [11:0] readFIFO_remainLen = 'd0, readFIFO_remainLen_reg = 'd0;
reg [31:0] readFIFO_remain = 'd0;
reg [11:0] read_fifo_read_cycles = 'd0;
// 没必要在发端发送的数据刚来时就把所有的信息读取好，并且多少个分片如何分也划分清楚
// 第一个always能把dataFIFO1中的数据读出来分片就行
reg [11:0] delay_cnt = 'd0;  // 用于延迟读取的计数器
reg [11:0] atest = 'd0;
reg [11:0] btest = 'd0;


always @(posedge clk) begin
    if (rst) begin
        dinCnt <= 'd0;
        fifo1DataRd <= 'd0;
        readFIFO1_rdEn <= 'd0;
        readFIFO1_DoutIndex <= 'd0;
        fragment_length <= 'd0;
        frameType_16Bit <= 'd0;
        frameType_1Bit_Reg <= 'd0;
        dataSliceState <= IDLE;
		delay_cnt <= 'd0;
    end
    else begin
		fifoc1DataOut_Dy1 <= fifo1DataOut;
        case(dataSliceState)
            IDLE: begin  // 空闲状态
                if(fifo1DataCount >= 'd212) begin
                    fifo1DataRd <= 'd1;  // 读取帧类型和长度
                    dataSliceState <= READ_FRAME_TYPE;
					readFIFO_remainLen_reg <= readFIFO_remainLen; // 不止一个延迟
					fragment_length <= 'd0;
					fifo_read_cycles		<= 'd0; // 重置计数器
					read_fifo_read_cycles	<= 'd0; // 重置计数器
					delay_cnt <= 'd0;
                end
            end
            READ_FRAME_TYPE: begin
                if (fifo1DataValid) begin
					case(readFIFO_remainLen_reg)
						'd0:begin
							fragment_length <= fifo1DataOut[16+:12];  // 纯数据长度
							frameType_16Bit <= fifo1DataOut[15:0];
							frameType_1Bit_Reg <= fifo1DataOut[0];
							dataSliceState <= READ_HEADER;
							if (fifo1DataOut[0]) begin  // 聚合帧，需要额外读取4字节
								fifo1DataRd <= 'd1;
							end
							else begin
								fifo1DataRd <= 'd0;
							end
						end
						'd1:begin
							fragment_length <= {readFIFO_remain[27-:4], fifo1DataOut[31-:8*1]};  // 纯数据长度{readFIFO_remain[24+:4], fifo1DataOut[31-:8*1]}
							frameType_16Bit <= fifo1DataOut[23-:8*2];
							frameType_1Bit_Reg <= fifo1DataOut[8*1];
							dataSliceState <= READ_HEADER;
							if (fifo1DataOut[8*1]) begin  // 聚合帧，需要额外读取4字节
								fifo1DataRd <= 'd1;
							end
							else begin
								fifo1DataRd <= 'd0;
							end
						end
						'd2:begin
							fragment_length <= {readFIFO_remain[27-:4], readFIFO_remain[23-:8*1]};  // 纯数据长度{readFIFO_remain[24+:4], }
							frameType_16Bit <= fifo1DataOut[31-:8*2];
							frameType_1Bit_Reg <= fifo1DataOut[8*2];
							dataSliceState <= READ_HEADER;
							if (fifo1DataOut[8*2]) begin  // 聚合帧，需要额外读取4字节
								fifo1DataRd <= 'd1;
							end
							else begin
								fifo1DataRd <= 'd0;
							end
						end
						'd3:begin
							fragment_length <= {readFIFO_remain[27-:4], readFIFO_remain[23-:8*1]};  // 纯数据长度{readFIFO_remain[24+:4], }
							frameType_16Bit <= {readFIFO_remain[15-:8*1], fifo1DataOut[31-:8*1]};
							frameType_1Bit_Reg <= fifo1DataOut[8*3];
							dataSliceState <= READ_HEADER;
							if (fifo1DataOut[8*3]) begin  // 聚合帧，需要额外读取4字节
								fifo1DataRd <= 'd1;
							end
							else begin
								fifo1DataRd <= 'd0;
							end
						end
					endcase
                end
				else fifo1DataRd <= 'd0;
            end
            READ_HEADER: begin //////分四个状态
				fragmentLengthAddhead <= (frameType_16Bit[0])?'d11 + fragment_length:'d7 + fragment_length;
				
						if (frameType_1Bit_Reg) begin
							if (fifo1DataValid) begin
								case(readFIFO_remainLen_reg)
									'd0:begin
										dataFragCnt_rd <= fifo1DataOut[31:25];
										fragdone_rd <= fifo1DataOut[24];
									end
									'd1:begin
										dataFragCnt_rd <= fifoc1DataOut_Dy1[7:1];
										fragdone_rd <= fifoc1DataOut_Dy1[0];
									end
									'd2:begin
										dataFragCnt_rd <= fifoc1DataOut_Dy1[15:9];
										fragdone_rd <= fifoc1DataOut_Dy1[8];
									end
									'd3:begin
										dataFragCnt_rd <= fifoc1DataOut_Dy1[23:17];
										fragdone_rd <= fifoc1DataOut_Dy1[16];
									end
								endcase
								o_length <= fragment_length;
								total_bytes_to_read <= 'd11 + fragment_length; // 帧头(7)+数据+帧尾(4)
								bytes_processed <= 'd0;
								dataSliceState <= SEND_DATA;
								// readFIFO1_rdEn <= 'd1;
								// readFIFO1_DoutIndex <= 4'd4;
							end
							else begin
								fifo1DataRd <= 'd0;
								// readFIFO1_rdEn <= 'd1;
								// readFIFO1_DoutIndex <= 4'd4;
							end
						end
						else begin
							o_length <= fragment_length;
							total_bytes_to_read <= 'd7 + fragment_length; // 帧头(3)+数据+帧尾(4)
							bytes_processed <= 'd0;
							dataSliceState <= SEND_DATA;
							// readFIFO1_r/
						end
				


            end
            SEND_DATA: begin
                    // 控制fifo1DataRd基于读取周期数
                    if (4 * (fifo_read_cycles) < (fragment_length + 'd3) - readFIFO_remainLen_reg) begin // fragment_length + 'd1加1是为了帧头还剩1字节没发，帧尾还剩2字节 // 4 * (fifo_read_cycles) < fragment_length - remain_Byte
                        fifo1DataRd <= 1'b1;
                        fifo_read_cycles <= fifo_read_cycles + 1'b1;

						
                    end else begin
						// 残余数据 remain_Byte = 4 * (fifo_read_cycles) - fragment_length
						if(4 * (fifo_read_cycles) < (fragment_length + 'd3 + 'd4) - readFIFO_remainLen_reg)begin
							fifo_read_cycles <= fifo_read_cycles + 1'b1;
						end
						else begin
							if(4 * (fifo_read_cycles) >= (fragment_length + 'd3 + 'd4) - readFIFO_remainLen_reg)begin // 此条件是为了能读出残余数据（其实是readFIFO中的数据，提前读出去）
								case (4 * fifo_read_cycles - ((fragment_length + 'd3 + 'd4) - readFIFO_remainLen_reg))
									'd1:begin readFIFO_remainLen <= 4 * fifo_read_cycles - ((fragment_length + 'd3 + 'd4) - readFIFO_remainLen_reg); readFIFO_remain <= {fifo1DataOut[0+:8*1], {3{8'd0}}}	;  end // 还剩1字节没发
									'd2:begin readFIFO_remainLen <= 4 * fifo_read_cycles - ((fragment_length + 'd3 + 'd4) - readFIFO_remainLen_reg); readFIFO_remain <= {fifo1DataOut[0+:8*2], {2{8'd0}}}	;  end // 还剩2字节没发
									'd3:begin readFIFO_remainLen <= 4 * fifo_read_cycles - ((fragment_length + 'd3 + 'd4) - readFIFO_remainLen_reg); readFIFO_remain <= {fifo1DataOut[0+:8*3], {1{8'd0}}}	;  end // 还剩3字节没发
									'd0:begin readFIFO_remainLen <= 4 * fifo_read_cycles - ((fragment_length + 'd3 + 'd4) - readFIFO_remainLen_reg); readFIFO_remain <= 'd0								;  end // 都发完了 从循环初始开始
									default:atest <= 'd5;
								endcase
							end
							// dataSliceState <= WAIT_END; // 跳转状态
						end
                        fifo1DataRd <= 1'b0;
                    end

                    // valid信号延迟计数
                    delay_cnt <= delay_cnt + 1'b1;
					if (delay_cnt >= 3'd1) begin
						// 延迟两个时钟周期后开始读取changeFIFO并处理数据
						if (4 * read_fifo_read_cycles < fragmentLengthAddhead) begin
							readFIFO1_rdEn <= 1'b1;
							readFIFO1_DoutIndex <= 4'd4;
							read_fifo_read_cycles <= read_fifo_read_cycles + 1'b1;
							if(4 * read_fifo_read_cycles +'d4 >= fragmentLengthAddhead)begin
								case (  fragmentLengthAddhead - 4 * read_fifo_read_cycles)
									'd1: readFIFO1_DoutIndex <= 'd1;
									'd2: readFIFO1_DoutIndex <= 'd2;
									'd3: readFIFO1_DoutIndex <= 'd3;
									'd4: readFIFO1_DoutIndex <= 'd4;
									default: readFIFO1_DoutIndex <= 'd0;
								endcase
							end
							btest <= btest + 'd1;
						end else begin
							// 下一个时钟周期停止读取
							readFIFO1_rdEn <= 1'b0;
							readFIFO1_DoutIndex <= 4'd0;
							dataSliceState <= WAIT_END;
						end
					end

					
            end
            WAIT_END: begin
                fifo1DataRd <= 'd0;
				readFIFO1_rdEn <= 1'b0;
				readFIFO1_DoutIndex <= 4'd0;
                dinCnt <= 'd0;
                dataSliceState <= IDLE;
            end
            default: dataSliceState <= IDLE;
        endcase
    end
end
reg dataSlice_valid = 'd0;
wire [31:0] dataSlice_data;
reg [3:0]  dataSlice_keep = 'd0;
wire        dataSlice_last;
assign dataSlice_data = readFIFO1_Dout;
assign dataSlice_last = !readFIFO1_rdEn && dataSlice_valid;
always@(posedge clk)begin
	if(rst)begin
		dataSlice_valid <= 'd0;
		dataSlice_keep <= 'd0;
	end
	else begin
		dataSlice_valid <= readFIFO1_rdEn;
		dataSlice_keep <= readFIFO1_DoutIndex;
	end
end


// readChange_FIFO readFIFO(
//     .clk         (clk					),
//     .rst_n       (!rst					),
//     .Din         (fifo1DataOut			),
//     .Din_index   (readFIFO1_DoutIndex	),
//     .wr_en       (fifo1DataValid		),
//     .rd_en       (readFIFO1_rdEn		),
//     .Dout        (readFIFO1_Dout		),
//     .index       (readFIFO1_index		)
// );


		// Dy1dinNd	<= i_axis_tvalid	;
		// Dy1dinData	<= i_axis_tdata		;
		// Dy1dinKeep	<= i_axis_tkeep		;
		// Dy1dinLast	<= i_axis_tlast		;

// wire			receCrcOut_tvalid			;
// wire	[31:0]	receCrcOut_tdata			;
// wire	[3:0]	receCrcOut_tkeep			;
// wire			receCrcOut_tlast			;
// CRC16Par32Poly0x1021Keep sendCrc (
//     .clk        (clk            ),  // 时钟输入
//     .Rst        (rst            ),  // 复位信号
//     .FlagTR     (1'b1        ),  // 1:发送校验 0:接收校验
//     .DinNd      (addFrame_tvalid		),  // 数据有效
//     .Din        (addFrame_tdata			),  // 32位输入数据
//     .DinKeep    (addFrame_tkeep			),  // 数据保持位
//     .DinLast    (addFrame_tlast			),  // 最后一个数据标志
//     .RegIni     (16'hFFFF        ),  // 初始寄存器值
//     .DoutNd     (receCrcOut_tvalid			),  // 输出数据有效
//     .Dout       (receCrcOut_tdata			),  // 32位输出数据
//     .DoutKeep   (receCrcOut_tkeep			),  // 输出数据保持位
//     .DoutLast   (receCrcOut_tlast			)  // 输出最后数据标志
// );


// wire        changeFIFO1_wrEn;
// wire [31:0] changeFIFO1_Din;
// wire [3:0]  changeFIFO1_DinIndex;
// wire        changeFIFO1_rdEn;
// wire [31:0] changeFIFO1_Dout;
// wire [3:0]  changeFIFO1_DoutIndex;
// wire [31:0] changeFIFO1_index;
// changeFIFO changeFIFO1 (
// 	.clk        (clk),
// 	.rst_n      (!rst),
// 	.Din        (changeFIFO1_Din),
// 	.Din_index  (changeFIFO1_DinIndex),// fifo1KeepOut
// 	.wr_en      (changeFIFO1_wrEn),
// 	.Dout_index (changeFIFO1_DoutIndex),
// 	.rd_en      (changeFIFO1_rdEn),
// 	.Dout       (changeFIFO1_Dout),
// 	.index      (changeFIFO1_index) // 不连接，待后续处理
// );

endmodule
