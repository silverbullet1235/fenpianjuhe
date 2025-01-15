`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/08 10:00:00
// Design Name: 
// Module Name: fpjhSend
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 分片聚合发送模块，实现数据的分片与聚合，并通过多个FIFO模块传输数据。
// 
// Dependencies: 
// - ChangeFifo.v
// - ReadChange_FIFO.v
// - fifo_Fpjh_data_1.v
// - fifo_Fpjh_len_1.v
// - fifo_Fpjh_data_2.v
// 
// Revision:
// Revision 0.05 - Reduced state count and ensured proper variable declarations
// 
////////////////////////////////////////////////////////////////////////////////

module fpjhSend(
    input wire         clk,             // 系统时钟
    input wire         rst,             // 复位信号
    
    // 输入AXIS接口
    input wire [11:0]  i_length,        // 数据长度
    input wire [31:0]  i_axis_tdata,    // 数据
    input wire [3:0]   i_axis_tkeep,    // 字节有效
    input wire         i_axis_tvalid,   // 数据有效
    input wire         i_axis_tlast,    // 最后一个数据
    output wire        i_axis_tready,   // 准备接收
    
    // 输出AXIS接口（用于发送处理后的数据）
    output wire [31:0]  o_axis_tdata,
    output wire [3:0]   o_axis_tkeep,
    output wire         o_axis_tvalid,
    output wire         o_axis_tlast,
    input wire         o_axis_tready
);
    reg [15:0] atest = 'd0;// 测试信号


    // 状态机定义（使用localparam）
    localparam STATE_IDLE      = 3'd0;  // 空闲状态
    localparam STATE_FRAGMENT  = 3'd1;  // 分片状态
    localparam STATE_FILL_PAD  = 3'd2;  // 填充5A并发送
    localparam STATE_AGGREGATE = 3'd3;  // 聚合状态
    
    // 寄存器定义
    reg [2:0]  current_state;
    reg [11:0] current_length = 'd0;        // 原始数据长度
    reg [11:0] remain_length = 'd0;         // 遗留数据长度

	reg [31:0] frag_count = 'd0;            // 一个数据分成的分片计数
	reg [06:0] dataFragCnt = 'd0;		// 数据分片编号 从0开始
	reg		frag_done = 'd0; // 分片是否结束
	reg			firstDataChunkFragmented = 'd0;		// First data chunk fragmented
	reg			lastDataChunkFragmented  = 'd0;		// Last data chunk fragmented

    reg [11:0] dataLengthCnt;         // 当前处理的数据长度
    reg [11:0] tempDataLength;        // 临时数据长度（用于聚合或填充）
    reg [31:0] data2Din;               // 数据写入 fifo2 的寄存器
    
    // 常量定义
    localparam MAX_FRAG_SIZE    = 12'd841;  // 最大分片大小
    localparam DATA_DOMAIN_SIZE = 12'd848;  // 数据域大小
    localparam HEADER_SIZE_AGGR = 5'd11;    // 聚合帧头尾大小
	localparam HEADER_SIZE_NORMAL = 5'd7;  // 普通帧头尾大小
    
    // FIFO接口信号
    wire [31:0] fifo1DataOut;
    wire [3:0]  fifo1KeepOut;
    wire        fifo1DataValid;
    wire        fifo1DataLast;
    wire        fifo1Full;
    wire        fifo1Empty;

    wire        fifoLenWrEn;
    wire        fifoLenFull;
    wire        fifoLenEmpty;
    wire        fifoLenValid;
    wire [8:0]  fifoLenDataCount;  // data_count is [8:0]
    wire [11:0] fifoLenOut;

    reg         fifoLenRdEn = 1'b0;
    reg         fifoDataRdEn = 1'b0;
    reg [3:0]   fifoKeepHold = 4'd0;

    // 同步寄存器（用于多周期信号）
    reg oFifo1AxisTlastDy1 = 1'b0, oFifo1AxisTlastDy2 = 1'b0, oFifo1AxisTlastDy3 = 1'b0;
    reg [3:0] oFifo1AxisTkeepDy1 = 4'd0, oFifo1AxisTkeepDy2 = 4'd0, oFifo1AxisTkeepDy3 = 4'd0;
    reg [31:0] oFifo1AxisTdataDy1 = 32'd0, oFifo1AxisTdataDy2 = 32'd0, oFifo1AxisTdataDy3 = 32'd0;

   // FIFO实例化
    fifo_Fpjh_data_1 fifoFpjhData1 (
        .clk        (clk),
        .srst       (rst),
        .din        ({i_axis_tlast, i_axis_tkeep, i_axis_tdata}), // [36:0] Keep可以换为3bit位宽
        .wr_en      (fifo1WrEn),
        .rd_en      (fifoDataRdEn),
        .dout       ({fifo1DataLast, fifo1KeepOut, fifo1DataOut}), // [36:0]
        .full       (fifo1Full),
        .empty      (fifo1Empty),
        .valid      (fifo1DataValid),
        .data_count () // 连接如果需要
    );
    // Assign FIFO写使能信号
    assign i_axis_tready = !fifo1Full && !fifoLenFull;
    assign fifo1WrEn = i_axis_tvalid && i_axis_tready; // data_1 FIFO写使能信号
    assign fifoLenWrEn = i_axis_tvalid && i_axis_tready && i_axis_tlast; // len_1 FIFO写使能信号

    fifo_Fpjh_len_1 fifoFpjhLen1 (
        .clk        (clk),
        .srst       (rst),
        .din        (i_length),       // [11:0]
        .wr_en      (fifoLenWrEn),	// fifoLenWrEn = i_axis_tvalid && i_axis_tready && i_axis_tlast; // len_1 FIFO写使能信号
        .rd_en      (fifoLenRdEn),
        .dout       (fifoLenOut),     // [11:0]
        .full       (fifoLenFull),
        .empty      (fifoLenEmpty),
        .valid      (fifoLenValid),
        .data_count (fifoLenDataCount)  // [8:0]
    );

reg [1:0] len_state = 2'd0;
reg [32:0] len [15:0];          // 扩展为33位，[32]:frameType_1Bit, [31:25]:dataFragCnt, [24]:frag_done, [23:12]:frameAggrOffset_length, [11:0]:length
wire [32:0] len_o; assign len_o = len[0]; // 观察信号
reg			frameType_1Bit = 'd0; // 0：无可选字段；1：帧聚合选项

// reg [06:0] dataFragCnt = 'd0;		// 数据分片编号 从0开始

// 修改指针定义
reg [3:0] len_ptr = 4'd0;  // 修改为4位宽度，以匹配len数组的16个元素（0-15） 采用循环读取数据，读一个赋值一个33'd0
reg [1:0] state_Remainlength = 2'd0;

// 定义状态参数
localparam lenStateAggr  = 2'd0;  // 聚合状态
localparam lenStatePack  = 2'd1;  // 打包状态
localparam lenStateSplit = 2'd2;  // 分片状态

localparam REMAIN_IDLE_STATE   = 2'd0;  // 空闲状态
localparam REMAIN_AGGR_STATE   = 2'd1;  // 可以进行聚合
localparam REMAIN_PACK_STATE   = 2'd2;  // 聚合后填充发送
localparam REMAIN_SPLIT_STATE  = 2'd3;  // 需要分片

// 状态切换逻辑，使用组合逻辑
wire [1:0] data_state;
assign data_state = (HEADER_SIZE_AGGR + current_length + HEADER_SIZE_NORMAL + 'd1 <= DATA_DOMAIN_SIZE) ? lenStateAggr :
					(current_length + HEADER_SIZE_NORMAL <= DATA_DOMAIN_SIZE && 
                    DATA_DOMAIN_SIZE <= HEADER_SIZE_AGGR + current_length + HEADER_SIZE_NORMAL) ? lenStatePack :
					lenStateSplit;
wire [1:0] remain_next_state;
assign remain_next_state = 
    (remain_length == 'd0 || current_length == 'd0) ? REMAIN_IDLE_STATE :
    (HEADER_SIZE_AGGR + remain_length + HEADER_SIZE_NORMAL + current_length <= DATA_DOMAIN_SIZE - 'd12) ? REMAIN_AGGR_STATE :
    (DATA_DOMAIN_SIZE - HEADER_SIZE_AGGR <= HEADER_SIZE_AGGR + remain_length + HEADER_SIZE_NORMAL + current_length && 
     HEADER_SIZE_AGGR + remain_length + HEADER_SIZE_NORMAL + current_length <= DATA_DOMAIN_SIZE) ? REMAIN_PACK_STATE :
    REMAIN_SPLIT_STATE;

// 数据长度处理逻辑(在发数据之前提前处理好应发的数据长度，及对应的信号)
always @(posedge clk) begin
    if(rst) begin
        len_ptr <= 4'd0;
		//分片结束0
    end 
    else begin
        // 读一个数据
        case(len_state)
        0:begin
            if(!fifoLenEmpty && current_length == 'd0)begin
                fifoLenRdEn <= 1'b1;
                len_state <= 'd1;
            end
        end
        1:begin
            fifoLenRdEn <= 1'b0;
            len_state <= 'd2;
        end
        2:begin
            len_state <= 'd0;
            current_length <= fifoLenOut;
        end
        endcase
        if(remain_length == 'd0 && current_length != 'd0) begin
            case(data_state)
			lenStateAggr: begin
				len[len_ptr] <= {1'b1,              // frameType_1Bit   聚合1
								7'd0,                // dataFragCnt      分片计数0
								1'b0,                // frag_done        分片结束0
								HEADER_SIZE_AGGR + current_length,	// frameAggrOffset_length
								current_length};     // length          数据长度
				len_ptr <= len_ptr + 1'b1;
				remain_length <= current_length;
				current_length <= 'd0;
			end

			lenStatePack: begin // 打包状态没问题
				len[len_ptr] <= {1'b0,              // frameType_1Bit   填充后发送0
								7'd0,                // dataFragCnt      分片计数0
								1'b0,                // frag_done        分片结束0
								12'd0,               // 
								current_length};     // length          数据长度
				len_ptr <= len_ptr + 1'b1;
				remain_length <= 'd0;
				current_length <= 'd0;
			end

			lenStateSplit: begin
				len[len_ptr] <= {1'b0,              // frameType_1Bit   分片0
							dataFragCnt,    // dataFragCnt     分片计数+1
							1'b1,                // frag_done        分片未结束1
							12'd0,  // remain_length
							MAX_FRAG_SIZE};      // length          固定841长度
				len_ptr <= len_ptr + 1'b1;
				dataFragCnt <= dataFragCnt + 'd1; //重要 分片计数
				frag_done <= 'd1;				  //重要 分片未完成
				remain_length <= current_length - MAX_FRAG_SIZE; // 可能需要接着分片出一个或者几个841
				current_length <= 'd0;
			end
            endcase
        end
        else if(remain_length != 'd0 && current_length != 'd0)begin
			case(remain_next_state)
            REMAIN_AGGR_STATE: begin 
                // 11+a+7+y≤848-12 可以进行聚合
				if(frag_done == 'd1)begin
					// remain_length为分片剩余时，先发remain_length
					len[len_ptr] <= {1'b1,              // 
					dataFragCnt,    // dataFragCnt
					1'b0,                // frag_done 分片结束0
					12'd0, // remain_length
					remain_length};      // length
					len_ptr <= len_ptr + 1'b1;         // 移动到下一个位置
					dataFragCnt <= 'd0; //重要 分片计数
					frag_done <= 'd0;				  //重要 分片已完成
					remain_length <= remain_length;
					current_length <= current_length;
				end
				else begin
					len[len_ptr] <= {1'b1,              // frameType_1Bit   聚合1
								dataFragCnt,    // dataFragCnt     分片计数
								1'b0,                // frag_done        分片结束0
								remain_length + HEADER_SIZE_AGGR + current_length + HEADER_SIZE_AGGR,  // frameAggrOffset_length // frameAggrOffset_length修改
								current_length}; // length 总数据长度
					len_ptr <= len_ptr + 1'b1;         // 移动到下一个位置
					dataFragCnt <= 'd0; //重要 分片计数
					frag_done <= 'd0;				  //重要 分片已完成
					remain_length <= remain_length + HEADER_SIZE_AGGR + current_length; // a+11+y
					current_length <= 'd0;
				end
            end
            REMAIN_PACK_STATE: begin 
                // 848-11≤11+a+7+y≤848 聚合后填充发送
				if(frag_done == 'd1)begin
					// remain_length为分片剩余时，先发remain_length
					len[len_ptr] <= {1'b1,              // 
					dataFragCnt,    // dataFragCnt
					1'b0,                // frag_done 分片结束0
					12'd0, // remain_length
					remain_length};      // length
					len_ptr <= len_ptr + 1'b1;         // 移动到下一个位置
					dataFragCnt <= 'd0; //重要 分片计数
					frag_done <= 'd0;				  //重要 分片已完成
					remain_length <= remain_length;
					current_length <= current_length;
					end
				else begin
					len[len_ptr] <= {1'b0,              // frameType_1Bit   填充发送0
								dataFragCnt,    // dataFragCnt     分片计数+1
								1'b0,                // frag_done        分片结束0
								12'd0,               // remain_length    剩余长度0
								current_length}; // length 总数据长度
					len_ptr <= len_ptr + 1'b1;         // 移动到下一个位置
					dataFragCnt <= 'd0; //重要 分片计数
					frag_done <= 'd0;				  //重要 分片
					remain_length <= 'd0;
					current_length <= 'd0;
				end
            end
            REMAIN_SPLIT_STATE: begin 
                // 848+1≤11+a+7+y 需要分片
				if(remain_length >= MAX_FRAG_SIZE + 'd1)begin
								len[len_ptr] <= {1'b0,              // 
											dataFragCnt,    // dataFragCnt
											1'b1,                // frag_done分片结束0
											12'd0, // remain_length
											MAX_FRAG_SIZE};      // length
								len_ptr <= len_ptr + 1'b1;         // 移动到下一个位置
								dataFragCnt <= dataFragCnt + 'd1; //重要 分片计数
								frag_done <= 'd1;				  //重要 
								remain_length <= remain_length - MAX_FRAG_SIZE;
								current_length <= current_length;
				end
				else begin
					if(frag_done == 'd1)begin
						// 当remain_length不需要分片，current_length需要分片时,先发remain_length
						len[len_ptr] <= {1'b1,              // 
						dataFragCnt,    // dataFragCnt
						1'b0,                // frag_done 分片结束0
						12'd0, // remain_length
						remain_length};      // length
						len_ptr <= len_ptr + 1'b1;         // 移动到下一个位置
						dataFragCnt <= 'd0; //重要 分片计数
						frag_done <= 'd0;				  //重要 分片已完成
						remain_length <= remain_length;
						current_length <= current_length;
						end
					else begin
						// 当remain_length不需要分片，current_length需要分片时
						len[len_ptr] <= {1'b0,              // 
						7'd0,    // dataFragCnt
						1'b1,                // frag_done 分片结束0
						12'd0, // remain_length
						(DATA_DOMAIN_SIZE - (HEADER_SIZE_AGGR + remain_length + HEADER_SIZE_NORMAL))}; // length 此处已修改
						len_ptr <= len_ptr + 1'b1;         // 移动到下一个位置
						dataFragCnt <= 'd0 + 'd1; //重要 分片计数
						frag_done <= 'd1;				  //重要 分片已完成
						remain_length <=   current_length + HEADER_SIZE_AGGR + remain_length + HEADER_SIZE_NORMAL - DATA_DOMAIN_SIZE;
						current_length <= 'd0;
					end
				end
            end
			endcase
        end
    end
end

// 定义发送状态机状态
localparam SEND_IDLE = 3'd0;        // 空闲状态
localparam SEND_READ_LEN = 3'd1;    // 读取长度状态
localparam SEND_DATA = 3'd2;        // 发送数据状态
localparam SEND_WAIT = 3'd3;        // 等待状态

reg [2:0] send_state = SEND_IDLE;
reg [11:0] send_length_cnt = 'd0;   // 已发送数据计数器

reg [15:0]	frameType_16Bit			= 'd0; // 0000：无可选字段；0001：帧聚合选项
reg [6:0]	dataFragCnt_rd			= 'd0;          // 分片计数
reg			fragdone_rd				= 'd0;            // 分片是否结束
reg [11:0]	frameAggrOffset_length	= 'd0;         // 帧聚合偏移长度（之前累计发了多少长度）
reg [11:0]	fragment_length			= 'd0;     // 片长度 fragment_length 数据分片域的长度，最大为841字节
integer i;

// 添加新的计数器和状态
reg [11:0] valid_delay_cnt = 'd0;  // 用于延迟读取的计数器
reg [11:0] read_bytes_cnt = 'd0;  // 用于跟踪已读取的字节数

reg [3:0] len_ptr_rd = 4'd0;  // 以匹配len数组的16个元素（0-15） 采用循环读取数据，读一个赋值一个33'd0
// 添加新的计数器用于跟踪读取周期数
reg [11:0] read_cycle_cnt = 'd0;

wire [3:0]	changeFIFO1_DinIndex;
assign changeFIFO1_DinIndex = (fifo1KeepOut == 4'h8) ? 4'b0001 : (fifo1KeepOut == 4'hC) ? 4'b0010 : 
								(fifo1KeepOut == 4'hE) ? 4'b0011 :	(fifo1KeepOut == 4'hF) ? 4'b0100 : 4'b0000; // 默认值
reg  [3:0]  changeFIFO1_DoutIndex;
reg  changeFIFO1_rdEn;  // 添加读使能信号声明
wire [4:0]	changeFIFO1_index;  // 添加读使能信号声明
reg			changeFIFO1_rdEnDy1 = 'b0;
reg [3:0]	changeFIFO1_DoutIndexDy1 = 'b0;
wire		fragOutNoneCrc_DoutNd; // 生成一个无CRC分片输出的Nd信号 对应changeFIFO1_Dout
assign fragOutNoneCrc_DoutNd = changeFIFO1_rdEnDy1;
wire [31:0] changeFIFO1_Dout;
wire [3:0]	fragOutNoneCrc_DoutKeep; // 生成一个无CRC分片输出的Keep信号 对应changeFIFO1_Dout
wire		fragOutNoneCrc_DoutLast; // 生成一个无CRC分片输出的Nd信号 对应changeFIFO1_Dout
assign fragOutNoneCrc_DoutLast = !changeFIFO1_rdEn && changeFIFO1_rdEnDy1 ? 1'b1 : 1'b0;


assign fragOutNoneCrc_DoutKeep = (changeFIFO1_DoutIndexDy1 == 4'b0001) ? 4'h8 : (changeFIFO1_DoutIndexDy1 == 4'b0010) ? 4'hC : 
								(changeFIFO1_DoutIndexDy1 == 4'b0011) ?  4'hE:	(changeFIFO1_DoutIndexDy1 == 4'b0100) ?  4'hF: 4'h0;
changeFIFO changeFIFO1 (
	.clk        (clk),
	.rst_n      (!rst),
	.Din        (fifo1DataOut),
	.Din_index  (changeFIFO1_DinIndex),// fifo1KeepOut
	.wr_en      (fifo1DataValid),
	.Dout_index (changeFIFO1_DoutIndex),
	.rd_en      (changeFIFO1_rdEn),
	.Dout       (changeFIFO1_Dout),
	.index      (changeFIFO1_index) // 不连接，待后续处理
);
// 添加读取周期计数器
reg [11:0] fifo_read_cycles = 'd0;
reg [11:0] change_fifo_read_cycles = 'd0;
// 添加等待计数器
reg [1:0] wait_cnt = 2'd0;

// 修改发送状态机
always @(posedge clk) begin
    if (rst) begin
        send_state <= SEND_IDLE;
        send_length_cnt <= 'd0;
        fragment_length <= 'd0;
        frameType_16Bit <= 'd0;
        dataFragCnt_rd <= 'd0;
        fragdone_rd <= 'd0;
        frameAggrOffset_length <= 'd0;
        fifoDataRdEn <= 1'b0;
        len_ptr_rd <= 4'd0;
        valid_delay_cnt <= 'd0;
        read_bytes_cnt <= 'd0;
        changeFIFO1_rdEn <= 1'b0;
        fifo_read_cycles <= 'd0;
        change_fifo_read_cycles <= 'd0;
        changeFIFO1_DoutIndex <= 4'b1111;

    end else begin
		changeFIFO1_rdEnDy1			<= changeFIFO1_rdEn		;	
		changeFIFO1_DoutIndexDy1	<= changeFIFO1_DoutIndex;
        case (send_state)
            SEND_IDLE: begin
                if (len[len_ptr_rd] != 33'd0) begin
                    // 读取len[len_ptr_rd]中的各个字段
                    frameType_16Bit <= {15'd0, len[len_ptr_rd][32]};
                    dataFragCnt_rd <= len[len_ptr_rd][31:25];
                    fragdone_rd <= len[len_ptr_rd][24];
                    frameAggrOffset_length <= len[len_ptr_rd][23:12];
                    fragment_length <= len[len_ptr_rd][11:0];
                    
                    // 清空当前位置并移动指针
                    len[len_ptr_rd] <= 33'd0;
                    len_ptr_rd <= len_ptr_rd + 1'b1;
                    
                    // 重置计数器
                    fifo_read_cycles <= 'd0;
                    change_fifo_read_cycles <= 'd0;
                    valid_delay_cnt <= 'd0;
                    send_state <= SEND_READ_LEN;
                end
            end

            SEND_READ_LEN: begin
                    // 控制fifoDataRdEn基于读取周期数
                    if (4 * (fifo_read_cycles) < fragment_length) begin // 4 * (fifo_read_cycles) < fragment_length - remain_Byte
                        fifoDataRdEn <= 1'b1;
                        fifo_read_cycles <= fifo_read_cycles + 1'b1;
                    end else begin
						// 残余数据 remain_Byte = 4 * (fifo_read_cycles) - fragment_length
                        fifoDataRdEn <= 1'b0;
                    end
                    
                    // valid信号延迟计数
                    valid_delay_cnt <= valid_delay_cnt + 1'b1;
                    
                    // 延迟两个时钟周期后开始读取changeFIFO并处理数据
                    if (valid_delay_cnt >= 3'd2) begin
                        // 计算剩余需要读取的字节数

                        if (4 * change_fifo_read_cycles < fragment_length) begin
                            changeFIFO1_rdEn <= 1'b1;
                            change_fifo_read_cycles <= change_fifo_read_cycles + 1'b1;
                            changeFIFO1_DoutIndex <= 4'd4;
							if(4 * change_fifo_read_cycles +'d4 >= fragment_length )begin
								case (  fragment_length - 4 * change_fifo_read_cycles)
									'd1: changeFIFO1_DoutIndex <= 'd1;
									'd2: changeFIFO1_DoutIndex <= 'd2;
									'd3: changeFIFO1_DoutIndex <= 'd3;
									'd4: changeFIFO1_DoutIndex <= 'd4;
									default: changeFIFO1_DoutIndex <= 'd0;
								endcase
								atest <= atest + 'd1;
							end

                        end else begin

                            // 下一个时钟周期停止读取
                            changeFIFO1_rdEn <= 1'b0;
                            send_state <= SEND_WAIT;
                        end
                    end
            end

            SEND_WAIT: begin //多等两个时钟在发数据
					fifoDataRdEn <= 1'b0;
                    changeFIFO1_rdEn <= 1'b0;
                    fifo_read_cycles <= 'd0;
                    change_fifo_read_cycles <= 'd0;
                    valid_delay_cnt <= 'd0;
                    changeFIFO1_DoutIndex <= 4'b0;
                if (wait_cnt < 2'd3) begin
                    // 等待计数器增加
                    wait_cnt <= wait_cnt + 1'b1;
                end else begin
                    // 等待三个时钟周期后重置所有信号
                    wait_cnt <= 2'd0;
                    send_state <= SEND_IDLE;

                end
            end

            default: begin
                send_state <= SEND_IDLE;
                fifoDataRdEn <= 1'b0;
                changeFIFO1_rdEn <= 1'b0;
                valid_delay_cnt <= 'd0;
            end
        endcase
    end
end
wire			addFrame_tvalid			;
wire	[31:0]	addFrame_tdata			;
wire	[3:0]	addFrame_tkeep			;
wire			addFrame_tlast			;
addFrameHead addFrameHead (
    .clk                    (clk                    ),  // 时钟信号
    .rst                    (rst                    ),  // 复位信号
    
    // 输入信号
    .fragOutNoneCrc_DoutNd (fragOutNoneCrc_DoutNd ),  // 输入数据有效
    .changeFIFO1_Dout      (changeFIFO1_Dout      ),  // 输入数据
    .fragOutNoneCrc_DoutKeep(fragOutNoneCrc_DoutKeep), // 输入数据字节有效
    .fragOutNoneCrc_DoutLast(fragOutNoneCrc_DoutLast), // 输入数据最后一拍
    .frameType_16Bit       (frameType_16Bit       ),  // 帧类型
    .dataFragCnt_rd        (dataFragCnt_rd        ),  // 分片计数
    .fragdone_rd           (fragdone_rd           ),  // 分片是否结束
    .frameAggrOffset_length(frameAggrOffset_length),  // 帧聚合偏移长度
    .fragment_length       (fragment_length       ),  // 片长度
    
    // 输出AXIS接口
    .m_axis_tvalid         (addFrame_tvalid			),  // 输出数据有效
    .m_axis_tdata          (addFrame_tdata			),  // 输出数据
    .m_axis_tkeep          (addFrame_tkeep			),  // 输出数据字节有效
    .m_axis_tlast          (addFrame_tlast			),  // 输出数据最后一拍
    .m_axis_tready         (1'b1         )   // 下游准备接收 i
);

wire			sendCrcOut_tvalid			;
wire	[31:0]	sendCrcOut_tdata			;
wire	[3:0]	sendCrcOut_tkeep			;
wire			sendCrcOut_tlast			;
CRC16Par32Poly0x1021Keep sendCrc (
    .clk        (clk            ),  // 时钟输入
    .Rst        (rst            ),  // 复位信号
    .FlagTR     (1'b1        ),  // 1:发送校验 0:接收校验
    .DinNd      (addFrame_tvalid		),  // 数据有效
    .Din        (addFrame_tdata			),  // 32位输入数据
    .DinKeep    (addFrame_tkeep			),  // 数据保持位
    .DinLast    (addFrame_tlast			),  // 最后一个数据标志
    .RegIni     (16'hFFFF        ),  // 初始寄存器值
    .DoutNd     (sendCrcOut_tvalid			),  // 输出数据有效
    .Dout       (sendCrcOut_tdata			),  // 32位输出数据
    .DoutKeep   (sendCrcOut_tkeep			),  // 输出数据保持位
    .DoutLast   (sendCrcOut_tlast			)  // 输出最后数据标志
);
reg [15:0]	Dy4frameType_16Bit			= 'd0;    // 0000：无可选字段；0001：帧聚合选项
reg [6:0]	Dy4dataFragCnt_rd			= 'd0;    // 分片计数
reg			Dy4fragdone_rd				= 'd0;    // 分片是否结束
reg [11:0]	Dy4frameAggrOffset_length	= 'd0;    // 帧聚合偏移长度（之前累计发了多少长度）
reg [11:0]	Dy4fragment_length			= 'd0;    // 片长度 fragment_length

// 添加中间延迟寄存器 (Dy1-Dy3)
reg [15:0] Dy1_fType = 'd0, Dy2_fType = 'd0, Dy3_fType = 'd0;
reg [6:0]  Dy1_fCnt = 'd0,  Dy2_fCnt = 'd0,  Dy3_fCnt = 'd0;
reg        Dy1_fDone = 'd0, Dy2_fDone = 'd0, Dy3_fDone = 'd0;
reg [11:0] Dy1_fLen = 'd0,  Dy2_fLen = 'd0,  Dy3_fLen = 'd0;
reg [11:0] Dy1_fOff = 'd0,  Dy2_fOff = 'd0,  Dy3_fOff = 'd0;
// 添加延迟逻辑
always @(posedge clk) begin
    if (rst) begin
        // 清零所有延迟寄存器
        {Dy1_fType, Dy2_fType, Dy3_fType, Dy4frameType_16Bit} <= 'd0;
        {Dy1_fCnt, Dy2_fCnt, Dy3_fCnt, Dy4dataFragCnt_rd} <= 'd0;
        {Dy1_fDone, Dy2_fDone, Dy3_fDone, Dy4fragdone_rd} <= 'd0;
        {Dy1_fLen, Dy2_fLen, Dy3_fLen, Dy4fragment_length} <= 'd0;
        {Dy1_fOff, Dy2_fOff, Dy3_fOff, Dy4frameAggrOffset_length} <= 'd0;
    end
    else begin
        // 第一级延迟
        Dy1_fType <= frameType_16Bit;
        Dy1_fCnt  <= dataFragCnt_rd;
        Dy1_fDone <= fragdone_rd;
        Dy1_fLen  <= fragment_length;
        Dy1_fOff  <= frameAggrOffset_length;
        // 第二级延迟
        Dy2_fType <= Dy1_fType;
        Dy2_fCnt  <= Dy1_fCnt;
        Dy2_fDone <= Dy1_fDone;
        Dy2_fLen  <= Dy1_fLen;
        Dy2_fOff  <= Dy1_fOff;
        // 第三级延迟
        Dy3_fType <= Dy2_fType;
        Dy3_fCnt  <= Dy2_fCnt;
        Dy3_fDone <= Dy2_fDone;
        Dy3_fLen  <= Dy2_fLen;
        Dy3_fOff  <= Dy2_fOff;
        // 第四级延迟（最终输出）
        Dy4frameType_16Bit        <= Dy3_fType;
        Dy4dataFragCnt_rd         <= Dy3_fCnt;
        Dy4fragdone_rd            <= Dy3_fDone;
        Dy4fragment_length        <= Dy3_fLen;
        Dy4frameAggrOffset_length <= Dy3_fOff;
    end
end


//     .DoutNd     (sendCrcOut_tvalid			),  // 输出数据有效
//     .Dout       (sendCrcOut_tdata			),  // 32位输出数据
//     .DoutKeep   (sendCrcOut_tkeep			),  // 输出数据保持位
//     .DoutLast   (sendCrcOut_tlast			)  // 输出最后数据标志
// reg [15:0]	Dy4frameType_16Bit			= 'd0;    // 0000：无可选字段；0001：帧聚合选项
// reg [6:0]	Dy4dataFragCnt_rd			= 'd0;    // 分片计数
// reg			Dy4fragdone_rd				= 'd0;    // 分片是否结束
// reg [11:0]	Dy4frameAggrOffset_length	= 'd0;    // 帧聚合偏移长度（之前累计发了多少长度）
// reg [11:0]	Dy4fragment_length			= 'd0;    // 片长度 fragment_length
    // localparam MAX_FRAG_SIZE    = 12'd841;  // 最大分片大小
    // localparam DATA_DOMAIN_SIZE = 12'd848;  // 数据域大小
    // localparam HEADER_SIZE_AGGR = 5'd11;    // 聚合帧头尾大小
	// localparam HEADER_SIZE_NORMAL = 5'd7;  // 普通帧头尾大小

    // 实例化 writeChange_FIFO
    reg [31:0] writeFIFO_din;
    reg [3:0]  writeFIFO_din_index;
    reg        writeFIFO_wrEn;
    wire        writeFIFO_doutNd;
    wire [31:0] writeFIFO_dout;
    wire [3:0]  writeFIFO_index;
    reg readFIFO_rdEn = 1'b0;
    writeChange_FIFO writeFIFO (
        .clk            (clk),
        .rst_n          (!rst),
        .Din            (writeFIFO_din			),
        .Din_index      (writeFIFO_din_index	),
        .wr_en          (writeFIFO_wrEn			),
        .Dout_valid     (writeFIFO_doutNd		),
        .Dout           (writeFIFO_dout			),
        .index          (writeFIFO_index		)
    );

reg sendCrcOut_tvalid_Dy1;
reg sendCrcOut_tlast_Dy1;
reg Dy4frameType_1Bit_reg;// 留存发送帧类型
// 添加累加长度寄存器和5A填充计数器
reg [11:0] accumulated_length = 'd0;
reg [11:0] padding_count = 'd0; // 填充5A的长度 // 填充的字节数为1-11
reg        is_padding = 1'b0;  // 标识当前是否在进行5A填充

// 处理帧聚合和填充逻辑
always @(posedge clk) begin
    if (rst) begin
        accumulated_length <= 'd0;
        padding_count <= 'd0;
        is_padding <= 1'b0;
        writeFIFO_wrEn <= 1'b0;
        writeFIFO_din <= 32'd0;
        writeFIFO_din_index <= 4'd0;
    end
    else begin
		sendCrcOut_tvalid_Dy1 <= sendCrcOut_tvalid;
		sendCrcOut_tlast_Dy1 <= sendCrcOut_tlast;
		if(sendCrcOut_tvalid) begin 
            writeFIFO_wrEn <= sendCrcOut_tvalid;
            writeFIFO_din <= sendCrcOut_tdata;
            writeFIFO_din_index <= sendCrcOut_tkeep;

			// if(Dy4frameType_16Bit[0] && (sendCrcOut_tvalid && !sendCrcOut_tvalid_Dy1))begin
			if(sendCrcOut_tvalid && !sendCrcOut_tvalid_Dy1) begin
				Dy4frameType_1Bit_reg <= Dy4frameType_16Bit[0];
				if(Dy4frameType_16Bit[0])begin
					accumulated_length <= accumulated_length + Dy4fragment_length + HEADER_SIZE_AGGR;
				end
				else begin
					accumulated_length <= accumulated_length + Dy4fragment_length + HEADER_SIZE_NORMAL;
				end
				


			end

		end
		else begin //!sendCrcOut_tvalid
					case(padding_count)
						4'd0:begin
							writeFIFO_wrEn <= 'd0;
							writeFIFO_din <= 'd0;
							writeFIFO_din_index <= 'd0;
							padding_count <= 'd0;
						end
						4'd1:begin
							writeFIFO_wrEn <= 'd1;
							writeFIFO_din <= {{1{8'h5A}}, {8*3{1'b0}}};
							writeFIFO_din_index <= 'd1;
							padding_count <= 'd0;
						end 
						4'd2: begin
							writeFIFO_wrEn <= 'd1;
							writeFIFO_din <= {{2{8'h5A}}, {8*2{1'b0}}};
							writeFIFO_din_index <= 'd2;
							padding_count <= 4'd0;
						end
						4'd3: begin
							writeFIFO_wrEn <= 'd1;
							writeFIFO_din <= {{3{8'h5A}}, {8*1{1'b0}}};
							writeFIFO_din_index <= 'd3;
							padding_count <= 4'd0;
						end
						4'd4: begin
							writeFIFO_wrEn <= 'd1;
							writeFIFO_din <= {{4{8'h5A}}, {0*1{1'b0}}};
							writeFIFO_din_index <= 'd4;
							padding_count <= 'd0;
						end
						default: begin
							writeFIFO_wrEn <= 'd1;
							writeFIFO_din <= {{4{8'h5A}}, {0*1{1'b0}}};
							writeFIFO_din_index <= 'd4;
							padding_count <= padding_count - 'd4;
						end
					endcase
		end
		if(!Dy4frameType_1Bit_reg && sendCrcOut_tlast_Dy1)begin // 跳转到发5A状态 
			accumulated_length <= 'd0;
			padding_count <= DATA_DOMAIN_SIZE - accumulated_length;
		end
    end
end


fixLengthAxis_FIFO  fixLengthAxis_FIFO (
	.clk            ( clk            ), //i
	.rst_n          ( !rst          ), //i
	.frameLength    ( 848            ), //i
	.Din            ( writeFIFO_dout			), //i
	.Din_valid      ( writeFIFO_doutNd		), //i
	.o_axis_tdata   ( o_axis_tdata   ), //o
	.o_axis_tkeep   ( o_axis_tkeep   ), //o
	.o_axis_tvalid  ( o_axis_tvalid  ), //o
	.o_axis_tlast   ( o_axis_tlast   ), //o
	.o_axis_tready  ( o_axis_tready  )  //i
);



/////////


endmodule