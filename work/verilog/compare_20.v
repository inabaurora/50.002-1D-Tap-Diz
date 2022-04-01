/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module compare_20 (
    input z,
    input v,
    input n,
    input [5:0] alufn_signal,
    output reg [15:0] c
  );
  
  
  
  always @* begin
    c = 16'h0000;
    
    case (alufn_signal[1+1-:2])
      default: begin
        c[0+0-:1] = 1'h0;
      end
      2'h1: begin
        c[0+0-:1] = z;
      end
      2'h2: begin
        c[0+0-:1] = n ^ v;
      end
      2'h3: begin
        c[0+0-:1] = z | (n ^ v);
      end
    endcase
  end
endmodule
