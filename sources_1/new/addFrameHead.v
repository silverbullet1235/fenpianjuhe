`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/10 21:58:11
// Design Name: 
// Module Name: addFrameHead
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
// 帧尾也输出

module addFrameHead(
    input wire              clk,                        // 时钟信号
    input wire              rst,                        // 复位信号
    
    // 输入信号
    input wire              fragOutNoneCrc_DoutNd,     // 输入数据有效
    input wire [31:0]       changeFIFO1_Dout,          // 输入数据
    input wire [3:0]        fragOutNoneCrc_DoutKeep,   // 输入数据字节有效 //hex
    input wire              fragOutNoneCrc_DoutLast,   // 输入数据最后一拍
    input wire [15:0]       frameType_16Bit,           // 帧类型
    input wire [6:0]        dataFragCnt_rd,            // 分片计数
    input wire              fragdone_rd,               // 分片是否结束
    input wire [11:0]       frameAggrOffset_length,    // 帧聚合偏移长度
    input wire [11:0]       fragment_length,           // 片长度
    
    // 输出AXIS接口
    output reg [31:0]       m_axis_tdata	= 'd0,		// 输出数据
    output reg [3:0]        m_axis_tkeep	= 'd0,		// 输出数据字节有效 //dec
    output reg              m_axis_tvalid	= 'd0,		// 输出数据有效
    output reg              m_axis_tlast	= 'd0,		// 输出数据最后一拍
    input wire              m_axis_tready				// 下游准备接收
);
wire [3:0]	fragOutNoneCrc_DoutKeep_dec;
assign		fragOutNoneCrc_DoutKeep_dec = (fragOutNoneCrc_DoutKeep == 4'h8) ? 4'd1 : (fragOutNoneCrc_DoutKeep == 4'hC) ? 4'd2 : 
										(fragOutNoneCrc_DoutKeep == 4'hE) ? 4'd3 :	(fragOutNoneCrc_DoutKeep == 4'hF) ? 4'd4 : 4'd0; // 默认值

reg			DinNdDy1 = 'd0, DinNdDy2 = 'd0, DinNdDy3 = 'd0, DinNdDy4 = 'd0;
reg [31:0]	DinDy1 = 'd0, DinDy2 = 'd0, DinDy3 = 'd0, DinDy4 = 'd0;
reg [3:0]	DinKeep1 = 'd0, DinKeep2 = 'd0, DinKeep3 = 'd0;
reg			DinLast1 = 'd0, DinLast2 = 'd0, DinLast3 = 'd0;
reg [7:0]	state = 'd0;
wire [31:0]		DinDyn_tdata	;
wire [3:0]		DinDyn_tkeep	;
wire			DinDyn_tvalid	;
wire			DinDyn_tlast	;
reg [31:0]		DinDyn_tdataDy	= 'd0;
reg [3:0]		DinDyn_tkeepDy	= 'd0;
reg				DinDyn_tlastDy	= 'd0;
assign DinDyn_tvalid	= (frameType_16Bit[0]== 1'b1)?DinNdDy2 : DinNdDy1;
assign DinDyn_tdata		= (frameType_16Bit[0]== 1'b1)?DinDy2 : DinDy1;
assign DinDyn_tkeep		= (frameType_16Bit[0]== 1'b1)?DinKeep2 : DinKeep1;
assign DinDyn_tlast		= (frameType_16Bit[0]== 1'b1)?DinLast2 : DinLast1;
always @(posedge clk) begin
	if(rst) begin
		m_axis_tdata <= 'd0;
		m_axis_tkeep <= 'd0;
		m_axis_tvalid <= 'd0;
		m_axis_tlast <= 'd0;
	end
	else begin
		{DinNdDy4, DinNdDy3, DinNdDy2, DinNdDy1}	<= {DinNdDy3, DinNdDy2, DinNdDy1, fragOutNoneCrc_DoutNd};
		{DinDy4, DinDy3, DinDy2, DinDy1} <= {DinDy3, DinDy2, DinDy1, changeFIFO1_Dout};
		{DinKeep3, DinKeep2, DinKeep1}	<= {DinKeep2, DinKeep1, fragOutNoneCrc_DoutKeep_dec};
		{DinLast3, DinLast2, DinLast1}	<= {DinLast2, DinLast1, fragOutNoneCrc_DoutLast};
		DinDyn_tdataDy <= DinDyn_tdata;
		DinDyn_tkeepDy <= DinDyn_tkeep;
		DinDyn_tlastDy <= DinDyn_tlast;
		case(state)
			'd0:begin
				m_axis_tdata	<= 'd0;
				m_axis_tkeep	<= 'd0;
				m_axis_tvalid	<= 'd0;
				m_axis_tlast	<= 'd0;
				if(fragOutNoneCrc_DoutNd && !DinNdDy1)begin
					m_axis_tdata	<= {4'b0,fragment_length,frameType_16Bit};
					m_axis_tkeep	<= 'd4;
					m_axis_tvalid	<= 'd1;
					m_axis_tlast	<= 'd0;
					if(frameType_16Bit[0]== 1'b1)begin
						state <= 'd1;
					end
					else begin
						state <= 'd2;
					end
				end
			end
			'd1:begin
				m_axis_tdata	<= {dataFragCnt_rd,fragdone_rd,frameType_16Bit,4'b0,frameAggrOffset_length[11-:4]};
				m_axis_tkeep	<= 'd4;
				m_axis_tvalid	<= 'd1;
				m_axis_tlast	<= 'd0;
				state <= state + 'd1;
			end
			'd2:begin
				if(DinDyn_tlast)begin
					state <= 'd255;
					case(DinDyn_tkeep)
						'd1:begin
							m_axis_tdata	<= (frameType_16Bit[0]== 1'b1)?{frameAggrOffset_length[0+:8], DinDyn_tdata[31-:8*1],16'd0} :
												{dataFragCnt_rd,fragdone_rd,DinDyn_tdata[31-:8*1],16'd0}	;
							m_axis_tkeep <= 'd4;
							m_axis_tvalid <= 'd1;
							m_axis_tlast <= 'd1;
						end
						'd2:begin
							m_axis_tdata	<= (frameType_16Bit[0]== 1'b1)?{frameAggrOffset_length[0+:8], DinDyn_tdata[31-:8*2],8'd0} :
												{dataFragCnt_rd,fragdone_rd,DinDyn_tdata[31-:8*2],8'd0}	;
							m_axis_tkeep <= 'd4;
							m_axis_tvalid <= 'd1;
							m_axis_tlast <= 'd0;
						end
						'd3:begin
							m_axis_tdata	<= (frameType_16Bit[0]== 1'b1)?{frameAggrOffset_length[0+:8], DinDyn_tdata[31-:8*3]} :
							{dataFragCnt_rd,fragdone_rd,DinDyn_tdata[31-:8*3]}	;
							m_axis_tkeep <= 'd4;
							m_axis_tvalid <= 'd1;
							m_axis_tlast <= 'd0;
						end
						'd4:begin
							m_axis_tdata	<= (frameType_16Bit[0]== 1'b1)?{frameAggrOffset_length[0+:8], DinDyn_tdata[31-:8*3]} :
							{dataFragCnt_rd,fragdone_rd,DinDyn_tdata[31-:8*3]}	;
							m_axis_tkeep <= 'd4;
							m_axis_tvalid <= 'd1;
							m_axis_tlast <= 'd0;
						end
					endcase
				end
				else begin
						m_axis_tdata	<= (frameType_16Bit[0]== 1'b1)?{frameAggrOffset_length[0+:8], DinDyn_tdata[31-:24]} :
											{dataFragCnt_rd,fragdone_rd,DinDyn_tdata[31-:24]}	;
						m_axis_tkeep	<= 'd4;
						m_axis_tvalid	<= 'd1;
						m_axis_tlast	<= 'd0;
						state <= state + 'd1;
				end
			end
			'd255:begin //处理数据last之后的一拍 （因为要填充CRC）
				if(DinDyn_tlastDy)begin
					state <= 'd0;
					case(DinDyn_tkeepDy)
						'd1:begin
							m_axis_tdata	<= {32'd0}	;
							m_axis_tkeep <= 'd0;
							m_axis_tvalid <= 'd0;
							m_axis_tlast <= 'd0;
						end
						'd2:begin
							m_axis_tdata	<= {8'd0, 24'd0}	;
							m_axis_tkeep <= 'd1;
							m_axis_tvalid <= 'd1;
							m_axis_tlast <= 'd1;
						end
						'd3:begin
							m_axis_tdata	<= {16'd0, 16'd0}	;
							m_axis_tkeep <= 'd2;
							m_axis_tvalid <= 'd1;
							m_axis_tlast <= 'd1;
						end
						'd4:begin
							m_axis_tdata	<= {DinDyn_tdataDy[0+:8], 16'd0, 8'd0}	;
							m_axis_tkeep <= 'd3;
							m_axis_tvalid <= 'd1;
							m_axis_tlast <= 'd1;
						end
					endcase
				end
			end
			default:begin
				if(DinDyn_tlast)begin 
					state <= 'd255;
					case(DinDyn_tkeep)
						'd1:begin
							m_axis_tdata	<= {DinDyn_tdataDy[0+:8], DinDyn_tdata[31-:8*1], 16'd0}	;
							m_axis_tkeep <= 'd4;
							m_axis_tvalid <= 'd1;
							m_axis_tlast <= 'd1;
						end
						'd2:begin
							m_axis_tdata	<= {DinDyn_tdataDy[0+:8], DinDyn_tdata[31-:8*2], 8'd0}	;
							m_axis_tkeep <= 'd4;
							m_axis_tvalid <= 'd1;
							m_axis_tlast <= 'd0;
						end
						'd3:begin
							m_axis_tdata	<= {DinDyn_tdataDy[0+:8], DinDyn_tdata[31-:8*3]}	;
							m_axis_tkeep <= 'd4;
							m_axis_tvalid <= 'd1;
							m_axis_tlast <= 'd0;
						end
						'd4:begin
							m_axis_tdata	<= {DinDyn_tdataDy[0+:8], DinDyn_tdata[31-:8*3]}	;
							m_axis_tkeep <= 'd4;
							m_axis_tvalid <= 'd1;
							m_axis_tlast <= 'd0;
						end
					endcase
				end
				else begin
					state <= state + 'd1;
					m_axis_tdata	<=	{DinDyn_tdataDy[0+:8],DinDyn_tdata[31-:24]}	;
					m_axis_tkeep	<= 'd4;
					m_axis_tvalid	<= 'd1;
					m_axis_tlast	<= 'd0;
				end
			end
		endcase
	end
end
endmodule
