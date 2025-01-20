// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sun Jan 19 01:05:53 2025
// Host        : DESKTOP-O4UFV4N running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/vivado_project/ProjectShangGuang/fpjh/fpjh.srcs/sources_1/ip/lenRece/lenRece_stub.v
// Design      : lenRece
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_3,Vivado 2019.1" *)
module lenRece(clka, ena, wea, addra, dina, douta, clkb, enb, web, addrb, 
  dinb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[3:0],dina[11:0],douta[11:0],clkb,enb,web[0:0],addrb[3:0],dinb[11:0],doutb[11:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [3:0]addra;
  input [11:0]dina;
  output [11:0]douta;
  input clkb;
  input enb;
  input [0:0]web;
  input [3:0]addrb;
  input [11:0]dinb;
  output [11:0]doutb;
endmodule
