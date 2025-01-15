`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/04 10:31:10
// Design Name: 
// Module Name: CRC16Par32Poly0x1021Keep2
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
// 32	32	32	32	...	32	32	16+16'd0
//////////////////////////////////////////////////////////////////////////////////
// Keep2
// 接收端不需要长度输入


module CRC16Par32Poly0x1021Keep2 (
	input	wire			clk					,
	input	wire			Rst					,
	input	wire			FlagTR				,	// 1 为发送校验		0 为接收校验
    // input   wire	[15:0]	DataLen				,	//输入数据长度为整4字节的时钟周期数  // 输入数据长度	发：数据域校验对应 211，整帧校验（无帧头）对应 216	收：数据域校验对应 212，整帧校验（无帧头）对应 217	下取整，	
	input	wire			SyncIn				,	// 输入 211 时对应 211.5 Byte		输入 216 时对应 216.5 Byte
	input	wire			DinNd				,
	input	wire	[31:0]	Din					,
	input	wire	[03:0]	DinKeep				, // 非必须
	input	wire			DinLast				, // 非必须
	input	wire	[15:0]	RegIni				,
	// 接收校验
	output	reg				CheckSync	= 1'd0	,	// 此信号拉高对 CheckCRC 进行01检测
	output	reg				CheckCRC	= 1'd0	,	// 接收CRC校验是否正确， 1 正确		0 不正确
	output	reg				SyncOut		= 1'd0	,	// 收发标志不同
	output	reg				DoutNd		= 1'd0	,
	output	reg		[31:0]	Dout		= 32'd0	,
	output	reg		[03:0]	DoutKeep    = 1'd0	, // 非必须
	output	reg             DoutLast    = 1'd0	, // 非必须
	output	wire	[15:0]	CRCout
	);
reg			SyncInDy0	= 'd0;
reg			DinNdDy0	= 'd0;
reg [31:0]	DinDy0		= 'd0;
reg [03:0]	DoutKeepDy0	= 'd0, DoutKeepDy	= 'd0;
reg			DoutLastDy0	= 'd0, DoutLastDy	= 'd0;


reg [15:0] LfsrReg	= {16{1'b1}}; //此处初值为16'FFFF！
reg [15:0] DinCnt	= 'd0;
reg [31:0] DinDy	= 32'd0;
reg SyncInDy = 1'b0, DinNdDy = 1'b0;
wire CheckSyncTp;
wire [8*2-1:0] Din16; // Keep2
assign CRCout		= LfsrReg ^ 16'h0000;	// 结果异或 此处异或值为 0
assign Din16		= DinDy0[31-:8*2]; // Keep2
assign CheckSyncTp	= (~DinNdDy0 & DinNdDy)? 'd1 : 'd0;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

always @(posedge clk) begin
	{SyncInDy0, SyncInDy, SyncOut}	<= {SyncIn, SyncInDy0, SyncInDy};
	{DinNdDy0, DinNdDy, DoutNd}	<= {DinNd, DinNdDy0, DinNdDy};
	{DinDy0, DinDy} <= {Din, DinDy0};
	{DoutKeepDy0, DoutKeepDy}	<= {DinKeep, DoutKeepDy0};
	{DoutLastDy0, DoutLastDy}	<= {DinLast, DoutLastDy0};
	CheckSync	<= CheckSyncTp;
	if(FlagTR & !DinNdDy0 & DinNdDy) begin
		Dout        <= {DinDy[31:16], LfsrReg};		// 发送加上 16 bit 校验位 // Keep2
        DoutKeep	<= 4'hF; // Keep2
        DoutLast	<= DoutLastDy;
	end

	else begin
		Dout	<= DinDy;
		DoutKeep	<= DoutKeepDy;
		DoutLast	<= DoutLastDy;
	end

	if((CheckSync) & ~(Rst | SyncInDy0))	DinCnt	<= 'd0;// DinCnt归零

	if(Rst | SyncInDy0) begin		// 校验
		LfsrReg		<= RegIni;
		DinCnt		<= 'd0;
	end
	else if(DinNdDy0) begin
		DinCnt	<= DinCnt + 'd1;
		if(FlagTR) begin	// 发送校验：前 248 clk 32 bit 并行，最后 16 bit 为 else 语句		接收校验： 249 clk 均为 32 bit 并行
			if(DinNd && DinNdDy0) begin//此处未使用Din，此处使用DinDy0
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
			else begin	// Keep2 最后 1 clk 16 bit 数据做 16 bit 并行	DinDy0 = {Data[15:0], 16'd0}	低位填0
				LfsrReg[00]	<= LfsrReg[0] ^ LfsrReg[4] ^ LfsrReg[8] ^ LfsrReg[11] ^ LfsrReg[12] ^ Din16[0] ^ Din16[4] ^ Din16[8] ^ Din16[11] ^ Din16[12];
				LfsrReg[01]	<= LfsrReg[1] ^ LfsrReg[5] ^ LfsrReg[9] ^ LfsrReg[12] ^ LfsrReg[13] ^ Din16[1] ^ Din16[5] ^ Din16[9] ^ Din16[12] ^ Din16[13];
				LfsrReg[02]	<= LfsrReg[2] ^ LfsrReg[6] ^ LfsrReg[10] ^ LfsrReg[13] ^ LfsrReg[14] ^ Din16[2] ^ Din16[6] ^ Din16[10] ^ Din16[13] ^ Din16[14];
				LfsrReg[03]	<= LfsrReg[3] ^ LfsrReg[7] ^ LfsrReg[11] ^ LfsrReg[14] ^ LfsrReg[15] ^ Din16[3] ^ Din16[7] ^ Din16[11] ^ Din16[14] ^ Din16[15];
				LfsrReg[04]	<= LfsrReg[4] ^ LfsrReg[8] ^ LfsrReg[12] ^ LfsrReg[15] ^ Din16[4] ^ Din16[8] ^ Din16[12] ^ Din16[15];
				LfsrReg[05]	<= LfsrReg[0] ^ LfsrReg[4] ^ LfsrReg[5] ^ LfsrReg[8] ^ LfsrReg[9] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[13] ^ Din16[0] ^ Din16[4] ^ Din16[5] ^ Din16[8] ^ Din16[9] ^ Din16[11] ^ Din16[12] ^ Din16[13];
				LfsrReg[06]	<= LfsrReg[1] ^ LfsrReg[5] ^ LfsrReg[6] ^ LfsrReg[9] ^ LfsrReg[10] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[14] ^ Din16[1] ^ Din16[5] ^ Din16[6] ^ Din16[9] ^ Din16[10] ^ Din16[12] ^ Din16[13] ^ Din16[14];
				LfsrReg[07]	<= LfsrReg[2] ^ LfsrReg[6] ^ LfsrReg[7] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[13] ^ LfsrReg[14] ^ LfsrReg[15] ^ Din16[2] ^ Din16[6] ^ Din16[7] ^ Din16[10] ^ Din16[11] ^ Din16[13] ^ Din16[14] ^ Din16[15];
				LfsrReg[08]	<= LfsrReg[3] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[11] ^ LfsrReg[12] ^ LfsrReg[14] ^ LfsrReg[15] ^ Din16[3] ^ Din16[7] ^ Din16[8] ^ Din16[11] ^ Din16[12] ^ Din16[14] ^ Din16[15];
				LfsrReg[09]	<= LfsrReg[4] ^ LfsrReg[8] ^ LfsrReg[9] ^ LfsrReg[12] ^ LfsrReg[13] ^ LfsrReg[15] ^ Din16[4] ^ Din16[8] ^ Din16[9] ^ Din16[12] ^ Din16[13] ^ Din16[15];
				LfsrReg[10]	<= LfsrReg[5] ^ LfsrReg[9] ^ LfsrReg[10] ^ LfsrReg[13] ^ LfsrReg[14] ^ Din16[5] ^ Din16[9] ^ Din16[10] ^ Din16[13] ^ Din16[14];
				LfsrReg[11]	<= LfsrReg[6] ^ LfsrReg[10] ^ LfsrReg[11] ^ LfsrReg[14] ^ LfsrReg[15] ^ Din16[6] ^ Din16[10] ^ Din16[11] ^ Din16[14] ^ Din16[15];
				LfsrReg[12]	<= LfsrReg[0] ^ LfsrReg[4] ^ LfsrReg[7] ^ LfsrReg[8] ^ LfsrReg[15] ^ Din16[0] ^ Din16[4] ^ Din16[7] ^ Din16[8] ^ Din16[15];
				LfsrReg[13]	<= LfsrReg[1] ^ LfsrReg[5] ^ LfsrReg[8] ^ LfsrReg[9] ^ Din16[1] ^ Din16[5] ^ Din16[8] ^ Din16[9];
				LfsrReg[14]	<= LfsrReg[2] ^ LfsrReg[6] ^ LfsrReg[9] ^ LfsrReg[10] ^ Din16[2] ^ Din16[6] ^ Din16[9] ^ Din16[10];
				LfsrReg[15]	<= LfsrReg[3] ^ LfsrReg[7] ^ LfsrReg[10] ^ LfsrReg[11] ^ Din16[3] ^ Din16[7] ^ Din16[10] ^ Din16[11];
			end
		end
		else begin	// 接收校验  //此处未使用Din，此处使用DinDy0
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
