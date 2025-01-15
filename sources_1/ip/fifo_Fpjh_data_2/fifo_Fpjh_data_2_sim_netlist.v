// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Mon Jan  6 21:44:33 2025
// Host        : DESKTOP-O4UFV4N running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/vivado_project/ProjectShangGuang/fpjh/fpjh.srcs/sources_1/ip/fifo_Fpjh_data_2/fifo_Fpjh_data_2_sim_netlist.v
// Design      : fifo_Fpjh_data_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1927-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_Fpjh_data_2,fifo_generator_v13_2_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_4,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module fifo_Fpjh_data_2
   (clk,
    srst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    almost_full,
    empty,
    almost_empty,
    valid,
    data_count,
    prog_full,
    prog_empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input clk;
  input srst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE ALMOST_FULL" *) output almost_full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ ALMOST_EMPTY" *) output almost_empty;
  output valid;
  output [12:0]data_count;
  output prog_full;
  output prog_empty;

  wire almost_empty;
  wire almost_full;
  wire clk;
  wire [12:0]data_count;
  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire prog_empty;
  wire prog_full;
  wire rd_en;
  wire srst;
  wire valid;
  wire wr_en;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [12:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [12:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "13" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "virtex7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "1" *) 
  (* C_HAS_ALMOST_FULL = "1" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "1" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "8kx4" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "848" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "849" *) 
  (* C_PROG_EMPTY_TYPE = "1" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "3" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "2" *) 
  (* C_PROG_FULL_TYPE = "1" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "13" *) 
  (* C_RD_DEPTH = "8192" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "13" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "13" *) 
  (* C_WR_DEPTH = "8192" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "13" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  fifo_Fpjh_data_2_fifo_generator_v13_2_4 U0
       (.almost_empty(almost_empty),
        .almost_full(almost_full),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(clk),
        .data_count(data_count),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(prog_empty),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(prog_full),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[12:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(srst),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(valid),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[12:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module fifo_Fpjh_data_2_blk_mem_gen_generic_cstr
   (dout,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ,
    clk,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    Q,
    din,
    p_17_out,
    ena_array,
    enb_array,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 );
  output [31:0]dout;
  output \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  input clk;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input srst;
  input [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input [12:0]Q;
  input [31:0]din;
  input p_17_out;
  input [1:0]ena_array;
  input [1:0]enb_array;
  input \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire [12:0]Q;
  wire clk;
  wire [31:0]din;
  wire [31:0]dout;
  wire [1:0]ena_array;
  wire [1:0]enb_array;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;
  wire p_17_out;
  wire \ramloop[2].ram.r_n_0 ;
  wire \ramloop[2].ram.r_n_1 ;
  wire \ramloop[2].ram.r_n_2 ;
  wire \ramloop[2].ram.r_n_3 ;
  wire \ramloop[2].ram.r_n_4 ;
  wire \ramloop[2].ram.r_n_5 ;
  wire \ramloop[2].ram.r_n_6 ;
  wire \ramloop[2].ram.r_n_7 ;
  wire \ramloop[2].ram.r_n_8 ;
  wire \ramloop[3].ram.r_n_0 ;
  wire \ramloop[3].ram.r_n_1 ;
  wire \ramloop[3].ram.r_n_2 ;
  wire \ramloop[3].ram.r_n_3 ;
  wire \ramloop[3].ram.r_n_4 ;
  wire \ramloop[3].ram.r_n_5 ;
  wire \ramloop[3].ram.r_n_6 ;
  wire \ramloop[3].ram.r_n_7 ;
  wire \ramloop[3].ram.r_n_8 ;
  wire \ramloop[4].ram.r_n_0 ;
  wire \ramloop[4].ram.r_n_1 ;
  wire \ramloop[4].ram.r_n_2 ;
  wire \ramloop[4].ram.r_n_3 ;
  wire \ramloop[4].ram.r_n_4 ;
  wire \ramloop[4].ram.r_n_5 ;
  wire \ramloop[4].ram.r_n_6 ;
  wire \ramloop[4].ram.r_n_7 ;
  wire \ramloop[4].ram.r_n_8 ;
  wire \ramloop[5].ram.r_n_0 ;
  wire \ramloop[5].ram.r_n_1 ;
  wire \ramloop[5].ram.r_n_2 ;
  wire \ramloop[5].ram.r_n_3 ;
  wire \ramloop[5].ram.r_n_4 ;
  wire \ramloop[5].ram.r_n_5 ;
  wire \ramloop[5].ram.r_n_6 ;
  wire \ramloop[5].ram.r_n_7 ;
  wire \ramloop[5].ram.r_n_8 ;
  wire \ramloop[6].ram.r_n_0 ;
  wire \ramloop[6].ram.r_n_1 ;
  wire \ramloop[6].ram.r_n_2 ;
  wire \ramloop[6].ram.r_n_3 ;
  wire \ramloop[6].ram.r_n_4 ;
  wire \ramloop[6].ram.r_n_5 ;
  wire \ramloop[6].ram.r_n_6 ;
  wire \ramloop[6].ram.r_n_7 ;
  wire \ramloop[7].ram.r_n_0 ;
  wire \ramloop[7].ram.r_n_1 ;
  wire \ramloop[7].ram.r_n_2 ;
  wire \ramloop[7].ram.r_n_3 ;
  wire \ramloop[7].ram.r_n_4 ;
  wire \ramloop[7].ram.r_n_5 ;
  wire \ramloop[7].ram.r_n_6 ;
  wire \ramloop[7].ram.r_n_7 ;
  wire srst;

  fifo_Fpjh_data_2_blk_mem_gen_mux__parameterized0 \has_mux_b.B 
       (.DOBDO({\ramloop[3].ram.r_n_0 ,\ramloop[3].ram.r_n_1 ,\ramloop[3].ram.r_n_2 ,\ramloop[3].ram.r_n_3 ,\ramloop[3].ram.r_n_4 ,\ramloop[3].ram.r_n_5 ,\ramloop[3].ram.r_n_6 ,\ramloop[3].ram.r_n_7 }),
        .DOPBDOP(\ramloop[3].ram.r_n_8 ),
        .clk(clk),
        .dout(dout[31:6]),
        .\dout[13] ({\ramloop[2].ram.r_n_0 ,\ramloop[2].ram.r_n_1 ,\ramloop[2].ram.r_n_2 ,\ramloop[2].ram.r_n_3 ,\ramloop[2].ram.r_n_4 ,\ramloop[2].ram.r_n_5 ,\ramloop[2].ram.r_n_6 ,\ramloop[2].ram.r_n_7 }),
        .\dout[14] (\ramloop[2].ram.r_n_8 ),
        .\dout[22] ({\ramloop[5].ram.r_n_0 ,\ramloop[5].ram.r_n_1 ,\ramloop[5].ram.r_n_2 ,\ramloop[5].ram.r_n_3 ,\ramloop[5].ram.r_n_4 ,\ramloop[5].ram.r_n_5 ,\ramloop[5].ram.r_n_6 ,\ramloop[5].ram.r_n_7 }),
        .\dout[22]_0 ({\ramloop[4].ram.r_n_0 ,\ramloop[4].ram.r_n_1 ,\ramloop[4].ram.r_n_2 ,\ramloop[4].ram.r_n_3 ,\ramloop[4].ram.r_n_4 ,\ramloop[4].ram.r_n_5 ,\ramloop[4].ram.r_n_6 ,\ramloop[4].ram.r_n_7 }),
        .\dout[23] (\ramloop[5].ram.r_n_8 ),
        .\dout[23]_0 (\ramloop[4].ram.r_n_8 ),
        .\dout[31] ({\ramloop[7].ram.r_n_0 ,\ramloop[7].ram.r_n_1 ,\ramloop[7].ram.r_n_2 ,\ramloop[7].ram.r_n_3 ,\ramloop[7].ram.r_n_4 ,\ramloop[7].ram.r_n_5 ,\ramloop[7].ram.r_n_6 ,\ramloop[7].ram.r_n_7 }),
        .\dout[31]_0 ({\ramloop[6].ram.r_n_0 ,\ramloop[6].ram.r_n_1 ,\ramloop[6].ram.r_n_2 ,\ramloop[6].ram.r_n_3 ,\ramloop[6].ram.r_n_4 ,\ramloop[6].ram.r_n_5 ,\ramloop[6].ram.r_n_6 ,\ramloop[6].ram.r_n_7 }),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_1 (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ));
  fifo_Fpjh_data_2_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din[1:0]),
        .dout(dout[1:0]),
        .p_17_out(p_17_out),
        .srst(srst));
  fifo_Fpjh_data_2_blk_mem_gen_prim_width__parameterized0 \ramloop[1].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din[5:2]),
        .dout(dout[5:2]),
        .p_17_out(p_17_out),
        .srst(srst));
  fifo_Fpjh_data_2_blk_mem_gen_prim_width__parameterized1 \ramloop[2].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ({\ramloop[2].ram.r_n_0 ,\ramloop[2].ram.r_n_1 ,\ramloop[2].ram.r_n_2 ,\ramloop[2].ram.r_n_3 ,\ramloop[2].ram.r_n_4 ,\ramloop[2].ram.r_n_5 ,\ramloop[2].ram.r_n_6 ,\ramloop[2].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\ramloop[2].ram.r_n_8 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 [11:0]),
        .Q(Q[11:0]),
        .clk(clk),
        .din(din[14:6]),
        .ena_array(ena_array[0]),
        .enb_array(enb_array[0]),
        .p_17_out(p_17_out),
        .srst(srst));
  fifo_Fpjh_data_2_blk_mem_gen_prim_width__parameterized2 \ramloop[3].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 [11:0]),
        .DOBDO({\ramloop[3].ram.r_n_0 ,\ramloop[3].ram.r_n_1 ,\ramloop[3].ram.r_n_2 ,\ramloop[3].ram.r_n_3 ,\ramloop[3].ram.r_n_4 ,\ramloop[3].ram.r_n_5 ,\ramloop[3].ram.r_n_6 ,\ramloop[3].ram.r_n_7 }),
        .DOPBDOP(\ramloop[3].ram.r_n_8 ),
        .Q(Q[11:0]),
        .clk(clk),
        .din(din[14:6]),
        .ena_array(ena_array[1]),
        .enb_array(enb_array[1]),
        .p_17_out(p_17_out),
        .srst(srst));
  fifo_Fpjh_data_2_blk_mem_gen_prim_width__parameterized3 \ramloop[4].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ({\ramloop[4].ram.r_n_0 ,\ramloop[4].ram.r_n_1 ,\ramloop[4].ram.r_n_2 ,\ramloop[4].ram.r_n_3 ,\ramloop[4].ram.r_n_4 ,\ramloop[4].ram.r_n_5 ,\ramloop[4].ram.r_n_6 ,\ramloop[4].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\ramloop[4].ram.r_n_8 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 [11:0]),
        .Q(Q[11:0]),
        .clk(clk),
        .din(din[23:15]),
        .ena_array(ena_array[0]),
        .enb_array(enb_array[0]),
        .p_17_out(p_17_out),
        .srst(srst));
  fifo_Fpjh_data_2_blk_mem_gen_prim_width__parameterized4 \ramloop[5].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ({\ramloop[5].ram.r_n_0 ,\ramloop[5].ram.r_n_1 ,\ramloop[5].ram.r_n_2 ,\ramloop[5].ram.r_n_3 ,\ramloop[5].ram.r_n_4 ,\ramloop[5].ram.r_n_5 ,\ramloop[5].ram.r_n_6 ,\ramloop[5].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\ramloop[5].ram.r_n_8 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 [11:0]),
        .Q(Q[11:0]),
        .clk(clk),
        .din(din[23:15]),
        .ena_array(ena_array[1]),
        .enb_array(enb_array[1]),
        .p_17_out(p_17_out),
        .srst(srst));
  fifo_Fpjh_data_2_blk_mem_gen_prim_width__parameterized5 \ramloop[6].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ({\ramloop[6].ram.r_n_0 ,\ramloop[6].ram.r_n_1 ,\ramloop[6].ram.r_n_2 ,\ramloop[6].ram.r_n_3 ,\ramloop[6].ram.r_n_4 ,\ramloop[6].ram.r_n_5 ,\ramloop[6].ram.r_n_6 ,\ramloop[6].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 [11:0]),
        .Q(Q[11:0]),
        .clk(clk),
        .din(din[31:24]),
        .ena_array(ena_array[0]),
        .enb_array(enb_array[0]),
        .p_17_out(p_17_out),
        .srst(srst));
  fifo_Fpjh_data_2_blk_mem_gen_prim_width__parameterized6 \ramloop[7].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ({\ramloop[7].ram.r_n_0 ,\ramloop[7].ram.r_n_1 ,\ramloop[7].ram.r_n_2 ,\ramloop[7].ram.r_n_3 ,\ramloop[7].ram.r_n_4 ,\ramloop[7].ram.r_n_5 ,\ramloop[7].ram.r_n_6 ,\ramloop[7].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 [11:0]),
        .Q(Q[11:0]),
        .clk(clk),
        .din(din[31:24]),
        .ena_array(ena_array[1]),
        .enb_array(enb_array[1]),
        .p_17_out(p_17_out),
        .srst(srst));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_mux" *) 
module fifo_Fpjh_data_2_blk_mem_gen_mux__parameterized0
   (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ,
    dout,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_1 ,
    clk,
    DOBDO,
    \dout[13] ,
    DOPBDOP,
    \dout[14] ,
    \dout[22] ,
    \dout[22]_0 ,
    \dout[23] ,
    \dout[23]_0 ,
    \dout[31] ,
    \dout[31]_0 );
  output \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;
  output [25:0]dout;
  input \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_1 ;
  input clk;
  input [7:0]DOBDO;
  input [7:0]\dout[13] ;
  input [0:0]DOPBDOP;
  input [0:0]\dout[14] ;
  input [7:0]\dout[22] ;
  input [7:0]\dout[22]_0 ;
  input [0:0]\dout[23] ;
  input [0:0]\dout[23]_0 ;
  input [7:0]\dout[31] ;
  input [7:0]\dout[31]_0 ;

  wire [7:0]DOBDO;
  wire [0:0]DOPBDOP;
  wire clk;
  wire [25:0]dout;
  wire [7:0]\dout[13] ;
  wire [0:0]\dout[14] ;
  wire [7:0]\dout[22] ;
  wire [7:0]\dout[22]_0 ;
  wire [0:0]\dout[23] ;
  wire [0:0]\dout[23]_0 ;
  wire [7:0]\dout[31] ;
  wire [7:0]\dout[31]_0 ;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_1 ;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[10]_INST_0 
       (.I0(DOBDO[4]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[13] [4]),
        .O(dout[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[11]_INST_0 
       (.I0(DOBDO[5]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[13] [5]),
        .O(dout[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[12]_INST_0 
       (.I0(DOBDO[6]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[13] [6]),
        .O(dout[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[13]_INST_0 
       (.I0(DOBDO[7]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[13] [7]),
        .O(dout[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[14]_INST_0 
       (.I0(DOPBDOP),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[14] ),
        .O(dout[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[15]_INST_0 
       (.I0(\dout[22] [0]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[22]_0 [0]),
        .O(dout[9]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[16]_INST_0 
       (.I0(\dout[22] [1]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[22]_0 [1]),
        .O(dout[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[17]_INST_0 
       (.I0(\dout[22] [2]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[22]_0 [2]),
        .O(dout[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[18]_INST_0 
       (.I0(\dout[22] [3]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[22]_0 [3]),
        .O(dout[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[19]_INST_0 
       (.I0(\dout[22] [4]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[22]_0 [4]),
        .O(dout[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[20]_INST_0 
       (.I0(\dout[22] [5]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[22]_0 [5]),
        .O(dout[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[21]_INST_0 
       (.I0(\dout[22] [6]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[22]_0 [6]),
        .O(dout[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[22]_INST_0 
       (.I0(\dout[22] [7]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[22]_0 [7]),
        .O(dout[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[23]_INST_0 
       (.I0(\dout[23] ),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[23]_0 ),
        .O(dout[17]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[24]_INST_0 
       (.I0(\dout[31] [0]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[31]_0 [0]),
        .O(dout[18]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[25]_INST_0 
       (.I0(\dout[31] [1]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[31]_0 [1]),
        .O(dout[19]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[26]_INST_0 
       (.I0(\dout[31] [2]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[31]_0 [2]),
        .O(dout[20]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[27]_INST_0 
       (.I0(\dout[31] [3]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[31]_0 [3]),
        .O(dout[21]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[28]_INST_0 
       (.I0(\dout[31] [4]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[31]_0 [4]),
        .O(dout[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[29]_INST_0 
       (.I0(\dout[31] [5]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[31]_0 [5]),
        .O(dout[23]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[30]_INST_0 
       (.I0(\dout[31] [6]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[31]_0 [6]),
        .O(dout[24]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[31]_INST_0 
       (.I0(\dout[31] [7]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[31]_0 [7]),
        .O(dout[25]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[6]_INST_0 
       (.I0(DOBDO[0]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[13] [0]),
        .O(dout[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[7]_INST_0 
       (.I0(DOBDO[1]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[13] [1]),
        .O(dout[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[8]_INST_0 
       (.I0(DOBDO[2]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[13] [2]),
        .O(dout[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \dout[9]_INST_0 
       (.I0(DOBDO[3]),
        .I1(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .I2(\dout[13] [3]),
        .O(dout[3]));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_1 ),
        .Q(\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_width
   (dout,
    clk,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_0 ,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_1 ,
    Q,
    din,
    p_17_out);
  output [1:0]dout;
  input clk;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_0 ;
  input srst;
  input [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_1 ;
  input [12:0]Q;
  input [1:0]din;
  input p_17_out;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_0 ;
  wire [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_1 ;
  wire [12:0]Q;
  wire clk;
  wire [1:0]din;
  wire [1:0]dout;
  wire p_17_out;
  wire srst;

  fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper \prim_noinit.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .dout(dout),
        .p_17_out(p_17_out),
        .srst(srst));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_width__parameterized0
   (dout,
    clk,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    Q,
    din,
    p_17_out);
  output [3:0]dout;
  input clk;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input srst;
  input [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input [12:0]Q;
  input [3:0]din;
  input p_17_out;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire [12:0]Q;
  wire clk;
  wire [3:0]din;
  wire [3:0]dout;
  wire p_17_out;
  wire srst;

  fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper__parameterized0 \prim_noinit.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .dout(dout),
        .p_17_out(p_17_out),
        .srst(srst));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_width__parameterized1
   (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    clk,
    ena_array,
    enb_array,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    Q,
    din,
    p_17_out);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input clk;
  input [0:0]ena_array;
  input [0:0]enb_array;
  input srst;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input [11:0]Q;
  input [8:0]din;
  input p_17_out;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire [11:0]Q;
  wire clk;
  wire [8:0]din;
  wire [0:0]ena_array;
  wire [0:0]enb_array;
  wire p_17_out;
  wire srst;

  fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper__parameterized1 \prim_noinit.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .ena_array(ena_array),
        .enb_array(enb_array),
        .p_17_out(p_17_out),
        .srst(srst));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_width__parameterized2
   (DOBDO,
    DOPBDOP,
    clk,
    ena_array,
    enb_array,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    Q,
    din,
    p_17_out);
  output [7:0]DOBDO;
  output [0:0]DOPBDOP;
  input clk;
  input [0:0]ena_array;
  input [0:0]enb_array;
  input srst;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input [11:0]Q;
  input [8:0]din;
  input p_17_out;

  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [7:0]DOBDO;
  wire [0:0]DOPBDOP;
  wire [11:0]Q;
  wire clk;
  wire [8:0]din;
  wire [0:0]ena_array;
  wire [0:0]enb_array;
  wire p_17_out;
  wire srst;

  fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper__parameterized2 \prim_noinit.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .DOBDO(DOBDO),
        .DOPBDOP(DOPBDOP),
        .Q(Q),
        .clk(clk),
        .din(din),
        .ena_array(ena_array),
        .enb_array(enb_array),
        .p_17_out(p_17_out),
        .srst(srst));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_width__parameterized3
   (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    clk,
    ena_array,
    enb_array,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    Q,
    din,
    p_17_out);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input clk;
  input [0:0]ena_array;
  input [0:0]enb_array;
  input srst;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input [11:0]Q;
  input [8:0]din;
  input p_17_out;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire [11:0]Q;
  wire clk;
  wire [8:0]din;
  wire [0:0]ena_array;
  wire [0:0]enb_array;
  wire p_17_out;
  wire srst;

  fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper__parameterized3 \prim_noinit.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .ena_array(ena_array),
        .enb_array(enb_array),
        .p_17_out(p_17_out),
        .srst(srst));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_width__parameterized4
   (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    clk,
    ena_array,
    enb_array,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    Q,
    din,
    p_17_out);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input clk;
  input [0:0]ena_array;
  input [0:0]enb_array;
  input srst;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input [11:0]Q;
  input [8:0]din;
  input p_17_out;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire [11:0]Q;
  wire clk;
  wire [8:0]din;
  wire [0:0]ena_array;
  wire [0:0]enb_array;
  wire p_17_out;
  wire srst;

  fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper__parameterized4 \prim_noinit.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .ena_array(ena_array),
        .enb_array(enb_array),
        .p_17_out(p_17_out),
        .srst(srst));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_width__parameterized5
   (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    clk,
    ena_array,
    enb_array,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    Q,
    din,
    p_17_out);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input clk;
  input [0:0]ena_array;
  input [0:0]enb_array;
  input srst;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input [11:0]Q;
  input [7:0]din;
  input p_17_out;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]Q;
  wire clk;
  wire [7:0]din;
  wire [0:0]ena_array;
  wire [0:0]enb_array;
  wire p_17_out;
  wire srst;

  fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper__parameterized5 \prim_noinit.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .ena_array(ena_array),
        .enb_array(enb_array),
        .p_17_out(p_17_out),
        .srst(srst));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_width__parameterized6
   (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    clk,
    ena_array,
    enb_array,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    Q,
    din,
    p_17_out);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input clk;
  input [0:0]ena_array;
  input [0:0]enb_array;
  input srst;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input [11:0]Q;
  input [7:0]din;
  input p_17_out;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]Q;
  wire clk;
  wire [7:0]din;
  wire [0:0]ena_array;
  wire [0:0]enb_array;
  wire p_17_out;
  wire srst;

  fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper__parameterized6 \prim_noinit.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .ena_array(ena_array),
        .enb_array(enb_array),
        .p_17_out(p_17_out),
        .srst(srst));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper
   (dout,
    clk,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_1 ,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_2 ,
    Q,
    din,
    p_17_out);
  output [1:0]dout;
  input clk;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_0 ;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_1 ;
  input srst;
  input [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_2 ;
  input [12:0]Q;
  input [1:0]din;
  input p_17_out;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_1 ;
  wire [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_2 ;
  wire [12:0]Q;
  wire clk;
  wire [1:0]din;
  wire [1:0]dout;
  wire p_17_out;
  wire srst;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED ;
  wire [15:2]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_2 ,1'b0}),
        .ADDRBWRADDR({Q,1'b0}),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED [15:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:2],dout}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED [1:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_0 ),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_1 ),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(srst),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({p_17_out,p_17_out}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper__parameterized0
   (dout,
    clk,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ,
    Q,
    din,
    p_17_out);
  output [3:0]dout;
  input clk;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input srst;
  input [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ;
  input [12:0]Q;
  input [3:0]din;
  input p_17_out;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ;
  wire [12:0]Q;
  wire clk;
  wire [3:0]din;
  wire [3:0]dout;
  wire p_17_out;
  wire srst;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:4]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(4),
    .READ_WIDTH_B(4),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(4),
    .WRITE_WIDTH_B(4)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,Q,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:4],dout}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(srst),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({p_17_out,p_17_out,p_17_out,p_17_out}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper__parameterized1
   (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    clk,
    ena_array,
    enb_array,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ,
    Q,
    din,
    p_17_out);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input clk;
  input [0:0]ena_array;
  input [0:0]enb_array;
  input srst;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ;
  input [11:0]Q;
  input [8:0]din;
  input p_17_out;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ;
  wire [11:0]Q;
  wire clk;
  wire [8:0]din;
  wire [0:0]ena_array;
  wire [0:0]enb_array;
  wire p_17_out;
  wire srst;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,Q,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,din[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 }),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 }),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(enb_array),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(srst),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({p_17_out,p_17_out,p_17_out,p_17_out}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper__parameterized2
   (DOBDO,
    DOPBDOP,
    clk,
    ena_array,
    enb_array,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    Q,
    din,
    p_17_out);
  output [7:0]DOBDO;
  output [0:0]DOPBDOP;
  input clk;
  input [0:0]ena_array;
  input [0:0]enb_array;
  input srst;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input [11:0]Q;
  input [8:0]din;
  input p_17_out;

  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [7:0]DOBDO;
  wire [0:0]DOPBDOP;
  wire [11:0]Q;
  wire clk;
  wire [8:0]din;
  wire [0:0]ena_array;
  wire [0:0]enb_array;
  wire p_17_out;
  wire srst;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,Q,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,din[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:8],DOBDO}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:1],DOPBDOP}),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(enb_array),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(srst),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({p_17_out,p_17_out,p_17_out,p_17_out}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper__parameterized3
   (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    clk,
    ena_array,
    enb_array,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ,
    Q,
    din,
    p_17_out);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input clk;
  input [0:0]ena_array;
  input [0:0]enb_array;
  input srst;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ;
  input [11:0]Q;
  input [8:0]din;
  input p_17_out;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ;
  wire [11:0]Q;
  wire clk;
  wire [8:0]din;
  wire [0:0]ena_array;
  wire [0:0]enb_array;
  wire p_17_out;
  wire srst;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,Q,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,din[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 }),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 }),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(enb_array),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(srst),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({p_17_out,p_17_out,p_17_out,p_17_out}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper__parameterized4
   (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    clk,
    ena_array,
    enb_array,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ,
    Q,
    din,
    p_17_out);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input clk;
  input [0:0]ena_array;
  input [0:0]enb_array;
  input srst;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ;
  input [11:0]Q;
  input [8:0]din;
  input p_17_out;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ;
  wire [11:0]Q;
  wire clk;
  wire [8:0]din;
  wire [0:0]ena_array;
  wire [0:0]enb_array;
  wire p_17_out;
  wire srst;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_2 ,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,Q,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,din[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 }),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 }),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(enb_array),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(srst),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({p_17_out,p_17_out,p_17_out,p_17_out}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper__parameterized5
   (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    clk,
    ena_array,
    enb_array,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    Q,
    din,
    p_17_out);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input clk;
  input [0:0]ena_array;
  input [0:0]enb_array;
  input srst;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input [11:0]Q;
  input [7:0]din;
  input p_17_out;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_75 ;
  wire [11:0]Q;
  wire clk;
  wire [7:0]din;
  wire [0:0]ena_array;
  wire [0:0]enb_array;
  wire p_17_out;
  wire srst;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,Q,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 }),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_75 }),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(enb_array),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(srst),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({p_17_out,p_17_out,p_17_out,p_17_out}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_Fpjh_data_2_blk_mem_gen_prim_wrapper__parameterized6
   (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    clk,
    ena_array,
    enb_array,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    Q,
    din,
    p_17_out);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input clk;
  input [0:0]ena_array;
  input [0:0]enb_array;
  input srst;
  input [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input [11:0]Q;
  input [7:0]din;
  input p_17_out;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_75 ;
  wire [11:0]Q;
  wire clk;
  wire [7:0]din;
  wire [0:0]ena_array;
  wire [0:0]enb_array;
  wire p_17_out;
  wire srst;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,Q,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 }),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_n_75 }),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(enb_array),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(srst),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({p_17_out,p_17_out,p_17_out,p_17_out}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module fifo_Fpjh_data_2_blk_mem_gen_top
   (dout,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ,
    clk,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    Q,
    din,
    p_17_out,
    ena_array,
    enb_array,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 );
  output [31:0]dout;
  output \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  input clk;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input srst;
  input [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input [12:0]Q;
  input [31:0]din;
  input p_17_out;
  input [1:0]ena_array;
  input [1:0]enb_array;
  input \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire [12:0]Q;
  wire clk;
  wire [31:0]din;
  wire [31:0]dout;
  wire [1:0]ena_array;
  wire [1:0]enb_array;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;
  wire p_17_out;
  wire srst;

  fifo_Fpjh_data_2_blk_mem_gen_generic_cstr \valid.cstr 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .dout(dout),
        .ena_array(ena_array),
        .enb_array(enb_array),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .p_17_out(p_17_out),
        .srst(srst));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_3" *) 
module fifo_Fpjh_data_2_blk_mem_gen_v8_4_3
   (dout,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ,
    clk,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    Q,
    din,
    p_17_out,
    ena_array,
    enb_array,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 );
  output [31:0]dout;
  output \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  input clk;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input srst;
  input [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input [12:0]Q;
  input [31:0]din;
  input p_17_out;
  input [1:0]ena_array;
  input [1:0]enb_array;
  input \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire [12:0]Q;
  wire clk;
  wire [31:0]din;
  wire [31:0]dout;
  wire [1:0]ena_array;
  wire [1:0]enb_array;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;
  wire p_17_out;
  wire srst;

  fifo_Fpjh_data_2_blk_mem_gen_v8_4_3_synth inst_blk_mem_gen
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .dout(dout),
        .ena_array(ena_array),
        .enb_array(enb_array),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .p_17_out(p_17_out),
        .srst(srst));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_3_synth" *) 
module fifo_Fpjh_data_2_blk_mem_gen_v8_4_3_synth
   (dout,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ,
    clk,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    Q,
    din,
    p_17_out,
    ena_array,
    enb_array,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 );
  output [31:0]dout;
  output \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  input clk;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input srst;
  input [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input [12:0]Q;
  input [31:0]din;
  input p_17_out;
  input [1:0]ena_array;
  input [1:0]enb_array;
  input \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire [12:0]Q;
  wire clk;
  wire [31:0]din;
  wire [31:0]dout;
  wire [1:0]ena_array;
  wire [1:0]enb_array;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ;
  wire p_17_out;
  wire srst;

  fifo_Fpjh_data_2_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .dout(dout),
        .ena_array(ena_array),
        .enb_array(enb_array),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 ),
        .p_17_out(p_17_out),
        .srst(srst));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_Fpjh_data_2_compare
   (comp0,
    \gmux.gm[6].gms.ms_0 ,
    v1_reg);
  output comp0;
  input [5:0]\gmux.gm[6].gms.ms_0 ;
  input [0:0]v1_reg;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire carrynet_4;
  wire carrynet_5;
  wire comp0;
  wire [5:0]\gmux.gm[6].gms.ms_0 ;
  wire [0:0]v1_reg;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(\gmux.gm[6].gms.ms_0 [3:0]));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3],comp0,carrynet_5,carrynet_4}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3],1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3],v1_reg,\gmux.gm[6].gms.ms_0 [5:4]}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_Fpjh_data_2_compare_0
   (comp1,
    ram_full_comb,
    \gmux.gm[6].gms.ms_0 ,
    v1_reg_0,
    wr_en,
    comp0,
    ram_full_i_reg,
    rd_en,
    out);
  output comp1;
  output ram_full_comb;
  input [5:0]\gmux.gm[6].gms.ms_0 ;
  input [0:0]v1_reg_0;
  input wr_en;
  input comp0;
  input ram_full_i_reg;
  input rd_en;
  input out;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire carrynet_4;
  wire carrynet_5;
  wire comp0;
  wire comp1;
  wire [5:0]\gmux.gm[6].gms.ms_0 ;
  wire out;
  wire ram_full_comb;
  wire ram_full_i_reg;
  wire rd_en;
  wire [0:0]v1_reg_0;
  wire wr_en;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(\gmux.gm[6].gms.ms_0 [3:0]));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3],comp1,carrynet_5,carrynet_4}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3],1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3],v1_reg_0,\gmux.gm[6].gms.ms_0 [5:4]}));
  LUT6 #(
    .INIT(64'hFF0FFFFF88008888)) 
    ram_full_fb_i_i_1
       (.I0(comp1),
        .I1(wr_en),
        .I2(comp0),
        .I3(ram_full_i_reg),
        .I4(rd_en),
        .I5(out),
        .O(ram_full_comb));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_Fpjh_data_2_compare_1
   (p_2_out,
    \gmux.gm[6].gms.ms_0 ,
    v1_reg_1,
    \gaf.gaf0.ram_afull_i_reg ,
    rd_en,
    E,
    comp1,
    almost_full);
  output p_2_out;
  input [5:0]\gmux.gm[6].gms.ms_0 ;
  input [0:0]v1_reg_1;
  input \gaf.gaf0.ram_afull_i_reg ;
  input rd_en;
  input [0:0]E;
  input comp1;
  input almost_full;

  wire [0:0]E;
  wire almost_full;
  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire carrynet_4;
  wire carrynet_5;
  wire comp1;
  wire \gaf.gaf0.ram_afull_i_reg ;
  wire [5:0]\gmux.gm[6].gms.ms_0 ;
  wire p_0_in;
  wire p_2_out;
  wire rd_en;
  wire [0:0]v1_reg_1;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFCFFFFF8A008A00)) 
    \gaf.gaf0.ram_afull_i_i_1 
       (.I0(p_0_in),
        .I1(\gaf.gaf0.ram_afull_i_reg ),
        .I2(rd_en),
        .I3(E),
        .I4(comp1),
        .I5(almost_full),
        .O(p_2_out));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(\gmux.gm[6].gms.ms_0 [3:0]));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3],p_0_in,carrynet_5,carrynet_4}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3],1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3],v1_reg_1,\gmux.gm[6].gms.ms_0 [5:4]}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_Fpjh_data_2_compare_2
   (comp0,
    \gmux.gm[1].gms.ms_0 ,
    \gmux.gm[2].gms.ms_0 ,
    \gmux.gm[3].gms.ms_0 ,
    \gmux.gm[4].gms.ms_0 ,
    \gmux.gm[5].gms.ms_0 ,
    \gmux.gm[6].gms.ms_0 ,
    ram_empty_i_reg);
  output comp0;
  input \gmux.gm[1].gms.ms_0 ;
  input \gmux.gm[2].gms.ms_0 ;
  input \gmux.gm[3].gms.ms_0 ;
  input \gmux.gm[4].gms.ms_0 ;
  input \gmux.gm[5].gms.ms_0 ;
  input \gmux.gm[6].gms.ms_0 ;
  input ram_empty_i_reg;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire carrynet_4;
  wire carrynet_5;
  wire comp0;
  wire \gmux.gm[1].gms.ms_0 ;
  wire \gmux.gm[2].gms.ms_0 ;
  wire \gmux.gm[3].gms.ms_0 ;
  wire \gmux.gm[4].gms.ms_0 ;
  wire \gmux.gm[5].gms.ms_0 ;
  wire \gmux.gm[6].gms.ms_0 ;
  wire ram_empty_i_reg;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S({\gmux.gm[4].gms.ms_0 ,\gmux.gm[3].gms.ms_0 ,\gmux.gm[2].gms.ms_0 ,\gmux.gm[1].gms.ms_0 }));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3],comp0,carrynet_5,carrynet_4}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3],1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3],ram_empty_i_reg,\gmux.gm[6].gms.ms_0 ,\gmux.gm[5].gms.ms_0 }));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_Fpjh_data_2_compare_3
   (comp1,
    ram_empty_i0__3,
    v1_reg,
    ram_empty_i_reg,
    rd_en,
    comp0,
    ram_empty_i_reg_0,
    wr_en,
    out);
  output comp1;
  output ram_empty_i0__3;
  input [5:0]v1_reg;
  input [0:0]ram_empty_i_reg;
  input rd_en;
  input comp0;
  input ram_empty_i_reg_0;
  input wr_en;
  input out;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire carrynet_4;
  wire carrynet_5;
  wire comp0;
  wire comp1;
  wire out;
  wire ram_empty_i0__3;
  wire [0:0]ram_empty_i_reg;
  wire ram_empty_i_reg_0;
  wire rd_en;
  wire [5:0]v1_reg;
  wire wr_en;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg[3:0]));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3],comp1,carrynet_5,carrynet_4}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3],1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3],ram_empty_i_reg,v1_reg[5:4]}));
  LUT6 #(
    .INIT(64'hFF0FFFFF88008888)) 
    ram_empty_fb_i_i_1
       (.I0(comp1),
        .I1(rd_en),
        .I2(comp0),
        .I3(ram_empty_i_reg_0),
        .I4(wr_en),
        .I5(out),
        .O(ram_empty_i0__3));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_Fpjh_data_2_compare_4
   (p_1_out,
    v1_reg_0,
    \gae.ram_aempty_i_reg ,
    p_17_out,
    comp1,
    out,
    rd_en,
    almost_empty);
  output p_1_out;
  input [5:0]v1_reg_0;
  input [0:0]\gae.ram_aempty_i_reg ;
  input p_17_out;
  input comp1;
  input out;
  input rd_en;
  input almost_empty;

  wire almost_empty;
  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire carrynet_4;
  wire carrynet_5;
  wire comp1;
  wire comp2;
  wire [0:0]\gae.ram_aempty_i_reg ;
  wire out;
  wire p_17_out;
  wire p_1_out;
  wire rd_en;
  wire [5:0]v1_reg_0;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:3]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h3FFF3F3F00220000)) 
    \gae.ram_aempty_i_i_1 
       (.I0(comp2),
        .I1(p_17_out),
        .I2(comp1),
        .I3(out),
        .I4(rd_en),
        .I5(almost_empty),
        .O(p_1_out));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg_0[3:0]));
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3],comp2,carrynet_5,carrynet_4}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3],1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3],\gae.ram_aempty_i_reg ,v1_reg_0[5:4]}));
endmodule

