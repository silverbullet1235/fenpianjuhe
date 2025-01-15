`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/20 08:23:23
// Design Name: 
// Module Name: outChange_FIFO
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
//此程序的输入为固定的4字节，输出的长度由Din_index决定，（会输出0、1、2、3、4字节）
//会出现rd_en拉高，但Din_index为0的情况

module readChange_FIFO(
    input               clk         ,
    input               rst_n       ,
    input       [31:0]  Din         ,
    input       [3:0]   Din_index   ,
    input               wr_en       ,
    input               rd_en       ,
    output  reg [31:0]  Dout        ,
    output  reg [3:0]   index       
);

wire [31:0]  Din_swap;
reg [255:0]  fifo_data   ;// 16字节暂存区

assign Din_swap = {Din[7:0], Din[15:8], Din[23:16], Din[31:24]};

integer i;
always @(posedge clk ) begin
    if( !rst_n ) begin
        index      <= 'd0   ;
        fifo_data  <= 'd0   ;
    end else begin
        if( wr_en && rd_en ) begin
            case ( Din_index )
                'd0 : begin
                    Dout                        <= 32'd0            ;
                    fifo_data[index*8+:32]      <= Din_swap         ;
                    index                       <= index + 4        ;
                end
                'd1 : begin
                    Dout                        <= { fifo_data[7:0], 24'd0 }  ;
                    for(i=0; i<16; i=i+1) begin
                        if( i < index - 1 )         fifo_data[i*8+:8] <= fifo_data[i*8+8+:8]    ;
                        else if( i == index - 1 )   fifo_data[i*8+:8] <= Din_swap[7:0]          ;
                        else if( i == index     )   fifo_data[i*8+:8] <= Din_swap[15:8]         ;
                        else if( i == index + 1 )   fifo_data[i*8+:8] <= Din_swap[23:16]        ;
                        else if( i == index + 2 )   fifo_data[i*8+:8] <= Din_swap[31:24]        ;
                        else                        fifo_data[i*8+:8] <= fifo_data[i*8+:8]      ;
                    end
                    index                       <= index + 3        ;
                end
                'd2 : begin
                    Dout                        <= { fifo_data[7:0], fifo_data[15:8], 16'd0 } ;
                    for(i=0; i<16; i=i+1) begin
                        if( i < index - 2 )         fifo_data[i*8+:8] <= fifo_data[i*8+16+:8]   ;
                        else if( i == index - 2 )   fifo_data[i*8+:8] <= Din_swap[7:0]          ;
                        else if( i == index - 1 )   fifo_data[i*8+:8] <= Din_swap[15:8]         ;
                        else if( i == index     )   fifo_data[i*8+:8] <= Din_swap[23:16]        ;
                        else if( i == index + 1 )   fifo_data[i*8+:8] <= Din_swap[31:24]        ;
                        else                        fifo_data[i*8+:8] <= fifo_data[i*8+:8]      ;
                    end
                    index                       <= index + 2        ;
                end
                'd3 : begin
                    Dout                        <= { fifo_data[7:0], fifo_data[15:8], fifo_data[23:16], 8'd0 } ;
                    for(i=0; i<16; i=i+1) begin
                        if( i < index - 3 )         fifo_data[i*8+:8] <= fifo_data[i*8+24+:8]   ;
                        else if( i == index - 3 )   fifo_data[i*8+:8] <= Din_swap[7:0]          ;
                        else if( i == index - 2 )   fifo_data[i*8+:8] <= Din_swap[15:8]         ;
                        else if( i == index - 1 )   fifo_data[i*8+:8] <= Din_swap[23:16]        ;
                        else if( i == index     )   fifo_data[i*8+:8] <= Din_swap[31:24]        ;
                        else                        fifo_data[i*8+:8] <= fifo_data[i*8+:8]      ;
                    end
                    index                       <= index + 1        ;
                end
                'd4 : begin
                    Dout                        <= { fifo_data[7:0], fifo_data[15:8], fifo_data[23:16], fifo_data[31:24] }  ;
                    for(i=0; i<16; i=i+1) begin
                        if( i < index - 4 )         fifo_data[i*8+:8] <= fifo_data[i*8+32+:8]   ;
                        else if( i == index - 4 )   fifo_data[i*8+:8] <= Din_swap[7:0]          ;
                        else if( i == index - 3 )   fifo_data[i*8+:8] <= Din_swap[15:8]         ;
                        else if( i == index - 2 )   fifo_data[i*8+:8] <= Din_swap[23:16]        ;
                        else if( i == index - 1 )   fifo_data[i*8+:8] <= Din_swap[31:24]        ;
                        else                        fifo_data[i*8+:8] <= fifo_data[i*8+:8]      ;
                    end
                    index                       <= index            ;
                end
                default:;
            endcase
        end else if( rd_en ) begin
            case ( Din_index )
                'd0 : begin
                    Dout                        <= 32'd0            ;
                end
                'd1 : begin
                    Dout                        <= { fifo_data[7:0], 24'd0 }  ;
                    fifo_data                   <= { 8'd0, fifo_data[127:8] } ;
                    index                       <= index - 1        ;
                end
                'd2 : begin
                    Dout                        <= { fifo_data[7:0], fifo_data[15:8], 16'd0 } ;
                    fifo_data                   <= { 16'd0, fifo_data[127:16] } ;
                    index                       <= index - 2        ;
                end
                'd3 : begin
                    Dout                        <= { fifo_data[7:0], fifo_data[15:8], fifo_data[23:16], 8'd0 } ;
                    fifo_data                   <= { 24'd0, fifo_data[127:24] } ;
                    index                       <= index - 3        ;
                end
                'd4 : begin
                    Dout                        <= { fifo_data[7:0], fifo_data[15:8], fifo_data[23:16], fifo_data[31:24] }  ;
                    fifo_data                   <= { 32'd0, fifo_data[127:32] } ;
                    index                       <= index - 4        ;
                end
                default:;
            endcase
        end else if( wr_en ) begin
            fifo_data[index*8+:32]  <= Din_swap   ;
            index                   <= index + 4  ;
        end else begin
            fifo_data               <= fifo_data  ;
            index                   <= index      ;
        end
    end
end
endmodule
