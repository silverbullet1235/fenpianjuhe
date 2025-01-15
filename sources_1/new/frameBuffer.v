`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/06 15:46:11
// Design Name: 
// Module Name: frameBuffer
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


module frameBuffer #(
    parameter   DATA_WIDTH = 32,
                BYTE_NUM = DATA_WIDTH/8,
                WAIT_CYCLES = 10
)(
    input  wire                         clk,
    input  wire                         rst_n,

    input  wire [DATA_WIDTH-1:0]        i_length,
    input  wire [DATA_WIDTH-1:0]        i_axis_tdata,
    input  wire [BYTE_NUM-1:0]          i_axis_tkeep,
    input  wire                         i_axis_tvalid,
    input  wire                         i_axis_tlast,
    output wire                         i_axis_tready,

    output  wire [DATA_WIDTH-1:0]       m_length,
    output wire [DATA_WIDTH-1:0]        m_axis_tdata,
    output wire [BYTE_NUM-1:0]          m_axis_tkeep,
    output wire                         m_axis_tvalid,
    output wire                         m_axis_tlast,
    input  wire                         m_axis_tready
);

// 状态机定义
localparam  IDLE = 3'd0,           // 等待开始输出
            SENDING1 = 3'd1,        // 发送第一帧数据
            GAP1 = 3'd2,           // 第一个间隔
            SENDING2 = 3'd3,        // 发送第二帧数据
            GAP2 = 3'd4,           // 第二个间隔
            SENDING3 = 3'd5;        // 发送第三帧数据

reg [2:0] state;

// 控制信号
reg i_axis_tvalid_reg = 1'b0;
reg [1:0] frame_output_cnt = 2'd0;        // 输出帧计数器
reg [7:0] frame_interval_cnt = 8'd0;      // 帧间隔计数器
reg [2:0] tvalid_edge_cnt = 3'd0;        // tvalid上升沿计数器
reg start_output = 1'b0;                  // 开始输出控制信号
reg fifo_len_rd_en = 1'b0;               // 长度FIFO读使能
reg fifo_data_wr_en = 1'b0;              // 数据FIFO写使能
reg fifo_data_rd_en = 1'b0;              // 数据FIFO读使能
reg [13:0] sending_cnt = 'd0;

// FIFO相关信号
wire fifo_data_full, fifo_data_empty, fifo_data_valid;
wire fifo_len_full, fifo_len_empty, fifo_len_valid; 
wire [DATA_WIDTH-1:0] fifo_data_dout;
wire [BYTE_NUM-1:0] fifo_data_keep;
wire [DATA_WIDTH-1:0] fifo_len_dout;

// 记录 i_axis_tvalid 的上一个周期值
always @(posedge clk) begin
    if (!rst_n)
        i_axis_tvalid_reg <= 1'b0;
    else
        i_axis_tvalid_reg <= i_axis_tvalid;
end


// 状态机控制逻辑
always @(posedge clk) begin
    if (!rst_n) begin
        state <= IDLE;
        frame_interval_cnt <= 0;
        fifo_data_rd_en <= 0;
    end else begin
        if (i_axis_tvalid && !i_axis_tvalid_reg && !(state == IDLE && (tvalid_edge_cnt >= 3'd3))) begin
            tvalid_edge_cnt <= tvalid_edge_cnt + 1'b1;
        end
        case (state)
            IDLE: begin
                if (tvalid_edge_cnt >= 3'd3) begin
                    state <= SENDING1;
                    tvalid_edge_cnt <= (i_axis_tvalid && !i_axis_tvalid_reg) ? tvalid_edge_cnt - 'd2 : tvalid_edge_cnt - 'd3;
                    fifo_len_rd_en <= 1'b1;
                    fifo_data_rd_en <= 1'b1;
                end
            end
            
            SENDING1: begin
                fifo_len_rd_en <= 1'b0;
                sending_cnt <= sending_cnt + 1'b1;
                if (m_axis_tready && !fifo_data_empty) begin
                    if ((sending_cnt << 2) >= fifo_len_dout - 'd4) begin //依据读时钟调整'd2
                        state <= GAP1;
                        frame_interval_cnt <= 8'd0;
                        fifo_data_rd_en <= 1'b0;
                        sending_cnt <= 'd0;
                    end
                end
            end
            
            GAP1: begin
                if (frame_interval_cnt == WAIT_CYCLES-1) begin
                    state <= SENDING2;
                    fifo_data_rd_en <= 1'b1;
                    frame_interval_cnt <= 8'd0;
                    fifo_len_rd_en <= 1'b1;
                end else begin
                    frame_interval_cnt <= frame_interval_cnt + 1'b1;
                end
            end
            
            SENDING2: begin
                fifo_len_rd_en <= 1'b0;
                sending_cnt <= sending_cnt + 1'b1;
                if (m_axis_tready && !fifo_data_empty) begin
                    if ((sending_cnt << 2) >= fifo_len_dout - 'd4) begin //依据读时钟调整'd2
                        state <= GAP2;
                        frame_interval_cnt <= 8'd0;
                        fifo_data_rd_en <= 1'b0;
                        sending_cnt <= 'd0;
                    end
                end
            end
            
            GAP2: begin
                if (frame_interval_cnt == WAIT_CYCLES-1) begin
                    state <= SENDING3;
                    fifo_data_rd_en <= 1'b1;
                    frame_interval_cnt <= 8'd0;
                    fifo_len_rd_en <= 1'b1;
                end else begin
                    frame_interval_cnt <= frame_interval_cnt + 1'b1;
                end
            end
            
            SENDING3: begin
                fifo_len_rd_en <= 1'b0;
                sending_cnt <= sending_cnt + 1'b1;
                if (m_axis_tready && !fifo_data_empty) begin
                    if ((sending_cnt << 2) >= fifo_len_dout - 'd4) begin //依据读时钟调整'd2
                        state <= IDLE;
                        fifo_data_rd_en <= 1'b0;
                        sending_cnt <= 'd0;
                    end
                end
            end
        endcase
    end
end

// 数据FIFO实例化
xpmFifoSync #(
    .WRITE_DATA_WIDTH  (DATA_WIDTH + BYTE_NUM + 1),
    .READ_DATA_WIDTH   (DATA_WIDTH + BYTE_NUM + 1),
    .FIFO_WRITE_DEPTH (1024),
    .USE_ADV_FEATURES  ("1707")
) u_xpmFifoSync_data (
    .clk         (clk),
    .rst_n       (rst_n),
    .Din         ({i_axis_tkeep, i_axis_tdata, i_axis_tlast}),
    .wr_en       (i_axis_tvalid),
    .rd_en       (fifo_data_rd_en && m_axis_tready),
    .data_valid  (fifo_data_valid),
    .Dout        ({fifo_data_keep, fifo_data_dout, fifo_data_last}),
    .fifo_full   (fifo_data_full),
    .fifo_empty  (fifo_data_empty)
);

// 长度FIFO实例化
xpmFifoSync #(
    .WRITE_DATA_WIDTH  (DATA_WIDTH),
    .READ_DATA_WIDTH   (DATA_WIDTH),
    .FIFO_WRITE_DEPTH (128),
    .USE_ADV_FEATURES  ("1707")
) u_xpmFifoSync_len (
    .clk         (clk),
    .rst_n       (rst_n),
    .Din         (i_length),
    .wr_en       (i_axis_tvalid && !i_axis_tvalid_reg),
    .rd_en       (fifo_len_rd_en),
    .data_valid  (fifo_len_valid),
    .Dout        (fifo_len_dout),
    .fifo_full   (fifo_len_full),
    .fifo_empty  (fifo_len_empty)
    // 加个valid信号
);

// 输出信号赋值
assign i_axis_tready = !fifo_data_full && !fifo_len_full;
assign m_axis_tvalid = fifo_data_valid;
assign m_axis_tdata = fifo_data_dout;
assign m_axis_tkeep = fifo_data_valid ? fifo_data_keep : 'd0;
assign m_axis_tlast = fifo_data_valid ? fifo_data_last : 1'b0;
assign m_length =  fifo_len_dout;

endmodule