(* ORIG_REF_NAME = "dc_ss" *) 
module fifo_Fpjh_data_2_dc_ss
   (data_count,
    srst,
    cntr_en,
    O,
    clk,
    \count_reg[7] ,
    \count_reg[11] ,
    \count_reg[12] );
  output [12:0]data_count;
  input srst;
  input cntr_en;
  input [3:0]O;
  input clk;
  input [3:0]\count_reg[7] ;
  input [3:0]\count_reg[11] ;
  input [0:0]\count_reg[12] ;

  wire [3:0]O;
  wire clk;
  wire cntr_en;
  wire [3:0]\count_reg[11] ;
  wire [0:0]\count_reg[12] ;
  wire [3:0]\count_reg[7] ;
  wire [12:0]data_count;
  wire srst;

  fifo_Fpjh_data_2_updn_cntr \gsym_dc.dc 
       (.O(O),
        .clk(clk),
        .cntr_en(cntr_en),
        .\count_reg[11]_0 (\count_reg[11] ),
        .\count_reg[12]_0 (\count_reg[12] ),
        .\count_reg[7]_0 (\count_reg[7] ),
        .data_count(data_count),
        .srst(srst));
endmodule

(* ORIG_REF_NAME = "fifo_generator_ramfifo" *) 
module fifo_Fpjh_data_2_fifo_generator_ramfifo
   (dout,
    empty,
    full,
    almost_full,
    almost_empty,
    valid,
    data_count,
    prog_empty,
    prog_full,
    clk,
    srst,
    din,
    wr_en,
    rd_en);
  output [31:0]dout;
  output empty;
  output full;
  output almost_full;
  output almost_empty;
  output valid;
  output [12:0]data_count;
  output prog_empty;
  output prog_full;
  input clk;
  input srst;
  input [31:0]din;
  input wr_en;
  input rd_en;

  wire almost_empty;
  wire almost_full;
  wire clk;
  wire [12:0]data_count;
  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire [1:0]\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ena_array ;
  wire [1:0]\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/enb_array ;
  wire \gntv_or_sync_fifo.gl0.rd_n_33 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_55 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_56 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_57 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_58 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_59 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_60 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_61 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_62 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_63 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_64 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_65 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_66 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_67 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_68 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_0 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_30 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_31 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_45 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_46 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_47 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_48 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_49 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_50 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_51 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_52 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_53 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_60 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_61 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_62 ;
  wire \grss.gdc.dc/cntr_en ;
  wire [6:6]\grss.rsts/c2/v1_reg ;
  wire [6:6]\grss.rsts/gae.c3/v1_reg ;
  wire \gwss.gpf.wrpf/eqOp__11 ;
  wire [5:0]\gwss.wsts/c0/v1_reg ;
  wire [5:0]\gwss.wsts/c1/v1_reg ;
  wire [5:0]\gwss.wsts/gaf.c2/v1_reg ;
  wire [12:0]p_0_out;
  wire [12:0]p_11_out;
  wire [12:0]p_12_out;
  wire p_17_out;
  wire p_2_out;
  wire p_7_out;
  wire prog_empty;
  wire prog_full;
  wire rd_en;
  wire [12:12]rd_pntr_plus1;
  wire [12:12]rd_pntr_plus2;
  wire sel_pipe;
  wire srst;
  wire valid;
  wire wr_en;
  wire [11:0]wr_pntr_plus2;

  fifo_Fpjh_data_2_rd_logic \gntv_or_sync_fifo.gl0.rd 
       (.D(rd_pntr_plus2),
        .DI({\gntv_or_sync_fifo.gl0.wr_n_30 ,\gntv_or_sync_fifo.gl0.wr_n_31 }),
        .Q(p_0_out),
        .S({\gntv_or_sync_fifo.gl0.wr_n_61 ,\gntv_or_sync_fifo.gl0.wr_n_62 }),
        .almost_empty(almost_empty),
        .clk(clk),
        .cntr_en(\grss.gdc.dc/cntr_en ),
        .data_count(data_count),
        .empty(empty),
        .enb_array(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/enb_array ),
        .eqOp__11(\gwss.gpf.wrpf/eqOp__11 ),
        .\gae.ram_aempty_i_reg (\grss.rsts/gae.c3/v1_reg ),
        .\gc1.count_d1_reg[12] (rd_pntr_plus1),
        .\gc1.count_d2_reg[0] (\gntv_or_sync_fifo.gl0.rd_n_33 ),
        .\gc1.count_d2_reg[10] ({\gntv_or_sync_fifo.gl0.rd_n_63 ,\gntv_or_sync_fifo.gl0.rd_n_64 ,\gntv_or_sync_fifo.gl0.rd_n_65 ,\gntv_or_sync_fifo.gl0.rd_n_66 }),
        .\gc1.count_d2_reg[11] (\gntv_or_sync_fifo.gl0.rd_n_56 ),
        .\gc1.count_d2_reg[12] (\gntv_or_sync_fifo.gl0.rd_n_68 ),
        .\gc1.count_d2_reg[2] ({\gntv_or_sync_fifo.gl0.rd_n_57 ,\gntv_or_sync_fifo.gl0.rd_n_58 }),
        .\gc1.count_d2_reg[6] ({\gntv_or_sync_fifo.gl0.rd_n_59 ,\gntv_or_sync_fifo.gl0.rd_n_60 ,\gntv_or_sync_fifo.gl0.rd_n_61 ,\gntv_or_sync_fifo.gl0.rd_n_62 }),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] (p_12_out),
        .\gmux.gm[5].gms.ms (wr_pntr_plus2),
        .\greg.gpcry_sym.diff_pntr_pad_reg[12] ({\gntv_or_sync_fifo.gl0.wr_n_49 ,\gntv_or_sync_fifo.gl0.wr_n_50 ,\gntv_or_sync_fifo.gl0.wr_n_51 ,\gntv_or_sync_fifo.gl0.wr_n_52 }),
        .\greg.gpcry_sym.diff_pntr_pad_reg[13] (p_11_out),
        .\greg.gpcry_sym.diff_pntr_pad_reg[8] ({\gntv_or_sync_fifo.gl0.wr_n_45 ,\gntv_or_sync_fifo.gl0.wr_n_46 ,\gntv_or_sync_fifo.gl0.wr_n_47 ,\gntv_or_sync_fifo.gl0.wr_n_48 }),
        .\greg.ram_rd_en_i_reg (\gntv_or_sync_fifo.gl0.rd_n_67 ),
        .out(p_2_out),
        .p_17_out(p_17_out),
        .p_7_out(p_7_out),
        .prog_empty(prog_empty),
        .prog_full(prog_full),
        .ram_empty_fb_i_reg(\gntv_or_sync_fifo.gl0.rd_n_55 ),
        .ram_empty_i_reg(\gntv_or_sync_fifo.gl0.wr_n_53 ),
        .ram_empty_i_reg_0(\grss.rsts/c2/v1_reg ),
        .ram_empty_i_reg_1(\gntv_or_sync_fifo.gl0.wr_n_0 ),
        .rd_en(rd_en),
        .sel_pipe(sel_pipe),
        .srst(srst),
        .v1_reg(\gwss.wsts/c0/v1_reg ),
        .v1_reg_0(\gwss.wsts/c1/v1_reg ),
        .v1_reg_1(\gwss.wsts/gaf.c2/v1_reg ),
        .valid(valid),
        .wr_en(wr_en));
  fifo_Fpjh_data_2_wr_logic \gntv_or_sync_fifo.gl0.wr 
       (.D(wr_pntr_plus2),
        .DI({\gntv_or_sync_fifo.gl0.wr_n_30 ,\gntv_or_sync_fifo.gl0.wr_n_31 }),
        .Q(p_12_out),
        .S({\gntv_or_sync_fifo.gl0.wr_n_61 ,\gntv_or_sync_fifo.gl0.wr_n_62 }),
        .almost_full(almost_full),
        .clk(clk),
        .cntr_en(\grss.gdc.dc/cntr_en ),
        .ena_array(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ena_array ),
        .eqOp__11(\gwss.gpf.wrpf/eqOp__11 ),
        .full(full),
        .\gaf.gaf0.ram_afull_i_reg (p_2_out),
        .\gcc0.gc1.gsym.count_d2_reg[10] ({\gntv_or_sync_fifo.gl0.wr_n_49 ,\gntv_or_sync_fifo.gl0.wr_n_50 ,\gntv_or_sync_fifo.gl0.wr_n_51 ,\gntv_or_sync_fifo.gl0.wr_n_52 }),
        .\gcc0.gc1.gsym.count_d2_reg[12] (p_11_out),
        .\gcc0.gc1.gsym.count_d2_reg[12]_0 (\gntv_or_sync_fifo.gl0.wr_n_53 ),
        .\gcc0.gc1.gsym.count_d2_reg[12]_1 (\grss.rsts/c2/v1_reg ),
        .\gcc0.gc1.gsym.count_d2_reg[12]_2 (\grss.rsts/gae.c3/v1_reg ),
        .\gcc0.gc1.gsym.count_d2_reg[6] ({\gntv_or_sync_fifo.gl0.wr_n_45 ,\gntv_or_sync_fifo.gl0.wr_n_46 ,\gntv_or_sync_fifo.gl0.wr_n_47 ,\gntv_or_sync_fifo.gl0.wr_n_48 }),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[12] ({\gntv_or_sync_fifo.gl0.rd_n_63 ,\gntv_or_sync_fifo.gl0.rd_n_64 ,\gntv_or_sync_fifo.gl0.rd_n_65 ,\gntv_or_sync_fifo.gl0.rd_n_66 }),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] (\gntv_or_sync_fifo.gl0.rd_n_56 ),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[4] (\gntv_or_sync_fifo.gl0.rd_n_33 ),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[4]_0 ({\gntv_or_sync_fifo.gl0.rd_n_57 ,\gntv_or_sync_fifo.gl0.rd_n_58 }),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ({\gntv_or_sync_fifo.gl0.rd_n_59 ,\gntv_or_sync_fifo.gl0.rd_n_60 ,\gntv_or_sync_fifo.gl0.rd_n_61 ,\gntv_or_sync_fifo.gl0.rd_n_62 }),
        .\gmux.gm[6].gms.ms (\gwss.wsts/c0/v1_reg ),
        .\gmux.gm[6].gms.ms_0 (\gwss.wsts/c1/v1_reg ),
        .\gmux.gm[6].gms.ms_1 (\gwss.wsts/gaf.c2/v1_reg ),
        .\gmux.gm[6].gms.ms_2 ({p_0_out[12],p_0_out[10:0]}),
        .\gmux.gm[6].gms.ms_3 (rd_pntr_plus1),
        .\gmux.gm[6].gms.ms_4 (rd_pntr_plus2),
        .\gpfs.prog_full_i_reg (\gntv_or_sync_fifo.gl0.rd_n_67 ),
        .out(\gntv_or_sync_fifo.gl0.wr_n_0 ),
        .p_17_out(p_17_out),
        .p_7_out(p_7_out),
        .prog_full(prog_full),
        .rd_en(rd_en),
        .srst(srst),
        .wr_en(wr_en),
        .wr_en_0(\gntv_or_sync_fifo.gl0.wr_n_60 ));
  fifo_Fpjh_data_2_memory \gntv_or_sync_fifo.mem 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\gntv_or_sync_fifo.gl0.wr_n_60 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\gntv_or_sync_fifo.gl0.rd_n_55 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (p_11_out),
        .Q(p_0_out),
        .clk(clk),
        .din(din),
        .dout(dout),
        .ena_array(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ena_array ),
        .enb_array(\gbm.gbmg.gbmga.ngecc.bmg/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/enb_array ),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] (\gntv_or_sync_fifo.gl0.rd_n_68 ),
        .p_17_out(p_17_out),
        .sel_pipe(sel_pipe),
        .srst(srst));
