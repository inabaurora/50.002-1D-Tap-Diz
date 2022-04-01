/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    input [3:0] gameplay_buttons,
    output reg [6:0] lane_1_LED,
    output reg [6:0] lane_2_LED,
    output reg [6:0] lane_3_LED,
    output reg [6:0] lane_4_LED,
    output reg [6:0] combo_seg,
    output reg [3:0] combo_sel,
    output reg [6:0] score_seg,
    output reg [3:0] score_sel
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [(3'h4+0)-1:0] M_buttoncond_out;
  reg [(3'h4+0)-1:0] M_buttoncond_in;
  
  genvar GEN_buttoncond0;
  generate
  for (GEN_buttoncond0=0;GEN_buttoncond0<3'h4;GEN_buttoncond0=GEN_buttoncond0+1) begin: buttoncond_gen_0
    button_conditioner_2 buttoncond (
      .clk(clk),
      .in(M_buttoncond_in[GEN_buttoncond0*(1)+(1)-1-:(1)]),
      .out(M_buttoncond_out[GEN_buttoncond0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [(3'h4+0)-1:0] M_buttondetector_out;
  reg [(3'h4+0)-1:0] M_buttondetector_in;
  
  genvar GEN_buttondetector0;
  generate
  for (GEN_buttondetector0=0;GEN_buttondetector0<3'h4;GEN_buttondetector0=GEN_buttondetector0+1) begin: buttondetector_gen_0
    edge_detector_3 buttondetector (
      .clk(clk),
      .in(M_buttondetector_in[GEN_buttondetector0*(1)+(1)-1-:(1)]),
      .out(M_buttondetector_out[GEN_buttondetector0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [7-1:0] M_seg_combo_seg;
  wire [4-1:0] M_seg_combo_sel;
  reg [16-1:0] M_seg_combo_values;
  multi_seven_seg_4 seg_combo (
    .clk(clk),
    .rst(rst),
    .values(M_seg_combo_values),
    .seg(M_seg_combo_seg),
    .sel(M_seg_combo_sel)
  );
  wire [7-1:0] M_seg_score_seg;
  wire [4-1:0] M_seg_score_sel;
  reg [16-1:0] M_seg_score_values;
  multi_seven_seg_4 seg_score (
    .clk(clk),
    .rst(rst),
    .values(M_seg_score_values),
    .seg(M_seg_score_seg),
    .sel(M_seg_score_sel)
  );
  wire [16-1:0] M_combo_dec_ctr_digits;
  reg [4-1:0] M_combo_dec_ctr_inc;
  multi_dec_ctr_5 combo_dec_ctr (
    .clk(clk),
    .rst(rst),
    .inc(M_combo_dec_ctr_inc),
    .digits(M_combo_dec_ctr_digits)
  );
  wire [16-1:0] M_score_dec_ctr_digits;
  reg [4-1:0] M_score_dec_ctr_inc;
  multi_dec_ctr_5 score_dec_ctr (
    .clk(clk),
    .rst(rst),
    .inc(M_score_dec_ctr_inc),
    .digits(M_score_dec_ctr_digits)
  );
  wire [16-1:0] M_game_beta_column_1;
  wire [16-1:0] M_game_beta_column_2;
  wire [16-1:0] M_game_beta_column_3;
  wire [16-1:0] M_game_beta_column_4;
  wire [4-1:0] M_game_beta_comboinc;
  wire [4-1:0] M_game_beta_scoreinc;
  reg [4-1:0] M_game_beta_button;
  betacpu_6 game_beta (
    .clk(clk),
    .rst(rst),
    .button(M_game_beta_button),
    .column_1(M_game_beta_column_1),
    .column_2(M_game_beta_column_2),
    .column_3(M_game_beta_column_3),
    .column_4(M_game_beta_column_4),
    .comboinc(M_game_beta_comboinc),
    .scoreinc(M_game_beta_scoreinc)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    usb_tx = usb_rx;
    M_buttoncond_in = gameplay_buttons;
    M_buttondetector_in = M_buttoncond_out;
    M_game_beta_button = M_buttondetector_out;
    lane_1_LED = M_game_beta_column_1[0+6-:7];
    lane_2_LED = M_game_beta_column_2[0+6-:7];
    lane_3_LED = M_game_beta_column_3[0+6-:7];
    lane_4_LED = M_game_beta_column_4[0+6-:7];
    M_combo_dec_ctr_inc = M_game_beta_comboinc;
    M_score_dec_ctr_inc = M_game_beta_scoreinc;
    M_seg_combo_values = M_combo_dec_ctr_digits;
    M_seg_score_values = M_score_dec_ctr_digits;
    combo_seg = ~M_seg_combo_seg;
    combo_sel = ~M_seg_combo_sel;
    score_seg = ~M_seg_score_seg;
    score_sel = ~M_seg_score_sel;
  end
endmodule