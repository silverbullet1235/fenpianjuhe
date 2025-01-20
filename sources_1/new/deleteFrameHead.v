`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/16 20:12:02
// Design Name: 
// Module Name: deleteFrameHead
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


module deleteFrameHead(
	input wire              clk,                 
	input wire              rst,                 
	input wire              receCrcOut_tvalid   ,
	input wire [31:0]       receCrcOut_tdata    ,
	input wire [3:0]        receCrcOut_tkeep    ,
	input wire              receCrcOut_tlast    ,
	input wire [31:0]       frameType_1Bit_Reg  ,
	// 输出AXIS接口
	output reg				m_axis_tsync	= 'd0	,
	output reg              m_axis_tvalid	= 'd0	,
	output reg [31:0]       m_axis_tdata	= 'd0	,
	output reg [3:0]        m_axis_tkeep	= 'd0	,
	output reg              m_axis_tlast	= 'd0	
);
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
assign DinDyn_tvalid	= (frameType_1Bit_Reg[0]== 1'b1)?(DinNdDy1 && DinNdDy3) : (DinNdDy1 && DinNdDy2);
assign DinDyn_tsync = (frameType_1Bit_Reg[0]== 1'b1)?(DinNdDy3 && !DinNdDy4) : (DinNdDy2 && !DinNdDy3);
reg [31:0] atest = 'd0;
reg DinDyn_tvalidDy1 = 'd0;
always @(posedge clk) begin
	if(rst) begin
		m_axis_tdata <= 'd0;
		m_axis_tkeep <= 'd0;
		m_axis_tvalid <= 'd0;
		m_axis_tlast <= 'd0;
		m_axis_tsync <= 'd0;
		DinDyn_tvalidDy1 <= 'd0;
	end
	else begin
		{DinNdDy4, DinNdDy3, DinNdDy2, DinNdDy1}	<= {DinNdDy3, DinNdDy2, DinNdDy1, receCrcOut_tvalid};
		{DinDy4, DinDy3, DinDy2, DinDy1} <= {DinDy3, DinDy2, DinDy1, receCrcOut_tdata};
		{DinKeep3, DinKeep2, DinKeep1}	<= {DinKeep2, DinKeep1, receCrcOut_tkeep};
		{DinLast3, DinLast2, DinLast1}	<= {DinLast2, DinLast1, receCrcOut_tlast};
		DinDyn_tdataDy <= DinDyn_tdata;
		DinDyn_tkeepDy <= DinDyn_tkeep;
		DinDyn_tlastDy <= DinDyn_tlast;
		m_axis_tsync <= DinDyn_tsync;
		DinDyn_tvalidDy1 <= DinDyn_tvalid;

		if(DinDyn_tvalidDy1)begin
			if(DinLast2)begin
				case(DinKeep2)
					'd1:begin
						m_axis_tvalid <= 'd0;
						m_axis_tdata <= 'd0;
						m_axis_tkeep <= 'd0;
						m_axis_tlast <= 'd0;
					end
					'd2:begin
						m_axis_tvalid <= 'd0;
						m_axis_tdata <= 'd0;
						m_axis_tkeep <= 'd0;
						m_axis_tlast <= 'd0;
					end
					'd3:begin
						m_axis_tvalid <= 'd0;
						m_axis_tdata <= 'd0;
						m_axis_tkeep <= 'd0;
						m_axis_tlast <= 'd0;
					end
					'd4:begin
						m_axis_tvalid <= 'd1;
						m_axis_tdata <= {DinDy2[23-:8*1],{3{8'd0}}};
						m_axis_tkeep <= 'd1;
						m_axis_tlast <= 'd1;
					end
				endcase
			end
			else if(DinLast1)begin
				case(DinKeep1)
					'd1:begin
						m_axis_tvalid <= DinDyn_tvalidDy1;
						m_axis_tdata <= {DinDy2[23-:8*2],{2{8'd0}}};
						m_axis_tkeep <= 'd2;
						m_axis_tlast <= 'd1;
					end
					'd2:begin
						m_axis_tvalid <= DinDyn_tvalidDy1;
						m_axis_tdata <= {DinDy2[23-:8*3],{1{8'd0}}};
						m_axis_tkeep <= 'd3;
						m_axis_tlast <= 'd1;
					end
					'd3:begin
						m_axis_tvalid <= DinDyn_tvalidDy1;
						m_axis_tdata <= {DinDy2[23-:8*3],DinDy1[31-:8*1]};
						m_axis_tkeep <= 'd4;
						m_axis_tlast <= 'd1;
					end
					'd4:begin
						m_axis_tvalid <= DinDyn_tvalidDy1;
						m_axis_tdata <= {DinDy2[23-:8*3],DinDy1[31-:8*1]};
						m_axis_tkeep <= 'd4;
						m_axis_tlast <= 'd0;
					end
				endcase
			end
			else if(m_axis_tsync)begin
				m_axis_tvalid <= DinDyn_tvalidDy1;
				m_axis_tdata <= {DinDy2[23-:8*3],DinDy1[31-:8*1]};
				m_axis_tkeep <= 'd4;
				m_axis_tlast <= 'd0;
			end
			else begin
				m_axis_tvalid <= DinDyn_tvalidDy1;
				m_axis_tdata <= {DinDy2[23-:8*3],DinDy1[31-:8*1]};
				m_axis_tkeep <= DinKeep2;
				m_axis_tlast <= DinLast2;
			end
		end
		else if(!DinNdDy2 && DinNdDy3)begin
			m_axis_tvalid <= 'd0;
			m_axis_tdata <= 'd0;
			m_axis_tkeep <= 'd0;
			m_axis_tlast <= 'd0;
		end
	end
end
endmodule
