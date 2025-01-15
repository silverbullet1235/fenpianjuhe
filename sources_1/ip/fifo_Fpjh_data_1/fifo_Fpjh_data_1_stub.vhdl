-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Mon Jan  6 16:13:16 2025
-- Host        : DESKTOP-O4UFV4N running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top fifo_Fpjh_data_1 -prefix
--               fifo_Fpjh_data_1_ fifo_Fpjh_1_stub.vhdl
-- Design      : fifo_Fpjh_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fifo_Fpjh_data_1 is
  Port ( 
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 36 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 36 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    data_count : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );

end fifo_Fpjh_data_1;

architecture stub of fifo_Fpjh_data_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,srst,din[36:0],wr_en,rd_en,dout[36:0],full,empty,valid,data_count[12:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v13_2_4,Vivado 2019.1";
begin
end;
