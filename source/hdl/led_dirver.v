module led_driver(
  input clk,
  input rst,
  input [3:0] lower,
  input [3:0] upper,
  output reg [7:0] led_out
);


   always @(posedge clk)
     if (rst)
       begin
         led_out <= 8'b0;
       end
     else
       begin
         led_out <= {upper, lower};
       end


endmodule