endmodule

(* ORIG_REF_NAME = "fifo_generator_top" *) 
module fifo_Fpjh_data_2_fifo_generator_top
   (dout,
    empty,
    full,
    almost_full,
    almost_empty,
    valid,
    data_count,
    prog_empty,
    prog_full,
    clk,
    srst,
    din,
    wr_en,
    rd_en);
  output [31:0]dout;
  output empty;
  output full;
  output almost_full;
  output almost_empty;
  output valid;
  output [12:0]data_count;
  output prog_empty;
  output prog_full;
  input clk;
  input srst;
  input [31:0]din;
  input wr_en;
  input rd_en;

  wire almost_empty;
  wire almost_full;
  wire clk;
  wire [12:0]data_count;
  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire prog_empty;
  wire prog_full;
  wire rd_en;
  wire srst;
  wire valid;
  wire wr_en;

  fifo_Fpjh_data_2_fifo_generator_ramfifo \grf.rf 
       (.almost_empty(almost_empty),
        .almost_full(almost_full),
        .clk(clk),
        .data_count(data_count),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .prog_empty(prog_empty),
        .prog_full(prog_full),
        .rd_en(rd_en),
        .srst(srst),
        .valid(valid),
        .wr_en(wr_en));
endmodule

(* C_ADD_NGC_CONSTRAINT = "0" *) (* C_APPLICATION_TYPE_AXIS = "0" *) (* C_APPLICATION_TYPE_RACH = "0" *) 
(* C_APPLICATION_TYPE_RDCH = "0" *) (* C_APPLICATION_TYPE_WACH = "0" *) (* C_APPLICATION_TYPE_WDCH = "0" *) 
(* C_APPLICATION_TYPE_WRCH = "0" *) (* C_AXIS_TDATA_WIDTH = "8" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TKEEP_WIDTH = "1" *) (* C_AXIS_TSTRB_WIDTH = "1" *) 
(* C_AXIS_TUSER_WIDTH = "4" *) (* C_AXIS_TYPE = "0" *) (* C_AXI_ADDR_WIDTH = "32" *) 
(* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) 
(* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "1" *) (* C_AXI_LEN_WIDTH = "8" *) 
(* C_AXI_LOCK_WIDTH = "1" *) (* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_TYPE = "1" *) 
(* C_AXI_WUSER_WIDTH = "1" *) (* C_COMMON_CLOCK = "1" *) (* C_COUNT_TYPE = "0" *) 
(* C_DATA_COUNT_WIDTH = "13" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "32" *) 
(* C_DIN_WIDTH_AXIS = "1" *) (* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) 
(* C_DIN_WIDTH_WACH = "1" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "32" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "0" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_ERROR_INJECTION_TYPE_AXIS = "0" *) (* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_FAMILY = "virtex7" *) (* C_FULL_FLAGS_RST_VAL = "0" *) (* C_HAS_ALMOST_EMPTY = "1" *) 
(* C_HAS_ALMOST_FULL = "1" *) (* C_HAS_AXIS_TDATA = "1" *) (* C_HAS_AXIS_TDEST = "0" *) 
(* C_HAS_AXIS_TID = "0" *) (* C_HAS_AXIS_TKEEP = "0" *) (* C_HAS_AXIS_TLAST = "0" *) 
(* C_HAS_AXIS_TREADY = "1" *) (* C_HAS_AXIS_TSTRB = "0" *) (* C_HAS_AXIS_TUSER = "1" *) 
(* C_HAS_AXI_ARUSER = "0" *) (* C_HAS_AXI_AWUSER = "0" *) (* C_HAS_AXI_BUSER = "0" *) 
(* C_HAS_AXI_ID = "0" *) (* C_HAS_AXI_RD_CHANNEL = "1" *) (* C_HAS_AXI_RUSER = "0" *) 
(* C_HAS_AXI_WR_CHANNEL = "1" *) (* C_HAS_AXI_WUSER = "0" *) (* C_HAS_BACKUP = "0" *) 
(* C_HAS_DATA_COUNT = "1" *) (* C_HAS_DATA_COUNTS_AXIS = "0" *) (* C_HAS_DATA_COUNTS_RACH = "0" *) 
(* C_HAS_DATA_COUNTS_RDCH = "0" *) (* C_HAS_DATA_COUNTS_WACH = "0" *) (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
(* C_HAS_DATA_COUNTS_WRCH = "0" *) (* C_HAS_INT_CLK = "0" *) (* C_HAS_MASTER_CE = "0" *) 
(* C_HAS_MEMINIT_FILE = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
(* C_HAS_PROG_FLAGS_RACH = "0" *) (* C_HAS_PROG_FLAGS_RDCH = "0" *) (* C_HAS_PROG_FLAGS_WACH = "0" *) 
(* C_HAS_PROG_FLAGS_WDCH = "0" *) (* C_HAS_PROG_FLAGS_WRCH = "0" *) (* C_HAS_RD_DATA_COUNT = "0" *) 
(* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "0" *) (* C_HAS_SLAVE_CE = "0" *) 
(* C_HAS_SRST = "1" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "1" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "0" *) (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
(* C_IMPLEMENTATION_TYPE_RDCH = "1" *) (* C_IMPLEMENTATION_TYPE_WACH = "1" *) (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
(* C_IMPLEMENTATION_TYPE_WRCH = "1" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "0" *) 
(* C_MEMORY_TYPE = "1" *) (* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "1" *) 
(* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) 
(* C_PRELOAD_LATENCY = "1" *) (* C_PRELOAD_REGS = "0" *) (* C_PRIM_FIFO_TYPE = "8kx4" *) 
(* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
(* C_PRIM_FIFO_TYPE_WACH = "512x36" *) (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "848" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "849" *) (* C_PROG_EMPTY_TYPE = "1" *) 
(* C_PROG_EMPTY_TYPE_AXIS = "0" *) (* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "3" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "2" *) (* C_PROG_FULL_TYPE = "1" *) 
(* C_PROG_FULL_TYPE_AXIS = "0" *) (* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "13" *) 
(* C_RD_DEPTH = "8192" *) (* C_RD_FREQ = "1" *) (* C_RD_PNTR_WIDTH = "13" *) 
(* C_REG_SLICE_MODE_AXIS = "0" *) (* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_SELECT_XPM = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) 
(* C_USE_COMMON_OVERFLOW = "0" *) (* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) 
(* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) (* C_USE_ECC_AXIS = "0" *) 
(* C_USE_ECC_RACH = "0" *) (* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_WACH = "0" *) 
(* C_USE_ECC_WDCH = "0" *) (* C_USE_ECC_WRCH = "0" *) (* C_USE_EMBEDDED_REG = "0" *) 
(* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "0" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) 
(* C_WRCH_TYPE = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "13" *) 
(* C_WR_DEPTH = "8192" *) (* C_WR_DEPTH_AXIS = "1024" *) (* C_WR_DEPTH_RACH = "16" *) 
(* C_WR_DEPTH_RDCH = "1024" *) (* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) 
(* C_WR_DEPTH_WRCH = "16" *) (* C_WR_FREQ = "1" *) (* C_WR_PNTR_WIDTH = "13" *) 
(* C_WR_PNTR_WIDTH_AXIS = "10" *) (* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
(* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) (* ORIG_REF_NAME = "fifo_generator_v13_2_4" *) 
module fifo_Fpjh_data_2_fifo_generator_v13_2_4
   (backup,
    backup_marker,
    clk,
    rst,
    srst,
    wr_clk,
    wr_rst,
    rd_clk,
    rd_rst,
    din,
    wr_en,
    rd_en,
    prog_empty_thresh,
    prog_empty_thresh_assert,
    prog_empty_thresh_negate,
    prog_full_thresh,
    prog_full_thresh_assert,
    prog_full_thresh_negate,
    int_clk,
    injectdbiterr,
    injectsbiterr,
    sleep,
    dout,
    full,
    almost_full,
    wr_ack,
    overflow,
    empty,
    almost_empty,
    valid,
    underflow,
    data_count,
    rd_data_count,
    wr_data_count,
    prog_full,
    prog_empty,
    sbiterr,
    dbiterr,
    wr_rst_busy,
    rd_rst_busy,
    m_aclk,
    s_aclk,
    s_aresetn,
    m_aclk_en,
    s_aclk_en,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awregion,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arregion,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    axi_aw_injectsbiterr,
    axi_aw_injectdbiterr,
    axi_aw_prog_full_thresh,
    axi_aw_prog_empty_thresh,
    axi_aw_data_count,
    axi_aw_wr_data_count,
    axi_aw_rd_data_count,
    axi_aw_sbiterr,
    axi_aw_dbiterr,
    axi_aw_overflow,
    axi_aw_underflow,
    axi_aw_prog_full,
    axi_aw_prog_empty,
    axi_w_injectsbiterr,
    axi_w_injectdbiterr,
    axi_w_prog_full_thresh,
    axi_w_prog_empty_thresh,
    axi_w_data_count,
    axi_w_wr_data_count,
    axi_w_rd_data_count,
    axi_w_sbiterr,
    axi_w_dbiterr,
    axi_w_overflow,
    axi_w_underflow,
    axi_w_prog_full,
    axi_w_prog_empty,
    axi_b_injectsbiterr,
    axi_b_injectdbiterr,
    axi_b_prog_full_thresh,
    axi_b_prog_empty_thresh,
    axi_b_data_count,
    axi_b_wr_data_count,
    axi_b_rd_data_count,
    axi_b_sbiterr,
    axi_b_dbiterr,
    axi_b_overflow,
    axi_b_underflow,
    axi_b_prog_full,
    axi_b_prog_empty,
    axi_ar_injectsbiterr,
    axi_ar_injectdbiterr,
    axi_ar_prog_full_thresh,
    axi_ar_prog_empty_thresh,
    axi_ar_data_count,
    axi_ar_wr_data_count,
    axi_ar_rd_data_count,
    axi_ar_sbiterr,
    axi_ar_dbiterr,
    axi_ar_overflow,
    axi_ar_underflow,
    axi_ar_prog_full,
    axi_ar_prog_empty,
    axi_r_injectsbiterr,
    axi_r_injectdbiterr,
    axi_r_prog_full_thresh,
    axi_r_prog_empty_thresh,
    axi_r_data_count,
    axi_r_wr_data_count,
    axi_r_rd_data_count,
    axi_r_sbiterr,
    axi_r_dbiterr,
    axi_r_overflow,
    axi_r_underflow,
    axi_r_prog_full,
    axi_r_prog_empty,
    axis_injectsbiterr,
    axis_injectdbiterr,
    axis_prog_full_thresh,
    axis_prog_empty_thresh,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count,
    axis_sbiterr,
    axis_dbiterr,
    axis_overflow,
    axis_underflow,
    axis_prog_full,
    axis_prog_empty);
  input backup;
  input backup_marker;
  input clk;
  input rst;
  input srst;
  input wr_clk;
  input wr_rst;
  input rd_clk;
  input rd_rst;
  input [31:0]din;
  input wr_en;
  input rd_en;
  input [12:0]prog_empty_thresh;
  input [12:0]prog_empty_thresh_assert;
  input [12:0]prog_empty_thresh_negate;
  input [12:0]prog_full_thresh;
  input [12:0]prog_full_thresh_assert;
  input [12:0]prog_full_thresh_negate;
  input int_clk;
  input injectdbiterr;
  input injectsbiterr;
  input sleep;
  output [31:0]dout;
  output full;
  output almost_full;
  output wr_ack;
  output overflow;
  output empty;
  output almost_empty;
  output valid;
  output underflow;
  output [12:0]data_count;
  output [12:0]rd_data_count;
  output [12:0]wr_data_count;
  output prog_full;
  output prog_empty;
  output sbiterr;
  output dbiterr;
  output wr_rst_busy;
  output rd_rst_busy;
  input m_aclk;
  input s_aclk;
  input s_aresetn;
  input m_aclk_en;
  input s_aclk_en;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [3:0]s_axi_awregion;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [63:0]m_axi_wdata;
  output [7:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input [3:0]s_axi_arregion;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [0:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [63:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;
  input s_axis_tvalid;
  output s_axis_tready;
  input [7:0]s_axis_tdata;
  input [0:0]s_axis_tstrb;
  input [0:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [3:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [7:0]m_axis_tdata;
  output [0:0]m_axis_tstrb;
  output [0:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [3:0]m_axis_tuser;
  input axi_aw_injectsbiterr;
  input axi_aw_injectdbiterr;
  input [3:0]axi_aw_prog_full_thresh;
  input [3:0]axi_aw_prog_empty_thresh;
  output [4:0]axi_aw_data_count;
  output [4:0]axi_aw_wr_data_count;
  output [4:0]axi_aw_rd_data_count;
  output axi_aw_sbiterr;
  output axi_aw_dbiterr;
  output axi_aw_overflow;
  output axi_aw_underflow;
  output axi_aw_prog_full;
  output axi_aw_prog_empty;
  input axi_w_injectsbiterr;
  input axi_w_injectdbiterr;
  input [9:0]axi_w_prog_full_thresh;
  input [9:0]axi_w_prog_empty_thresh;
  output [10:0]axi_w_data_count;
  output [10:0]axi_w_wr_data_count;
  output [10:0]axi_w_rd_data_count;
  output axi_w_sbiterr;
  output axi_w_dbiterr;
  output axi_w_overflow;
  output axi_w_underflow;
  output axi_w_prog_full;
  output axi_w_prog_empty;
  input axi_b_injectsbiterr;
  input axi_b_injectdbiterr;
  input [3:0]axi_b_prog_full_thresh;
  input [3:0]axi_b_prog_empty_thresh;
  output [4:0]axi_b_data_count;
  output [4:0]axi_b_wr_data_count;
  output [4:0]axi_b_rd_data_count;
  output axi_b_sbiterr;
  output axi_b_dbiterr;
  output axi_b_overflow;
  output axi_b_underflow;
  output axi_b_prog_full;
  output axi_b_prog_empty;
  input axi_ar_injectsbiterr;
  input axi_ar_injectdbiterr;
  input [3:0]axi_ar_prog_full_thresh;
  input [3:0]axi_ar_prog_empty_thresh;
  output [4:0]axi_ar_data_count;
  output [4:0]axi_ar_wr_data_count;
  output [4:0]axi_ar_rd_data_count;
  output axi_ar_sbiterr;
  output axi_ar_dbiterr;
  output axi_ar_overflow;
  output axi_ar_underflow;
  output axi_ar_prog_full;
  output axi_ar_prog_empty;
  input axi_r_injectsbiterr;
  input axi_r_injectdbiterr;
  input [9:0]axi_r_prog_full_thresh;
  input [9:0]axi_r_prog_empty_thresh;
  output [10:0]axi_r_data_count;
  output [10:0]axi_r_wr_data_count;
  output [10:0]axi_r_rd_data_count;
  output axi_r_sbiterr;
  output axi_r_dbiterr;
  output axi_r_overflow;
  output axi_r_underflow;
  output axi_r_prog_full;
  output axi_r_prog_empty;
  input axis_injectsbiterr;
  input axis_injectdbiterr;
  input [9:0]axis_prog_full_thresh;
  input [9:0]axis_prog_empty_thresh;
  output [10:0]axis_data_count;
  output [10:0]axis_wr_data_count;
  output [10:0]axis_rd_data_count;
  output axis_sbiterr;
  output axis_dbiterr;
  output axis_overflow;
  output axis_underflow;
  output axis_prog_full;
  output axis_prog_empty;

  wire \<const0> ;
  wire \<const1> ;
  wire almost_empty;
  wire almost_full;
  wire clk;
  wire [12:0]data_count;
  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire prog_empty;
  wire prog_full;
  wire rd_en;
  wire srst;
  wire valid;
  wire wr_en;

  assign axi_ar_data_count[4] = \<const0> ;
  assign axi_ar_data_count[3] = \<const0> ;
  assign axi_ar_data_count[2] = \<const0> ;
  assign axi_ar_data_count[1] = \<const0> ;
  assign axi_ar_data_count[0] = \<const0> ;
  assign axi_ar_dbiterr = \<const0> ;
  assign axi_ar_overflow = \<const0> ;
  assign axi_ar_prog_empty = \<const1> ;
  assign axi_ar_prog_full = \<const0> ;
  assign axi_ar_rd_data_count[4] = \<const0> ;
  assign axi_ar_rd_data_count[3] = \<const0> ;
  assign axi_ar_rd_data_count[2] = \<const0> ;
  assign axi_ar_rd_data_count[1] = \<const0> ;
  assign axi_ar_rd_data_count[0] = \<const0> ;
  assign axi_ar_sbiterr = \<const0> ;
  assign axi_ar_underflow = \<const0> ;
  assign axi_ar_wr_data_count[4] = \<const0> ;
  assign axi_ar_wr_data_count[3] = \<const0> ;
  assign axi_ar_wr_data_count[2] = \<const0> ;
  assign axi_ar_wr_data_count[1] = \<const0> ;
  assign axi_ar_wr_data_count[0] = \<const0> ;
  assign axi_aw_data_count[4] = \<const0> ;
  assign axi_aw_data_count[3] = \<const0> ;
  assign axi_aw_data_count[2] = \<const0> ;
  assign axi_aw_data_count[1] = \<const0> ;
  assign axi_aw_data_count[0] = \<const0> ;
  assign axi_aw_dbiterr = \<const0> ;
  assign axi_aw_overflow = \<const0> ;
  assign axi_aw_prog_empty = \<const1> ;
  assign axi_aw_prog_full = \<const0> ;
  assign axi_aw_rd_data_count[4] = \<const0> ;
  assign axi_aw_rd_data_count[3] = \<const0> ;
  assign axi_aw_rd_data_count[2] = \<const0> ;
  assign axi_aw_rd_data_count[1] = \<const0> ;
  assign axi_aw_rd_data_count[0] = \<const0> ;
  assign axi_aw_sbiterr = \<const0> ;
  assign axi_aw_underflow = \<const0> ;
  assign axi_aw_wr_data_count[4] = \<const0> ;
  assign axi_aw_wr_data_count[3] = \<const0> ;
  assign axi_aw_wr_data_count[2] = \<const0> ;
  assign axi_aw_wr_data_count[1] = \<const0> ;
  assign axi_aw_wr_data_count[0] = \<const0> ;
  assign axi_b_data_count[4] = \<const0> ;
  assign axi_b_data_count[3] = \<const0> ;
  assign axi_b_data_count[2] = \<const0> ;
  assign axi_b_data_count[1] = \<const0> ;
  assign axi_b_data_count[0] = \<const0> ;
  assign axi_b_dbiterr = \<const0> ;
  assign axi_b_overflow = \<const0> ;
  assign axi_b_prog_empty = \<const1> ;
  assign axi_b_prog_full = \<const0> ;
  assign axi_b_rd_data_count[4] = \<const0> ;
  assign axi_b_rd_data_count[3] = \<const0> ;
  assign axi_b_rd_data_count[2] = \<const0> ;
  assign axi_b_rd_data_count[1] = \<const0> ;
  assign axi_b_rd_data_count[0] = \<const0> ;
  assign axi_b_sbiterr = \<const0> ;
  assign axi_b_underflow = \<const0> ;
  assign axi_b_wr_data_count[4] = \<const0> ;
  assign axi_b_wr_data_count[3] = \<const0> ;
  assign axi_b_wr_data_count[2] = \<const0> ;
  assign axi_b_wr_data_count[1] = \<const0> ;
  assign axi_b_wr_data_count[0] = \<const0> ;
  assign axi_r_data_count[10] = \<const0> ;
  assign axi_r_data_count[9] = \<const0> ;
  assign axi_r_data_count[8] = \<const0> ;
  assign axi_r_data_count[7] = \<const0> ;
  assign axi_r_data_count[6] = \<const0> ;
  assign axi_r_data_count[5] = \<const0> ;
  assign axi_r_data_count[4] = \<const0> ;
  assign axi_r_data_count[3] = \<const0> ;
  assign axi_r_data_count[2] = \<const0> ;
  assign axi_r_data_count[1] = \<const0> ;
  assign axi_r_data_count[0] = \<const0> ;
  assign axi_r_dbiterr = \<const0> ;
  assign axi_r_overflow = \<const0> ;
  assign axi_r_prog_empty = \<const1> ;
  assign axi_r_prog_full = \<const0> ;
  assign axi_r_rd_data_count[10] = \<const0> ;
  assign axi_r_rd_data_count[9] = \<const0> ;
  assign axi_r_rd_data_count[8] = \<const0> ;
  assign axi_r_rd_data_count[7] = \<const0> ;
  assign axi_r_rd_data_count[6] = \<const0> ;
  assign axi_r_rd_data_count[5] = \<const0> ;
  assign axi_r_rd_data_count[4] = \<const0> ;
  assign axi_r_rd_data_count[3] = \<const0> ;
  assign axi_r_rd_data_count[2] = \<const0> ;
  assign axi_r_rd_data_count[1] = \<const0> ;
  assign axi_r_rd_data_count[0] = \<const0> ;
  assign axi_r_sbiterr = \<const0> ;
  assign axi_r_underflow = \<const0> ;
  assign axi_r_wr_data_count[10] = \<const0> ;
  assign axi_r_wr_data_count[9] = \<const0> ;
  assign axi_r_wr_data_count[8] = \<const0> ;
  assign axi_r_wr_data_count[7] = \<const0> ;
  assign axi_r_wr_data_count[6] = \<const0> ;
  assign axi_r_wr_data_count[5] = \<const0> ;
  assign axi_r_wr_data_count[4] = \<const0> ;
  assign axi_r_wr_data_count[3] = \<const0> ;
  assign axi_r_wr_data_count[2] = \<const0> ;
  assign axi_r_wr_data_count[1] = \<const0> ;
  assign axi_r_wr_data_count[0] = \<const0> ;
  assign axi_w_data_count[10] = \<const0> ;
  assign axi_w_data_count[9] = \<const0> ;
  assign axi_w_data_count[8] = \<const0> ;
  assign axi_w_data_count[7] = \<const0> ;
  assign axi_w_data_count[6] = \<const0> ;
  assign axi_w_data_count[5] = \<const0> ;
  assign axi_w_data_count[4] = \<const0> ;
  assign axi_w_data_count[3] = \<const0> ;
  assign axi_w_data_count[2] = \<const0> ;
  assign axi_w_data_count[1] = \<const0> ;
  assign axi_w_data_count[0] = \<const0> ;
  assign axi_w_dbiterr = \<const0> ;
  assign axi_w_overflow = \<const0> ;
  assign axi_w_prog_empty = \<const1> ;
  assign axi_w_prog_full = \<const0> ;
  assign axi_w_rd_data_count[10] = \<const0> ;
  assign axi_w_rd_data_count[9] = \<const0> ;
  assign axi_w_rd_data_count[8] = \<const0> ;
  assign axi_w_rd_data_count[7] = \<const0> ;
  assign axi_w_rd_data_count[6] = \<const0> ;
  assign axi_w_rd_data_count[5] = \<const0> ;
  assign axi_w_rd_data_count[4] = \<const0> ;
  assign axi_w_rd_data_count[3] = \<const0> ;
  assign axi_w_rd_data_count[2] = \<const0> ;
  assign axi_w_rd_data_count[1] = \<const0> ;
  assign axi_w_rd_data_count[0] = \<const0> ;
  assign axi_w_sbiterr = \<const0> ;
  assign axi_w_underflow = \<const0> ;
  assign axi_w_wr_data_count[10] = \<const0> ;
  assign axi_w_wr_data_count[9] = \<const0> ;
  assign axi_w_wr_data_count[8] = \<const0> ;
  assign axi_w_wr_data_count[7] = \<const0> ;
  assign axi_w_wr_data_count[6] = \<const0> ;
  assign axi_w_wr_data_count[5] = \<const0> ;
  assign axi_w_wr_data_count[4] = \<const0> ;
  assign axi_w_wr_data_count[3] = \<const0> ;
  assign axi_w_wr_data_count[2] = \<const0> ;
  assign axi_w_wr_data_count[1] = \<const0> ;
  assign axi_w_wr_data_count[0] = \<const0> ;
  assign axis_data_count[10] = \<const0> ;
  assign axis_data_count[9] = \<const0> ;
  assign axis_data_count[8] = \<const0> ;
  assign axis_data_count[7] = \<const0> ;
  assign axis_data_count[6] = \<const0> ;
  assign axis_data_count[5] = \<const0> ;
  assign axis_data_count[4] = \<const0> ;
  assign axis_data_count[3] = \<const0> ;
  assign axis_data_count[2] = \<const0> ;
  assign axis_data_count[1] = \<const0> ;
  assign axis_data_count[0] = \<const0> ;
  assign axis_dbiterr = \<const0> ;
  assign axis_overflow = \<const0> ;
  assign axis_prog_empty = \<const1> ;
  assign axis_prog_full = \<const0> ;
  assign axis_rd_data_count[10] = \<const0> ;
  assign axis_rd_data_count[9] = \<const0> ;
  assign axis_rd_data_count[8] = \<const0> ;
  assign axis_rd_data_count[7] = \<const0> ;
  assign axis_rd_data_count[6] = \<const0> ;
  assign axis_rd_data_count[5] = \<const0> ;
  assign axis_rd_data_count[4] = \<const0> ;
  assign axis_rd_data_count[3] = \<const0> ;
  assign axis_rd_data_count[2] = \<const0> ;
  assign axis_rd_data_count[1] = \<const0> ;
  assign axis_rd_data_count[0] = \<const0> ;
  assign axis_sbiterr = \<const0> ;
  assign axis_underflow = \<const0> ;
  assign axis_wr_data_count[10] = \<const0> ;
  assign axis_wr_data_count[9] = \<const0> ;
  assign axis_wr_data_count[8] = \<const0> ;
  assign axis_wr_data_count[7] = \<const0> ;
  assign axis_wr_data_count[6] = \<const0> ;
  assign axis_wr_data_count[5] = \<const0> ;
  assign axis_wr_data_count[4] = \<const0> ;
  assign axis_wr_data_count[3] = \<const0> ;
  assign axis_wr_data_count[2] = \<const0> ;
  assign axis_wr_data_count[1] = \<const0> ;
  assign axis_wr_data_count[0] = \<const0> ;
  assign dbiterr = \<const0> ;
  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const0> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = \<const0> ;
  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28] = \<const0> ;
  assign m_axi_awaddr[27] = \<const0> ;
  assign m_axi_awaddr[26] = \<const0> ;
  assign m_axi_awaddr[25] = \<const0> ;
  assign m_axi_awaddr[24] = \<const0> ;
  assign m_axi_awaddr[23] = \<const0> ;
  assign m_axi_awaddr[22] = \<const0> ;
  assign m_axi_awaddr[21] = \<const0> ;
  assign m_axi_awaddr[20] = \<const0> ;
  assign m_axi_awaddr[19] = \<const0> ;
  assign m_axi_awaddr[18] = \<const0> ;
  assign m_axi_awaddr[17] = \<const0> ;
  assign m_axi_awaddr[16] = \<const0> ;
  assign m_axi_awaddr[15] = \<const0> ;
  assign m_axi_awaddr[14] = \<const0> ;
  assign m_axi_awaddr[13] = \<const0> ;
  assign m_axi_awaddr[12] = \<const0> ;
  assign m_axi_awaddr[11] = \<const0> ;
  assign m_axi_awaddr[10] = \<const0> ;
  assign m_axi_awaddr[9] = \<const0> ;
  assign m_axi_awaddr[8] = \<const0> ;
  assign m_axi_awaddr[7] = \<const0> ;
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const0> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_awvalid = \<const0> ;
  assign m_axi_bready = \<const0> ;
  assign m_axi_rready = \<const0> ;
  assign m_axi_wdata[63] = \<const0> ;
  assign m_axi_wdata[62] = \<const0> ;
  assign m_axi_wdata[61] = \<const0> ;
  assign m_axi_wdata[60] = \<const0> ;
  assign m_axi_wdata[59] = \<const0> ;
  assign m_axi_wdata[58] = \<const0> ;
  assign m_axi_wdata[57] = \<const0> ;
  assign m_axi_wdata[56] = \<const0> ;
  assign m_axi_wdata[55] = \<const0> ;
  assign m_axi_wdata[54] = \<const0> ;
  assign m_axi_wdata[53] = \<const0> ;
  assign m_axi_wdata[52] = \<const0> ;
  assign m_axi_wdata[51] = \<const0> ;
  assign m_axi_wdata[50] = \<const0> ;
  assign m_axi_wdata[49] = \<const0> ;
  assign m_axi_wdata[48] = \<const0> ;
  assign m_axi_wdata[47] = \<const0> ;
  assign m_axi_wdata[46] = \<const0> ;
  assign m_axi_wdata[45] = \<const0> ;
  assign m_axi_wdata[44] = \<const0> ;
  assign m_axi_wdata[43] = \<const0> ;
  assign m_axi_wdata[42] = \<const0> ;
  assign m_axi_wdata[41] = \<const0> ;
  assign m_axi_wdata[40] = \<const0> ;
  assign m_axi_wdata[39] = \<const0> ;
  assign m_axi_wdata[38] = \<const0> ;
  assign m_axi_wdata[37] = \<const0> ;
  assign m_axi_wdata[36] = \<const0> ;
  assign m_axi_wdata[35] = \<const0> ;
  assign m_axi_wdata[34] = \<const0> ;
  assign m_axi_wdata[33] = \<const0> ;
  assign m_axi_wdata[32] = \<const0> ;
  assign m_axi_wdata[31] = \<const0> ;
  assign m_axi_wdata[30] = \<const0> ;
  assign m_axi_wdata[29] = \<const0> ;
  assign m_axi_wdata[28] = \<const0> ;
  assign m_axi_wdata[27] = \<const0> ;
  assign m_axi_wdata[26] = \<const0> ;
  assign m_axi_wdata[25] = \<const0> ;
  assign m_axi_wdata[24] = \<const0> ;
  assign m_axi_wdata[23] = \<const0> ;
  assign m_axi_wdata[22] = \<const0> ;
  assign m_axi_wdata[21] = \<const0> ;
  assign m_axi_wdata[20] = \<const0> ;
  assign m_axi_wdata[19] = \<const0> ;
  assign m_axi_wdata[18] = \<const0> ;
  assign m_axi_wdata[17] = \<const0> ;
  assign m_axi_wdata[16] = \<const0> ;
  assign m_axi_wdata[15] = \<const0> ;
  assign m_axi_wdata[14] = \<const0> ;
  assign m_axi_wdata[13] = \<const0> ;
  assign m_axi_wdata[12] = \<const0> ;
  assign m_axi_wdata[11] = \<const0> ;
  assign m_axi_wdata[10] = \<const0> ;
  assign m_axi_wdata[9] = \<const0> ;
  assign m_axi_wdata[8] = \<const0> ;
  assign m_axi_wdata[7] = \<const0> ;
  assign m_axi_wdata[6] = \<const0> ;
  assign m_axi_wdata[5] = \<const0> ;
  assign m_axi_wdata[4] = \<const0> ;
  assign m_axi_wdata[3] = \<const0> ;
  assign m_axi_wdata[2] = \<const0> ;
  assign m_axi_wdata[1] = \<const0> ;
  assign m_axi_wdata[0] = \<const0> ;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const0> ;
  assign m_axi_wstrb[7] = \<const0> ;
  assign m_axi_wstrb[6] = \<const0> ;
  assign m_axi_wstrb[5] = \<const0> ;
  assign m_axi_wstrb[4] = \<const0> ;
  assign m_axi_wstrb[3] = \<const0> ;
  assign m_axi_wstrb[2] = \<const0> ;
  assign m_axi_wstrb[1] = \<const0> ;
  assign m_axi_wstrb[0] = \<const0> ;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = \<const0> ;
  assign m_axis_tdata[7] = \<const0> ;
  assign m_axis_tdata[6] = \<const0> ;
  assign m_axis_tdata[5] = \<const0> ;
  assign m_axis_tdata[4] = \<const0> ;
  assign m_axis_tdata[3] = \<const0> ;
  assign m_axis_tdata[2] = \<const0> ;
  assign m_axis_tdata[1] = \<const0> ;
  assign m_axis_tdata[0] = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[0] = \<const0> ;
  assign m_axis_tlast = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign m_axis_tuser[3] = \<const0> ;
  assign m_axis_tuser[2] = \<const0> ;
  assign m_axis_tuser[1] = \<const0> ;
  assign m_axis_tuser[0] = \<const0> ;
  assign m_axis_tvalid = \<const0> ;
  assign overflow = \<const0> ;
  assign rd_data_count[12] = \<const0> ;
  assign rd_data_count[11] = \<const0> ;
  assign rd_data_count[10] = \<const0> ;
  assign rd_data_count[9] = \<const0> ;
  assign rd_data_count[8] = \<const0> ;
  assign rd_data_count[7] = \<const0> ;
  assign rd_data_count[6] = \<const0> ;
  assign rd_data_count[5] = \<const0> ;
  assign rd_data_count[4] = \<const0> ;
  assign rd_data_count[3] = \<const0> ;
  assign rd_data_count[2] = \<const0> ;
  assign rd_data_count[1] = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign rd_rst_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[63] = \<const0> ;
  assign s_axi_rdata[62] = \<const0> ;
  assign s_axi_rdata[61] = \<const0> ;
  assign s_axi_rdata[60] = \<const0> ;
  assign s_axi_rdata[59] = \<const0> ;
  assign s_axi_rdata[58] = \<const0> ;
  assign s_axi_rdata[57] = \<const0> ;
  assign s_axi_rdata[56] = \<const0> ;
  assign s_axi_rdata[55] = \<const0> ;
  assign s_axi_rdata[54] = \<const0> ;
  assign s_axi_rdata[53] = \<const0> ;
  assign s_axi_rdata[52] = \<const0> ;
  assign s_axi_rdata[51] = \<const0> ;
  assign s_axi_rdata[50] = \<const0> ;
  assign s_axi_rdata[49] = \<const0> ;
  assign s_axi_rdata[48] = \<const0> ;
  assign s_axi_rdata[47] = \<const0> ;
  assign s_axi_rdata[46] = \<const0> ;
  assign s_axi_rdata[45] = \<const0> ;
  assign s_axi_rdata[44] = \<const0> ;
  assign s_axi_rdata[43] = \<const0> ;
  assign s_axi_rdata[42] = \<const0> ;
  assign s_axi_rdata[41] = \<const0> ;
  assign s_axi_rdata[40] = \<const0> ;
  assign s_axi_rdata[39] = \<const0> ;
  assign s_axi_rdata[38] = \<const0> ;
  assign s_axi_rdata[37] = \<const0> ;
  assign s_axi_rdata[36] = \<const0> ;
  assign s_axi_rdata[35] = \<const0> ;
  assign s_axi_rdata[34] = \<const0> ;
  assign s_axi_rdata[33] = \<const0> ;
  assign s_axi_rdata[32] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign s_axis_tready = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[12] = \<const0> ;
  assign wr_data_count[11] = \<const0> ;
  assign wr_data_count[10] = \<const0> ;
  assign wr_data_count[9] = \<const0> ;
  assign wr_data_count[8] = \<const0> ;
  assign wr_data_count[7] = \<const0> ;
  assign wr_data_count[6] = \<const0> ;
  assign wr_data_count[5] = \<const0> ;
  assign wr_data_count[4] = \<const0> ;
  assign wr_data_count[3] = \<const0> ;
  assign wr_data_count[2] = \<const0> ;
  assign wr_data_count[1] = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  assign wr_rst_busy = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  fifo_Fpjh_data_2_fifo_generator_v13_2_4_synth inst_fifo_gen
       (.almost_empty(almost_empty),
        .almost_full(almost_full),
        .clk(clk),
        .data_count(data_count),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .prog_empty(prog_empty),
        .prog_full(prog_full),
        .rd_en(rd_en),
        .srst(srst),
        .valid(valid),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "fifo_generator_v13_2_4_synth" *) 
module fifo_Fpjh_data_2_fifo_generator_v13_2_4_synth
   (dout,
    empty,
    full,
    almost_full,
    almost_empty,
    valid,
    data_count,
    prog_empty,
    prog_full,
    clk,
    srst,
    din,
    wr_en,
    rd_en);
  output [31:0]dout;
  output empty;
  output full;
  output almost_full;
  output almost_empty;
  output valid;
  output [12:0]data_count;
  output prog_empty;
  output prog_full;
  input clk;
  input srst;
  input [31:0]din;
  input wr_en;
  input rd_en;

  wire almost_empty;
  wire almost_full;
  wire clk;
  wire [12:0]data_count;
  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire prog_empty;
  wire prog_full;
  wire rd_en;
  wire srst;
  wire valid;
  wire wr_en;

  fifo_Fpjh_data_2_fifo_generator_top \gconvfifo.rf 
       (.almost_empty(almost_empty),
        .almost_full(almost_full),
        .clk(clk),
        .data_count(data_count),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .prog_empty(prog_empty),
        .prog_full(prog_full),
        .rd_en(rd_en),
        .srst(srst),
        .valid(valid),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "memory" *) 
module fifo_Fpjh_data_2_memory
   (dout,
    sel_pipe,
    clk,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ,
    srst,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ,
    Q,
    din,
    p_17_out,
    ena_array,
    enb_array,
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] );
  output [31:0]dout;
  output sel_pipe;
  input clk;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  input \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  input srst;
  input [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  input [12:0]Q;
  input [31:0]din;
  input p_17_out;
  input [1:0]ena_array;
  input [1:0]enb_array;
  input \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ;
  wire [12:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ;
  wire [12:0]Q;
  wire clk;
  wire [31:0]din;
  wire [31:0]dout;
  wire [1:0]ena_array;
  wire [1:0]enb_array;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ;
  wire p_17_out;
  wire sel_pipe;
  wire srst;

  fifo_Fpjh_data_2_blk_mem_gen_v8_4_3 \gbm.gbmg.gbmga.ngecc.bmg 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_1 ),
        .Q(Q),
        .clk(clk),
        .din(din),
        .dout(dout),
        .ena_array(ena_array),
        .enb_array(enb_array),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] (sel_pipe),
        .\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0]_0 (\no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] ),
        .p_17_out(p_17_out),
        .srst(srst));
endmodule

(* ORIG_REF_NAME = "rd_bin_cntr" *) 
module fifo_Fpjh_data_2_rd_bin_cntr
   (D,
    DI,
    Q,
    \gc1.count_d2_reg[0]_0 ,
    enb_array,
    v1_reg,
    v1_reg_2,
    v1_reg_3,
    v1_reg_0,
    v1_reg_1,
    \gc1.count_d2_reg[0]_1 ,
    \gc1.count_d2_reg[2]_0 ,
    \gc1.count_d2_reg[4]_0 ,
    \gc1.count_d2_reg[6]_0 ,
    \gc1.count_d2_reg[8]_0 ,
    \gc1.count_d2_reg[10]_0 ,
    \gc1.count_d2_reg[11]_0 ,
    \gc1.count_d2_reg[11]_1 ,
    S,
    \gc1.count_d2_reg[6]_1 ,
    \gc1.count_d2_reg[10]_1 ,
    \gc1.count_d2_reg[2]_1 ,
    \gc1.count_d2_reg[6]_2 ,
    \gc1.count_d2_reg[10]_2 ,
    \gc1.count_d2_reg[12]_0 ,
    \gc1.count_d1_reg[12]_0 ,
    srst,
    E,
    clk,
    wr_en,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[4] ,
    rd_en,
    out,
    \greg.gpcry_sym.diff_pntr_pad_reg[13] ,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[13] ,
    \gmux.gm[5].gms.ms ,
    sel_pipe);
  output [0:0]D;
  output [0:0]DI;
  output [12:0]Q;
  output [0:0]\gc1.count_d2_reg[0]_0 ;
  output [0:0]enb_array;
  output [5:0]v1_reg;
  output [5:0]v1_reg_2;
  output [5:0]v1_reg_3;
  output [5:0]v1_reg_0;
  output [5:0]v1_reg_1;
  output \gc1.count_d2_reg[0]_1 ;
  output \gc1.count_d2_reg[2]_0 ;
  output \gc1.count_d2_reg[4]_0 ;
  output \gc1.count_d2_reg[6]_0 ;
  output \gc1.count_d2_reg[8]_0 ;
  output \gc1.count_d2_reg[10]_0 ;
  output [0:0]\gc1.count_d2_reg[11]_0 ;
  output [0:0]\gc1.count_d2_reg[11]_1 ;
  output [1:0]S;
  output [3:0]\gc1.count_d2_reg[6]_1 ;
  output [3:0]\gc1.count_d2_reg[10]_1 ;
  output [1:0]\gc1.count_d2_reg[2]_1 ;
  output [3:0]\gc1.count_d2_reg[6]_2 ;
  output [3:0]\gc1.count_d2_reg[10]_2 ;
  output \gc1.count_d2_reg[12]_0 ;
  output [0:0]\gc1.count_d1_reg[12]_0 ;
  input srst;
  input [0:0]E;
  input clk;
  input wr_en;
  input \gdiff.gcry_1_sym.diff_pntr_pad_reg[4] ;
  input rd_en;
  input out;
  input [12:0]\greg.gpcry_sym.diff_pntr_pad_reg[13] ;
  input [12:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] ;
  input [11:0]\gmux.gm[5].gms.ms ;
  input sel_pipe;

  wire [0:0]D;
  wire [0:0]DI;
  wire [0:0]E;
  wire [12:0]Q;
  wire [1:0]S;
  wire clk;
  wire [0:0]enb_array;
  wire \gc1.count[0]_i_2_n_0 ;
  wire [0:0]\gc1.count_d1_reg[12]_0 ;
  wire [0:0]\gc1.count_d2_reg[0]_0 ;
  wire \gc1.count_d2_reg[0]_1 ;
  wire \gc1.count_d2_reg[10]_0 ;
  wire [3:0]\gc1.count_d2_reg[10]_1 ;
  wire [3:0]\gc1.count_d2_reg[10]_2 ;
  wire [0:0]\gc1.count_d2_reg[11]_0 ;
  wire [0:0]\gc1.count_d2_reg[11]_1 ;
  wire \gc1.count_d2_reg[12]_0 ;
  wire \gc1.count_d2_reg[2]_0 ;
  wire [1:0]\gc1.count_d2_reg[2]_1 ;
  wire \gc1.count_d2_reg[4]_0 ;
  wire \gc1.count_d2_reg[6]_0 ;
  wire [3:0]\gc1.count_d2_reg[6]_1 ;
  wire [3:0]\gc1.count_d2_reg[6]_2 ;
  wire \gc1.count_d2_reg[8]_0 ;
  wire \gc1.count_reg[0]_i_1_n_0 ;
  wire \gc1.count_reg[0]_i_1_n_1 ;
  wire \gc1.count_reg[0]_i_1_n_2 ;
  wire \gc1.count_reg[0]_i_1_n_3 ;
  wire \gc1.count_reg[0]_i_1_n_4 ;
  wire \gc1.count_reg[0]_i_1_n_5 ;
  wire \gc1.count_reg[0]_i_1_n_6 ;
  wire \gc1.count_reg[0]_i_1_n_7 ;
  wire \gc1.count_reg[12]_i_1_n_7 ;
  wire \gc1.count_reg[4]_i_1_n_0 ;
  wire \gc1.count_reg[4]_i_1_n_1 ;
  wire \gc1.count_reg[4]_i_1_n_2 ;
  wire \gc1.count_reg[4]_i_1_n_3 ;
  wire \gc1.count_reg[4]_i_1_n_4 ;
  wire \gc1.count_reg[4]_i_1_n_5 ;
  wire \gc1.count_reg[4]_i_1_n_6 ;
  wire \gc1.count_reg[4]_i_1_n_7 ;
  wire \gc1.count_reg[8]_i_1_n_0 ;
  wire \gc1.count_reg[8]_i_1_n_1 ;
  wire \gc1.count_reg[8]_i_1_n_2 ;
  wire \gc1.count_reg[8]_i_1_n_3 ;
  wire \gc1.count_reg[8]_i_1_n_4 ;
  wire \gc1.count_reg[8]_i_1_n_5 ;
  wire \gc1.count_reg[8]_i_1_n_6 ;
  wire \gc1.count_reg[8]_i_1_n_7 ;
  wire [12:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg[4] ;
  wire [11:0]\gmux.gm[5].gms.ms ;
  wire [12:0]\greg.gpcry_sym.diff_pntr_pad_reg[13] ;
  wire out;
  wire rd_en;
  wire [11:0]rd_pntr_plus1;
  wire [11:0]rd_pntr_plus2;
  wire sel_pipe;
  wire srst;
  wire [5:0]v1_reg;
  wire [5:0]v1_reg_0;
  wire [5:0]v1_reg_1;
  wire [5:0]v1_reg_2;
  wire [5:0]v1_reg_3;
  wire wr_en;
  wire [3:0]\NLW_gc1.count_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_gc1.count_reg[12]_i_1_O_UNCONNECTED ;

  LUT4 #(
    .INIT(16'h88A8)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__0 
       (.I0(Q[12]),
        .I1(srst),
        .I2(rd_en),
        .I3(out),
        .O(enb_array));
  LUT1 #(
    .INIT(2'h1)) 
    \gc1.count[0]_i_2 
       (.I0(rd_pntr_plus2[0]),
        .O(\gc1.count[0]_i_2_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gc1.count_d1_reg[0] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[0]),
        .Q(rd_pntr_plus1[0]),
        .S(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[10] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[10]),
        .Q(rd_pntr_plus1[10]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[11] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[11]),
        .Q(rd_pntr_plus1[11]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[12] 
       (.C(clk),
        .CE(E),
        .D(D),
        .Q(\gc1.count_d1_reg[12]_0 ),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[1] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[1]),
        .Q(rd_pntr_plus1[1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[2] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[2]),
        .Q(rd_pntr_plus1[2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[3] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[3]),
        .Q(rd_pntr_plus1[3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[4] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[4]),
        .Q(rd_pntr_plus1[4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[5] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[5]),
        .Q(rd_pntr_plus1[5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[6] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[6]),
        .Q(rd_pntr_plus1[6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[7] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[7]),
        .Q(rd_pntr_plus1[7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[8] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[8]),
        .Q(rd_pntr_plus1[8]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d1_reg[9] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus2[9]),
        .Q(rd_pntr_plus1[9]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[0] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[0]),
        .Q(Q[0]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[10] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[10]),
        .Q(Q[10]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[11] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[11]),
        .Q(Q[11]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[12] 
       (.C(clk),
        .CE(E),
        .D(\gc1.count_d1_reg[12]_0 ),
        .Q(Q[12]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[1] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[1]),
        .Q(Q[1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[2] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[2]),
        .Q(Q[2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[3] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[3]),
        .Q(Q[3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[4] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[4]),
        .Q(Q[4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[5] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[5]),
        .Q(Q[5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[6] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[6]),
        .Q(Q[6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[7] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[7]),
        .Q(Q[7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[8] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[8]),
        .Q(Q[8]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_d2_reg[9] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[9]),
        .Q(Q[9]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[0] 
       (.C(clk),
        .CE(E),
        .D(\gc1.count_reg[0]_i_1_n_7 ),
        .Q(rd_pntr_plus2[0]),
        .R(srst));
  CARRY4 \gc1.count_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\gc1.count_reg[0]_i_1_n_0 ,\gc1.count_reg[0]_i_1_n_1 ,\gc1.count_reg[0]_i_1_n_2 ,\gc1.count_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\gc1.count_reg[0]_i_1_n_4 ,\gc1.count_reg[0]_i_1_n_5 ,\gc1.count_reg[0]_i_1_n_6 ,\gc1.count_reg[0]_i_1_n_7 }),
        .S({rd_pntr_plus2[3:1],\gc1.count[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[10] 
       (.C(clk),
        .CE(E),
        .D(\gc1.count_reg[8]_i_1_n_5 ),
        .Q(rd_pntr_plus2[10]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[11] 
       (.C(clk),
        .CE(E),
        .D(\gc1.count_reg[8]_i_1_n_4 ),
        .Q(rd_pntr_plus2[11]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[12] 
       (.C(clk),
        .CE(E),
        .D(\gc1.count_reg[12]_i_1_n_7 ),
        .Q(D),
        .R(srst));
  CARRY4 \gc1.count_reg[12]_i_1 
       (.CI(\gc1.count_reg[8]_i_1_n_0 ),
        .CO(\NLW_gc1.count_reg[12]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_gc1.count_reg[12]_i_1_O_UNCONNECTED [3:1],\gc1.count_reg[12]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,D}));
  FDSE #(
    .INIT(1'b1)) 
    \gc1.count_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\gc1.count_reg[0]_i_1_n_6 ),
        .Q(rd_pntr_plus2[1]),
        .S(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[2] 
       (.C(clk),
        .CE(E),
        .D(\gc1.count_reg[0]_i_1_n_5 ),
        .Q(rd_pntr_plus2[2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\gc1.count_reg[0]_i_1_n_4 ),
        .Q(rd_pntr_plus2[3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[4] 
       (.C(clk),
        .CE(E),
        .D(\gc1.count_reg[4]_i_1_n_7 ),
        .Q(rd_pntr_plus2[4]),
        .R(srst));
  CARRY4 \gc1.count_reg[4]_i_1 
       (.CI(\gc1.count_reg[0]_i_1_n_0 ),
        .CO({\gc1.count_reg[4]_i_1_n_0 ,\gc1.count_reg[4]_i_1_n_1 ,\gc1.count_reg[4]_i_1_n_2 ,\gc1.count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\gc1.count_reg[4]_i_1_n_4 ,\gc1.count_reg[4]_i_1_n_5 ,\gc1.count_reg[4]_i_1_n_6 ,\gc1.count_reg[4]_i_1_n_7 }),
        .S(rd_pntr_plus2[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[5] 
       (.C(clk),
        .CE(E),
        .D(\gc1.count_reg[4]_i_1_n_6 ),
        .Q(rd_pntr_plus2[5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[6] 
       (.C(clk),
        .CE(E),
        .D(\gc1.count_reg[4]_i_1_n_5 ),
        .Q(rd_pntr_plus2[6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[7] 
       (.C(clk),
        .CE(E),
        .D(\gc1.count_reg[4]_i_1_n_4 ),
        .Q(rd_pntr_plus2[7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[8] 
       (.C(clk),
        .CE(E),
        .D(\gc1.count_reg[8]_i_1_n_7 ),
        .Q(rd_pntr_plus2[8]),
        .R(srst));
  CARRY4 \gc1.count_reg[8]_i_1 
       (.CI(\gc1.count_reg[4]_i_1_n_0 ),
        .CO({\gc1.count_reg[8]_i_1_n_0 ,\gc1.count_reg[8]_i_1_n_1 ,\gc1.count_reg[8]_i_1_n_2 ,\gc1.count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\gc1.count_reg[8]_i_1_n_4 ,\gc1.count_reg[8]_i_1_n_5 ,\gc1.count_reg[8]_i_1_n_6 ,\gc1.count_reg[8]_i_1_n_7 }),
        .S(rd_pntr_plus2[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \gc1.count_reg[9] 
       (.C(clk),
        .CE(E),
        .D(\gc1.count_reg[8]_i_1_n_6 ),
        .Q(rd_pntr_plus2[9]),
        .R(srst));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1 
       (.I0(Q[0]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [0]),
        .I2(Q[1]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [1]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__0 
       (.I0(rd_pntr_plus1[0]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [0]),
        .I2(rd_pntr_plus1[1]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [1]),
        .O(v1_reg_2[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__1 
       (.I0(rd_pntr_plus2[0]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [0]),
        .I2(rd_pntr_plus2[1]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [1]),
        .O(v1_reg_3[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__2 
       (.I0(Q[0]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [0]),
        .I2(Q[1]),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [1]),
        .O(v1_reg_0[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__3 
       (.I0(Q[0]),
        .I1(\gmux.gm[5].gms.ms [0]),
        .I2(Q[1]),
        .I3(\gmux.gm[5].gms.ms [1]),
        .O(v1_reg_1[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__4 
       (.I0(Q[0]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [0]),
        .I2(Q[1]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [1]),
        .O(\gc1.count_d2_reg[0]_1 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1 
       (.I0(Q[2]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [2]),
        .I2(Q[3]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [3]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[2]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [2]),
        .I2(rd_pntr_plus1[3]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [3]),
        .O(v1_reg_2[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__1 
       (.I0(rd_pntr_plus2[2]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [2]),
        .I2(rd_pntr_plus2[3]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [3]),
        .O(v1_reg_3[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__2 
       (.I0(Q[2]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [2]),
        .I2(Q[3]),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [3]),
        .O(v1_reg_0[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__3 
       (.I0(Q[2]),
        .I1(\gmux.gm[5].gms.ms [2]),
        .I2(Q[3]),
        .I3(\gmux.gm[5].gms.ms [3]),
        .O(v1_reg_1[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__4 
       (.I0(Q[2]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [2]),
        .I2(Q[3]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [3]),
        .O(\gc1.count_d2_reg[2]_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1 
       (.I0(Q[4]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [4]),
        .I2(Q[5]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [5]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[4]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [4]),
        .I2(rd_pntr_plus1[5]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [5]),
        .O(v1_reg_2[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__1 
       (.I0(rd_pntr_plus2[4]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [4]),
        .I2(rd_pntr_plus2[5]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [5]),
        .O(v1_reg_3[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__2 
       (.I0(Q[4]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [4]),
        .I2(Q[5]),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [5]),
        .O(v1_reg_0[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__3 
       (.I0(Q[4]),
        .I1(\gmux.gm[5].gms.ms [4]),
        .I2(Q[5]),
        .I3(\gmux.gm[5].gms.ms [5]),
        .O(v1_reg_1[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__4 
       (.I0(Q[4]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [4]),
        .I2(Q[5]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [5]),
        .O(\gc1.count_d2_reg[4]_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1 
       (.I0(Q[6]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [6]),
        .I2(Q[7]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [7]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[6]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [6]),
        .I2(rd_pntr_plus1[7]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [7]),
        .O(v1_reg_2[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__1 
       (.I0(rd_pntr_plus2[6]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [6]),
        .I2(rd_pntr_plus2[7]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [7]),
        .O(v1_reg_3[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__2 
       (.I0(Q[6]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [6]),
        .I2(Q[7]),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [7]),
        .O(v1_reg_0[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__3 
       (.I0(Q[6]),
        .I1(\gmux.gm[5].gms.ms [6]),
        .I2(Q[7]),
        .I3(\gmux.gm[5].gms.ms [7]),
        .O(v1_reg_1[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__4 
       (.I0(Q[6]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [6]),
        .I2(Q[7]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [7]),
        .O(\gc1.count_d2_reg[6]_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[4].gms.ms_i_1 
       (.I0(Q[8]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [8]),
        .I2(Q[9]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [9]),
        .O(v1_reg[4]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[4].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[8]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [8]),
        .I2(rd_pntr_plus1[9]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [9]),
        .O(v1_reg_2[4]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[4].gms.ms_i_1__1 
       (.I0(rd_pntr_plus2[8]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [8]),
        .I2(rd_pntr_plus2[9]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [9]),
        .O(v1_reg_3[4]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[4].gms.ms_i_1__2 
       (.I0(Q[8]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [8]),
        .I2(Q[9]),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [9]),
        .O(v1_reg_0[4]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[4].gms.ms_i_1__3 
       (.I0(Q[8]),
        .I1(\gmux.gm[5].gms.ms [8]),
        .I2(Q[9]),
        .I3(\gmux.gm[5].gms.ms [9]),
        .O(v1_reg_1[4]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[4].gms.ms_i_1__4 
       (.I0(Q[8]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [8]),
        .I2(Q[9]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [9]),
        .O(\gc1.count_d2_reg[8]_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[5].gms.ms_i_1 
       (.I0(Q[10]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [10]),
        .I2(Q[11]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [11]),
        .O(v1_reg[5]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[5].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[10]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [10]),
        .I2(rd_pntr_plus1[11]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [11]),
        .O(v1_reg_2[5]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[5].gms.ms_i_1__1 
       (.I0(rd_pntr_plus2[10]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [10]),
        .I2(rd_pntr_plus2[11]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [11]),
        .O(v1_reg_3[5]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[5].gms.ms_i_1__2 
       (.I0(Q[10]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [10]),
        .I2(Q[11]),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [11]),
        .O(v1_reg_0[5]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[5].gms.ms_i_1__3 
       (.I0(Q[10]),
        .I1(\gmux.gm[5].gms.ms [10]),
        .I2(Q[11]),
        .I3(\gmux.gm[5].gms.ms [11]),
        .O(v1_reg_1[5]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[5].gms.ms_i_1__4 
       (.I0(Q[10]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [10]),
        .I2(Q[11]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [11]),
        .O(\gc1.count_d2_reg[10]_0 ));
  LUT5 #(
    .INIT(32'hAAEFAA20)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe[0]_i_1 
       (.I0(Q[12]),
        .I1(out),
        .I2(rd_en),
        .I3(srst),
        .I4(sel_pipe),
        .O(\gc1.count_d2_reg[12]_0 ));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_5
       (.I0(Q[6]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [6]),
        .I2(\greg.gpcry_sym.diff_pntr_pad_reg[13] [7]),
        .I3(Q[7]),
        .O(\gc1.count_d2_reg[6]_1 [3]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_5__0
       (.I0(Q[6]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [6]),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [7]),
        .I3(Q[7]),
        .O(\gc1.count_d2_reg[6]_2 [3]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_6
       (.I0(Q[5]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [5]),
        .I2(\greg.gpcry_sym.diff_pntr_pad_reg[13] [6]),
        .I3(Q[6]),
        .O(\gc1.count_d2_reg[6]_1 [2]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_6__0
       (.I0(Q[5]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [5]),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [6]),
        .I3(Q[6]),
        .O(\gc1.count_d2_reg[6]_2 [2]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_7
       (.I0(Q[4]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [4]),
        .I2(\greg.gpcry_sym.diff_pntr_pad_reg[13] [5]),
        .I3(Q[5]),
        .O(\gc1.count_d2_reg[6]_1 [1]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_7__0
       (.I0(Q[4]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [4]),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [5]),
        .I3(Q[5]),
        .O(\gc1.count_d2_reg[6]_2 [1]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_8
       (.I0(Q[3]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [3]),
        .I2(\greg.gpcry_sym.diff_pntr_pad_reg[13] [4]),
        .I3(Q[4]),
        .O(\gc1.count_d2_reg[6]_1 [0]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__0_i_8__0
       (.I0(Q[3]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [3]),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [4]),
        .I3(Q[4]),
        .O(\gc1.count_d2_reg[6]_2 [0]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__1_i_5
       (.I0(Q[10]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [10]),
        .I2(\greg.gpcry_sym.diff_pntr_pad_reg[13] [11]),
        .I3(Q[11]),
        .O(\gc1.count_d2_reg[10]_1 [3]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__1_i_5__0
       (.I0(Q[10]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [10]),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [11]),
        .I3(Q[11]),
        .O(\gc1.count_d2_reg[10]_2 [3]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__1_i_6
       (.I0(Q[9]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [9]),
        .I2(\greg.gpcry_sym.diff_pntr_pad_reg[13] [10]),
        .I3(Q[10]),
        .O(\gc1.count_d2_reg[10]_1 [2]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__1_i_6__0
       (.I0(Q[9]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [9]),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [10]),
        .I3(Q[10]),
        .O(\gc1.count_d2_reg[10]_2 [2]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__1_i_7
       (.I0(Q[8]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [8]),
        .I2(\greg.gpcry_sym.diff_pntr_pad_reg[13] [9]),
        .I3(Q[9]),
        .O(\gc1.count_d2_reg[10]_1 [1]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__1_i_7__0
       (.I0(Q[8]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [8]),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [9]),
        .I3(Q[9]),
        .O(\gc1.count_d2_reg[10]_2 [1]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__1_i_8
       (.I0(Q[7]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [7]),
        .I2(\greg.gpcry_sym.diff_pntr_pad_reg[13] [8]),
        .I3(Q[8]),
        .O(\gc1.count_d2_reg[10]_1 [0]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__1_i_8__0
       (.I0(Q[7]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [7]),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [8]),
        .I3(Q[8]),
        .O(\gc1.count_d2_reg[10]_2 [0]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__2_i_1
       (.I0(Q[11]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [11]),
        .I2(Q[12]),
        .I3(\greg.gpcry_sym.diff_pntr_pad_reg[13] [12]),
        .O(\gc1.count_d2_reg[11]_0 ));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry__2_i_1__0
       (.I0(Q[11]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [11]),
        .I2(Q[12]),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [12]),
        .O(\gc1.count_d2_reg[11]_1 ));
  LUT6 #(
    .INIT(64'hFFFF5DFF55550455)) 
    plusOp__0_carry_i_3
       (.I0(Q[0]),
        .I1(wr_en),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg[4] ),
        .I3(rd_en),
        .I4(out),
        .I5(\greg.gpcry_sym.diff_pntr_pad_reg[13] [0]),
        .O(DI));
  LUT6 #(
    .INIT(64'h5555F75500005100)) 
    plusOp__0_carry_i_3__0
       (.I0(Q[0]),
        .I1(rd_en),
        .I2(out),
        .I3(wr_en),
        .I4(\gdiff.gcry_1_sym.diff_pntr_pad_reg[4] ),
        .I5(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [0]),
        .O(\gc1.count_d2_reg[0]_0 ));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_4
       (.I0(Q[2]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [2]),
        .I2(\greg.gpcry_sym.diff_pntr_pad_reg[13] [3]),
        .I3(Q[3]),
        .O(S[1]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_4__0
       (.I0(Q[2]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [2]),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [3]),
        .I3(Q[3]),
        .O(\gc1.count_d2_reg[2]_1 [1]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_5
       (.I0(Q[1]),
        .I1(\greg.gpcry_sym.diff_pntr_pad_reg[13] [1]),
        .I2(\greg.gpcry_sym.diff_pntr_pad_reg[13] [2]),
        .I3(Q[2]),
        .O(S[0]));
  LUT4 #(
    .INIT(16'hB44B)) 
    plusOp__0_carry_i_5__0
       (.I0(Q[1]),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [1]),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] [2]),
        .I3(Q[2]),
        .O(\gc1.count_d2_reg[2]_1 [0]));
endmodule

(* ORIG_REF_NAME = "rd_handshaking_flags" *) 
module fifo_Fpjh_data_2_rd_handshaking_flags
   (valid,
    srst,
    ram_valid_i,
    clk);
  output valid;
  input srst;
  input ram_valid_i;
  input clk;

  wire clk;
  wire ram_valid_i;
  wire srst;
  wire valid;

  FDRE #(
    .INIT(1'b0)) 
    \gv.ram_valid_d1_reg 
       (.C(clk),
        .CE(1'b1),
        .D(ram_valid_i),
        .Q(valid),
        .R(srst));
endmodule

(* ORIG_REF_NAME = "rd_logic" *) 
module fifo_Fpjh_data_2_rd_logic
   (out,
    empty,
    almost_empty,
    valid,
    p_7_out,
    D,
    data_count,
    prog_empty,
    Q,
    \gc1.count_d2_reg[0] ,
    enb_array,
    v1_reg,
    \gc1.count_d1_reg[12] ,
    v1_reg_0,
    v1_reg_1,
    ram_empty_fb_i_reg,
    \gc1.count_d2_reg[11] ,
    \gc1.count_d2_reg[2] ,
    \gc1.count_d2_reg[6] ,
    \gc1.count_d2_reg[10] ,
    \greg.ram_rd_en_i_reg ,
    \gc1.count_d2_reg[12] ,
    ram_empty_i_reg,
    ram_empty_i_reg_0,
    \gae.ram_aempty_i_reg ,
    srst,
    clk,
    p_17_out,
    cntr_en,
    DI,
    S,
    \greg.gpcry_sym.diff_pntr_pad_reg[8] ,
    \greg.gpcry_sym.diff_pntr_pad_reg[12] ,
    wr_en,
    ram_empty_i_reg_1,
    rd_en,
    \greg.gpcry_sym.diff_pntr_pad_reg[13] ,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[13] ,
    \gmux.gm[5].gms.ms ,
    eqOp__11,
    prog_full,
    sel_pipe);
  output out;
  output empty;
  output almost_empty;
  output valid;
  output p_7_out;
  output [0:0]D;
  output [12:0]data_count;
  output prog_empty;
  output [12:0]Q;
  output [0:0]\gc1.count_d2_reg[0] ;
  output [1:0]enb_array;
  output [5:0]v1_reg;
  output [0:0]\gc1.count_d1_reg[12] ;
  output [5:0]v1_reg_0;
  output [5:0]v1_reg_1;
  output ram_empty_fb_i_reg;
  output [0:0]\gc1.count_d2_reg[11] ;
  output [1:0]\gc1.count_d2_reg[2] ;
  output [3:0]\gc1.count_d2_reg[6] ;
  output [3:0]\gc1.count_d2_reg[10] ;
  output \greg.ram_rd_en_i_reg ;
  output \gc1.count_d2_reg[12] ;
  input ram_empty_i_reg;
  input [0:0]ram_empty_i_reg_0;
  input [0:0]\gae.ram_aempty_i_reg ;
  input srst;
  input clk;
  input p_17_out;
  input cntr_en;
  input [1:0]DI;
  input [1:0]S;
  input [3:0]\greg.gpcry_sym.diff_pntr_pad_reg[8] ;
  input [3:0]\greg.gpcry_sym.diff_pntr_pad_reg[12] ;
  input wr_en;
  input ram_empty_i_reg_1;
  input rd_en;
  input [12:0]\greg.gpcry_sym.diff_pntr_pad_reg[13] ;
  input [12:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] ;
  input [11:0]\gmux.gm[5].gms.ms ;
  input eqOp__11;
  input prog_full;
  input sel_pipe;

  wire [0:0]D;
  wire [1:0]DI;
  wire [12:0]Q;
  wire [1:0]S;
  wire almost_empty;
  wire [5:0]\c2/v1_reg ;
  wire clk;
  wire cntr_en;
  wire [12:0]data_count;
  wire empty;
  wire [1:0]enb_array;
  wire eqOp__11;
  wire [5:0]\gae.c3/v1_reg ;
  wire [0:0]\gae.ram_aempty_i_reg ;
  wire [0:0]\gc1.count_d1_reg[12] ;
  wire [0:0]\gc1.count_d2_reg[0] ;
  wire [3:0]\gc1.count_d2_reg[10] ;
  wire [0:0]\gc1.count_d2_reg[11] ;
  wire \gc1.count_d2_reg[12] ;
  wire [1:0]\gc1.count_d2_reg[2] ;
  wire [3:0]\gc1.count_d2_reg[6] ;
  wire [12:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] ;
  wire [11:0]\gmux.gm[5].gms.ms ;
  wire [3:0]\greg.gpcry_sym.diff_pntr_pad_reg[12] ;
  wire [12:0]\greg.gpcry_sym.diff_pntr_pad_reg[13] ;
  wire [3:0]\greg.gpcry_sym.diff_pntr_pad_reg[8] ;
  wire \greg.ram_rd_en_i_reg ;
  wire \grss.rsts_n_10 ;
  wire \grss.rsts_n_11 ;
  wire \grss.rsts_n_12 ;
  wire \grss.rsts_n_13 ;
  wire \grss.rsts_n_14 ;
  wire \grss.rsts_n_15 ;
  wire \grss.rsts_n_16 ;
  wire \grss.rsts_n_17 ;
  wire \grss.rsts_n_18 ;
  wire \grss.rsts_n_19 ;
  wire \grss.rsts_n_7 ;
  wire \grss.rsts_n_8 ;
  wire \grss.rsts_n_9 ;
  wire out;
  wire p_17_out;
  wire p_7_out;
  wire prog_empty;
  wire prog_full;
  wire ram_empty_fb_i_reg;
  wire ram_empty_i_reg;
  wire [0:0]ram_empty_i_reg_0;
  wire ram_empty_i_reg_1;
  wire ram_valid_i;
  wire rd_en;
  wire rpntr_n_1;
  wire rpntr_n_47;
  wire rpntr_n_48;
  wire rpntr_n_49;
  wire rpntr_n_50;
  wire rpntr_n_51;
  wire rpntr_n_52;
  wire rpntr_n_53;
  wire rpntr_n_55;
  wire rpntr_n_56;
  wire rpntr_n_57;
  wire rpntr_n_58;
  wire rpntr_n_59;
  wire rpntr_n_60;
  wire rpntr_n_61;
  wire rpntr_n_62;
  wire rpntr_n_63;
  wire rpntr_n_64;
  wire sel_pipe;
  wire srst;
  wire [5:0]v1_reg;
  wire [5:0]v1_reg_0;
  wire [5:0]v1_reg_1;
  wire valid;
  wire wr_en;

  fifo_Fpjh_data_2_rd_handshaking_flags \grhf.rhf 
       (.clk(clk),
        .ram_valid_i(ram_valid_i),
        .srst(srst),
        .valid(valid));
  fifo_Fpjh_data_2_dc_ss \grss.gdc.dc 
       (.O({\grss.rsts_n_7 ,\grss.rsts_n_8 ,\grss.rsts_n_9 ,\grss.rsts_n_10 }),
        .clk(clk),
        .cntr_en(cntr_en),
        .\count_reg[11] ({\grss.rsts_n_15 ,\grss.rsts_n_16 ,\grss.rsts_n_17 ,\grss.rsts_n_18 }),
        .\count_reg[12] (\grss.rsts_n_19 ),
        .\count_reg[7] ({\grss.rsts_n_11 ,\grss.rsts_n_12 ,\grss.rsts_n_13 ,\grss.rsts_n_14 }),
        .data_count(data_count),
        .srst(srst));
  fifo_Fpjh_data_2_rd_pe_ss \grss.gpe.rdpe 
       (.DI({DI,rpntr_n_1}),
        .E(p_7_out),
        .S({rpntr_n_55,rpntr_n_56,S}),
        .clk(clk),
        .eqOp__11(eqOp__11),
        .\greg.gpcry_sym.diff_pntr_pad_reg[12]_0 (\greg.gpcry_sym.diff_pntr_pad_reg[12] ),
        .\greg.gpcry_sym.diff_pntr_pad_reg[12]_1 ({rpntr_n_61,rpntr_n_62,rpntr_n_63,rpntr_n_64}),
        .\greg.gpcry_sym.diff_pntr_pad_reg[13]_0 (rpntr_n_53),
        .\greg.gpcry_sym.diff_pntr_pad_reg[8]_0 (\greg.gpcry_sym.diff_pntr_pad_reg[8] ),
        .\greg.gpcry_sym.diff_pntr_pad_reg[8]_1 ({rpntr_n_57,rpntr_n_58,rpntr_n_59,rpntr_n_60}),
        .\greg.ram_rd_en_i_reg_0 (\greg.ram_rd_en_i_reg ),
        .p_17_out(p_17_out),
        .prog_empty(prog_empty),
        .prog_full(prog_full),
        .srst(srst));
  fifo_Fpjh_data_2_rd_status_flags_ss \grss.rsts 
       (.E(p_7_out),
        .O({\grss.rsts_n_7 ,\grss.rsts_n_8 ,\grss.rsts_n_9 ,\grss.rsts_n_10 }),
        .Q(Q[12]),
        .almost_empty(almost_empty),
        .clk(clk),
        .\count_reg[11] ({\grss.rsts_n_15 ,\grss.rsts_n_16 ,\grss.rsts_n_17 ,\grss.rsts_n_18 }),
        .\count_reg[11]_0 (\grss.rsts_n_19 ),
        .\count_reg[7] ({\grss.rsts_n_11 ,\grss.rsts_n_12 ,\grss.rsts_n_13 ,\grss.rsts_n_14 }),
        .data_count(data_count),
        .empty(empty),
        .enb_array(enb_array[0]),
        .\gae.ram_aempty_i_reg_0 (\gae.ram_aempty_i_reg ),
        .\gmux.gm[1].gms.ms (rpntr_n_47),
        .\gmux.gm[2].gms.ms (rpntr_n_48),
        .\gmux.gm[3].gms.ms (rpntr_n_49),
        .\gmux.gm[4].gms.ms (rpntr_n_50),
        .\gmux.gm[5].gms.ms (rpntr_n_51),
        .\gmux.gm[6].gms.ms (rpntr_n_52),
        .out(out),
        .p_17_out(p_17_out),
        .ram_empty_fb_i_reg_0(ram_empty_fb_i_reg),
        .ram_empty_i_reg_0(ram_empty_i_reg),
        .ram_empty_i_reg_1(ram_empty_i_reg_0),
        .ram_empty_i_reg_2(ram_empty_i_reg_1),
        .ram_valid_i(ram_valid_i),
        .rd_en(rd_en),
        .srst(srst),
        .v1_reg(\c2/v1_reg ),
        .v1_reg_0(\gae.c3/v1_reg ),
        .wr_en(wr_en));
  fifo_Fpjh_data_2_rd_bin_cntr rpntr
       (.D(D),
        .DI(rpntr_n_1),
        .E(p_7_out),
        .Q(Q),
        .S({rpntr_n_55,rpntr_n_56}),
        .clk(clk),
        .enb_array(enb_array[1]),
        .\gc1.count_d1_reg[12]_0 (\gc1.count_d1_reg[12] ),
        .\gc1.count_d2_reg[0]_0 (\gc1.count_d2_reg[0] ),
        .\gc1.count_d2_reg[0]_1 (rpntr_n_47),
        .\gc1.count_d2_reg[10]_0 (rpntr_n_52),
        .\gc1.count_d2_reg[10]_1 ({rpntr_n_61,rpntr_n_62,rpntr_n_63,rpntr_n_64}),
        .\gc1.count_d2_reg[10]_2 (\gc1.count_d2_reg[10] ),
        .\gc1.count_d2_reg[11]_0 (rpntr_n_53),
        .\gc1.count_d2_reg[11]_1 (\gc1.count_d2_reg[11] ),
        .\gc1.count_d2_reg[12]_0 (\gc1.count_d2_reg[12] ),
        .\gc1.count_d2_reg[2]_0 (rpntr_n_48),
        .\gc1.count_d2_reg[2]_1 (\gc1.count_d2_reg[2] ),
        .\gc1.count_d2_reg[4]_0 (rpntr_n_49),
        .\gc1.count_d2_reg[6]_0 (rpntr_n_50),
        .\gc1.count_d2_reg[6]_1 ({rpntr_n_57,rpntr_n_58,rpntr_n_59,rpntr_n_60}),
        .\gc1.count_d2_reg[6]_2 (\gc1.count_d2_reg[6] ),
        .\gc1.count_d2_reg[8]_0 (rpntr_n_51),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] (\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] ),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[4] (ram_empty_i_reg_1),
        .\gmux.gm[5].gms.ms (\gmux.gm[5].gms.ms ),
        .\greg.gpcry_sym.diff_pntr_pad_reg[13] (\greg.gpcry_sym.diff_pntr_pad_reg[13] ),
        .out(out),
        .rd_en(rd_en),
        .sel_pipe(sel_pipe),
        .srst(srst),
        .v1_reg(v1_reg),
        .v1_reg_0(v1_reg_0),
        .v1_reg_1(v1_reg_1),
        .v1_reg_2(\c2/v1_reg ),
        .v1_reg_3(\gae.c3/v1_reg ),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "rd_pe_ss" *) 
module fifo_Fpjh_data_2_rd_pe_ss
   (prog_empty,
    \greg.ram_rd_en_i_reg_0 ,
    srst,
    E,
    clk,
    p_17_out,
    DI,
    S,
    \greg.gpcry_sym.diff_pntr_pad_reg[8]_0 ,
    \greg.gpcry_sym.diff_pntr_pad_reg[8]_1 ,
    \greg.gpcry_sym.diff_pntr_pad_reg[12]_0 ,
    \greg.gpcry_sym.diff_pntr_pad_reg[12]_1 ,
    \greg.gpcry_sym.diff_pntr_pad_reg[13]_0 ,
    eqOp__11,
    prog_full);
  output prog_empty;
  output \greg.ram_rd_en_i_reg_0 ;
  input srst;
  input [0:0]E;
  input clk;
  input p_17_out;
  input [2:0]DI;
  input [3:0]S;
  input [3:0]\greg.gpcry_sym.diff_pntr_pad_reg[8]_0 ;
  input [3:0]\greg.gpcry_sym.diff_pntr_pad_reg[8]_1 ;
  input [3:0]\greg.gpcry_sym.diff_pntr_pad_reg[12]_0 ;
  input [3:0]\greg.gpcry_sym.diff_pntr_pad_reg[12]_1 ;
  input [0:0]\greg.gpcry_sym.diff_pntr_pad_reg[13]_0 ;
  input eqOp__11;
  input prog_full;

  wire [2:0]DI;
  wire [0:0]E;
  wire [3:0]S;
  wire clk;
  wire [13:1]diff_pntr_pad;
  wire eqOp__11;
  wire eqOp__11_0;
  wire \gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_rd_en_i ;
  wire \gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_wr_en_i ;
  wire \gpes.prog_empty_i_i_1_n_0 ;
  wire \gpes.prog_empty_i_i_3_n_0 ;
  wire \gpes.prog_empty_i_i_4_n_0 ;
  wire [3:0]\greg.gpcry_sym.diff_pntr_pad_reg[12]_0 ;
  wire [3:0]\greg.gpcry_sym.diff_pntr_pad_reg[12]_1 ;
  wire [0:0]\greg.gpcry_sym.diff_pntr_pad_reg[13]_0 ;
  wire [3:0]\greg.gpcry_sym.diff_pntr_pad_reg[8]_0 ;
  wire [3:0]\greg.gpcry_sym.diff_pntr_pad_reg[8]_1 ;
  wire \greg.ram_rd_en_i_reg_0 ;
  wire p_17_out;
  wire [13:1]plusOp;
  wire plusOp__0_carry__0_n_0;
  wire plusOp__0_carry__0_n_1;
  wire plusOp__0_carry__0_n_2;
  wire plusOp__0_carry__0_n_3;
  wire plusOp__0_carry__1_n_0;
  wire plusOp__0_carry__1_n_1;
  wire plusOp__0_carry__1_n_2;
  wire plusOp__0_carry__1_n_3;
  wire plusOp__0_carry_n_0;
  wire plusOp__0_carry_n_1;
  wire plusOp__0_carry_n_2;
  wire plusOp__0_carry_n_3;
  wire prog_empty;
  wire prog_full;
  wire srst;
  wire [3:0]NLW_plusOp__0_carry__2_CO_UNCONNECTED;
  wire [3:1]NLW_plusOp__0_carry__2_O_UNCONNECTED;

  LUT5 #(
    .INIT(32'hFFFFAE2A)) 
    \gpes.prog_empty_i_i_1 
       (.I0(prog_empty),
        .I1(eqOp__11_0),
        .I2(\gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_wr_en_i ),
        .I3(\gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_rd_en_i ),
        .I4(srst),
        .O(\gpes.prog_empty_i_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \gpes.prog_empty_i_i_2 
       (.I0(\gpes.prog_empty_i_i_3_n_0 ),
        .I1(\gpes.prog_empty_i_i_4_n_0 ),
        .I2(diff_pntr_pad[8]),
        .I3(diff_pntr_pad[1]),
        .I4(diff_pntr_pad[6]),
        .I5(diff_pntr_pad[2]),
        .O(eqOp__11_0));
  LUT5 #(
    .INIT(32'hDFFFFFFF)) 
    \gpes.prog_empty_i_i_3 
       (.I0(diff_pntr_pad[9]),
        .I1(diff_pntr_pad[12]),
        .I2(diff_pntr_pad[5]),
        .I3(diff_pntr_pad[10]),
        .I4(diff_pntr_pad[7]),
        .O(\gpes.prog_empty_i_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \gpes.prog_empty_i_i_4 
       (.I0(diff_pntr_pad[4]),
        .I1(diff_pntr_pad[3]),
        .I2(diff_pntr_pad[13]),
        .I3(diff_pntr_pad[11]),
        .O(\gpes.prog_empty_i_i_4_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \gpes.prog_empty_i_reg 
       (.C(clk),
        .CE(1'b1),
        .D(\gpes.prog_empty_i_i_1_n_0 ),
        .Q(prog_empty),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hDF40)) 
    \gpfs.prog_full_i_i_1 
       (.I0(\gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_rd_en_i ),
        .I1(\gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_wr_en_i ),
        .I2(eqOp__11),
        .I3(prog_full),
        .O(\greg.ram_rd_en_i_reg_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp[10]),
        .Q(diff_pntr_pad[10]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp[11]),
        .Q(diff_pntr_pad[11]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp[12]),
        .Q(diff_pntr_pad[12]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp[13]),
        .Q(diff_pntr_pad[13]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp[1]),
        .Q(diff_pntr_pad[1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp[2]),
        .Q(diff_pntr_pad[2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp[3]),
        .Q(diff_pntr_pad[3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp[4]),
        .Q(diff_pntr_pad[4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp[5]),
        .Q(diff_pntr_pad[5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp[6]),
        .Q(diff_pntr_pad[6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp[7]),
        .Q(diff_pntr_pad[7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp[8]),
        .Q(diff_pntr_pad[8]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \greg.gpcry_sym.diff_pntr_pad_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp[9]),
        .Q(diff_pntr_pad[9]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \greg.ram_rd_en_i_reg 
       (.C(clk),
        .CE(1'b1),
        .D(E),
        .Q(\gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_rd_en_i ),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \greg.ram_wr_en_i_reg 
       (.C(clk),
        .CE(1'b1),
        .D(p_17_out),
        .Q(\gntv_or_sync_fifo.gl0.wr/gwss.gpf.wrpf/ram_wr_en_i ),
        .R(srst));
  CARRY4 plusOp__0_carry
       (.CI(1'b0),
        .CO({plusOp__0_carry_n_0,plusOp__0_carry_n_1,plusOp__0_carry_n_2,plusOp__0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O(plusOp[4:1]),
        .S(S));
  CARRY4 plusOp__0_carry__0
       (.CI(plusOp__0_carry_n_0),
        .CO({plusOp__0_carry__0_n_0,plusOp__0_carry__0_n_1,plusOp__0_carry__0_n_2,plusOp__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(\greg.gpcry_sym.diff_pntr_pad_reg[8]_0 ),
        .O(plusOp[8:5]),
        .S(\greg.gpcry_sym.diff_pntr_pad_reg[8]_1 ));
  CARRY4 plusOp__0_carry__1
       (.CI(plusOp__0_carry__0_n_0),
        .CO({plusOp__0_carry__1_n_0,plusOp__0_carry__1_n_1,plusOp__0_carry__1_n_2,plusOp__0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(\greg.gpcry_sym.diff_pntr_pad_reg[12]_0 ),
        .O(plusOp[12:9]),
        .S(\greg.gpcry_sym.diff_pntr_pad_reg[12]_1 ));
  CARRY4 plusOp__0_carry__2
       (.CI(plusOp__0_carry__1_n_0),
        .CO(NLW_plusOp__0_carry__2_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp__0_carry__2_O_UNCONNECTED[3:1],plusOp[13]}),
        .S({1'b0,1'b0,1'b0,\greg.gpcry_sym.diff_pntr_pad_reg[13]_0 }));
endmodule

(* ORIG_REF_NAME = "rd_status_flags_ss" *) 
module fifo_Fpjh_data_2_rd_status_flags_ss
   (out,
    empty,
    almost_empty,
    ram_valid_i,
    enb_array,
    E,
    ram_empty_fb_i_reg_0,
    O,
    \count_reg[7] ,
    \count_reg[11] ,
    \count_reg[11]_0 ,
    \gmux.gm[1].gms.ms ,
    \gmux.gm[2].gms.ms ,
    \gmux.gm[3].gms.ms ,
    \gmux.gm[4].gms.ms ,
    \gmux.gm[5].gms.ms ,
    \gmux.gm[6].gms.ms ,
    ram_empty_i_reg_0,
    v1_reg,
    ram_empty_i_reg_1,
    v1_reg_0,
    \gae.ram_aempty_i_reg_0 ,
    srst,
    clk,
    rd_en,
    ram_empty_i_reg_2,
    wr_en,
    p_17_out,
    Q,
    data_count);
  output out;
  output empty;
  output almost_empty;
  output ram_valid_i;
  output [0:0]enb_array;
  output [0:0]E;
  output ram_empty_fb_i_reg_0;
  output [3:0]O;
  output [3:0]\count_reg[7] ;
  output [3:0]\count_reg[11] ;
  output [0:0]\count_reg[11]_0 ;
  input \gmux.gm[1].gms.ms ;
  input \gmux.gm[2].gms.ms ;
  input \gmux.gm[3].gms.ms ;
  input \gmux.gm[4].gms.ms ;
  input \gmux.gm[5].gms.ms ;
  input \gmux.gm[6].gms.ms ;
  input ram_empty_i_reg_0;
  input [5:0]v1_reg;
  input [0:0]ram_empty_i_reg_1;
  input [5:0]v1_reg_0;
  input [0:0]\gae.ram_aempty_i_reg_0 ;
  input srst;
  input clk;
  input rd_en;
  input ram_empty_i_reg_2;
  input wr_en;
  input p_17_out;
  input [0:0]Q;
  input [12:0]data_count;

  wire [0:0]E;
  wire [3:0]O;
  wire [0:0]Q;
  wire almost_empty;
  wire clk;
  wire comp0;
  wire comp1;
  wire \count[11]_i_2_n_0 ;
  wire \count[11]_i_3_n_0 ;
  wire \count[11]_i_4_n_0 ;
  wire \count[11]_i_5_n_0 ;
  wire \count[12]_i_3_n_0 ;
  wire \count[3]_i_2_n_0 ;
  wire \count[3]_i_3_n_0 ;
  wire \count[3]_i_4_n_0 ;
  wire \count[3]_i_5_n_0 ;
  wire \count[3]_i_6_n_0 ;
  wire \count[7]_i_2_n_0 ;
  wire \count[7]_i_3_n_0 ;
  wire \count[7]_i_4_n_0 ;
  wire \count[7]_i_5_n_0 ;
  wire [3:0]\count_reg[11] ;
  wire [0:0]\count_reg[11]_0 ;
  wire \count_reg[11]_i_1_n_0 ;
  wire \count_reg[11]_i_1_n_1 ;
  wire \count_reg[11]_i_1_n_2 ;
  wire \count_reg[11]_i_1_n_3 ;
  wire \count_reg[3]_i_1_n_0 ;
  wire \count_reg[3]_i_1_n_1 ;
  wire \count_reg[3]_i_1_n_2 ;
  wire \count_reg[3]_i_1_n_3 ;
  wire [3:0]\count_reg[7] ;
  wire \count_reg[7]_i_1_n_0 ;
  wire \count_reg[7]_i_1_n_1 ;
  wire \count_reg[7]_i_1_n_2 ;
  wire \count_reg[7]_i_1_n_3 ;
  wire [12:0]data_count;
  wire [0:0]enb_array;
  wire [0:0]\gae.ram_aempty_i_reg_0 ;
  wire \gmux.gm[1].gms.ms ;
  wire \gmux.gm[2].gms.ms ;
  wire \gmux.gm[3].gms.ms ;
  wire \gmux.gm[4].gms.ms ;
  wire \gmux.gm[5].gms.ms ;
  wire \gmux.gm[6].gms.ms ;
  wire p_17_out;
  wire p_1_out;
  (* DONT_TOUCH *) wire ram_empty_fb_i;
  wire ram_empty_fb_i_reg_0;
  (* DONT_TOUCH *) wire ram_empty_i;
  wire ram_empty_i0__3;
  wire ram_empty_i_reg_0;
  wire [0:0]ram_empty_i_reg_1;
  wire ram_empty_i_reg_2;
  wire ram_valid_i;
  wire rd_en;
  wire srst;
  wire [5:0]v1_reg;
  wire [5:0]v1_reg_0;
  wire wr_en;
  wire [3:0]\NLW_count_reg[12]_i_2_CO_UNCONNECTED ;
  wire [3:1]\NLW_count_reg[12]_i_2_O_UNCONNECTED ;

  assign empty = ram_empty_i;
  assign out = ram_empty_fb_i;
  LUT4 #(
    .INIT(16'h00AE)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2 
       (.I0(srst),
        .I1(rd_en),
        .I2(ram_empty_fb_i),
        .I3(Q),
        .O(enb_array));
  LUT3 #(
    .INIT(8'hF4)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__1 
       (.I0(ram_empty_fb_i),
        .I1(rd_en),
        .I2(srst),
        .O(ram_empty_fb_i_reg_0));
  fifo_Fpjh_data_2_compare_2 c1
       (.comp0(comp0),
        .\gmux.gm[1].gms.ms_0 (\gmux.gm[1].gms.ms ),
        .\gmux.gm[2].gms.ms_0 (\gmux.gm[2].gms.ms ),
        .\gmux.gm[3].gms.ms_0 (\gmux.gm[3].gms.ms ),
        .\gmux.gm[4].gms.ms_0 (\gmux.gm[4].gms.ms ),
        .\gmux.gm[5].gms.ms_0 (\gmux.gm[5].gms.ms ),
        .\gmux.gm[6].gms.ms_0 (\gmux.gm[6].gms.ms ),
        .ram_empty_i_reg(ram_empty_i_reg_0));
  fifo_Fpjh_data_2_compare_3 c2
       (.comp0(comp0),
        .comp1(comp1),
        .out(ram_empty_fb_i),
        .ram_empty_i0__3(ram_empty_i0__3),
        .ram_empty_i_reg(ram_empty_i_reg_1),
        .ram_empty_i_reg_0(ram_empty_i_reg_2),
        .rd_en(rd_en),
        .v1_reg(v1_reg),
        .wr_en(wr_en));
  LUT3 #(
    .INIT(8'hB4)) 
    \count[11]_i_2 
       (.I0(ram_empty_fb_i),
        .I1(rd_en),
        .I2(data_count[11]),
        .O(\count[11]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \count[11]_i_3 
       (.I0(ram_empty_fb_i),
        .I1(rd_en),
        .I2(data_count[10]),
        .O(\count[11]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \count[11]_i_4 
       (.I0(ram_empty_fb_i),
        .I1(rd_en),
        .I2(data_count[9]),
        .O(\count[11]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \count[11]_i_5 
       (.I0(ram_empty_fb_i),
        .I1(rd_en),
        .I2(data_count[8]),
        .O(\count[11]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \count[12]_i_3 
       (.I0(ram_empty_fb_i),
        .I1(rd_en),
        .I2(data_count[12]),
        .O(\count[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \count[3]_i_2 
       (.I0(ram_empty_fb_i),
        .I1(rd_en),
        .O(\count[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \count[3]_i_3 
       (.I0(ram_empty_fb_i),
        .I1(rd_en),
        .I2(data_count[3]),
        .O(\count[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \count[3]_i_4 
       (.I0(ram_empty_fb_i),
        .I1(rd_en),
        .I2(data_count[2]),
        .O(\count[3]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \count[3]_i_5 
       (.I0(ram_empty_fb_i),
        .I1(rd_en),
        .I2(data_count[1]),
        .O(\count[3]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \count[3]_i_6 
       (.I0(ram_empty_fb_i),
        .I1(rd_en),
        .I2(data_count[0]),
        .O(\count[3]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \count[7]_i_2 
       (.I0(ram_empty_fb_i),
        .I1(rd_en),
        .I2(data_count[7]),
        .O(\count[7]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \count[7]_i_3 
       (.I0(ram_empty_fb_i),
        .I1(rd_en),
        .I2(data_count[6]),
        .O(\count[7]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \count[7]_i_4 
       (.I0(ram_empty_fb_i),
        .I1(rd_en),
        .I2(data_count[5]),
        .O(\count[7]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \count[7]_i_5 
       (.I0(ram_empty_fb_i),
        .I1(rd_en),
        .I2(data_count[4]),
        .O(\count[7]_i_5_n_0 ));
  CARRY4 \count_reg[11]_i_1 
       (.CI(\count_reg[7]_i_1_n_0 ),
        .CO({\count_reg[11]_i_1_n_0 ,\count_reg[11]_i_1_n_1 ,\count_reg[11]_i_1_n_2 ,\count_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(data_count[11:8]),
        .O(\count_reg[11] ),
        .S({\count[11]_i_2_n_0 ,\count[11]_i_3_n_0 ,\count[11]_i_4_n_0 ,\count[11]_i_5_n_0 }));
  CARRY4 \count_reg[12]_i_2 
       (.CI(\count_reg[11]_i_1_n_0 ),
        .CO(\NLW_count_reg[12]_i_2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_count_reg[12]_i_2_O_UNCONNECTED [3:1],\count_reg[11]_0 }),
        .S({1'b0,1'b0,1'b0,\count[12]_i_3_n_0 }));
  CARRY4 \count_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\count_reg[3]_i_1_n_0 ,\count_reg[3]_i_1_n_1 ,\count_reg[3]_i_1_n_2 ,\count_reg[3]_i_1_n_3 }),
        .CYINIT(\count[3]_i_2_n_0 ),
        .DI(data_count[3:0]),
        .O(O),
        .S({\count[3]_i_3_n_0 ,\count[3]_i_4_n_0 ,\count[3]_i_5_n_0 ,\count[3]_i_6_n_0 }));
  CARRY4 \count_reg[7]_i_1 
       (.CI(\count_reg[3]_i_1_n_0 ),
        .CO({\count_reg[7]_i_1_n_0 ,\count_reg[7]_i_1_n_1 ,\count_reg[7]_i_1_n_2 ,\count_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(data_count[7:4]),
        .O(\count_reg[7] ),
        .S({\count[7]_i_2_n_0 ,\count[7]_i_3_n_0 ,\count[7]_i_4_n_0 ,\count[7]_i_5_n_0 }));
  fifo_Fpjh_data_2_compare_4 \gae.c3 
       (.almost_empty(almost_empty),
        .comp1(comp1),
        .\gae.ram_aempty_i_reg (\gae.ram_aempty_i_reg_0 ),
        .out(ram_empty_fb_i),
        .p_17_out(p_17_out),
        .p_1_out(p_1_out),
        .rd_en(rd_en),
        .v1_reg_0(v1_reg_0));
  FDSE #(
    .INIT(1'b1)) 
    \gae.ram_aempty_i_reg 
       (.C(clk),
        .CE(1'b1),
        .D(p_1_out),
        .Q(almost_empty),
        .S(srst));
  LUT2 #(
    .INIT(4'h2)) 
    \greg.ram_rd_en_i_i_1 
       (.I0(rd_en),
        .I1(ram_empty_fb_i),
        .O(E));
  LUT2 #(
    .INIT(4'h2)) 
    \gv.ram_valid_d1_i_1 
       (.I0(rd_en),
        .I1(ram_empty_i),
        .O(ram_valid_i));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    ram_empty_fb_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(ram_empty_i0__3),
        .Q(ram_empty_fb_i),
        .S(srst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    ram_empty_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(ram_empty_i0__3),
        .Q(ram_empty_i),
        .S(srst));
endmodule

(* ORIG_REF_NAME = "updn_cntr" *) 
module fifo_Fpjh_data_2_updn_cntr
   (data_count,
    srst,
    cntr_en,
    O,
    clk,
    \count_reg[7]_0 ,
    \count_reg[11]_0 ,
    \count_reg[12]_0 );
  output [12:0]data_count;
  input srst;
  input cntr_en;
  input [3:0]O;
  input clk;
  input [3:0]\count_reg[7]_0 ;
  input [3:0]\count_reg[11]_0 ;
  input [0:0]\count_reg[12]_0 ;

  wire [3:0]O;
  wire clk;
  wire cntr_en;
  wire [3:0]\count_reg[11]_0 ;
  wire [0:0]\count_reg[12]_0 ;
  wire [3:0]\count_reg[7]_0 ;
  wire [12:0]data_count;
  wire srst;

  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk),
        .CE(cntr_en),
        .D(O[0]),
        .Q(data_count[0]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[10] 
       (.C(clk),
        .CE(cntr_en),
        .D(\count_reg[11]_0 [2]),
        .Q(data_count[10]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[11] 
       (.C(clk),
        .CE(cntr_en),
        .D(\count_reg[11]_0 [3]),
        .Q(data_count[11]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[12] 
       (.C(clk),
        .CE(cntr_en),
        .D(\count_reg[12]_0 ),
        .Q(data_count[12]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk),
        .CE(cntr_en),
        .D(O[1]),
        .Q(data_count[1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk),
        .CE(cntr_en),
        .D(O[2]),
        .Q(data_count[2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk),
        .CE(cntr_en),
        .D(O[3]),
        .Q(data_count[3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(clk),
        .CE(cntr_en),
        .D(\count_reg[7]_0 [0]),
        .Q(data_count[4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(clk),
        .CE(cntr_en),
        .D(\count_reg[7]_0 [1]),
        .Q(data_count[5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(clk),
        .CE(cntr_en),
        .D(\count_reg[7]_0 [2]),
        .Q(data_count[6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(clk),
        .CE(cntr_en),
        .D(\count_reg[7]_0 [3]),
        .Q(data_count[7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[8] 
       (.C(clk),
        .CE(cntr_en),
        .D(\count_reg[11]_0 [0]),
        .Q(data_count[8]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[9] 
       (.C(clk),
        .CE(cntr_en),
        .D(\count_reg[11]_0 [1]),
        .Q(data_count[9]),
        .R(srst));
endmodule

(* ORIG_REF_NAME = "wr_bin_cntr" *) 
module fifo_Fpjh_data_2_wr_bin_cntr
   (D,
    DI,
    Q,
    \gcc0.gc1.gsym.count_d2_reg[2]_0 ,
    \gcc0.gc1.gsym.count_d2_reg[12]_0 ,
    \gcc0.gc1.gsym.count_d1_reg[6]_0 ,
    \gcc0.gc1.gsym.count_d2_reg[6]_0 ,
    \gcc0.gc1.gsym.count_d1_reg[10]_0 ,
    \gcc0.gc1.gsym.count_d2_reg[10]_0 ,
    v1_reg,
    v1_reg_0,
    \gcc0.gc1.gsym.count_d2_reg[12]_1 ,
    ena_array,
    \gcc0.gc1.gsym.count_d2_reg[12]_2 ,
    \gcc0.gc1.gsym.count_d2_reg[12]_3 ,
    v1_reg_1,
    S,
    \gcc0.gc1.gsym.count_d1_reg[0]_0 ,
    srst,
    E,
    clk,
    \gmux.gm[6].gms.ms ,
    out,
    wr_en,
    \gmux.gm[6].gms.ms_0 ,
    \gmux.gm[6].gms.ms_1 ,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[4] ,
    rd_en,
    p_7_out);
  output [11:0]D;
  output [1:0]DI;
  output [12:0]Q;
  output [1:0]\gcc0.gc1.gsym.count_d2_reg[2]_0 ;
  output [12:0]\gcc0.gc1.gsym.count_d2_reg[12]_0 ;
  output [3:0]\gcc0.gc1.gsym.count_d1_reg[6]_0 ;
  output [3:0]\gcc0.gc1.gsym.count_d2_reg[6]_0 ;
  output [3:0]\gcc0.gc1.gsym.count_d1_reg[10]_0 ;
  output [3:0]\gcc0.gc1.gsym.count_d2_reg[10]_0 ;
  output [0:0]v1_reg;
  output [0:0]v1_reg_0;
  output \gcc0.gc1.gsym.count_d2_reg[12]_1 ;
  output [0:0]ena_array;
  output [0:0]\gcc0.gc1.gsym.count_d2_reg[12]_2 ;
  output [0:0]\gcc0.gc1.gsym.count_d2_reg[12]_3 ;
  output [0:0]v1_reg_1;
  output [1:0]S;
  output [1:0]\gcc0.gc1.gsym.count_d1_reg[0]_0 ;
  input srst;
  input [0:0]E;
  input clk;
  input [11:0]\gmux.gm[6].gms.ms ;
  input out;
  input wr_en;
  input [0:0]\gmux.gm[6].gms.ms_0 ;
  input [0:0]\gmux.gm[6].gms.ms_1 ;
  input \gdiff.gcry_1_sym.diff_pntr_pad_reg[4] ;
  input rd_en;
  input p_7_out;

  wire [11:0]D;
  wire [1:0]DI;
  wire [0:0]E;
  wire [12:0]Q;
  wire [1:0]S;
  wire clk;
  wire [0:0]ena_array;
  wire \gcc0.gc1.gsym.count[0]_i_2_n_0 ;
  wire [1:0]\gcc0.gc1.gsym.count_d1_reg[0]_0 ;
  wire [3:0]\gcc0.gc1.gsym.count_d1_reg[10]_0 ;
  wire [3:0]\gcc0.gc1.gsym.count_d1_reg[6]_0 ;
  wire [3:0]\gcc0.gc1.gsym.count_d2_reg[10]_0 ;
  wire [12:0]\gcc0.gc1.gsym.count_d2_reg[12]_0 ;
  wire \gcc0.gc1.gsym.count_d2_reg[12]_1 ;
  wire [0:0]\gcc0.gc1.gsym.count_d2_reg[12]_2 ;
  wire [0:0]\gcc0.gc1.gsym.count_d2_reg[12]_3 ;
  wire [1:0]\gcc0.gc1.gsym.count_d2_reg[2]_0 ;
  wire [3:0]\gcc0.gc1.gsym.count_d2_reg[6]_0 ;
  wire \gcc0.gc1.gsym.count_reg[0]_i_1_n_0 ;
  wire \gcc0.gc1.gsym.count_reg[0]_i_1_n_1 ;
  wire \gcc0.gc1.gsym.count_reg[0]_i_1_n_2 ;
  wire \gcc0.gc1.gsym.count_reg[0]_i_1_n_3 ;
  wire \gcc0.gc1.gsym.count_reg[0]_i_1_n_4 ;
  wire \gcc0.gc1.gsym.count_reg[0]_i_1_n_5 ;
  wire \gcc0.gc1.gsym.count_reg[0]_i_1_n_6 ;
  wire \gcc0.gc1.gsym.count_reg[0]_i_1_n_7 ;
  wire \gcc0.gc1.gsym.count_reg[12]_i_1_n_7 ;
  wire \gcc0.gc1.gsym.count_reg[4]_i_1_n_0 ;
  wire \gcc0.gc1.gsym.count_reg[4]_i_1_n_1 ;
  wire \gcc0.gc1.gsym.count_reg[4]_i_1_n_2 ;
  wire \gcc0.gc1.gsym.count_reg[4]_i_1_n_3 ;
  wire \gcc0.gc1.gsym.count_reg[4]_i_1_n_4 ;
  wire \gcc0.gc1.gsym.count_reg[4]_i_1_n_5 ;
  wire \gcc0.gc1.gsym.count_reg[4]_i_1_n_6 ;
  wire \gcc0.gc1.gsym.count_reg[4]_i_1_n_7 ;
  wire \gcc0.gc1.gsym.count_reg[8]_i_1_n_0 ;
  wire \gcc0.gc1.gsym.count_reg[8]_i_1_n_1 ;
  wire \gcc0.gc1.gsym.count_reg[8]_i_1_n_2 ;
  wire \gcc0.gc1.gsym.count_reg[8]_i_1_n_3 ;
  wire \gcc0.gc1.gsym.count_reg[8]_i_1_n_4 ;
  wire \gcc0.gc1.gsym.count_reg[8]_i_1_n_5 ;
  wire \gcc0.gc1.gsym.count_reg[8]_i_1_n_6 ;
  wire \gcc0.gc1.gsym.count_reg[8]_i_1_n_7 ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg[4] ;
  wire [11:0]\gmux.gm[6].gms.ms ;
  wire [0:0]\gmux.gm[6].gms.ms_0 ;
  wire [0:0]\gmux.gm[6].gms.ms_1 ;
  wire out;
  wire p_7_out;
  wire rd_en;
  wire srst;
  wire [0:0]v1_reg;
  wire [0:0]v1_reg_0;
  wire [0:0]v1_reg_1;
  wire wr_en;
  wire [12:12]wr_pntr_plus2;
  wire [3:0]\NLW_gcc0.gc1.gsym.count_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_gcc0.gc1.gsym.count_reg[12]_i_1_O_UNCONNECTED ;

  LUT3 #(
    .INIT(8'h20)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1 
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [12]),
        .I1(out),
        .I2(wr_en),
        .O(ena_array));
  LUT1 #(
    .INIT(2'h1)) 
    \gcc0.gc1.gsym.count[0]_i_2 
       (.I0(D[0]),
        .O(\gcc0.gc1.gsym.count[0]_i_2_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \gcc0.gc1.gsym.count_d1_reg[0] 
       (.C(clk),
        .CE(E),
        .D(D[0]),
        .Q(Q[0]),
        .S(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[10] 
       (.C(clk),
        .CE(E),
        .D(D[10]),
        .Q(Q[10]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[11] 
       (.C(clk),
        .CE(E),
        .D(D[11]),
        .Q(Q[11]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[12] 
       (.C(clk),
        .CE(E),
        .D(wr_pntr_plus2),
        .Q(Q[12]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[1] 
       (.C(clk),
        .CE(E),
        .D(D[1]),
        .Q(Q[1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[2] 
       (.C(clk),
        .CE(E),
        .D(D[2]),
        .Q(Q[2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[3] 
       (.C(clk),
        .CE(E),
        .D(D[3]),
        .Q(Q[3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[4] 
       (.C(clk),
        .CE(E),
        .D(D[4]),
        .Q(Q[4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[5] 
       (.C(clk),
        .CE(E),
        .D(D[5]),
        .Q(Q[5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[6] 
       (.C(clk),
        .CE(E),
        .D(D[6]),
        .Q(Q[6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[7] 
       (.C(clk),
        .CE(E),
        .D(D[7]),
        .Q(Q[7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[8] 
       (.C(clk),
        .CE(E),
        .D(D[8]),
        .Q(Q[8]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d1_reg[9] 
       (.C(clk),
        .CE(E),
        .D(D[9]),
        .Q(Q[9]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[0] 
       (.C(clk),
        .CE(E),
        .D(Q[0]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[12]_0 [0]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[10] 
       (.C(clk),
        .CE(E),
        .D(Q[10]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[12]_0 [10]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[11] 
       (.C(clk),
        .CE(E),
        .D(Q[11]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[12]_0 [11]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[12] 
       (.C(clk),
        .CE(E),
        .D(Q[12]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[12]_0 [12]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[1] 
       (.C(clk),
        .CE(E),
        .D(Q[1]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[12]_0 [1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[2] 
       (.C(clk),
        .CE(E),
        .D(Q[2]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[12]_0 [2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[3] 
       (.C(clk),
        .CE(E),
        .D(Q[3]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[12]_0 [3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[4] 
       (.C(clk),
        .CE(E),
        .D(Q[4]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[12]_0 [4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[5] 
       (.C(clk),
        .CE(E),
        .D(Q[5]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[12]_0 [5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[6] 
       (.C(clk),
        .CE(E),
        .D(Q[6]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[12]_0 [6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[7] 
       (.C(clk),
        .CE(E),
        .D(Q[7]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[12]_0 [7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[8] 
       (.C(clk),
        .CE(E),
        .D(Q[8]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[12]_0 [8]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_d2_reg[9] 
       (.C(clk),
        .CE(E),
        .D(Q[9]),
        .Q(\gcc0.gc1.gsym.count_d2_reg[12]_0 [9]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[0] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[0]_i_1_n_7 ),
        .Q(D[0]),
        .R(srst));
  CARRY4 \gcc0.gc1.gsym.count_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\gcc0.gc1.gsym.count_reg[0]_i_1_n_0 ,\gcc0.gc1.gsym.count_reg[0]_i_1_n_1 ,\gcc0.gc1.gsym.count_reg[0]_i_1_n_2 ,\gcc0.gc1.gsym.count_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\gcc0.gc1.gsym.count_reg[0]_i_1_n_4 ,\gcc0.gc1.gsym.count_reg[0]_i_1_n_5 ,\gcc0.gc1.gsym.count_reg[0]_i_1_n_6 ,\gcc0.gc1.gsym.count_reg[0]_i_1_n_7 }),
        .S({D[3:1],\gcc0.gc1.gsym.count[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[10] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[8]_i_1_n_5 ),
        .Q(D[10]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[11] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[8]_i_1_n_4 ),
        .Q(D[11]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[12] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[12]_i_1_n_7 ),
        .Q(wr_pntr_plus2),
        .R(srst));
  CARRY4 \gcc0.gc1.gsym.count_reg[12]_i_1 
       (.CI(\gcc0.gc1.gsym.count_reg[8]_i_1_n_0 ),
        .CO(\NLW_gcc0.gc1.gsym.count_reg[12]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_gcc0.gc1.gsym.count_reg[12]_i_1_O_UNCONNECTED [3:1],\gcc0.gc1.gsym.count_reg[12]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,wr_pntr_plus2}));
  FDSE #(
    .INIT(1'b1)) 
    \gcc0.gc1.gsym.count_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[0]_i_1_n_6 ),
        .Q(D[1]),
        .S(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[2] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[0]_i_1_n_5 ),
        .Q(D[2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[0]_i_1_n_4 ),
        .Q(D[3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[4] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[4]_i_1_n_7 ),
        .Q(D[4]),
        .R(srst));
  CARRY4 \gcc0.gc1.gsym.count_reg[4]_i_1 
       (.CI(\gcc0.gc1.gsym.count_reg[0]_i_1_n_0 ),
        .CO({\gcc0.gc1.gsym.count_reg[4]_i_1_n_0 ,\gcc0.gc1.gsym.count_reg[4]_i_1_n_1 ,\gcc0.gc1.gsym.count_reg[4]_i_1_n_2 ,\gcc0.gc1.gsym.count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\gcc0.gc1.gsym.count_reg[4]_i_1_n_4 ,\gcc0.gc1.gsym.count_reg[4]_i_1_n_5 ,\gcc0.gc1.gsym.count_reg[4]_i_1_n_6 ,\gcc0.gc1.gsym.count_reg[4]_i_1_n_7 }),
        .S(D[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[5] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[4]_i_1_n_6 ),
        .Q(D[5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[6] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[4]_i_1_n_5 ),
        .Q(D[6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[7] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[4]_i_1_n_4 ),
        .Q(D[7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[8] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[8]_i_1_n_7 ),
        .Q(D[8]),
        .R(srst));
  CARRY4 \gcc0.gc1.gsym.count_reg[8]_i_1 
       (.CI(\gcc0.gc1.gsym.count_reg[4]_i_1_n_0 ),
        .CO({\gcc0.gc1.gsym.count_reg[8]_i_1_n_0 ,\gcc0.gc1.gsym.count_reg[8]_i_1_n_1 ,\gcc0.gc1.gsym.count_reg[8]_i_1_n_2 ,\gcc0.gc1.gsym.count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\gcc0.gc1.gsym.count_reg[8]_i_1_n_4 ,\gcc0.gc1.gsym.count_reg[8]_i_1_n_5 ,\gcc0.gc1.gsym.count_reg[8]_i_1_n_6 ,\gcc0.gc1.gsym.count_reg[8]_i_1_n_7 }),
        .S(D[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc1.gsym.count_reg[9] 
       (.C(clk),
        .CE(E),
        .D(\gcc0.gc1.gsym.count_reg[8]_i_1_n_6 ),
        .Q(D[9]),
        .R(srst));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[6].gms.ms_i_1 
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [12]),
        .I1(\gmux.gm[6].gms.ms_0 ),
        .O(\gcc0.gc1.gsym.count_d2_reg[12]_2 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[6].gms.ms_i_1__0 
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [12]),
        .I1(\gmux.gm[6].gms.ms_1 ),
        .O(\gcc0.gc1.gsym.count_d2_reg[12]_3 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[6].gms.ms_i_1__1 
       (.I0(wr_pntr_plus2),
        .I1(\gmux.gm[6].gms.ms [11]),
        .O(v1_reg_1));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[6].gms.ms_i_1__2 
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [12]),
        .I1(\gmux.gm[6].gms.ms [11]),
        .O(v1_reg));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[6].gms.ms_i_1__3 
       (.I0(Q[12]),
        .I1(\gmux.gm[6].gms.ms [11]),
        .O(v1_reg_0));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[6].gms.ms_i_1__4 
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [12]),
        .I1(\gmux.gm[6].gms.ms [11]),
        .O(\gcc0.gc1.gsym.count_d2_reg[12]_1 ));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_1
       (.I0(Q[6]),
        .I1(\gmux.gm[6].gms.ms [6]),
        .O(\gcc0.gc1.gsym.count_d1_reg[6]_0 [3]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_1__0
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [6]),
        .I1(\gmux.gm[6].gms.ms [6]),
        .O(\gcc0.gc1.gsym.count_d2_reg[6]_0 [3]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_2
       (.I0(Q[5]),
        .I1(\gmux.gm[6].gms.ms [5]),
        .O(\gcc0.gc1.gsym.count_d1_reg[6]_0 [2]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_2__0
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [5]),
        .I1(\gmux.gm[6].gms.ms [5]),
        .O(\gcc0.gc1.gsym.count_d2_reg[6]_0 [2]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_3
       (.I0(Q[4]),
        .I1(\gmux.gm[6].gms.ms [4]),
        .O(\gcc0.gc1.gsym.count_d1_reg[6]_0 [1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_3__0
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [4]),
        .I1(\gmux.gm[6].gms.ms [4]),
        .O(\gcc0.gc1.gsym.count_d2_reg[6]_0 [1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_4
       (.I0(Q[3]),
        .I1(\gmux.gm[6].gms.ms [3]),
        .O(\gcc0.gc1.gsym.count_d1_reg[6]_0 [0]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__0_i_4__0
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [3]),
        .I1(\gmux.gm[6].gms.ms [3]),
        .O(\gcc0.gc1.gsym.count_d2_reg[6]_0 [0]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__1_i_1
       (.I0(Q[10]),
        .I1(\gmux.gm[6].gms.ms [10]),
        .O(\gcc0.gc1.gsym.count_d1_reg[10]_0 [3]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__1_i_1__0
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [10]),
        .I1(\gmux.gm[6].gms.ms [10]),
        .O(\gcc0.gc1.gsym.count_d2_reg[10]_0 [3]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__1_i_2
       (.I0(Q[9]),
        .I1(\gmux.gm[6].gms.ms [9]),
        .O(\gcc0.gc1.gsym.count_d1_reg[10]_0 [2]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__1_i_2__0
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [9]),
        .I1(\gmux.gm[6].gms.ms [9]),
        .O(\gcc0.gc1.gsym.count_d2_reg[10]_0 [2]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__1_i_3
       (.I0(Q[8]),
        .I1(\gmux.gm[6].gms.ms [8]),
        .O(\gcc0.gc1.gsym.count_d1_reg[10]_0 [1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__1_i_3__0
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [8]),
        .I1(\gmux.gm[6].gms.ms [8]),
        .O(\gcc0.gc1.gsym.count_d2_reg[10]_0 [1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__1_i_4
       (.I0(Q[7]),
        .I1(\gmux.gm[6].gms.ms [7]),
        .O(\gcc0.gc1.gsym.count_d1_reg[10]_0 [0]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry__1_i_4__0
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [7]),
        .I1(\gmux.gm[6].gms.ms [7]),
        .O(\gcc0.gc1.gsym.count_d2_reg[10]_0 [0]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_1
       (.I0(Q[2]),
        .I1(\gmux.gm[6].gms.ms [2]),
        .O(DI[1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_1__0
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [2]),
        .I1(\gmux.gm[6].gms.ms [2]),
        .O(\gcc0.gc1.gsym.count_d2_reg[2]_0 [1]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_2
       (.I0(Q[1]),
        .I1(\gmux.gm[6].gms.ms [1]),
        .O(DI[0]));
  LUT2 #(
    .INIT(4'h2)) 
    plusOp__0_carry_i_2__0
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [1]),
        .I1(\gmux.gm[6].gms.ms [1]),
        .O(\gcc0.gc1.gsym.count_d2_reg[2]_0 [0]));
  LUT6 #(
    .INIT(64'h5D04A2FBA2FB5D04)) 
    plusOp__0_carry_i_6
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [0]),
        .I1(p_7_out),
        .I2(E),
        .I3(\gmux.gm[6].gms.ms [0]),
        .I4(\gcc0.gc1.gsym.count_d2_reg[12]_0 [1]),
        .I5(\gmux.gm[6].gms.ms [1]),
        .O(S[1]));
  LUT6 #(
    .INIT(64'hF75108AE08AEF751)) 
    plusOp__0_carry_i_6__0
       (.I0(Q[0]),
        .I1(E),
        .I2(p_7_out),
        .I3(\gmux.gm[6].gms.ms [0]),
        .I4(Q[1]),
        .I5(\gmux.gm[6].gms.ms [1]),
        .O(\gcc0.gc1.gsym.count_d1_reg[0]_0 [1]));
  LUT6 #(
    .INIT(64'h6966666669666966)) 
    plusOp__0_carry_i_7
       (.I0(\gcc0.gc1.gsym.count_d2_reg[12]_0 [0]),
        .I1(\gmux.gm[6].gms.ms [0]),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg[4] ),
        .I3(rd_en),
        .I4(out),
        .I5(wr_en),
        .O(S[0]));
  LUT6 #(
    .INIT(64'h9699999996999699)) 
    plusOp__0_carry_i_7__0
       (.I0(Q[0]),
        .I1(\gmux.gm[6].gms.ms [0]),
        .I2(out),
        .I3(wr_en),
        .I4(\gdiff.gcry_1_sym.diff_pntr_pad_reg[4] ),
        .I5(rd_en),
        .O(\gcc0.gc1.gsym.count_d1_reg[0]_0 [0]));
endmodule

(* ORIG_REF_NAME = "wr_logic" *) 
module fifo_Fpjh_data_2_wr_logic
   (out,
    full,
    almost_full,
    D,
    p_17_out,
    prog_full,
    Q,
    DI,
    \gcc0.gc1.gsym.count_d2_reg[12] ,
    \gcc0.gc1.gsym.count_d2_reg[6] ,
    \gcc0.gc1.gsym.count_d2_reg[10] ,
    \gcc0.gc1.gsym.count_d2_reg[12]_0 ,
    cntr_en,
    ena_array,
    \gcc0.gc1.gsym.count_d2_reg[12]_1 ,
    \gcc0.gc1.gsym.count_d2_reg[12]_2 ,
    eqOp__11,
    wr_en_0,
    S,
    \gmux.gm[6].gms.ms ,
    \gmux.gm[6].gms.ms_0 ,
    \gmux.gm[6].gms.ms_1 ,
    srst,
    clk,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[4] ,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[4]_0 ,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[12] ,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[13] ,
    \gpfs.prog_full_i_reg ,
    \gmux.gm[6].gms.ms_2 ,
    wr_en,
    \gaf.gaf0.ram_afull_i_reg ,
    rd_en,
    \gmux.gm[6].gms.ms_3 ,
    \gmux.gm[6].gms.ms_4 ,
    p_7_out);
  output out;
  output full;
  output almost_full;
  output [11:0]D;
  output p_17_out;
  output prog_full;
  output [12:0]Q;
  output [1:0]DI;
  output [12:0]\gcc0.gc1.gsym.count_d2_reg[12] ;
  output [3:0]\gcc0.gc1.gsym.count_d2_reg[6] ;
  output [3:0]\gcc0.gc1.gsym.count_d2_reg[10] ;
  output \gcc0.gc1.gsym.count_d2_reg[12]_0 ;
  output cntr_en;
  output [1:0]ena_array;
  output [0:0]\gcc0.gc1.gsym.count_d2_reg[12]_1 ;
  output [0:0]\gcc0.gc1.gsym.count_d2_reg[12]_2 ;
  output eqOp__11;
  output wr_en_0;
  output [1:0]S;
  input [5:0]\gmux.gm[6].gms.ms ;
  input [5:0]\gmux.gm[6].gms.ms_0 ;
  input [5:0]\gmux.gm[6].gms.ms_1 ;
  input srst;
  input clk;
  input [0:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[4] ;
  input [1:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[4]_0 ;
  input [3:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ;
  input [3:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[12] ;
  input [0:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] ;
  input \gpfs.prog_full_i_reg ;
  input [11:0]\gmux.gm[6].gms.ms_2 ;
  input wr_en;
  input \gaf.gaf0.ram_afull_i_reg ;
  input rd_en;
  input [0:0]\gmux.gm[6].gms.ms_3 ;
  input [0:0]\gmux.gm[6].gms.ms_4 ;
  input p_7_out;

  wire [11:0]D;
  wire [1:0]DI;
  wire [12:0]Q;
  wire [1:0]S;
  wire almost_full;
  wire [6:6]\c0/v1_reg ;
  wire [6:6]\c1/v1_reg ;
  wire clk;
  wire cntr_en;
  wire [1:0]ena_array;
  wire eqOp__11;
  wire full;
  wire [6:6]\gaf.c2/v1_reg ;
  wire \gaf.gaf0.ram_afull_i_reg ;
  wire [3:0]\gcc0.gc1.gsym.count_d2_reg[10] ;
  wire [12:0]\gcc0.gc1.gsym.count_d2_reg[12] ;
  wire \gcc0.gc1.gsym.count_d2_reg[12]_0 ;
  wire [0:0]\gcc0.gc1.gsym.count_d2_reg[12]_1 ;
  wire [0:0]\gcc0.gc1.gsym.count_d2_reg[12]_2 ;
  wire [3:0]\gcc0.gc1.gsym.count_d2_reg[6] ;
  wire [3:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[12] ;
  wire [0:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] ;
  wire [0:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[4] ;
  wire [1:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[4]_0 ;
  wire [3:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ;
  wire [5:0]\gmux.gm[6].gms.ms ;
  wire [5:0]\gmux.gm[6].gms.ms_0 ;
  wire [5:0]\gmux.gm[6].gms.ms_1 ;
  wire [11:0]\gmux.gm[6].gms.ms_2 ;
  wire [0:0]\gmux.gm[6].gms.ms_3 ;
  wire [0:0]\gmux.gm[6].gms.ms_4 ;
  wire \gpfs.prog_full_i_reg ;
  wire out;
  wire p_17_out;
  wire p_7_out;
  wire prog_full;
  wire rd_en;
  wire srst;
  wire wpntr_n_12;
  wire wpntr_n_13;
  wire wpntr_n_42;
  wire wpntr_n_43;
  wire wpntr_n_44;
  wire wpntr_n_45;
  wire wpntr_n_50;
  wire wpntr_n_51;
  wire wpntr_n_52;
  wire wpntr_n_53;
  wire wpntr_n_67;
  wire wpntr_n_68;
  wire wr_en;
  wire wr_en_0;

  fifo_Fpjh_data_2_wr_pf_ss \gwss.gpf.wrpf 
       (.DI({wpntr_n_12,wpntr_n_13,\gdiff.gcry_1_sym.diff_pntr_pad_reg[4] }),
        .S({\gdiff.gcry_1_sym.diff_pntr_pad_reg[4]_0 ,wpntr_n_67,wpntr_n_68}),
        .clk(clk),
        .eqOp__11(eqOp__11),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[12]_0 ({wpntr_n_50,wpntr_n_51,wpntr_n_52,wpntr_n_53}),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[12]_1 (\gdiff.gcry_1_sym.diff_pntr_pad_reg[12] ),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[13]_0 (\gdiff.gcry_1_sym.diff_pntr_pad_reg[13] ),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_0 ({wpntr_n_42,wpntr_n_43,wpntr_n_44,wpntr_n_45}),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_1 (\gdiff.gcry_1_sym.diff_pntr_pad_reg[8] ),
        .\gpfs.prog_full_i_reg_0 (\gpfs.prog_full_i_reg ),
        .prog_full(prog_full),
        .srst(srst));
  fifo_Fpjh_data_2_wr_status_flags_ss \gwss.wsts 
       (.E(p_17_out),
        .Q(\gcc0.gc1.gsym.count_d2_reg[12] [12]),
        .almost_full(almost_full),
        .clk(clk),
        .cntr_en(cntr_en),
        .ena_array(ena_array[0]),
        .full(full),
        .\gaf.gaf0.ram_afull_i_reg_0 (\gaf.gaf0.ram_afull_i_reg ),
        .\gmux.gm[6].gms.ms (\gmux.gm[6].gms.ms ),
        .\gmux.gm[6].gms.ms_0 (\gmux.gm[6].gms.ms_0 ),
        .\gmux.gm[6].gms.ms_1 (\gmux.gm[6].gms.ms_1 ),
        .out(out),
        .rd_en(rd_en),
        .srst(srst),
        .v1_reg(\c0/v1_reg ),
        .v1_reg_0(\c1/v1_reg ),
        .v1_reg_1(\gaf.c2/v1_reg ),
        .wr_en(wr_en),
        .wr_en_0(wr_en_0));
  fifo_Fpjh_data_2_wr_bin_cntr wpntr
       (.D(D),
        .DI({wpntr_n_12,wpntr_n_13}),
        .E(p_17_out),
        .Q(Q),
        .S(S),
        .clk(clk),
        .ena_array(ena_array[1]),
        .\gcc0.gc1.gsym.count_d1_reg[0]_0 ({wpntr_n_67,wpntr_n_68}),
        .\gcc0.gc1.gsym.count_d1_reg[10]_0 ({wpntr_n_50,wpntr_n_51,wpntr_n_52,wpntr_n_53}),
        .\gcc0.gc1.gsym.count_d1_reg[6]_0 ({wpntr_n_42,wpntr_n_43,wpntr_n_44,wpntr_n_45}),
        .\gcc0.gc1.gsym.count_d2_reg[10]_0 (\gcc0.gc1.gsym.count_d2_reg[10] ),
        .\gcc0.gc1.gsym.count_d2_reg[12]_0 (\gcc0.gc1.gsym.count_d2_reg[12] ),
        .\gcc0.gc1.gsym.count_d2_reg[12]_1 (\gcc0.gc1.gsym.count_d2_reg[12]_0 ),
        .\gcc0.gc1.gsym.count_d2_reg[12]_2 (\gcc0.gc1.gsym.count_d2_reg[12]_1 ),
        .\gcc0.gc1.gsym.count_d2_reg[12]_3 (\gcc0.gc1.gsym.count_d2_reg[12]_2 ),
        .\gcc0.gc1.gsym.count_d2_reg[2]_0 (DI),
        .\gcc0.gc1.gsym.count_d2_reg[6]_0 (\gcc0.gc1.gsym.count_d2_reg[6] ),
        .\gdiff.gcry_1_sym.diff_pntr_pad_reg[4] (\gaf.gaf0.ram_afull_i_reg ),
        .\gmux.gm[6].gms.ms (\gmux.gm[6].gms.ms_2 ),
        .\gmux.gm[6].gms.ms_0 (\gmux.gm[6].gms.ms_3 ),
        .\gmux.gm[6].gms.ms_1 (\gmux.gm[6].gms.ms_4 ),
        .out(out),
        .p_7_out(p_7_out),
        .rd_en(rd_en),
        .srst(srst),
        .v1_reg(\c0/v1_reg ),
        .v1_reg_0(\c1/v1_reg ),
        .v1_reg_1(\gaf.c2/v1_reg ),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "wr_pf_ss" *) 
module fifo_Fpjh_data_2_wr_pf_ss
   (prog_full,
    eqOp__11,
    DI,
    S,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_0 ,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_1 ,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[12]_0 ,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[12]_1 ,
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[13]_0 ,
    srst,
    \gpfs.prog_full_i_reg_0 ,
    clk);
  output prog_full;
  output eqOp__11;
  input [2:0]DI;
  input [3:0]S;
  input [3:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_0 ;
  input [3:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_1 ;
  input [3:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[12]_0 ;
  input [3:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[12]_1 ;
  input [0:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[13]_0 ;
  input srst;
  input \gpfs.prog_full_i_reg_0 ;
  input clk;

  wire [2:0]DI;
  wire [3:0]S;
  wire clk;
  wire eqOp__11;
  wire [3:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[12]_0 ;
  wire [3:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[12]_1 ;
  wire [0:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[13]_0 ;
  wire [3:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_0 ;
  wire [3:0]\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_1 ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[10] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[11] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[12] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[13] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[1] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[2] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[3] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[4] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[5] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[6] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[7] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[8] ;
  wire \gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[9] ;
  wire \gpfs.prog_full_i_i_3_n_0 ;
  wire \gpfs.prog_full_i_i_4_n_0 ;
  wire \gpfs.prog_full_i_reg_0 ;
  wire plusOp__0_carry__0_n_0;
  wire plusOp__0_carry__0_n_1;
  wire plusOp__0_carry__0_n_2;
  wire plusOp__0_carry__0_n_3;
  wire plusOp__0_carry__0_n_4;
  wire plusOp__0_carry__0_n_5;
  wire plusOp__0_carry__0_n_6;
  wire plusOp__0_carry__0_n_7;
  wire plusOp__0_carry__1_n_0;
  wire plusOp__0_carry__1_n_1;
  wire plusOp__0_carry__1_n_2;
  wire plusOp__0_carry__1_n_3;
  wire plusOp__0_carry__1_n_4;
  wire plusOp__0_carry__1_n_5;
  wire plusOp__0_carry__1_n_6;
  wire plusOp__0_carry__1_n_7;
  wire plusOp__0_carry__2_n_7;
  wire plusOp__0_carry_n_0;
  wire plusOp__0_carry_n_1;
  wire plusOp__0_carry_n_2;
  wire plusOp__0_carry_n_3;
  wire plusOp__0_carry_n_4;
  wire plusOp__0_carry_n_5;
  wire plusOp__0_carry_n_6;
  wire plusOp__0_carry_n_7;
  wire prog_full;
  wire srst;
  wire [3:0]NLW_plusOp__0_carry__2_CO_UNCONNECTED;
  wire [3:1]NLW_plusOp__0_carry__2_O_UNCONNECTED;

  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp__0_carry__1_n_6),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[10] ),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp__0_carry__1_n_5),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[11] ),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp__0_carry__1_n_4),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[12] ),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp__0_carry__2_n_7),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[13] ),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_7),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[1] ),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_6),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[2] ),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_5),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[3] ),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp__0_carry_n_4),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[4] ),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp__0_carry__0_n_7),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[5] ),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp__0_carry__0_n_6),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[6] ),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp__0_carry__0_n_5),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[7] ),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp__0_carry__0_n_4),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[8] ),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gdiff.gcry_1_sym.diff_pntr_pad_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp__0_carry__1_n_7),
        .Q(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[9] ),
        .R(srst));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \gpfs.prog_full_i_i_2 
       (.I0(\gpfs.prog_full_i_i_3_n_0 ),
        .I1(\gpfs.prog_full_i_i_4_n_0 ),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[8] ),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[9] ),
        .I4(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[6] ),
        .I5(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[7] ),
        .O(eqOp__11));
  LUT5 #(
    .INIT(32'hFFFDFFFF)) 
    \gpfs.prog_full_i_i_3 
       (.I0(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[1] ),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[11] ),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[10] ),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[12] ),
        .I4(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[2] ),
        .O(\gpfs.prog_full_i_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \gpfs.prog_full_i_i_4 
       (.I0(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[4] ),
        .I1(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[5] ),
        .I2(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[13] ),
        .I3(\gdiff.gcry_1_sym.diff_pntr_pad_reg_n_0_[3] ),
        .O(\gpfs.prog_full_i_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gpfs.prog_full_i_reg 
       (.C(clk),
        .CE(1'b1),
        .D(\gpfs.prog_full_i_reg_0 ),
        .Q(prog_full),
        .R(srst));
  CARRY4 plusOp__0_carry
       (.CI(1'b0),
        .CO({plusOp__0_carry_n_0,plusOp__0_carry_n_1,plusOp__0_carry_n_2,plusOp__0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O({plusOp__0_carry_n_4,plusOp__0_carry_n_5,plusOp__0_carry_n_6,plusOp__0_carry_n_7}),
        .S(S));
  CARRY4 plusOp__0_carry__0
       (.CI(plusOp__0_carry_n_0),
        .CO({plusOp__0_carry__0_n_0,plusOp__0_carry__0_n_1,plusOp__0_carry__0_n_2,plusOp__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_0 ),
        .O({plusOp__0_carry__0_n_4,plusOp__0_carry__0_n_5,plusOp__0_carry__0_n_6,plusOp__0_carry__0_n_7}),
        .S(\gdiff.gcry_1_sym.diff_pntr_pad_reg[8]_1 ));
  CARRY4 plusOp__0_carry__1
       (.CI(plusOp__0_carry__0_n_0),
        .CO({plusOp__0_carry__1_n_0,plusOp__0_carry__1_n_1,plusOp__0_carry__1_n_2,plusOp__0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(\gdiff.gcry_1_sym.diff_pntr_pad_reg[12]_0 ),
        .O({plusOp__0_carry__1_n_4,plusOp__0_carry__1_n_5,plusOp__0_carry__1_n_6,plusOp__0_carry__1_n_7}),
        .S(\gdiff.gcry_1_sym.diff_pntr_pad_reg[12]_1 ));
  CARRY4 plusOp__0_carry__2
       (.CI(plusOp__0_carry__1_n_0),
        .CO(NLW_plusOp__0_carry__2_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp__0_carry__2_O_UNCONNECTED[3:1],plusOp__0_carry__2_n_7}),
        .S({1'b0,1'b0,1'b0,\gdiff.gcry_1_sym.diff_pntr_pad_reg[13]_0 }));
endmodule

(* ORIG_REF_NAME = "wr_status_flags_ss" *) 
module fifo_Fpjh_data_2_wr_status_flags_ss
   (out,
    full,
    almost_full,
    cntr_en,
    E,
    ena_array,
    wr_en_0,
    \gmux.gm[6].gms.ms ,
    v1_reg,
    \gmux.gm[6].gms.ms_0 ,
    v1_reg_0,
    \gmux.gm[6].gms.ms_1 ,
    v1_reg_1,
    srst,
    clk,
    wr_en,
    \gaf.gaf0.ram_afull_i_reg_0 ,
    rd_en,
    Q);
  output out;
  output full;
  output almost_full;
  output cntr_en;
  output [0:0]E;
  output [0:0]ena_array;
  output wr_en_0;
  input [5:0]\gmux.gm[6].gms.ms ;
  input [0:0]v1_reg;
  input [5:0]\gmux.gm[6].gms.ms_0 ;
  input [0:0]v1_reg_0;
  input [5:0]\gmux.gm[6].gms.ms_1 ;
  input [0:0]v1_reg_1;
  input srst;
  input clk;
  input wr_en;
  input \gaf.gaf0.ram_afull_i_reg_0 ;
  input rd_en;
  input [0:0]Q;

  wire [0:0]E;
  wire [0:0]Q;
  wire clk;
  wire cntr_en;
  wire comp0;
  wire comp1;
  wire [0:0]ena_array;
  wire \gaf.gaf0.ram_afull_i_reg_0 ;
  wire [5:0]\gmux.gm[6].gms.ms ;
  wire [5:0]\gmux.gm[6].gms.ms_0 ;
  wire [5:0]\gmux.gm[6].gms.ms_1 ;
  wire p_2_out;
  (* DONT_TOUCH *) wire ram_afull_fb;
  (* DONT_TOUCH *) wire ram_afull_i;
  wire ram_full_comb;
  (* DONT_TOUCH *) wire ram_full_fb_i;
  (* DONT_TOUCH *) wire ram_full_i;
  wire rd_en;
  wire srst;
  wire [0:0]v1_reg;
  wire [0:0]v1_reg_0;
  wire [0:0]v1_reg_1;
  wire wr_en;
  wire wr_en_0;

  assign almost_full = ram_afull_i;
  assign full = ram_full_i;
  assign out = ram_full_fb_i;
  LUT3 #(
    .INIT(8'h04)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__0 
       (.I0(ram_full_fb_i),
        .I1(wr_en),
        .I2(Q),
        .O(ena_array));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__1 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(wr_en_0));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_3 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(E));
  fifo_Fpjh_data_2_compare c0
       (.comp0(comp0),
        .\gmux.gm[6].gms.ms_0 (\gmux.gm[6].gms.ms ),
        .v1_reg(v1_reg));
  fifo_Fpjh_data_2_compare_0 c1
       (.comp0(comp0),
        .comp1(comp1),
        .\gmux.gm[6].gms.ms_0 (\gmux.gm[6].gms.ms_0 ),
        .out(ram_full_fb_i),
        .ram_full_comb(ram_full_comb),
        .ram_full_i_reg(\gaf.gaf0.ram_afull_i_reg_0 ),
        .rd_en(rd_en),
        .v1_reg_0(v1_reg_0),
        .wr_en(wr_en));
  LUT4 #(
    .INIT(16'h4B44)) 
    \count[12]_i_1 
       (.I0(ram_full_fb_i),
        .I1(wr_en),
        .I2(\gaf.gaf0.ram_afull_i_reg_0 ),
        .I3(rd_en),
        .O(cntr_en));
  fifo_Fpjh_data_2_compare_1 \gaf.c2 
       (.E(E),
        .almost_full(ram_afull_i),
        .comp1(comp1),
        .\gaf.gaf0.ram_afull_i_reg (\gaf.gaf0.ram_afull_i_reg_0 ),
        .\gmux.gm[6].gms.ms_0 (\gmux.gm[6].gms.ms_1 ),
        .p_2_out(p_2_out),
        .rd_en(rd_en),
        .v1_reg_1(v1_reg_1));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gaf.gaf0.ram_afull_i_reg 
       (.C(clk),
        .CE(1'b1),
        .D(p_2_out),
        .Q(ram_afull_i),
        .R(srst));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(ram_afull_fb));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    ram_full_fb_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(ram_full_comb),
        .Q(ram_full_fb_i),
        .R(srst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    ram_full_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(ram_full_comb),
        .Q(ram_full_i),
        .R(srst));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
