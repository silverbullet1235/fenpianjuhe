// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Mon Jan  6 21:30:55 2025
// Host        : DESKTOP-O4UFV4N running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/vivado_project/ProjectShangGuang/fpjh/fpjh.srcs/sources_1/ip/fifo_Fpjh_len_1/fifo_Fpjh_len_1_stub.v
// Design      : fifo_Fpjh_len_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_4,Vivado 2019.1" *)
module fifo_Fpjh_len_1(clk, srst, din, wr_en, rd_en, dout, full, empty, valid, 
  data_count)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[11:0],wr_en,rd_en,dout[11:0],full,empty,valid,data_count[8:0]" */;
  input clk;
  input srst;
  input [11:0]din;
  input wr_en;
  input rd_en;
  output [11:0]dout;
  output full;
  output empty;
  output valid;
  output [8:0]data_count;
endmodule
