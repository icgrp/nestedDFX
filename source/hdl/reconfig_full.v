//////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2020 Xilinx, Inc.
// This design is confidential and proprietary of Xilinx, Inc.
// All Rights Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /   Vendor: Xilinx
// \   \   \/    Version: 1.0
//  \   \        Application: Dynamic Function eXchange 
//  /   /        Filename: reconfig_counters.v
// /___/   /\    Date Last Modified: 14 FEB 2020
// \   \  /  \
//  \___\/\___\
//
//
// Board:  VCU118 rev 1
// Device: xcvu9p
// Design Name: led_shift_count_nested
// Purpose: Nested Dynamic Function eXchange Tutorial
//////////////////////////////////////////////////////////////////////////////

module reconfig_inst(
    input             rst,
    input             gclk,
    output reg [3:0]  upper,
    output reg [3:0]  lower
    );
    
wire [3:0] count_out_upper;
wire [3:0] count_out_lower;
    
   // instantiate module count, upper bits
   count inst_count_upper (
      .rst       (rst),
      .clk       (gclk),
      .count_out (count_out_upper)
   );

   // instantiate module count, lower bits
   count inst_count_lower (
      .rst       (rst),
      .clk       (gclk),
      .count_out (count_out_lower)
   );
   
   always @(posedge gclk)
     if (rst)
       begin
         upper <= 4'b0000;
         lower <= 4'b0000;
       end
     else
       begin
         upper <= count_out_upper;
         lower <= count_out_lower;
       end

endmodule


module count (
   rst,
   clk,
   count_out
);

   input rst;                // Active high reset
   input clk;                // 200MHz input clock
   output [3:0] count_out;   // Output to LEDs

   reg [24:0] count;
   reg [3:0]  count_out;

   //Counter to reduce speed of output
   always @(posedge clk)
      if (rst) begin
         count <= 0;
      end
      else begin
         count <= count + 1;
      end

    always @(posedge clk)
      if (rst)
         count_out <= 4'b1111;
      else begin
         if (count == 25'b1111111111111111111111111) begin
            count_out <= count_out - 1;
         end
      end
endmodule
