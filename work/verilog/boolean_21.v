/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module boolean_21 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn_signal,
    output reg [15:0] c
  );
  
  
  
  always @* begin
    c = 16'h0000;
    
    case (alufn_signal[0+3-:4])
      default: begin
        c = 16'h0000;
      end
      4'h8: begin
        c = a & b;
      end
      4'he: begin
        c = a | b;
      end
      4'h6: begin
        c = a ^ b;
      end
      4'ha: begin
        c = a;
      end
    endcase
  end
endmodule
