`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/10 20:49:08
// Design Name: 
// Module Name: CRC16Par32Poly0x1021Keep
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
//  CRC 收发校验，发送需处理，通过FlagTR选择收发功能
// CRC16 32 bit 输入 x^16 + x^12 + x^5 + 1		MSB-First	0x1021
// 32bit/clk + 最后一个输入Clk只有高16bit数据，低16bit为0或其他，不需要校验
// 32	32	32	32	...	32	32	24+8'd0
//////////////////////////////////////////////////////////////////////////////////

module CRC16Par32Poly0x1021Keep (
	input	wire			clk					,
	input	wire			Rst					,
	input	wire			FlagTR				,	// 1 为发送校验		0 为接收校验
    // input   wire	[15:0]	DataLen				,	//输入数据长度为整4字节的时钟周期数  // 输入数据长度	发：数据域校验对应 211，整帧校验（无帧头）对应 216	收：数据域校验对应 212，整帧校验（无帧头）对应 217	下取整，	
	// input	wire			SyncIn				,	// 输入 211 时对应 211.5 Byte		输入 216 时对应 216.5 Byte
	input	wire			DinNd				,
	input	wire	[31:0]	Din					, // 输入数据已经输入两字节的0作为CRC校验
	input	wire	[03:0]	DinKeep				, // 非必须
	input	wire			DinLast				, // 非必须
	input	wire	[15:0]	RegIni				,
	// 接收校验
	output	reg				CheckSync	= 1'd0	,	// 此信号拉高对 CheckCRC 进行01检测
	output	reg				CheckCRC	= 1'd0	,	// 接收CRC校验是否正确， 1 正确		0 不正确
	// output	reg				SyncOut		= 1'd0	,	// 收发标志不同
	output	reg				DoutNd		= 1'd0	,
	output	reg		[31:0]	Dout		= 32'd0	,
	output	reg		[03:0]	DoutKeep    = 1'd0	, // 非必须
	output	reg             DoutLast    = 1'd0	, // 非必须
	output	wire	[15:0]	CRCout
	);
wire			SyncIn				;
reg				SyncOut		= 1'd0	;
reg			SyncInDy0	= 'd0, SyncInDy = 1'b0;
reg			DinNdDy0	= 'd0, DinNdDy = 1'b0,DinNdDy1	= 'd0;
reg [31:0]	DinDy0		= 'd0;
reg [03:0]	DoutKeepDy0	= 'd0, DoutKeepDy	= 'd0, DoutKeepDy1	= 'd0;
reg			DoutLastDy0	= 'd0, DoutLastDy	= 'd0, DoutLastDy1	= 'd0;


reg [15:0] LfsrReg	= {16{1'b1}}; //此处初值为16'FFFF！
reg [15:0] DinCnt	= 'd0;
reg [31:0] DinDy	= 32'd0;

wire CheckSyncTp;
wire [8*4-1:0] Din16; // Keep4
assign Din16		= DinDy0[31-:8*4]; // Keep4
wire [8*2-1:0] Din24; // Keep4
assign Din24		= DinDy0[31-:8*2]; // Keep4
assign CRCout		= LfsrReg ^ 16'h0000;	// 结果异或 此处异或值为 0
assign CheckSyncTp	= (~DinNdDy0 & DinNdDy)? 'd1 : 'd0;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

always @(posedge clk) begin
	{SyncInDy0, SyncInDy, SyncOut}	<= {SyncIn, SyncInDy0, SyncInDy};
	{DinNdDy0, DinNdDy, DinNdDy1}	<= {DinNd, DinNdDy0, DinNdDy};// Keep4
	{DinDy0, DinDy} <= {Din, DinDy0};
	{DoutKeepDy0, DoutKeepDy, DoutKeepDy1}	<= {DinKeep, DoutKeepDy0, DoutKeepDy};
	{DoutLastDy0, DoutLastDy, DoutLastDy1}	<= {DinLast, DoutLastDy0, DoutLastDy};
	CheckSync	<= CheckSyncTp;
	if(FlagTR & DinNd & DinNdDy) begin // Keep DinDy除最后两个时钟数据外的其他数据
		
		DoutNd	<= DinNdDy;
        Dout	<= DinDy;
        DoutKeep	<= DoutKeepDy;
		DoutLast	<= DoutLastDy;
    end
	else if(FlagTR & DoutLastDy0) begin // Keep4
		case(DoutKeepDy0)
			'd1:begin
				DoutNd	<= DinNdDy;
				Dout	<= {DinDy[31-:24],LfsrReg[15-:8]};
				DoutKeep	<= DoutKeepDy;
				DoutLast	<= DoutLastDy;
			end
			'd2,'d3,'d4:begin
				DoutNd	<= DinNdDy;
				Dout	<= DinDy;
				DoutKeep	<= DoutKeepDy;
				DoutLast	<= DoutLastDy;
			end
		endcase
	end
	else if(FlagTR & DoutLastDy) begin // Keep4
		case(DoutKeepDy)
			'd1:begin
				DoutNd	<= DinNdDy;
				Dout	<= {LfsrReg[0+:8],24'd0};
				DoutKeep	<= DoutKeepDy;
				DoutLast	<= DoutLastDy;
			end
			'd2:begin
				DoutNd	<= DinNdDy;
				Dout	<= {LfsrReg, 16'd0};
				DoutKeep	<= DoutKeepDy;
				DoutLast	<= DoutLastDy;
			end
			'd3:begin
				DoutNd	<= DinNdDy;
				Dout	<= {DinDy[31-:8], LfsrReg, 8'd0};
				DoutKeep	<= DoutKeepDy;
				DoutLast	<= DoutLastDy;
			end
			'd4:begin
				DoutNd	<= DinNdDy;
				Dout	<= {DinDy[31-:16], LfsrReg};
				DoutKeep	<= DoutKeepDy;
				DoutLast	<= DoutLastDy;
			end
		endcase
	end
	else begin
		DoutNd      <= DinNdDy;// 此状态中为0
		Dout        <= DinDy;// 此状态中为0
		DoutKeep	<= DoutKeepDy;// 此状态中为0
		DoutLast	<= DoutLastDy;// 此状态中为0
	end

	if((CheckSync) & ~(Rst | (DinNd && !DinNdDy0)))	DinCnt	<= 'd0;// DinCnt归零  // SyncInDy0 = (DinNd && !DinNdDy0);

	if(Rst | (DinNd && !DinNdDy0)) begin		// 校验
		LfsrReg		<= RegIni;
		DinCnt		<= 'd0;
	end
	else if(DinNdDy0) begin
		DinCnt	<= DinCnt + 'd1;
		if(FlagTR) begin	// 发送 // Keep4
			if(DinLast) begin
				case(DinKeep) //1:3字节 2：4字节 3：4字节 4：4字节
					'd1:begin
						LfsrReg[00] <= LfsrReg[0] ^ LfsrReg[3] ^ LfsrReg[4] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[14] ^ DinDy0[8] ^ DinDy0[12] ^ DinDy0[16] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[30];
						LfsrReg[01] <= LfsrReg[1] ^ LfsrReg[4] ^ LfsrReg[5] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[9] ^ DinDy0[13] ^ DinDy0[17] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
						LfsrReg[02] <= LfsrReg[2] ^ LfsrReg[5] ^ LfsrReg[6] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[10] ^ DinDy0[14] ^ DinDy0[18] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[03] <= LfsrReg[3] ^ LfsrReg[6] ^ LfsrReg[7] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[11] ^ DinDy0[15] ^ DinDy0[19] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[04] <= LfsrReg[0] ^ LfsrReg[4] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[15] ^ DinDy0[12] ^ DinDy0[16] ^ DinDy0[20] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[31];
						LfsrReg[05] <= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[3] ^ LfsrReg[4] ^ LfsrReg[5] ^ LfsrReg[8] ^ LfsrReg[9] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[14] ^ DinDy0[8] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[30];
						LfsrReg[06] <= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[4] ^ LfsrReg[5] ^ LfsrReg[6] ^ LfsrReg[9] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[9] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
						LfsrReg[07] <= LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[5] ^ LfsrReg[6] ^ LfsrReg[7] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[10] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[08] <= LfsrReg[0] ^ LfsrReg[3] ^ LfsrReg[4] ^ LfsrReg[6] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[11] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[09] <= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[4] ^ LfsrReg[5] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[9] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[12] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
						LfsrReg[10] <= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[5] ^ LfsrReg[6] ^ LfsrReg[8] ^ LfsrReg[9] ^ LfsrReg[10] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[13] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[11] <= LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[6] ^ LfsrReg[7] ^ LfsrReg[9] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[14] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[12] <= LfsrReg[0] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[10] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[8] ^ DinDy0[12] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[26] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[13] <= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[8] ^ LfsrReg[9] ^ LfsrReg[11] ^ LfsrReg[15] ^ DinDy0[9] ^ DinDy0[13] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[27] ^ DinDy0[31];
						LfsrReg[14] <= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[9] ^ LfsrReg[10] ^ LfsrReg[12] ^ DinDy0[10] ^ DinDy0[14] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[28];
						LfsrReg[15] <= LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[13] ^ DinDy0[11] ^ DinDy0[15] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[29];

					end
					'd2,'d3,'d4:begin
						LfsrReg[00]	<= LfsrReg[3] ^ LfsrReg[4] ^ LfsrReg[6] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[12] ^ DinDy0[0] ^ DinDy0[4] ^ DinDy0[8] ^ DinDy0[11] ^ DinDy0[12] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[22] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[28];
						LfsrReg[01]	<= LfsrReg[4] ^ LfsrReg[5] ^ LfsrReg[7] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[13] ^ DinDy0[1] ^ DinDy0[5] ^ DinDy0[9] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[23] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[29];
						LfsrReg[02]	<= LfsrReg[5] ^ LfsrReg[6] ^ LfsrReg[8] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[2] ^ DinDy0[6] ^ DinDy0[10] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[03]	<= LfsrReg[6] ^ LfsrReg[7] ^ LfsrReg[9] ^ LfsrReg[13] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[3] ^ DinDy0[7] ^ DinDy0[11] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[29] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[04]	<= LfsrReg[0] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[10] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[4] ^ DinDy0[8] ^ DinDy0[12] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[26] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[05]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[3] ^ LfsrReg[04] ^ LfsrReg[06] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[15] ^ DinDy0[0] ^ DinDy0[4] ^ DinDy0[5] ^ DinDy0[8] ^ DinDy0[9] ^ DinDy0[11] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[31];
						LfsrReg[06]	<= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[4] ^ LfsrReg[05] ^ LfsrReg[07] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[13] ^ DinDy0[1] ^ DinDy0[5] ^ DinDy0[6] ^ DinDy0[9] ^ DinDy0[10] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[29];
						LfsrReg[07]	<= LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[5] ^ LfsrReg[06] ^ LfsrReg[08] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[14] ^ DinDy0[2] ^ DinDy0[6] ^ DinDy0[7] ^ DinDy0[10] ^ DinDy0[11] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[30];
						LfsrReg[08]	<= LfsrReg[0] ^ LfsrReg[3] ^ LfsrReg[4] ^ LfsrReg[06] ^ LfsrReg[07] ^ LfsrReg[09] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[3] ^ DinDy0[7] ^ DinDy0[8] ^ DinDy0[11] ^ DinDy0[12] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
						LfsrReg[09]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[4] ^ LfsrReg[05] ^ LfsrReg[07] ^ LfsrReg[08] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[4] ^ DinDy0[8] ^ DinDy0[9] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[10]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[05] ^ LfsrReg[06] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[11] ^ LfsrReg[13] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[5] ^ DinDy0[9] ^ DinDy0[10] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[27] ^ DinDy0[29] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[11]	<= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[06] ^ LfsrReg[07] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[6] ^ DinDy0[10] ^ DinDy0[11] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[12]	<= LfsrReg[0] ^ LfsrReg[2] ^ LfsrReg[6] ^ LfsrReg[07] ^ LfsrReg[08] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[0] ^ DinDy0[4] ^ DinDy0[7] ^ DinDy0[8] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[18] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
						LfsrReg[13]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[3] ^ LfsrReg[07] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[1] ^ DinDy0[5] ^ DinDy0[8] ^ DinDy0[9] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[19] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[14]	<= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[4] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[2] ^ DinDy0[6] ^ DinDy0[9] ^ DinDy0[10] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[20] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[15]	<= LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[5] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[15] ^ DinDy0[3] ^ DinDy0[7] ^ DinDy0[10] ^ DinDy0[11] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[21] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[31];
					end
				endcase
			end
			else if(DoutLastDy0) begin
				case(DoutKeepDy0) //1:0字节 2：0字节 3：1字节 4：2字节
					'd1,'d2:begin
						LfsrReg <= LfsrReg;
					end
					'd3:begin
						LfsrReg[00] <= LfsrReg[8] ^ LfsrReg[12] ^ DinDy0[24] ^ DinDy0[28];
						LfsrReg[01] <= LfsrReg[9] ^ LfsrReg[13] ^ DinDy0[25] ^ DinDy0[29];
						LfsrReg[02] <= LfsrReg[10] ^ LfsrReg[14] ^ DinDy0[26] ^ DinDy0[30];
						LfsrReg[03] <= LfsrReg[11] ^ LfsrReg[15] ^ DinDy0[27] ^ DinDy0[31];
						LfsrReg[04] <= LfsrReg[12] ^ DinDy0[28];
						LfsrReg[05] <= LfsrReg[8] ^ LfsrReg[12] ^ LfsrReg[13] ^ DinDy0[24] ^ DinDy0[28] ^ DinDy0[29];
						LfsrReg[06] <= LfsrReg[9] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[25] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[07] <= LfsrReg[10] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[26] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[08] <= LfsrReg[0] ^ LfsrReg[11] ^ LfsrReg[15] ^ DinDy0[27] ^ DinDy0[31];
						LfsrReg[09] <= LfsrReg[1] ^ LfsrReg[12] ^ DinDy0[28];
						LfsrReg[10] <= LfsrReg[2] ^ LfsrReg[13] ^ DinDy0[29];
						LfsrReg[11] <= LfsrReg[3] ^ LfsrReg[14] ^ DinDy0[30];
						LfsrReg[12] <= LfsrReg[4] ^ LfsrReg[8] ^ LfsrReg[12] ^ LfsrReg[15] ^ DinDy0[24] ^ DinDy0[28] ^ DinDy0[31];
						LfsrReg[13] <= LfsrReg[5] ^ LfsrReg[9] ^ LfsrReg[13] ^ DinDy0[25] ^ DinDy0[29];
						LfsrReg[14] <= LfsrReg[6] ^ LfsrReg[10] ^ LfsrReg[14] ^ DinDy0[26] ^ DinDy0[30];
						LfsrReg[15] <= LfsrReg[7] ^ LfsrReg[11] ^ LfsrReg[15] ^ DinDy0[27] ^ DinDy0[31];
					end
					'd4:begin
						LfsrReg[00]	<= LfsrReg[0] ^ LfsrReg[4] ^ LfsrReg[8] ^ LfsrReg[11] ^ LfsrReg[12] ^ DinDy0[16] ^ DinDy0[20] ^ DinDy0[24] ^ DinDy0[27] ^ DinDy0[28];
						LfsrReg[01]	<= LfsrReg[1] ^ LfsrReg[5] ^ LfsrReg[9] ^ LfsrReg[12] ^ LfsrReg[13] ^ DinDy0[17] ^ DinDy0[21] ^ DinDy0[25] ^ DinDy0[28] ^ DinDy0[29];
						LfsrReg[02]	<= LfsrReg[2] ^ LfsrReg[6] ^ LfsrReg[10] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[18] ^ DinDy0[22] ^ DinDy0[26] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[03]	<= LfsrReg[3] ^ LfsrReg[7] ^ LfsrReg[11] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[19] ^ DinDy0[23] ^ DinDy0[27] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[04]	<= LfsrReg[4] ^ LfsrReg[8] ^ LfsrReg[12] ^ LfsrReg[15] ^ DinDy0[20] ^ DinDy0[24] ^ DinDy0[28] ^ DinDy0[31];
						LfsrReg[05]	<= LfsrReg[0] ^ LfsrReg[4] ^ LfsrReg[5] ^ LfsrReg[8] ^ LfsrReg[9] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[13] ^ DinDy0[16] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[29];
						LfsrReg[06]	<= LfsrReg[1] ^ LfsrReg[5] ^ LfsrReg[6] ^ LfsrReg[9] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[17] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[07]	<= LfsrReg[2] ^ LfsrReg[6] ^ LfsrReg[7] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[13] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[18] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[29] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[08]	<= LfsrReg[3] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[19] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[09]	<= LfsrReg[4] ^ LfsrReg[8] ^ LfsrReg[9] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[20] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
						LfsrReg[10]	<= LfsrReg[5] ^ LfsrReg[9] ^ LfsrReg[10] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[21] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[11]	<= LfsrReg[6] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[22] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[12]	<= LfsrReg[0] ^ LfsrReg[4] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[15] ^ DinDy0[16] ^ DinDy0[20] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[31];
						LfsrReg[13]	<= LfsrReg[1] ^ LfsrReg[5] ^ LfsrReg[8] ^ LfsrReg[9] ^ DinDy0[17] ^ DinDy0[21] ^ DinDy0[24] ^ DinDy0[25];
						LfsrReg[14]	<= LfsrReg[2] ^ LfsrReg[6] ^ LfsrReg[9] ^ LfsrReg[10] ^ DinDy0[18] ^ DinDy0[22] ^ DinDy0[25] ^ DinDy0[26];
						LfsrReg[15]	<= LfsrReg[3] ^ LfsrReg[7] ^ LfsrReg[10] ^ LfsrReg[11] ^ DinDy0[19] ^ DinDy0[23] ^ DinDy0[26] ^ DinDy0[27];
					end
				endcase
			end
			else begin
				LfsrReg[00]	<= LfsrReg[3] ^ LfsrReg[4] ^ LfsrReg[6] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[12] ^ DinDy0[0] ^ DinDy0[4] ^ DinDy0[8] ^ DinDy0[11] ^ DinDy0[12] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[22] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[28];
				LfsrReg[01]	<= LfsrReg[4] ^ LfsrReg[5] ^ LfsrReg[7] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[13] ^ DinDy0[1] ^ DinDy0[5] ^ DinDy0[9] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[23] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[29];
				LfsrReg[02]	<= LfsrReg[5] ^ LfsrReg[6] ^ LfsrReg[8] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[2] ^ DinDy0[6] ^ DinDy0[10] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[30];
				LfsrReg[03]	<= LfsrReg[6] ^ LfsrReg[7] ^ LfsrReg[9] ^ LfsrReg[13] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[3] ^ DinDy0[7] ^ DinDy0[11] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[29] ^ DinDy0[30] ^ DinDy0[31];
				LfsrReg[04]	<= LfsrReg[0] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[10] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[4] ^ DinDy0[8] ^ DinDy0[12] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[26] ^ DinDy0[30] ^ DinDy0[31];
				LfsrReg[05]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[3] ^ LfsrReg[04] ^ LfsrReg[06] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[15] ^ DinDy0[0] ^ DinDy0[4] ^ DinDy0[5] ^ DinDy0[8] ^ DinDy0[9] ^ DinDy0[11] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[31];
				LfsrReg[06]	<= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[4] ^ LfsrReg[05] ^ LfsrReg[07] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[13] ^ DinDy0[1] ^ DinDy0[5] ^ DinDy0[6] ^ DinDy0[9] ^ DinDy0[10] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[29];
				LfsrReg[07]	<= LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[5] ^ LfsrReg[06] ^ LfsrReg[08] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[14] ^ DinDy0[2] ^ DinDy0[6] ^ DinDy0[7] ^ DinDy0[10] ^ DinDy0[11] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[30];
				LfsrReg[08]	<= LfsrReg[0] ^ LfsrReg[3] ^ LfsrReg[4] ^ LfsrReg[06] ^ LfsrReg[07] ^ LfsrReg[09] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[3] ^ DinDy0[7] ^ DinDy0[8] ^ DinDy0[11] ^ DinDy0[12] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
				LfsrReg[09]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[4] ^ LfsrReg[05] ^ LfsrReg[07] ^ LfsrReg[08] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[4] ^ DinDy0[8] ^ DinDy0[9] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[30];
				LfsrReg[10]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[05] ^ LfsrReg[06] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[11] ^ LfsrReg[13] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[5] ^ DinDy0[9] ^ DinDy0[10] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[27] ^ DinDy0[29] ^ DinDy0[30] ^ DinDy0[31];
				LfsrReg[11]	<= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[06] ^ LfsrReg[07] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[6] ^ DinDy0[10] ^ DinDy0[11] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[30] ^ DinDy0[31];
				LfsrReg[12]	<= LfsrReg[0] ^ LfsrReg[2] ^ LfsrReg[6] ^ LfsrReg[07] ^ LfsrReg[08] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[0] ^ DinDy0[4] ^ DinDy0[7] ^ DinDy0[8] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[18] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
				LfsrReg[13]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[3] ^ LfsrReg[07] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[1] ^ DinDy0[5] ^ DinDy0[8] ^ DinDy0[9] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[19] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[29] ^ DinDy0[30];
				LfsrReg[14]	<= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[4] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[2] ^ DinDy0[6] ^ DinDy0[9] ^ DinDy0[10] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[20] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[30] ^ DinDy0[31];
				LfsrReg[15]	<= LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[5] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[15] ^ DinDy0[3] ^ DinDy0[7] ^ DinDy0[10] ^ DinDy0[11] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[21] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[31];
			end
		end
		else begin	// Keep4
			if(DinNd && DinNdDy0) begin
				LfsrReg[00]	<= LfsrReg[3] ^ LfsrReg[4] ^ LfsrReg[6] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[12] ^ DinDy0[0] ^ DinDy0[4] ^ DinDy0[8] ^ DinDy0[11] ^ DinDy0[12] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[22] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[28];
				LfsrReg[01]	<= LfsrReg[4] ^ LfsrReg[5] ^ LfsrReg[7] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[13] ^ DinDy0[1] ^ DinDy0[5] ^ DinDy0[9] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[23] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[29];
				LfsrReg[02]	<= LfsrReg[5] ^ LfsrReg[6] ^ LfsrReg[8] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[2] ^ DinDy0[6] ^ DinDy0[10] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[30];
				LfsrReg[03]	<= LfsrReg[6] ^ LfsrReg[7] ^ LfsrReg[9] ^ LfsrReg[13] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[3] ^ DinDy0[7] ^ DinDy0[11] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[29] ^ DinDy0[30] ^ DinDy0[31];
				LfsrReg[04]	<= LfsrReg[0] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[10] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[4] ^ DinDy0[8] ^ DinDy0[12] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[26] ^ DinDy0[30] ^ DinDy0[31];
				LfsrReg[05]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[3] ^ LfsrReg[04] ^ LfsrReg[06] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[15] ^ DinDy0[0] ^ DinDy0[4] ^ DinDy0[5] ^ DinDy0[8] ^ DinDy0[9] ^ DinDy0[11] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[31];
				LfsrReg[06]	<= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[4] ^ LfsrReg[05] ^ LfsrReg[07] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[13] ^ DinDy0[1] ^ DinDy0[5] ^ DinDy0[6] ^ DinDy0[9] ^ DinDy0[10] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[29];
				LfsrReg[07]	<= LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[5] ^ LfsrReg[06] ^ LfsrReg[08] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[14] ^ DinDy0[2] ^ DinDy0[6] ^ DinDy0[7] ^ DinDy0[10] ^ DinDy0[11] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[30];
				LfsrReg[08]	<= LfsrReg[0] ^ LfsrReg[3] ^ LfsrReg[4] ^ LfsrReg[06] ^ LfsrReg[07] ^ LfsrReg[09] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[3] ^ DinDy0[7] ^ DinDy0[8] ^ DinDy0[11] ^ DinDy0[12] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
				LfsrReg[09]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[4] ^ LfsrReg[05] ^ LfsrReg[07] ^ LfsrReg[08] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[4] ^ DinDy0[8] ^ DinDy0[9] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[30];
				LfsrReg[10]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[05] ^ LfsrReg[06] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[11] ^ LfsrReg[13] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[5] ^ DinDy0[9] ^ DinDy0[10] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[27] ^ DinDy0[29] ^ DinDy0[30] ^ DinDy0[31];
				LfsrReg[11]	<= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[06] ^ LfsrReg[07] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[6] ^ DinDy0[10] ^ DinDy0[11] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[30] ^ DinDy0[31];
				LfsrReg[12]	<= LfsrReg[0] ^ LfsrReg[2] ^ LfsrReg[6] ^ LfsrReg[07] ^ LfsrReg[08] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[0] ^ DinDy0[4] ^ DinDy0[7] ^ DinDy0[8] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[18] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
				LfsrReg[13]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[3] ^ LfsrReg[07] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[1] ^ DinDy0[5] ^ DinDy0[8] ^ DinDy0[9] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[19] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[29] ^ DinDy0[30];
				LfsrReg[14]	<= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[4] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[2] ^ DinDy0[6] ^ DinDy0[9] ^ DinDy0[10] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[20] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[30] ^ DinDy0[31];
				LfsrReg[15]	<= LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[5] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[15] ^ DinDy0[3] ^ DinDy0[7] ^ DinDy0[10] ^ DinDy0[11] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[21] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[31];
			end
			else begin // DoutLastDy0
				case(DoutKeepDy0)
					4'd1: begin
						LfsrReg[00] <= LfsrReg[8] ^ LfsrReg[12] ^ DinDy0[24] ^ DinDy0[28];
						LfsrReg[01] <= LfsrReg[9] ^ LfsrReg[13] ^ DinDy0[25] ^ DinDy0[29];
						LfsrReg[02] <= LfsrReg[10] ^ LfsrReg[14] ^ DinDy0[26] ^ DinDy0[30];
						LfsrReg[03] <= LfsrReg[11] ^ LfsrReg[15] ^ DinDy0[27] ^ DinDy0[31];
						LfsrReg[04] <= LfsrReg[12] ^ DinDy0[28];
						LfsrReg[05] <= LfsrReg[8] ^ LfsrReg[12] ^ LfsrReg[13] ^ DinDy0[24] ^ DinDy0[28] ^ DinDy0[29];
						LfsrReg[06] <= LfsrReg[9] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[25] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[07] <= LfsrReg[10] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[26] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[08] <= LfsrReg[0] ^ LfsrReg[11] ^ LfsrReg[15] ^ DinDy0[27] ^ DinDy0[31];
						LfsrReg[09] <= LfsrReg[1] ^ LfsrReg[12] ^ DinDy0[28];
						LfsrReg[10] <= LfsrReg[2] ^ LfsrReg[13] ^ DinDy0[29];
						LfsrReg[11] <= LfsrReg[3] ^ LfsrReg[14] ^ DinDy0[30];
						LfsrReg[12] <= LfsrReg[4] ^ LfsrReg[8] ^ LfsrReg[12] ^ LfsrReg[15] ^ DinDy0[24] ^ DinDy0[28] ^ DinDy0[31];
						LfsrReg[13] <= LfsrReg[5] ^ LfsrReg[9] ^ LfsrReg[13] ^ DinDy0[25] ^ DinDy0[29];
						LfsrReg[14] <= LfsrReg[6] ^ LfsrReg[10] ^ LfsrReg[14] ^ DinDy0[26] ^ DinDy0[30];
						LfsrReg[15] <= LfsrReg[7] ^ LfsrReg[11] ^ LfsrReg[15] ^ DinDy0[27] ^ DinDy0[31];
					end
					4'd2: begin
						LfsrReg[00]	<= LfsrReg[0] ^ LfsrReg[4] ^ LfsrReg[8] ^ LfsrReg[11] ^ LfsrReg[12] ^ DinDy0[16] ^ DinDy0[20] ^ DinDy0[24] ^ DinDy0[27] ^ DinDy0[28];
						LfsrReg[01]	<= LfsrReg[1] ^ LfsrReg[5] ^ LfsrReg[9] ^ LfsrReg[12] ^ LfsrReg[13] ^ DinDy0[17] ^ DinDy0[21] ^ DinDy0[25] ^ DinDy0[28] ^ DinDy0[29];
						LfsrReg[02]	<= LfsrReg[2] ^ LfsrReg[6] ^ LfsrReg[10] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[18] ^ DinDy0[22] ^ DinDy0[26] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[03]	<= LfsrReg[3] ^ LfsrReg[7] ^ LfsrReg[11] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[19] ^ DinDy0[23] ^ DinDy0[27] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[04]	<= LfsrReg[4] ^ LfsrReg[8] ^ LfsrReg[12] ^ LfsrReg[15] ^ DinDy0[20] ^ DinDy0[24] ^ DinDy0[28] ^ DinDy0[31];
						LfsrReg[05]	<= LfsrReg[0] ^ LfsrReg[4] ^ LfsrReg[5] ^ LfsrReg[8] ^ LfsrReg[9] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[13] ^ DinDy0[16] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[29];
						LfsrReg[06]	<= LfsrReg[1] ^ LfsrReg[5] ^ LfsrReg[6] ^ LfsrReg[9] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[17] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[07]	<= LfsrReg[2] ^ LfsrReg[6] ^ LfsrReg[7] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[13] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[18] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[29] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[08]	<= LfsrReg[3] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[19] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[09]	<= LfsrReg[4] ^ LfsrReg[8] ^ LfsrReg[9] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[20] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
						LfsrReg[10]	<= LfsrReg[5] ^ LfsrReg[9] ^ LfsrReg[10] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[21] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[11]	<= LfsrReg[6] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[22] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[12]	<= LfsrReg[0] ^ LfsrReg[4] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[15] ^ DinDy0[16] ^ DinDy0[20] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[31];
						LfsrReg[13]	<= LfsrReg[1] ^ LfsrReg[5] ^ LfsrReg[8] ^ LfsrReg[9] ^ DinDy0[17] ^ DinDy0[21] ^ DinDy0[24] ^ DinDy0[25];
						LfsrReg[14]	<= LfsrReg[2] ^ LfsrReg[6] ^ LfsrReg[9] ^ LfsrReg[10] ^ DinDy0[18] ^ DinDy0[22] ^ DinDy0[25] ^ DinDy0[26];
						LfsrReg[15]	<= LfsrReg[3] ^ LfsrReg[7] ^ LfsrReg[10] ^ LfsrReg[11] ^ DinDy0[19] ^ DinDy0[23] ^ DinDy0[26] ^ DinDy0[27];
					end
					4'd3: begin
						LfsrReg[00] <= LfsrReg[0] ^ LfsrReg[3] ^ LfsrReg[4] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[14] ^ DinDy0[8] ^ DinDy0[12] ^ DinDy0[16] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[30];
						LfsrReg[01] <= LfsrReg[1] ^ LfsrReg[4] ^ LfsrReg[5] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[9] ^ DinDy0[13] ^ DinDy0[17] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
						LfsrReg[02] <= LfsrReg[2] ^ LfsrReg[5] ^ LfsrReg[6] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[10] ^ DinDy0[14] ^ DinDy0[18] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[03] <= LfsrReg[3] ^ LfsrReg[6] ^ LfsrReg[7] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[11] ^ DinDy0[15] ^ DinDy0[19] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[04] <= LfsrReg[0] ^ LfsrReg[4] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[15] ^ DinDy0[12] ^ DinDy0[16] ^ DinDy0[20] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[31];
						LfsrReg[05] <= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[3] ^ LfsrReg[4] ^ LfsrReg[5] ^ LfsrReg[8] ^ LfsrReg[9] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[14] ^ DinDy0[8] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[30];
						LfsrReg[06] <= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[4] ^ LfsrReg[5] ^ LfsrReg[6] ^ LfsrReg[9] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[9] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
						LfsrReg[07] <= LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[5] ^ LfsrReg[6] ^ LfsrReg[7] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[10] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[08] <= LfsrReg[0] ^ LfsrReg[3] ^ LfsrReg[4] ^ LfsrReg[6] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[11] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[09] <= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[4] ^ LfsrReg[5] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[9] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[12] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
						LfsrReg[10] <= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[5] ^ LfsrReg[6] ^ LfsrReg[8] ^ LfsrReg[9] ^ LfsrReg[10] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[13] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[11] <= LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[6] ^ LfsrReg[7] ^ LfsrReg[9] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[14] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[12] <= LfsrReg[0] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[10] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[8] ^ DinDy0[12] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[26] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[13] <= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[8] ^ LfsrReg[9] ^ LfsrReg[11] ^ LfsrReg[15] ^ DinDy0[9] ^ DinDy0[13] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[27] ^ DinDy0[31];
						LfsrReg[14] <= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[9] ^ LfsrReg[10] ^ LfsrReg[12] ^ DinDy0[10] ^ DinDy0[14] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[28];
						LfsrReg[15] <= LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[13] ^ DinDy0[11] ^ DinDy0[15] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[29];
					end
					4'd4: begin
						LfsrReg[00]	<= LfsrReg[3] ^ LfsrReg[4] ^ LfsrReg[6] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[12] ^ DinDy0[0] ^ DinDy0[4] ^ DinDy0[8] ^ DinDy0[11] ^ DinDy0[12] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[22] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[28];
						LfsrReg[01]	<= LfsrReg[4] ^ LfsrReg[5] ^ LfsrReg[7] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[13] ^ DinDy0[1] ^ DinDy0[5] ^ DinDy0[9] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[23] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[29];
						LfsrReg[02]	<= LfsrReg[5] ^ LfsrReg[6] ^ LfsrReg[8] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[2] ^ DinDy0[6] ^ DinDy0[10] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[03]	<= LfsrReg[6] ^ LfsrReg[7] ^ LfsrReg[9] ^ LfsrReg[13] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[3] ^ DinDy0[7] ^ DinDy0[11] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[29] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[04]	<= LfsrReg[0] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[10] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[4] ^ DinDy0[8] ^ DinDy0[12] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[26] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[05]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[3] ^ LfsrReg[04] ^ LfsrReg[06] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[15] ^ DinDy0[0] ^ DinDy0[4] ^ DinDy0[5] ^ DinDy0[8] ^ DinDy0[9] ^ DinDy0[11] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[31];
						LfsrReg[06]	<= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[4] ^ LfsrReg[05] ^ LfsrReg[07] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[13] ^ DinDy0[1] ^ DinDy0[5] ^ DinDy0[6] ^ DinDy0[9] ^ DinDy0[10] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[29];
						LfsrReg[07]	<= LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[5] ^ LfsrReg[06] ^ LfsrReg[08] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[14] ^ DinDy0[2] ^ DinDy0[6] ^ DinDy0[7] ^ DinDy0[10] ^ DinDy0[11] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[30];
						LfsrReg[08]	<= LfsrReg[0] ^ LfsrReg[3] ^ LfsrReg[4] ^ LfsrReg[06] ^ LfsrReg[07] ^ LfsrReg[09] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[3] ^ DinDy0[7] ^ DinDy0[8] ^ DinDy0[11] ^ DinDy0[12] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[19] ^ DinDy0[20] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[27] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
						LfsrReg[09]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[4] ^ LfsrReg[05] ^ LfsrReg[07] ^ LfsrReg[08] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[4] ^ DinDy0[8] ^ DinDy0[9] ^ DinDy0[12] ^ DinDy0[13] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[20] ^ DinDy0[21] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[10]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[05] ^ LfsrReg[06] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[11] ^ LfsrReg[13] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[5] ^ DinDy0[9] ^ DinDy0[10] ^ DinDy0[13] ^ DinDy0[14] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[21] ^ DinDy0[22] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[27] ^ DinDy0[29] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[11]	<= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[06] ^ LfsrReg[07] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[6] ^ DinDy0[10] ^ DinDy0[11] ^ DinDy0[14] ^ DinDy0[15] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[28] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[12]	<= LfsrReg[0] ^ LfsrReg[2] ^ LfsrReg[6] ^ LfsrReg[07] ^ LfsrReg[08] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ DinDy0[0] ^ DinDy0[4] ^ DinDy0[7] ^ DinDy0[8] ^ DinDy0[15] ^ DinDy0[16] ^ DinDy0[18] ^ DinDy0[22] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[28] ^ DinDy0[29] ^ DinDy0[31];
						LfsrReg[13]	<= LfsrReg[0] ^ LfsrReg[1] ^ LfsrReg[3] ^ LfsrReg[07] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[13] ^ LfsrReg[14] ^ DinDy0[1] ^ DinDy0[5] ^ DinDy0[8] ^ DinDy0[9] ^ DinDy0[16] ^ DinDy0[17] ^ DinDy0[19] ^ DinDy0[23] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[29] ^ DinDy0[30];
						LfsrReg[14]	<= LfsrReg[1] ^ LfsrReg[2] ^ LfsrReg[4] ^ LfsrReg[08] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[14] ^ LfsrReg[15] ^ DinDy0[2] ^ DinDy0[6] ^ DinDy0[9] ^ DinDy0[10] ^ DinDy0[17] ^ DinDy0[18] ^ DinDy0[20] ^ DinDy0[24] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[30] ^ DinDy0[31];
						LfsrReg[15]	<= LfsrReg[2] ^ LfsrReg[3] ^ LfsrReg[5] ^ LfsrReg[09] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[15] ^ DinDy0[3] ^ DinDy0[7] ^ DinDy0[10] ^ DinDy0[11] ^ DinDy0[18] ^ DinDy0[19] ^ DinDy0[21] ^ DinDy0[25] ^ DinDy0[26] ^ DinDy0[27] ^ DinDy0[31];
					end
				endcase
			end
		end
	end
end

reg State = 1'b0;
always @(posedge clk) begin	// 接收校验标志输出，CRC是否正确
	if(Rst) begin
		CheckCRC	<= 1'b0;
		State		<= 1'b0;
	end
	else
		case(State)
			0: begin
				CheckCRC	<= CheckCRC;
				if(CheckSyncTp)
					State	<= State + 1'b1;
				else
					State	<= State;
			end
			1: begin
				State	<= State + 1'b1;
				if(|CRCout == 0)
					CheckCRC	<= 1'b1;
				else
					CheckCRC	<= 1'b0;
			end
		endcase
end

endmodule