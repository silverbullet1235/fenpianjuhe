`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/06 15:42:33
// Design Name: 
// Module Name: fpjhSendTb
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


module fpjhSendTb();

parameter RESET_PERIOD 		= 200;
parameter CLKIN_PERIOD      = 2;	// Input Clock Period

reg 						sys_rst;
reg 						clk;

initial begin
	clk = 1'b0;
	sys_rst = 1'b1;
	#RESET_PERIOD
	sys_rst = 1'b0;
end

always begin
	clk = #(CLKIN_PERIOD/2) ~clk;
end

reg [31:0]  count           ;
reg [11:0]  i_length         ;
reg         i_axis_tvalid    ;
reg [31:0]  i_axis_tdata     ;
reg [03:0]  i_axis_tkeep     ;
reg         i_axis_tlast     ;
wire        i_axis_tready    ;
wire        o_axis_tvalid    ;
wire[31:0]  o_axis_tdata     ;
wire[03:0]  o_axis_tkeep     ;
wire        o_axis_tlast     ;
reg         o_axis_tready    ;
// wire        i_axis_rvalid;
// wire[31:0]  i_axis_rdata ;
// wire[03:0]  i_axis_rkeep ;
// wire        i_axis_rlast ;
wire        o_axis_rvalid;
wire[31:0]  o_axis_rdata;
wire[03:0]  o_axis_rkeep ;
wire        o_axis_rlast ;
reg        o_axis_rready;
wire[31:0]  o_length ;


// // 测试长度方案1
// localparam cnt_FixLength_1 	= 30	;    // 第一种数据长度  250 可以
// localparam cnt_FixLength_2 	= 210	;    // 第二种数据长度
// localparam cnt_FixLength_3 	= 500	;    // 第三种数据长度
// localparam cnt_GapLength_1 	= 80	;    // 第一种间隙长度
// localparam cnt_GapLength_2 	= 80	;    // 第二种间隙长度
// localparam cnt_GapLength_3 	= 80	;    // 第三种间隙长度
// localparam keep_LastclkByte = 14	; // 8 12 14 15 // 3 2 1 0
// localparam cnt_LastclkByte = 4 - $clog2(16-keep_LastclkByte);
// localparam cnt_FixLengthByte_1 = cnt_FixLength_1 * 4 - 4 + cnt_LastclkByte;
// localparam cnt_FixLengthByte_2 = cnt_FixLength_2 * 4 - 4 + cnt_LastclkByte;
// localparam cnt_FixLengthByte_3 = cnt_FixLength_3 * 4 - 4 + cnt_LastclkByte;

// // 测试长度方案2
// localparam cnt_FixLength_1 = 208;    // 第一种数据长度  250 可以
// localparam cnt_FixLength_2 = 208;    // 第二种数据长度
// localparam cnt_FixLength_3 = 208;    // 第三种数据长度
// localparam cnt_GapLength_1 = 103;    // 第一种间隙长度
// localparam cnt_GapLength_2 = 103;    // 第二种间隙长度
// localparam cnt_GapLength_3 = 103;    // 第三种间隙长度
// localparam keep_LastclkByte = 8; // 8 12 14 15 // 3 2 1 0
// localparam cnt_LastclkByte = 4 - $clog2(16-keep_LastclkByte);
// localparam cnt_FixLengthByte_1 = cnt_FixLength_1 * 4 - 4 + cnt_LastclkByte;
// localparam cnt_FixLengthByte_2 = cnt_FixLength_2 * 4 - 4 + cnt_LastclkByte;
// localparam cnt_FixLengthByte_3 = cnt_FixLength_3 * 4 - 4 + cnt_LastclkByte;

// 测试长度方案3
localparam cnt_FixLength_1 = 15;    // 第一种数据长度  250 可以
localparam cnt_FixLength_2 = 15;    // 第二种数据长度
localparam cnt_FixLength_3 = 15;    // 第三种数据长度
localparam cnt_GapLength_1 = 16;    // 第一种间隙长度
localparam cnt_GapLength_2 = 16;    // 第二种间隙长度
localparam cnt_GapLength_3 = 16;    // 第三种间隙长度
localparam keep_LastclkByte = 8; // 8 12 14 15 // 3 2 1 0
localparam cnt_LastclkByte = 4 - $clog2(16-keep_LastclkByte);
localparam cnt_FixLengthByte_1 = cnt_FixLength_1 * 4 - 4 + cnt_LastclkByte;
localparam cnt_FixLengthByte_2 = cnt_FixLength_2 * 4 - 4 + cnt_LastclkByte;
localparam cnt_FixLengthByte_3 = cnt_FixLength_3 * 4 - 4 + cnt_LastclkByte;

reg [1:0] gap_sel;  // 用于选择间隙长度的标志位

always @(posedge clk ) begin
	if( sys_rst ) begin
		count           <= 'd0;
		i_length         <= 'd0;
		i_axis_tdata     <= 'h12345678;
		i_axis_tkeep     <= 'd0;
		i_axis_tvalid    <= 'd0;
		i_axis_tlast     <= 'd0;
		o_axis_tready    <= 'd0;
		o_axis_rready    <= 'd0;
		gap_sel         <= 2'd0;  // 初始化选择标志位为2位
	end else begin
		o_axis_tready <= 'd1;
		o_axis_rready <= 'd1;
		if (count == ((gap_sel == 2'd0 ? cnt_FixLength_1 : 
						gap_sel == 2'd1 ? cnt_FixLength_2 : cnt_FixLength_3) + 
						(gap_sel == 2'd0 ? cnt_GapLength_1 : 
						gap_sel == 2'd1 ? cnt_GapLength_2 : cnt_GapLength_3) - 'd1)) begin
			count <= 'd0;
			gap_sel <= (gap_sel == 2'd2) ? 2'd0 : gap_sel + 1'b1;
		end else begin
			count <= count + 1;
		end
		
		i_length <= (gap_sel == 2'd0 ? cnt_FixLength_1 : 
					gap_sel == 2'd1 ? cnt_FixLength_2 : cnt_FixLength_3) * 4 - 4 + cnt_LastclkByte;
		
		i_axis_tdata <= count ==	((gap_sel == 2'd0 ? cnt_FixLength_1 : 
									gap_sel == 2'd1 ? cnt_FixLength_2 : cnt_FixLength_3) + 
									(gap_sel == 2'd0 ? cnt_GapLength_1 : 
									gap_sel == 2'd1 ? cnt_GapLength_2 : cnt_GapLength_3) - 'd1) ? 
									'h12345678 : i_axis_tdata + 1;

		if(count < ((gap_sel == 2'd0 ? cnt_FixLength_1 : 
					gap_sel == 2'd1 ? cnt_FixLength_2 : cnt_FixLength_3) - 'd1)) 
			i_axis_tkeep <= 'hf;
		else if(count == ((gap_sel == 2'd0 ? cnt_FixLength_1 : 
							gap_sel == 2'd1 ? cnt_FixLength_2 : cnt_FixLength_3) - 'd1)) 
			i_axis_tkeep <= keep_LastclkByte;
		else  
			i_axis_tkeep <= 'd0;
			
		i_axis_tvalid <= count <= ((gap_sel == 2'd0 ? cnt_FixLength_1 : 
									gap_sel == 2'd1 ? cnt_FixLength_2 : cnt_FixLength_3) - 'd1) ? 'b1 : 'b0;
		i_axis_tlast  <= count == ((gap_sel == 2'd0 ? cnt_FixLength_1 : 
									gap_sel == 2'd1 ? cnt_FixLength_2 : cnt_FixLength_3) - 'd1) ? 'b1 : 'b0;
		o_axis_tready <= 'b1;
	end
end

fpjhSend u_fpjhSend (
    .clk            (clk),                // 系统时钟
    .rst          (sys_rst),              // 复位信号
    
    // 输入AXIS接口
    .i_length       (i_length		),        // 数据长度
    .i_axis_tdata   (i_axis_tdata	),       // 输入数据
    .i_axis_tkeep   (i_axis_tkeep	),       // 输入字节有效
    .i_axis_tvalid  (i_axis_tvalid	),      // 输入数据有效
    .i_axis_tlast   (i_axis_tlast	),       // 输入最后数据标志
    .i_axis_tready  (i_axis_tready	),      // 输入就绪信号
    
    // 输出AXIS接口
    .o_axis_tdata   ( o_axis_tdata   ),       // 输出数据
    .o_axis_tkeep   ( o_axis_tkeep   ),       // 输出字节有效
    .o_axis_tvalid  ( o_axis_tvalid  ),      // 输出数据有效
    .o_axis_tlast   ( o_axis_tlast   ),       // 输出最后数据标志
    .o_axis_tready  ( o_axis_tready  )       // 输出就绪信号
);



fpjhRece u_fpjhRece (
    .clk            (clk),              // 系统时钟
    .rst            (sys_rst),              // 复位信号
    
    // 输入AXIS接口
    .i_axis_tdata   (o_axis_tdata),     // 输入数据[31:0]
    .i_axis_tkeep   (o_axis_tkeep),     // 字节有效[3:0]
    .i_axis_tvalid  (o_axis_tvalid),    // 数据有效
    .i_axis_tlast   (o_axis_tlast),     // 最后一个数据
    .i_axis_tready  (i_axis_tready),    // 准备接收
    
    // 输出AXIS接口
    .o_axis_tdata   (o_axis_rdata ),     // 输出数据[31:0]
    .o_axis_tkeep   (o_axis_rkeep ),     // 输出字节有效[3:0]
    .o_axis_tvalid  (o_axis_rvalid),    // 输出数据有效
    .o_axis_tlast   (o_axis_rlast ),     // 输出最后数据标志
    .o_axis_tready  (o_axis_rready	),    // 下游模块准备接收
    .o_length       (o_length)          // 输出长度[31:0]
);


endmodule
