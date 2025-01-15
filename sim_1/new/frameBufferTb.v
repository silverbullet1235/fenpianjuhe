`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/06 15:46:30
// Design Name: 
// Module Name: frameBufferTb
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


module frameBufferTb();

parameter RESET_PERIOD     = 200;
parameter CLKIN_PERIOD    = 2;    // 时钟周期
parameter DATA_WIDTH      = 32;   // 数据位宽
parameter BYTE_NUM        = 4;    // 字节数
parameter WAIT_CYCLES     = 10;   // 帧间等待周期

reg                     sys_rst;
reg                     clk;

// 时钟和复位初始化
initial begin
    clk = 1'b0;
    sys_rst = 1'b1;
    #RESET_PERIOD
    sys_rst = 1'b0;
end

// 时钟生成
always begin
    clk = #(CLKIN_PERIOD/2) ~clk;
end

// 测试信号定义
reg [31:0]  count;          // 计数器
reg [31:0]  i_length;       // 输入长度
reg [31:0]  i_axis_tdata;   // 输入数据
reg [03:0]  i_axis_tkeep;   // 字节有效信号
reg         i_axis_tvalid;   // 数据有效信号
reg         i_axis_tlast;    // 帧结束信号
wire        i_axis_tready;   // 接收就绪信号

// 输出信号
wire[31:0]  m_axis_tdata;   // 输出数据
wire[03:0]  m_axis_tkeep;   // 输出字节有效
wire        m_axis_tvalid;   // 输出数据有效
wire        m_axis_tlast;    // 输出帧结束
wire         m_axis_tready;   // 输出接收就绪

// 测试参数定义
localparam cnt_FixLength = 250;
localparam cnt_GapLength_1 = 125;    // 间隙长度
localparam keep_LastclkByte = 15;
localparam cnt_LastclkByte = 4 - $clog2(16-keep_LastclkByte);
localparam cnt_FixLengthByte = cnt_FixLength * 4 - 4 + cnt_LastclkByte;
assign m_axis_tready = 1'b1;
// 测试激励生成
always @(posedge clk) begin
    if (sys_rst) begin
        count <= 'd0;
        i_length <= 'd0;
        i_axis_tdata <= 32'h12345678;
        i_axis_tkeep <= 'd0;
        i_axis_tvalid <= 'd0;
        i_axis_tlast <= 'd0;
    end else begin
        // 计数器控制
        if (count == (cnt_FixLength + cnt_GapLength_1  - 'd1)) begin
            count <= 'd0;
        end else begin
            count <= count + 1;
        end


		i_length         <= cnt_FixLengthByte;
		i_axis_tdata     <= count == (cnt_FixLength + cnt_GapLength_1 - 'd1) ?  'h12345678 : i_axis_tdata + 1;

		if(count < (cnt_FixLength - 'd1)) i_axis_tkeep <= 'hf;
		else if(count == (cnt_FixLength - 'd1)) i_axis_tkeep <= keep_LastclkByte;
		else  i_axis_tkeep <= 'd0;
		i_axis_tvalid    <= (count <= (cnt_FixLength - 'd1)) ? 'b1 : 'b0;
		i_axis_tlast     <= (count == (cnt_FixLength - 'd1)) ? 'b1 : 'b0;
    end
end

// DUT实例化
frameBuffer #(
    .DATA_WIDTH(DATA_WIDTH),
    .BYTE_NUM(BYTE_NUM),
    .WAIT_CYCLES(WAIT_CYCLES)
) frame_buffer_inst (
    .clk(clk),
    .rst_n(!sys_rst),
    
    // 输入接口
    .i_axis_tdata(i_axis_tdata),
    .i_axis_tkeep(i_axis_tkeep),
    .i_axis_tvalid(i_axis_tvalid),
    .i_axis_tlast(i_axis_tlast),
    .i_axis_tready(i_axis_tready),
    .i_length(i_length),
    
    // 输出接口
    .m_axis_tdata(m_axis_tdata),
    .m_axis_tkeep(m_axis_tkeep),
    .m_axis_tvalid(m_axis_tvalid),
    .m_axis_tlast(m_axis_tlast),
    .m_axis_tready(m_axis_tready)
);




// // 测试结果监控
// reg [31:0] frame_monitor;
// always @(posedge clk) begin
//     if (sys_rst) begin
//         frame_monitor <= 0;
//     end else begin
//         if (m_axis_tvalid && m_axis_tready && m_axis_tlast) begin
//             frame_monitor <= frame_monitor + 1;
//             $display("Frame %d completed at time %t", frame_monitor, $time);
//         end
//     end
// end

endmodule

