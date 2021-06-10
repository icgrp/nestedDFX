//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Tue Jun  8 22:13:47 2021
//Host        : ylxiao-OptiPlex-7050 running 64-bit Ubuntu 18.04.5 LTS
//Command     : generate_target flooplan_static_wrapper.bd
//Design      : flooplan_static_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module flooplan_static_wrapper
   (led_out);
  output [7:0]led_out;

  wire [7:0]led_out;

  flooplan_static flooplan_static_i
       (.led_out(led_out));
endmodule
