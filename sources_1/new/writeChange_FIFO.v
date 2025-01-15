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
// Description: FIFO中的先输入字节在fifo_data右侧，后输入字节在fifo_data左侧
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//此程序的输出为固定的4字节，输入的长度由Din_index决定，（会输入0、1、2、3、4字节）
//会出现wr_en拉高，但Din_index为0的情况

// 此FIFO无法处理输入数据仅为1、2、3字节的情况，需要修改（其实只要fifo_data中留着1、2、3字节就输出不了）

module writeChange_FIFO(
    input               clk         ,
    input               rst_n       ,
    input       [31:0]  Din         ,
    input       [3:0]   Din_index   ,// 指示输入数据的有效字节所在的位置
    input               wr_en       ,
    output  reg [31:0]  Dout        ,
    output  reg         Dout_valid  ,
    output  reg [3:0]   index       // 指示fifo_data中有效字节的位置，即FIFO中有效字节的个数
);

wire [31:0]     Din_swap;
wire            Dout_validw;
reg [127+32:0]  fifo_data   ;// 内部缓存 缓存达到或者超过4字节时，输出一个完整的32字节 ///fifo_data[127:0]为暂存区，高32保留

assign Din_swap     = {Din[7:0], Din[15:8], Din[23:16], Din[31:24]};// 字节交换
assign Dout_validw  = index >= 4;

integer i;
always @(posedge clk ) begin
    if( !rst_n ) begin
        index      <= 'd0   ;
        fifo_data[127:0]  <= 'd0   ;
    end else begin
        if( wr_en && Dout_validw ) begin// wr_en Dout_validw 同时为1时，输出一个完整的32字节
            case ( Din_index )
                'd0 : begin             // 状态多余，仿真时去掉 跟else if( Dout_validw ) begin有点重复，也就是为什么会出现无Din_index指示，但是wr_en会有拉高
                    Dout        <= { fifo_data[7:0], fifo_data[15:8], fifo_data[23:16], fifo_data[31:24] }  ;
                    fifo_data[127:0]   <= { 32'd0, fifo_data[95:32] } ;
                    index       <= index - 4        ;
                end
                'd1 : begin             // 最低的4个字节输出，最高的3字节输入0，第四个高字节输入1字节数据
                    Dout                        <= { fifo_data[7:0], fifo_data[15:8], fifo_data[23:16], fifo_data[31:24] }  ;
                    for(i=0; i<16; i=i+1) begin
                        if( i < index - 4 )         fifo_data[i*8+:8] <= fifo_data[i*8+32+:8]   ;
                        else if( i == index - 4 )   fifo_data[i*8+:8] <= Din_swap[7:0]          ;
                        else if( i == index - 3 )   fifo_data[i*8+:8] <= 8'd0                   ;
                        else if( i == index - 2 )   fifo_data[i*8+:8] <= 8'd0                   ;
                        else if( i == index - 1 )   fifo_data[i*8+:8] <= 8'd0                   ;
                        else                        fifo_data[i*8+:8] <= fifo_data[i*8+:8]      ;
                    end
                    index                       <= index - 3        ;
                end
                'd2 : begin
                    Dout                        <= { fifo_data[7:0], fifo_data[15:8], fifo_data[23:16], fifo_data[31:24] }  ;
                    for(i=0; i<16; i=i+1) begin
                        if( i < index - 4 )         fifo_data[i*8+:8] <= fifo_data[i*8+32+:8]   ;
                        else if( i == index - 4 )   fifo_data[i*8+:8] <= Din_swap[7:0]          ;
                        else if( i == index - 3 )   fifo_data[i*8+:8] <= Din_swap[15:8]         ;
                        else if( i == index - 2 )   fifo_data[i*8+:8] <= 8'd0                   ;
                        else if( i == index - 1 )   fifo_data[i*8+:8] <= 8'd0                   ;
                        else                        fifo_data[i*8+:8] <= fifo_data[i*8+:8]      ;
                    end
                    index                       <= index - 2        ;
                end
                'd3 : begin
                    Dout                        <= { fifo_data[7:0], fifo_data[15:8], fifo_data[23:16], fifo_data[31:24] }  ;
                    for(i=0; i<16; i=i+1) begin
                        if( i < index - 4 )         fifo_data[i*8+:8] <= fifo_data[i*8+32+:8]   ;
                        else if( i == index - 4 )   fifo_data[i*8+:8] <= Din_swap[7:0]          ;
                        else if( i == index - 3 )   fifo_data[i*8+:8] <= Din_swap[15:8]         ;
                        else if( i == index - 2 )   fifo_data[i*8+:8] <= Din_swap[23:16]        ;
                        else if( i == index - 1 )   fifo_data[i*8+:8] <= 8'd0                   ;
                        else                        fifo_data[i*8+:8] <= fifo_data[i*8+:8]      ;
                    end
                    index                       <= index - 1        ;
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
        end else if( Dout_validw ) begin// Dout_validw 为真，wr_en为假时，输出一个完整的32字节 //感觉这个状态达不到很高
            Dout        <= { fifo_data[7:0], fifo_data[15:8], fifo_data[23:16], fifo_data[31:24] }  ;
            fifo_data[127:0]   <= { 32'd0, fifo_data[95:32] } ;
            index       <= index - 4        ;
        end else if( wr_en ) begin// wr_en 为真，Dout_validw 为假时，输入数据
            case ( Din_index )
                'd1 : begin
                    fifo_data[index*8+:8]       <= Din_swap[7:0]    ;
                    index                       <= index + 1        ;
                end
                'd2 : begin
                    fifo_data[index*8+:16]      <= Din_swap[15:0]   ;
                    index                       <= index + 2        ;
                end
                'd3 : begin
                    fifo_data[index*8+:24]      <= Din_swap[23:0]   ;
                    index                       <= index + 3        ;
                end
                'd4 : begin
                    fifo_data[index*8+:32]      <= Din_swap         ;
                    index                       <= index + 4        ;
                end
                default:;
            endcase
        end else begin// wr_en 为假时，保持内部缓存
            fifo_data               <= fifo_data  ;
            index                   <= index      ;
        end
    end
end

always @(posedge clk ) begin
    Dout_valid  <= Dout_validw;
end
endmodule
