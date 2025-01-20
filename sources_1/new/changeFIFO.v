`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/07 16:55:35
// Design Name: 
// Module Name: changeFIFO
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


module changeFIFO(
    input               clk         ,
    input               rst_n       ,
    input       [31:0]  Din         ,
    input       [3:0]   Din_index   , // 指示输入数据的有效字节数
    input               wr_en       ,
    input       [3:0]   Dout_index  , // 指示需要输出的字节数
    input               rd_en       ,
    output  reg [31:0]  Dout        ,
    output  reg [4:0]   index       // 指示FIFO中有效字节的个数
);
wire [31:0]     Din_swap;
reg  [511:0]    fifo_data;
assign Din_swap = {Din[7:0], Din[15:8], Din[23:16], Din[31:24]};
integer i;
always @(posedge clk) begin
    if (!rst_n) begin
        index <= 'd0;
        fifo_data <= 'd0;
        Dout <= 'd0;
    end else begin
        if (wr_en && rd_en) begin  // 同时读写
            case (Dout_index)
                'd0: begin  // 只写不读
                    case (Din_index)
                        'd1: begin
                            fifo_data[index*8+:8] <= Din_swap[7:0];
                            index <= index + 1;
                        end
                        'd2: begin
                            fifo_data[index*8+:16] <= Din_swap[15:0];
                            index <= index + 2;
                        end
                        'd3: begin
                            fifo_data[index*8+:24] <= Din_swap[23:0];
                            index <= index + 3;
                        end
                        'd4: begin
                            fifo_data[index*8+:32] <= Din_swap;
                            index <= index + 4;
                        end
                    endcase
                end
                'd1: begin
                    Dout <= {fifo_data[7:0], 24'd0};
                    case(Din_index)
                        'd1: begin
                            for(i=0; i<48; i=i+1) begin
                                if(i < index - 1)          fifo_data[i*8+:8] <= fifo_data[i*8+8+:8];
                                else if(i == index - 1)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                        'd2: begin
                            for(i=0; i<64; i=i+1) begin
                                if(i < index - 1)          fifo_data[i*8+:8] <= fifo_data[i*8+8+:8];
                                else if(i == index - 1)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else if(i == index)        fifo_data[i*8+:8] <= Din_swap[15:8];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                        'd3: begin
                            for(i=0; i<64; i=i+1) begin
                                if(i < index - 1)          fifo_data[i*8+:8] <= fifo_data[i*8+8+:8];
                                else if(i == index - 1)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else if(i == index)        fifo_data[i*8+:8] <= Din_swap[15:8];
                                else if(i == index + 1)    fifo_data[i*8+:8] <= Din_swap[23:16];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                        'd4: begin
                            for(i=0; i<64; i=i+1) begin
                                if(i < index - 1)          fifo_data[i*8+:8] <= fifo_data[i*8+8+:8];
                                else if(i == index - 1)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else if(i == index)        fifo_data[i*8+:8] <= Din_swap[15:8];
                                else if(i == index + 1)    fifo_data[i*8+:8] <= Din_swap[23:16];
                                else if(i == index + 2)    fifo_data[i*8+:8] <= Din_swap[31:24];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                    endcase
                    index <= index - 1 + Din_index;
                end
                'd2: begin
                    Dout <= {fifo_data[7:0], fifo_data[15:8], 16'd0};
                    case(Din_index)
                        'd1: begin
                            for(i=0; i<64; i=i+1) begin
                                if(i < index - 2)          fifo_data[i*8+:8] <= fifo_data[i*8+16+:8];
                                else if(i == index - 2)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                        'd2: begin
                            for(i=0; i<64; i=i+1) begin
                                if(i < index - 2)          fifo_data[i*8+:8] <= fifo_data[i*8+16+:8];
                                else if(i == index - 2)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else if(i == index - 1)    fifo_data[i*8+:8] <= Din_swap[15:8];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                        'd3: begin
                            for(i=0; i<64; i=i+1) begin
                                if(i < index - 2)          fifo_data[i*8+:8] <= fifo_data[i*8+16+:8];
                                else if(i == index - 2)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else if(i == index - 1)    fifo_data[i*8+:8] <= Din_swap[15:8];
                                else if(i == index)        fifo_data[i*8+:8] <= Din_swap[23:16];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                        'd4: begin
                            for(i=0; i<64; i=i+1) begin
                                if(i < index - 2)          fifo_data[i*8+:8] <= fifo_data[i*8+16+:8];
                                else if(i == index - 2)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else if(i == index - 1)    fifo_data[i*8+:8] <= Din_swap[15:8];
                                else if(i == index)        fifo_data[i*8+:8] <= Din_swap[23:16];
                                else if(i == index + 1)    fifo_data[i*8+:8] <= Din_swap[31:24];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                    endcase
                    index <= index - 2 + Din_index;
                end
                'd3: begin
                    Dout <= {fifo_data[7:0], fifo_data[15:8], fifo_data[23:16], 8'd0};
                    case(Din_index)
                        'd1: begin
                            for(i=0; i<64; i=i+1) begin
                                if(i < index - 3)          fifo_data[i*8+:8] <= fifo_data[i*8+24+:8];
                                else if(i == index - 3)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                        'd2: begin
                            for(i=0; i<64; i=i+1) begin
                                if(i < index - 3)          fifo_data[i*8+:8] <= fifo_data[i*8+24+:8];
                                else if(i == index - 3)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else if(i == index - 2)    fifo_data[i*8+:8] <= Din_swap[15:8];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                        'd3: begin
                            for(i=0; i<64; i=i+1) begin
                                if(i < index - 3)          fifo_data[i*8+:8] <= fifo_data[i*8+24+:8];
                                else if(i == index - 3)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else if(i == index - 2)    fifo_data[i*8+:8] <= Din_swap[15:8];
                                else if(i == index - 1)    fifo_data[i*8+:8] <= Din_swap[23:16];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                        'd4: begin
                            for(i=0; i<64; i=i+1) begin
                                if(i < index - 3)          fifo_data[i*8+:8] <= fifo_data[i*8+24+:8];
                                else if(i == index - 3)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else if(i == index - 2)    fifo_data[i*8+:8] <= Din_swap[15:8];
                                else if(i == index - 1)    fifo_data[i*8+:8] <= Din_swap[23:16];
                                else if(i == index)        fifo_data[i*8+:8] <= Din_swap[31:24];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                    endcase
                    index <= index - 3 + Din_index;
                end
                'd4: begin
                    Dout <= {fifo_data[7:0], fifo_data[15:8], fifo_data[23:16], fifo_data[31:24]};
                    case(Din_index)
                        'd1: begin
                            for(i=0; i<64; i=i+1) begin
                                if(i < index - 4)          fifo_data[i*8+:8] <= fifo_data[i*8+32+:8];
                                else if(i == index - 4)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                        'd2: begin
                            for(i=0; i<64; i=i+1) begin
                                if(i < index - 4)          fifo_data[i*8+:8] <= fifo_data[i*8+32+:8];
                                else if(i == index - 4)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else if(i == index - 3)    fifo_data[i*8+:8] <= Din_swap[15:8];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                        'd3: begin
                            for(i=0; i<64; i=i+1) begin
                                if(i < index - 4)          fifo_data[i*8+:8] <= fifo_data[i*8+32+:8];
                                else if(i == index - 4)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else if(i == index - 3)    fifo_data[i*8+:8] <= Din_swap[15:8];
                                else if(i == index - 2)    fifo_data[i*8+:8] <= Din_swap[23:16];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                        'd4: begin
                            for(i=0; i<64; i=i+1) begin
                                if(i < index - 4)          fifo_data[i*8+:8] <= fifo_data[i*8+32+:8];
                                else if(i == index - 4)    fifo_data[i*8+:8] <= Din_swap[7:0];
                                else if(i == index - 3)    fifo_data[i*8+:8] <= Din_swap[15:8];
                                else if(i == index - 2)    fifo_data[i*8+:8] <= Din_swap[23:16];
                                else if(i == index - 1)    fifo_data[i*8+:8] <= Din_swap[31:24];
                                else                       fifo_data[i*8+:8] <= 8'd0;
                            end
                        end
                    endcase
                    index <= index - 4 + Din_index;
                end
            endcase
        end else if (rd_en) begin  // 只读
            case (Dout_index)
                'd0: Dout <= 32'd0;
                'd1: begin
                    Dout <= {fifo_data[7:0], 24'd0};
                    fifo_data <= {8'd0, fifo_data[511:8]};
                    index <= index - 1;
                end
                'd2: begin
                    Dout <= {fifo_data[7:0], fifo_data[15:8], 16'd0};
                    fifo_data <= {16'd0, fifo_data[511:16]};
                    index <= index - 2;
                end
                'd3: begin
                    Dout <= {fifo_data[7:0], fifo_data[15:8], fifo_data[23:16], 8'd0};
                    fifo_data <= {24'd0, fifo_data[511:24]};
                    index <= index - 3;
                end
                'd4: begin
                    Dout <= {fifo_data[7:0], fifo_data[15:8], fifo_data[23:16], fifo_data[31:24]};
                    fifo_data <= {32'd0, fifo_data[511:32]};
                    index <= index - 4;
                end
                default: ;
            endcase
        end else if (wr_en) begin  // 只写
            case (Din_index)
                'd1: begin
                    fifo_data[index*8+:8] <= Din_swap[7:0];
                    index <= index + 1;
                end
                'd2: begin
                    fifo_data[index*8+:16] <= Din_swap[15:0];
                    index <= index + 2;
                end
                'd3: begin
                    fifo_data[index*8+:24] <= Din_swap[23:0];
                    index <= index + 3;
                end
                'd4: begin
                    fifo_data[index*8+:32] <= Din_swap;
                    index <= index + 4;
                end
                default: ;
            endcase
        end
        else begin// wr_en 为假时，保持内部缓存
            fifo_data               <= fifo_data  ;
            index                   <= index      ;
        end
    end
end

endmodule
