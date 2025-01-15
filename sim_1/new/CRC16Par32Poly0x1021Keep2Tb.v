`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/04 11:08:39
// Design Name: 
// Module Name: CRC16Par32Poly0x1021Keep2Tb
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
// Keep1 Keep2 Keep3 Keep4

module CRC16Par32Poly0x1021Keep2Tb();

parameter RESET_PERIOD 		= 200;
parameter CLKIN_PERIOD      = 2;	// Input Clock Period


reg clk;
reg rst;

reg			FlagTR;
reg [15:0]	RegIni;
// 时钟生成
initial begin
    clk = 1'b0;
    rst = 1'b1;
	FlagTR = 1'b1;
	RegIni = 16'hFFFF;
	#RESET_PERIOD
	rst = 1'b0;
end

always begin
	clk = #(CLKIN_PERIOD/2) ~clk;
end

	// input	wire			clk					,
	// input	wire			Rst					,
	// input	wire			FlagTR				,	// 1 为发送校验		0 为接收校验
	// input	wire			SyncIn				,	// 输入 211 时对应 211.5 Byte		输入 216 时对应 216.5 Byte
	// input	wire			DinNd				,
	// input	wire	[31:0]	Din					,
	// input	wire	[15:0]	RegIni				,
	// // 接收校验
	// output	reg				CheckSync	= 1'd0	,	// 此信号拉高对 CheckCRC 进行01检测
	// output	reg				CheckCRC	= 1'd0	,	// 接收CRC校验是否正确， 1 正确		0 不正确
	// // 发送校验
	// output	reg				SyncOut		= 1'd0	,	// 收发标志不同
	// output	reg				DoutNd		= 1'd0	,
	// output	reg		[31:0]	Dout		= 32'd0	,
	// output	wire	[15:0]	CRCout

reg		[31:0]		count		= 'd0	;
reg		[31:0]		DataLen		= 'd0	;
wire				SyncIn			;
reg					DinNd		= 'd0	;
reg		[31:0]		Din			= 'd0	;
// wire	[31:0]		DinPlusOne		;
wire	[31:0]		crcDin			;
reg		[03:0]		DinKeep			= 'd0	;
reg					DinLast			= 'd0	;


localparam cnt_FixLength = 5; // DinNd拉高的时钟周期数 250	250*（250+100）*6.4G = 4.57G
localparam cnt_GapLength = 5;  // DinNd拉低的时钟周期数 30	
localparam keep_LastclkByte = 15;// 8 c e f // 8 12 14 15 // Keep1 Keep2 Keep3 Keep4
localparam cnt_LastclkByte = 4 - $clog2(16-keep_LastclkByte);// 1 2 3 4  
localparam cnt_FixLengthByte = cnt_FixLength * 4 - 4 + cnt_LastclkByte;

wire			CheckSync	;	// 此信号拉高对 CheckCRC 进行01检测
wire			CheckCRC	;	// 接收CRC校验是否正确， 1 正确		0 不正确
wire			SyncOut		;	// 收发标志不同
wire			DoutNd		;
wire	[31:0]	Dout		;
wire	[03:0]	DoutKeep	;
wire			DoutLast	;
wire	[15:0]	CRCout		;

// assign DinPlusOne = Din + 'd1;
assign crcDin = (1 < count && count < cnt_FixLength + 'd1) ? Din : 
					(count == cnt_FixLength + 'd1) ? {Din[31-:cnt_LastclkByte*8], {((4-cnt_LastclkByte)*8){1'b0}}} : 'd0;
always @(posedge clk ) begin
	if( rst ) begin
		count           <= 'd0;
		DataLen         <= 'd0;
		Din     <= 'h12345678;
		DinKeep     <= 'd0;
		DinNd    <= 'd0;
		DinLast     <= 'd0;
	end else begin
		count           <= count == (cnt_FixLength + cnt_GapLength - 'd1) ? 'd0 : count + 1;
		DataLen         <= cnt_FixLengthByte;
		Din     <=	count == (cnt_FixLength + cnt_GapLength - 'd1) ? 'h12345678 : Din + 1;

		if(0 < count && count < (cnt_FixLength)) DinKeep <= 'hf;
		else if(count == cnt_FixLength) DinKeep <= keep_LastclkByte;
		else  DinKeep <= 'd0;

		DinNd    <=(0 < count && count <= cnt_FixLength)? 'b1 : 'b0;
		DinLast     <= count == cnt_FixLength ? 'b1 : 'b0;
	end
end
assign SyncIn = count == 'd1 ? 'b1 : 'b0;
// 实例化被测模块
generate
	if(cnt_LastclkByte == 1)begin : Tx_crcKeep1
		CRC16Par32Poly0x1021Keep1 Tx_crcKeep1 (
			.clk        (clk                            	),
			.Rst        (rst                            	),
			.FlagTR     (FlagTR                         	),
			.SyncIn     (SyncIn                         	),
			.DinNd      (DinNd                          	),
			.Din        (crcDin                         	),
			.DinKeep    (DinKeep                        	),
			.DinLast    (DinLast                        	),
			.RegIni     (RegIni                         	),
			.CheckSync  (CheckSync                      	),
			.CheckCRC   (CheckCRC                       	),
			.SyncOut    (SyncOut                        	),
			.DoutNd     (DoutNd                         	),
			.Dout       (Dout                           	),
			.DoutKeep   (DoutKeep                       	),
			.DoutLast   (DoutLast                       	),
			.CRCout     (CRCout                         	)
		);
	end
	else if(cnt_LastclkByte == 2)begin : Tx_crcKeep2
		CRC16Par32Poly0x1021Keep2 Tx_crcKeep2 (
			.clk        (clk                            	),
			.Rst        (rst                            	),
			.FlagTR     (FlagTR                         	),
			.SyncIn     (SyncIn                         	),
			.DinNd      (DinNd                          	),
			.Din        (crcDin                         	),
			.DinKeep    (DinKeep                        	),
			.DinLast    (DinLast                        	),
			.RegIni     (RegIni                         	),
			.CheckSync  (CheckSync                      	),
			.CheckCRC   (CheckCRC                       	),
			.SyncOut    (SyncOut                        	),
			.DoutNd     (DoutNd                         	),
			.Dout       (Dout                           	),
			.DoutKeep   (DoutKeep                       	),
			.DoutLast   (DoutLast                       	),
			.CRCout     (CRCout                         	)
		);
	end
	else if (cnt_LastclkByte == 3)begin : Tx_crcKeep3
		CRC16Par32Poly0x1021Keep3 Tx_crcKeep3 (
			.clk        (clk                            	),
			.Rst        (rst                            	),
			.FlagTR     (FlagTR                         	),
			.SyncIn     (SyncIn                         	),
			.DinNd      (DinNd                          	),
			.Din        (crcDin                         	),
			.DinKeep    (DinKeep                        	),
			.DinLast    (DinLast                        	),
			.RegIni     (RegIni                         	),
			.CheckSync  (CheckSync                      	),
			.CheckCRC   (CheckCRC                       	),
			.SyncOut    (SyncOut                        	),
			.DoutNd     (DoutNd                         	),
			.Dout       (Dout                           	),
			.DoutKeep   (DoutKeep                       	),
			.DoutLast   (DoutLast                       	),
			.CRCout     (CRCout                         	)
		);
	end
	else begin : Tx_crcKeep4
		CRC16Par32Poly0x1021Keep4 Tx_crcKeep4 (
			.clk        (clk                            	),
			.Rst        (rst                            	),
			.FlagTR     (FlagTR                         	),
			.SyncIn     (SyncIn                         	),
			.DinNd      (DinNd                          	),
			.Din        (crcDin                         	),
			.DinKeep    (DinKeep                        	),
			.DinLast    (DinLast                        	),
			.RegIni     (RegIni                         	),
			.CheckSync  (CheckSync                      	),
			.CheckCRC   (CheckCRC                       	),
			.SyncOut    (SyncOut                        	),
			.DoutNd     (DoutNd                         	),
			.Dout       (Dout                           	),
			.DoutKeep   (DoutKeep                       	),
			.DoutLast   (DoutLast                       	),
			.CRCout     (CRCout                         	)
		);
	end
endgenerate

wire				Rx_CheckSync	;                      		
wire				Rx_CheckCRC		;                      		
wire				Rx_SyncOut		;                      		
wire				Rx_DoutNd		;                      		
wire		[31:0]	Rx_Dout			;                      		
wire		[03:0]	Rx_DoutKeep		;                       		
wire				Rx_DoutLast		;                       		
wire		[15:0]	Rx_CRCout		;                       		

generate
	if(cnt_LastclkByte == 1)begin : Rx_crcKeep1
		CRC16Par32Poly0x1021Keep1 Rx_crcKeep1 (
			.clk        (clk                            		),
			.Rst        (rst                            		),
			.FlagTR     (!FlagTR                         		), // 接收为0
			.SyncIn     (SyncOut                        		),
			.DinNd      (DoutNd                         		),
			.Din        (Dout                           		),
			.DinKeep    (DoutKeep                       		), 
			.DinLast    (DoutLast                       		), 
			.RegIni     (RegIni                         		),
			.CheckSync  (Rx_CheckSync							),
			.CheckCRC   (Rx_CheckCRC							),
			.SyncOut    (Rx_SyncOut								),
			.DoutNd     (Rx_DoutNd								),
			.Dout       (Rx_Dout								),
			.DoutKeep   (Rx_DoutKeep							),
			.DoutLast   (Rx_DoutLast							),
			.CRCout     (Rx_CRCout								)
		);
	end
	else if(cnt_LastclkByte == 2)begin : Rx_crcKeep2
		CRC16Par32Poly0x1021Keep2 Rx_crcKeep2 (
			.clk        (clk                            		),
			.Rst        (rst                            		),
			.FlagTR     (!FlagTR                         		), // 接收为0
			.SyncIn     (SyncOut                        		),
			.DinNd      (DoutNd                         		),
			.Din        (Dout                           		),
			.DinKeep    (DoutKeep                       		), 
			.DinLast    (DoutLast                       		), 
			.RegIni     (RegIni                         		),
			.CheckSync  (Rx_CheckSync							),
			.CheckCRC   (Rx_CheckCRC							),
			.SyncOut    (Rx_SyncOut								),
			.DoutNd     (Rx_DoutNd								),
			.Dout       (Rx_Dout								),
			.DoutKeep   (Rx_DoutKeep							),
			.DoutLast   (Rx_DoutLast							),
			.CRCout     (Rx_CRCout								)
		);

	end
	else if (cnt_LastclkByte == 3)begin : Rx_crcKeep3
		CRC16Par32Poly0x1021Keep3 Rx_crcKeep3 (
			.clk        (clk                            		),
			.Rst        (rst                            		),
			.FlagTR     (!FlagTR                         		), // 接收为0
			.SyncIn     (SyncOut                        		),
			.DinNd      (DoutNd                         		),
			.Din        (Dout                           		),
			.DinKeep    (DoutKeep                       		), 
			.DinLast    (DoutLast                       		), 
			.RegIni     (RegIni                         		),
			.CheckSync  (Rx_CheckSync							),
			.CheckCRC   (Rx_CheckCRC							),
			.SyncOut    (Rx_SyncOut								),
			.DoutNd     (Rx_DoutNd								),
			.Dout       (Rx_Dout								),
			.DoutKeep   (Rx_DoutKeep							),
			.DoutLast   (Rx_DoutLast							),
			.CRCout     (Rx_CRCout								)
		);
	end
	else begin : Rx_crcKeep4	
		CRC16Par32Poly0x1021Keep4 Rx_crcKeep4 (
			.clk        (clk                            		),
			.Rst        (rst                            		),
			.FlagTR     (!FlagTR                         		), // 接收为0
			.SyncIn     (SyncOut                        		),
			.DinNd      (DoutNd                         		),
			.Din        (Dout                           		),
			.DinKeep    (DoutKeep                       		), 
			.DinLast    (DoutLast                       		), 
			.RegIni     (RegIni                         		),
			.CheckSync  (Rx_CheckSync							),
			.CheckCRC   (Rx_CheckCRC							),
			.SyncOut    (Rx_SyncOut								),
			.DoutNd     (Rx_DoutNd								),
			.Dout       (Rx_Dout								),
			.DoutKeep   (Rx_DoutKeep							),
			.DoutLast   (Rx_DoutLast							),
			.CRCout     (Rx_CRCout								)
		);
	end
endgenerate





// 监控输出
initial begin
    $monitor("Time=%0t rst=%b flag_tr=%b check_crc=%b crc_out=%h", 
            $time, rst, FlagTR, CheckCRC, CRCout);
end

endmodule

