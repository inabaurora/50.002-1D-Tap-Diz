/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module lunatic_ROM_13 (
    input [1:0] address,
    output reg [3:0] value
  );
  
  
  
  localparam LUNATIC_ROM = 16'h8421;
  
  always @* begin
    value = LUNATIC_ROM[(address)*4+3-:4];
  end
endmodule
