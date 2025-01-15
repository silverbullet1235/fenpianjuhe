`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/01/07 19:48:11
// Design Name: 
// Module Name: changeFIFOTb
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
////////////////////////////////////////////////////////////////////////////////

module changeFIFOTb();

    parameter RESET_PERIOD     = 200;
    parameter CLKIN_PERIOD     = 2;    // Input Clock Period

    reg         clk;
    reg         rst_n;

    // 测试信号定义
    reg  [31:0] Din         = 'd0;
    reg  [3:0]  Din_index   = 'd0;
    reg         wr_en       = 'd0;
    reg  [3:0]  Dout_index  = 'd0;
    reg         rd_en       = 'd0;
    wire [31:0] Dout        ;
    wire [3:0]  index       ;

    // 时钟和复位信号生成
    initial begin // 除时钟外，用非阻塞对齐时钟上升沿；initial也采用阻塞赋值，结果将不按时序触发
        // 使用阻塞赋值
        clk = 1'b0;
        rst_n <= 1'b0;
        #RESET_PERIOD;
        rst_n <= 1'b1;
        #(CLKIN_PERIOD/2);

        // 测试向写入4字节
        #(CLKIN_PERIOD*10);
        Din         <= 'h12345678;
        Din_index   <= 'd4;
        wr_en       <= 1'b1;
        Dout_index  <= 'd0;
        rd_en       <= 1'b0;
        #(CLKIN_PERIOD);
        Din         <= 'd0;
        Din_index   <= 'd0;
        wr_en       <= 1'b0;
        Dout_index  <= 'd0;
        rd_en       <= 1'b0;

        // 同时写入2字节并读取3字节
        #(CLKIN_PERIOD*10);
        Din         <= 'h11223344;
        Din_index   <= 'd2;
        wr_en       <= 1'b1;
        Dout_index  <= 'd3;
        rd_en       <= 1'b1;
        #(CLKIN_PERIOD);
        Din         <= 'd0;
        Din_index   <= 'd0;
        wr_en       <= 1'b0;
        Dout_index  <= 'd0;
        rd_en       <= 1'b0;

        // 添加更多测试用例（可选）
        /*
        #(CLKIN_PERIOD*10)
        Din         <= 'hAABBCCDD;
        Din_index   <= 'd3;
        wr_en       <= 1'b1;
        Dout_index  <= 'd2;
        rd_en       <= 1'b1;
        #(CLKIN_PERIOD);
        Din         <= 'd0;
        Din_index   <= 'd0;
        wr_en       <= 1'b0;
        Dout_index  <= 'd0;
        rd_en       <= 1'b0;
        */
        
        // 结束仿真（可选）
        #100;
        $finish;
    end

    // 时钟生成，使用阻塞赋值
    always         #(CLKIN_PERIOD/2) clk = ~clk;

    // 实例化被测模块
    changeFIFO uut (
        .clk        (clk),
        .rst_n      (rst_n),
        .Din        (Din),
        .Din_index  (Din_index),
        .wr_en      (wr_en),
        .Dout_index (Dout_index),
        .rd_en      (rd_en),
        .Dout       (Dout),
        .index      (index)
    );

endmodule
