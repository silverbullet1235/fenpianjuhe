// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Mon Jan  6 21:44:33 2025
// Host        : DESKTOP-O4UFV4N running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/vivado_project/ProjectShangGuang/fpjh/fpjh.srcs/sources_1/ip/fifo_Fpjh_data_2/fifo_Fpjh_data_2_stub.v
// Design      : fifo_Fpjh_data_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_4,Vivado 2019.1" *)
module fifo_Fpjh_data_2(clk, srst, din, wr_en, rd_en, dout, full, almost_full, 
  empty, almost_empty, valid, data_count, prog_full, prog_empty)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[31:0],wr_en,rd_en,dout[31:0],full,almost_full,empty,almost_empty,valid,data_count[12:0],prog_full,prog_empty" */;
  input clk;
  input srst;
  input [31:0]din;
  input wr_en;
  input rd_en;
  output [31:0]dout;
  output full;
  output almost_full;
  output empty;
  output almost_empty;
  output valid;
  output [12:0]data_count;
  output prog_full;
  output prog_empty;
endmodule
