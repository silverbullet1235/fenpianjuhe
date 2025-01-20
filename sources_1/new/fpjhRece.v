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
    output reg				o_axis_tvalid	= 'd0,
    output wire		[31:0]  o_axis_tdata		 ,
    output reg		[3:0]   o_axis_tkeep	= 'd0,
    output reg				o_axis_tlast	= 'd0,
    input wire				o_axis_tready	,
    output reg		[31:0]	o_length = 'd0	
);
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
	.din        ({i_axis_tlast, i_axis_tkeep, i_axis_tdata}),
	.wr_en      (i_axis_tvalid),
	.rd_en      (fifo1DataRd),
	.dout       ({fifo1DataLast, fifo1KeepOut, fifo1DataOut}),
	.full       (fifo1Full),
	.empty      (fifo1Empty),
	.valid      (fifo1DataValid),
	.data_count (fifo1DataCount)
);
reg [31:0] dinCnt = 'd0;
reg [15:0]	frameType_16Bit			= 'd0; // 0000：无可选字段；0001：帧聚合选项
reg [6:0]	dataFragCnt_rd			= 'd0; // 分片计数
reg			fragdone_rd				= 'd0; // 分片是否结束
reg [11:0]	frameAggrOffset_length	= 'd0; // 帧聚合偏移长度（之前累计发了多少长度）
reg [11:0]	fragment_length			= 'd0; // 片长度 fragment_length 数据分片域的长度，最大为841字节
reg [11:0]	fragmentLengthAddhead	= 'd0; // 片长度 + 帧头帧尾
reg [31:0] aggrCnt = 'd0; // 聚合帧个数计数
reg [31:0] frameType_1Bit_Reg = 'd0;
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
reg [31:0] fifo1DataOut_Dy1 = 'd0;
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
reg [11:0] delay_cnt = 'd0;
reg [11:0] atest = 'd0;
reg [11:0] btest = 'd0;
reg [11:0] accumulated_length = 'd0;
reg dataSlice_valid = 'd0;
wire [31:0] dataSlice_data;
reg [3:0]  dataSlice_keep = 'd0;
wire        dataSlice_last;
assign dataSlice_data = readFIFO1_Dout;
assign dataSlice_last = !readFIFO1_rdEn && dataSlice_valid;
reg [11:0] padding_count = 'd0;
reg [11:0] padding_count_divBy4 = 'd0;
reg [11:0] delay_cnt_5A = 'd0;
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
		accumulated_length <= 'd0;
    end
    else begin
		fifo1DataOut_Dy1 <= fifo1DataOut;
        case(dataSliceState)
            IDLE: begin
                if(fifo1DataCount >= 'd212) begin
                    fifo1DataRd <= 'd1;
                    dataSliceState <= READ_FRAME_TYPE;
					readFIFO_remainLen_reg <= readFIFO_remainLen;
					fragment_length <= 'd0;
					fifo_read_cycles		<= 'd0;
					read_fifo_read_cycles	<= 'd0;
					delay_cnt <= 'd0;
					delay_cnt_5A <= 'd0;
                end
            end
            READ_FRAME_TYPE: begin
                if (fifo1DataValid) begin
					case(readFIFO_remainLen_reg)
						'd0:begin
							fragment_length <= fifo1DataOut[16+:12];
							frameType_16Bit <= fifo1DataOut[15:0];
							frameType_1Bit_Reg <= fifo1DataOut[0];
							dataSliceState <= READ_HEADER;
							if (fifo1DataOut[0]) begin
								fifo1DataRd <= 'd1;
							end
							else begin
								fifo1DataRd <= 'd0;
							end
						end
						'd1:begin
							fragment_length <= {readFIFO_remain[27-:4], fifo1DataOut[31-:8*1]};
							frameType_16Bit <= fifo1DataOut[23-:8*2];
							frameType_1Bit_Reg <= fifo1DataOut[8*1];
							dataSliceState <= READ_HEADER;
							if (fifo1DataOut[8*1]) begin
								fifo1DataRd <= 'd1;
							end
							else begin
								fifo1DataRd <= 'd0;
							end
						end
						'd2:begin
							fragment_length <= {readFIFO_remain[27-:4], readFIFO_remain[23-:8*1]};
							frameType_16Bit <= fifo1DataOut[31-:8*2];
							frameType_1Bit_Reg <= fifo1DataOut[8*2];
							dataSliceState <= READ_HEADER;
							if (fifo1DataOut[8*2]) begin
								fifo1DataRd <= 'd1;
							end
							else begin
								fifo1DataRd <= 'd0;
							end
						end
						'd3:begin
							fragment_length <= {readFIFO_remain[27-:4], readFIFO_remain[23-:8*1]};
							frameType_16Bit <= {readFIFO_remain[15-:8*1], fifo1DataOut[31-:8*1]};
							frameType_1Bit_Reg <= fifo1DataOut[8*3];
							dataSliceState <= READ_HEADER;
							if (fifo1DataOut[8*3]) begin
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
										dataFragCnt_rd <= fifo1DataOut_Dy1[7:1];
										fragdone_rd <= fifo1DataOut_Dy1[0];
									end
									'd2:begin
										dataFragCnt_rd <= fifo1DataOut_Dy1[15:9];
										fragdone_rd <= fifo1DataOut_Dy1[8];
									end
									'd3:begin
										dataFragCnt_rd <= fifo1DataOut_Dy1[23:17];
										fragdone_rd <= fifo1DataOut_Dy1[16];
									end
								endcase
								o_length <= fragment_length;
								total_bytes_to_read <= 'd11 + fragment_length;
								bytes_processed <= 'd0;
								dataSliceState <= SEND_DATA;
								accumulated_length <= accumulated_length;
							end
							else begin
								fifo1DataRd <= 'd0;
								accumulated_length <= 'd11 + fragment_length + accumulated_length;
							end
						end
						else begin

							o_length <= fragment_length;
							total_bytes_to_read <= 'd7 + fragment_length;
							bytes_processed <= 'd0;
							dataSliceState <= SEND_DATA;
							padding_count <= 'd848 - accumulated_length -'d7 - fragment_length;
							accumulated_length <= 'd0;
							padding_count_divBy4 <= ('d848 - accumulated_length -'d7 - fragment_length) >> 2;
						end
            end
            SEND_DATA: begin
					if(!frameType_1Bit_Reg && (read_fifo_read_cycles == 'd1))begin
						case(readFIFO_remainLen_reg)
							'd0:begin
								dataFragCnt_rd <= fifo1DataOut[31:25];
								fragdone_rd <= fifo1DataOut[24];
							end
							'd1:begin
								dataFragCnt_rd <= fifo1DataOut_Dy1[7:1];
								fragdone_rd <= fifo1DataOut_Dy1[0];
							end
							'd2:begin
								dataFragCnt_rd <= fifo1DataOut_Dy1[15:9];
								fragdone_rd <= fifo1DataOut_Dy1[8];
							end
							'd3:begin
								dataFragCnt_rd <= fifo1DataOut_Dy1[23:17];
								fragdone_rd <= fifo1DataOut_Dy1[16];
							end
						endcase
					end
                    if (4 * (fifo_read_cycles) < (fragment_length + 'd3) - readFIFO_remainLen_reg) begin // fragment_length + 'd1加1是为了帧头还剩1字节没发，帧尾还剩2字节 // 4 * (fifo_read_cycles) < fragment_length - remain_Byte
                        fifo1DataRd <= 1'b1;
                        fifo_read_cycles <= fifo_read_cycles + 1'b1;
                    end else begin
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
						end
                        fifo1DataRd <= 1'b0;
                    end
                    delay_cnt <= delay_cnt + 1'b1;
					if (delay_cnt >= 3'd1) begin
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
							readFIFO1_rdEn <= 1'b0;
							readFIFO1_DoutIndex <= 4'd0;
							dataSliceState <= WAIT_END;
						end
					end
					delay_cnt_5A <= 'd0;
            end
            WAIT_END: begin
				case(padding_count_divBy4)
					'd2:begin
						padding_count_divBy4 <= padding_count_divBy4 - 'd1;
						fifo1DataRd <= 'd1;
					end
					'd1:begin
						padding_count_divBy4 <= padding_count_divBy4 - 'd1;
						fifo1DataRd <= 'd1;
					end
					'd0:begin
						padding_count_divBy4 <= padding_count_divBy4;
						fifo1DataRd <= 'd0;
					end
				endcase
				delay_cnt_5A <= delay_cnt_5A + 1'b1;
				if (delay_cnt_5A >= 3'd2) begin
					case(padding_count)
						4'd0:begin
							readFIFO1_rdEn <= 'd0;
							readFIFO1_DoutIndex <= 'd0;
							padding_count <= 'd0;
							dataSliceState <= IDLE;
						end
						4'd1:begin
							readFIFO1_rdEn <= 'd1;
							readFIFO1_DoutIndex <= 'd1;
							padding_count <= 'd0;
							readFIFO_remainLen = 'd0;
							readFIFO_remain = 'd0;
						end 
						4'd2: begin
							readFIFO1_rdEn <= 'd1;
							readFIFO1_DoutIndex <= 'd2;
							padding_count <= 4'd0;
							readFIFO_remainLen = 'd0;
							readFIFO_remain = 'd0;
						end
						4'd3: begin
							readFIFO1_rdEn <= 'd1;
							readFIFO1_DoutIndex <= 'd3;
							padding_count <= 4'd0;
							readFIFO_remainLen = 'd0;
							readFIFO_remain = 'd0;
						end
						4'd4: begin
							readFIFO1_rdEn <= 'd1;
							readFIFO1_DoutIndex <= 'd4;
							padding_count <= 'd0;
							readFIFO_remainLen = 'd0;
							readFIFO_remain = 'd0;
						end
						default: begin
							readFIFO1_rdEn <= 'd1;
							readFIFO1_DoutIndex <= 'd4;
							padding_count <= padding_count - 'd4;
						end
					endcase
				end
            end
            default: dataSliceState <= IDLE;
        endcase
    end
end

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

wire		dataSlice_valid_no5A	;
wire [31:0]	dataSlice_data_no5A		;
wire [3:0]	dataSlice_keep_no5A		;
wire		dataSlice_last_no5A		;
assign dataSlice_valid_no5A = (delay_cnt_5A > 'd1)? 'd0 : dataSlice_valid;
assign dataSlice_data_no5A = (delay_cnt_5A > 'd1)? 'd0: dataSlice_data ;
assign dataSlice_keep_no5A = (delay_cnt_5A > 'd1)? 'd0: dataSlice_keep ;
assign dataSlice_last_no5A = (delay_cnt_5A > 'd1)? 'd0: dataSlice_last ;

wire			receCrcOut_CheckSync		;
wire			receCrcOut_CheckCRC			;
wire			receCrcOut_tvalid			;
wire	[31:0]	receCrcOut_tdata			;
wire	[3:0]	receCrcOut_tkeep			;
wire			receCrcOut_tlast			;
CRC16Par32Poly0x1021Keep receCrc (
    .clk        (clk            ),  // 时钟输入
    .Rst        (rst            ),  // 复位信号
    .FlagTR     (1'b0        ),  // 1:发送校验 0:接收校验
    .DinNd      (dataSlice_valid_no5A	),  // 数据有效
    .Din        (dataSlice_data_no5A	),  // 32位输入数据
    .DinKeep    (dataSlice_keep_no5A	),  // 数据保持位
    .DinLast    (dataSlice_last_no5A	),  // 最后一个数据标志
    .RegIni     (16'hFFFF        ),  // 初始寄存器值
	.CheckSync	(receCrcOut_CheckSync	),	// 此信号拉高对 CheckCRC 进行01检测
	.CheckCRC	(receCrcOut_CheckCRC	),	// 接收CRC校验是否正确， 1 正确		0 不正确

    .DoutNd     (receCrcOut_tvalid			),  // 输出数据有效
    .Dout       (receCrcOut_tdata			),  // 32位输出数据
    .DoutKeep   (receCrcOut_tkeep			),  // 输出数据保持位
    .DoutLast   (receCrcOut_tlast			)  // 输出最后数据标志
);

wire		m_axis_tsync	;
wire		m_axis_tvalid	;
wire [31:0]	m_axis_tdata	;
wire [03:0]	m_axis_tkeep	;
wire		m_axis_tlast	;
deleteFrameHead deleteFrameHead_inst (
    .clk                (clk),                
    .rst                (rst),                
    .receCrcOut_tvalid  (receCrcOut_tvalid),  
    .receCrcOut_tdata   (receCrcOut_tdata),   
    .receCrcOut_tkeep   (receCrcOut_tkeep),   
    .receCrcOut_tlast   (receCrcOut_tlast),   
    .frameType_1Bit_Reg (frameType_1Bit_Reg), 
    // 输出AXIS接口
    .m_axis_tsync      (m_axis_tsync	),    
    .m_axis_tvalid      (m_axis_tvalid	),    
    .m_axis_tdata       (m_axis_tdata	),    
    .m_axis_tkeep       (m_axis_tkeep	),    
    .m_axis_tlast       (m_axis_tlast	)     
);

reg [15:0]	Dy4frameType_16Bit			= 'd0;    // 0000：无可选字段；0001：帧聚合选项
reg [6:0]	Dy4dataFragCnt_rd			= 'd0;    // 分片计数
reg			Dy4fragdone_rd				= 'd0;    // 分片是否结束
reg [11:0]	Dy4fragment_length			= 'd0;    // 片长度 fragment_length
reg [15:0] Dy1_fType = 'd0, Dy2_fType = 'd0, Dy3_fType = 'd0;
reg [6:0]  Dy1_fCnt = 'd0,  Dy2_fCnt = 'd0,  Dy3_fCnt = 'd0;
reg        Dy1_fDone = 'd0, Dy2_fDone = 'd0, Dy3_fDone = 'd0;
reg [11:0] Dy1_fLen = 'd0,  Dy2_fLen = 'd0,  Dy3_fLen = 'd0;
always @(posedge clk) begin
    if (rst) begin
        {Dy1_fType, Dy2_fType, Dy3_fType, Dy4frameType_16Bit} <= 'd0;
        {Dy1_fCnt, Dy2_fCnt, Dy3_fCnt, Dy4dataFragCnt_rd} <= 'd0;
        {Dy1_fDone, Dy2_fDone, Dy3_fDone, Dy4fragdone_rd} <= 'd0;
        {Dy1_fLen, Dy2_fLen, Dy3_fLen, Dy4fragment_length} <= 'd0;
    end
    else begin
        Dy1_fType <= frameType_1Bit_Reg[15:0];
        Dy1_fCnt  <= dataFragCnt_rd;
        Dy1_fDone <= fragdone_rd;
        Dy1_fLen  <= fragment_length;
        Dy2_fType <= Dy1_fType;
        Dy2_fCnt  <= Dy1_fCnt;
        Dy2_fDone <= Dy1_fDone;
        Dy2_fLen  <= Dy1_fLen;
        Dy3_fType <= Dy2_fType;
        Dy3_fCnt  <= Dy2_fCnt;
        Dy3_fDone <= Dy2_fDone;
        Dy3_fLen  <= Dy2_fLen;
        Dy4frameType_16Bit        <= Dy3_fType;
        Dy4dataFragCnt_rd         <= Dy3_fCnt;
        Dy4fragdone_rd            <= Dy3_fDone;
        Dy4fragment_length        <= Dy3_fLen;
    end
end
reg [11:0] total_bytes_accumulate = 'd0;
reg [11:0] len_A_in = 'd0;
wire [11:0] len_B_out;
reg [3:0] lenRece_ptr = 'd0;   
reg m_axis_tlastDy1 = 'd0;
reg [3:0] lenRece_ptr_rd = 'd0;
wire wr_len_B ;
lenRece your_instance_name (
  .clka(clk),    // input wire clka
  .ena(1'b1),      // input wire ena
  .wea(m_axis_tlast && !Dy4fragdone_rd),      // input wire [0 : 0] wea
  .addra(lenRece_ptr),  // input wire [3 : 0] addra
  .dina(total_bytes_accumulate + Dy4fragment_length),    // input wire [11 : 0] dina
  .clkb(clk),    // input wire clkb
  .enb(1'b1),      // input wire enb
  .web(wr_len_B),      // input wire [0 : 0] web
  .addrb(lenRece_ptr_rd),  // input wire [3 : 0] addrb
  .dinb('d0),    // input wire [11 : 0] dinb
  .doutb(len_B_out)  // output wire [11 : 0] doutb
);

always @(posedge clk) begin
    if (rst) begin
		total_bytes_accumulate <= 'd0;
		lenRece_ptr <= 'd0;
    end
    else begin
		m_axis_tlastDy1 <= m_axis_tlast;
		if(m_axis_tlast)begin
			if(Dy4fragdone_rd)begin
			total_bytes_accumulate <= total_bytes_accumulate + Dy4fragment_length;
			end
			else begin
			len_A_in <= total_bytes_accumulate + Dy4fragment_length;  // 
			total_bytes_accumulate <= 'd0;  // 
			lenRece_ptr <= lenRece_ptr + 'd1;
			end
		end
    end
end

// FIFO接口信号
reg			fifo2DataRd = 'd0;
wire        fifo2DataValid;
wire [31:0] fifo2DataOut;
wire [3:0]  fifo2KeepOut;
wire        fifo2DataLast;
wire        fifo2Full;
wire        fifo2Empty;
wire [12:0] fifo2DataCount;
fifo_Fpjh_data_1 fifoFpjhData2 (
	.clk        (clk),
	.srst       (rst),
	.din        ({m_axis_tlast, m_axis_tkeep, m_axis_tdata}),
	.wr_en      (m_axis_tvalid),
	.rd_en      (fifo2DataRd),
	.dout       ({fifo2DataLast, fifo2KeepOut, fifo2DataOut}),
	.full       (fifo2Full),
	.empty      (fifo2Empty),
	.valid      (fifo2DataValid),
	.data_count (fifo2DataCount) // 连接如果需要
);

wire        changeFIFO1_wrEn;
wire [31:0] changeFIFO1_Din;
wire [3:0]  changeFIFO1_DinIndex;
reg        changeFIFO1_rdEn;
wire [31:0] changeFIFO1_Dout;
reg [3:0]  changeFIFO1_DoutIndex;
wire [4:0] changeFIFO1_index;
reg		changeFIFO1_DoutLast = 'd0;
assign o_axis_tdata = changeFIFO1_Dout;
changeFIFO changeFIFO1 (
	.clk        (clk),
	.rst_n      (!rst),
	.Din        (fifo2DataOut),
	.Din_index  (fifo2KeepOut),// fifo1KeepOut
	.wr_en      (fifo2DataValid),
	.Dout_index (changeFIFO1_DoutIndex),
	.rd_en      (changeFIFO1_rdEn),
	.Dout       (changeFIFO1_Dout),
	.index      (changeFIFO1_index) // 不连接，待后续处理
);

// 添加新的状态定义
reg [15:0] dataSlice2State = 'd0;
localparam IDLE2 = 4'd0;
localparam READ_DATA2 = 4'd1;
localparam WAIT_END2 = 4'd2;

// 添加新的计数器和控制信号
reg [11:0] fifo2_read_cycles = 'd0;
reg [11:0] change_fifo_read_cycles = 'd0;
reg [11:0] delay2_cnt = 'd0;

reg [11:0] bytes_processed2 = 'd0;

// 添加新的寄存器

reg [11:0] total_bytes_to_read2 = 'd0;
reg [11:0] fifo2_actualSentBytes = 'd0;
reg [11:0] changeFIFO_remainLen = 'd0;
assign wr_len_B = ((dataSlice2State == IDLE2) && (len_B_out != 'd0))? 'd1 : 'd0;
always @(posedge clk) begin
    if (rst) begin
        fifo2DataRd <= 'd0;
        changeFIFO1_rdEn <= 'd0;
        changeFIFO1_DoutIndex <= 'd0;
        fifo2_read_cycles <= 'd0;
        change_fifo_read_cycles <= 'd0;
        delay2_cnt <= 'd0;
        dataSlice2State <= IDLE2;
        lenRece_ptr_rd <= 'd0;
		changeFIFO1_DoutLast <= 'd0;
    end
    else begin
        case(dataSlice2State)
            IDLE2: begin
                if( len_B_out != 'd0) begin
                    fifo2DataRd <= 'd0;
                    fifo2_read_cycles <= 'd0;
                    change_fifo_read_cycles <= 'd0;
                    delay2_cnt <= 'd0;
                    total_bytes_to_read2 <= len_B_out;
					lenRece_ptr_rd <= lenRece_ptr_rd + 'd1;
                    dataSlice2State <= READ_DATA2;
                end
            end

            READ_DATA2: begin
                if (4 * fifo2_read_cycles < total_bytes_to_read2 + 'd12 - changeFIFO_remainLen) begin //
                    fifo2DataRd <= 1'b1;
                    fifo2_read_cycles <= fifo2_read_cycles + 1'b1;
                end 
                else begin
                    fifo2DataRd <= 1'b0;
                end
				if(fifo2DataValid)begin
					fifo2_actualSentBytes <= fifo2_actualSentBytes + fifo2KeepOut;
				end
                delay2_cnt <= delay2_cnt + 'd1;
                
                if (delay2_cnt >= 3'd4) begin //
                    if (4 * change_fifo_read_cycles < total_bytes_to_read2) begin
                        changeFIFO1_rdEn <= 1'b1;
                        changeFIFO1_DoutIndex <= 4'd4;
                        change_fifo_read_cycles <= change_fifo_read_cycles + 1'b1;
                        changeFIFO1_DoutLast <= 'd0;
                        if (4 * change_fifo_read_cycles + 'd4 >= total_bytes_to_read2) begin
							changeFIFO1_DoutLast <= 'd1;
                            case (total_bytes_to_read2 - 4 * change_fifo_read_cycles)
                                'd1: changeFIFO1_DoutIndex <= 'd1;
                                'd2: changeFIFO1_DoutIndex <= 'd2;
                                'd3: changeFIFO1_DoutIndex <= 'd3;
                                'd4: changeFIFO1_DoutIndex <= 'd4;
                                default: changeFIFO1_DoutIndex <= 'd0;
                            endcase
                        end
                    end 
                    else begin
						changeFIFO1_DoutLast <= 'd0;
                        changeFIFO1_rdEn <= 1'b0;
                        changeFIFO1_DoutIndex <= 'd0;
                        dataSlice2State <= WAIT_END2;
                    end
                end
            end
            WAIT_END2: begin
                fifo2DataRd <= 'd0;
                changeFIFO1_rdEn <= 'd0;
                changeFIFO1_DoutIndex <= 'd0;
                dataSlice2State <= IDLE2;
				changeFIFO_remainLen <= changeFIFO1_index;
            end
        endcase
		o_axis_tvalid	<= changeFIFO1_rdEn			;
		o_axis_tkeep <= (changeFIFO1_DoutIndex == 4'b0001) ? 4'h8 : (changeFIFO1_DoutIndex == 4'b0010) ? 4'hC : 
								(changeFIFO1_DoutIndex == 4'b0011) ?  4'hE:	(changeFIFO1_DoutIndex == 4'b0100) ?  4'hF: 4'h0;
		o_axis_tlast	<= changeFIFO1_DoutLast		;
    end
end
endmodule
