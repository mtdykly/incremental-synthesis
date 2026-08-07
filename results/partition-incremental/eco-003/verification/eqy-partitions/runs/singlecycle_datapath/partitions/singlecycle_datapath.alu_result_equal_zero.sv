module miter (
  input  [  0:0] \__pi_data_mem_address[0] ,
  input  [  0:0] \__pi_data_mem_address[10] ,
  input  [  0:0] \__pi_data_mem_address[11] ,
  input  [  0:0] \__pi_data_mem_address[12] ,
  input  [  0:0] \__pi_data_mem_address[13] ,
  input  [  0:0] \__pi_data_mem_address[14] ,
  input  [  0:0] \__pi_data_mem_address[15] ,
  input  [  0:0] \__pi_data_mem_address[16] ,
  input  [  0:0] \__pi_data_mem_address[17] ,
  input  [  0:0] \__pi_data_mem_address[18] ,
  input  [  0:0] \__pi_data_mem_address[19] ,
  input  [  0:0] \__pi_data_mem_address[1] ,
  input  [  0:0] \__pi_data_mem_address[20] ,
  input  [  0:0] \__pi_data_mem_address[21] ,
  input  [  0:0] \__pi_data_mem_address[22] ,
  input  [  0:0] \__pi_data_mem_address[23] ,
  input  [  0:0] \__pi_data_mem_address[24] ,
  input  [  0:0] \__pi_data_mem_address[25] ,
  input  [  0:0] \__pi_data_mem_address[26] ,
  input  [  0:0] \__pi_data_mem_address[27] ,
  input  [  0:0] \__pi_data_mem_address[28] ,
  input  [  0:0] \__pi_data_mem_address[29] ,
  input  [  0:0] \__pi_data_mem_address[2] ,
  input  [  0:0] \__pi_data_mem_address[30] ,
  input  [  0:0] \__pi_data_mem_address[31] ,
  input  [  0:0] \__pi_data_mem_address[3] ,
  input  [  0:0] \__pi_data_mem_address[4] ,
  input  [  0:0] \__pi_data_mem_address[5] ,
  input  [  0:0] \__pi_data_mem_address[6] ,
  input  [  0:0] \__pi_data_mem_address[7] ,
  input  [  0:0] \__pi_data_mem_address[8] ,
  input  [  0:0] \__pi_data_mem_address[9] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_alu_result_equal_zero__gold ,
  output [  0:0] \__po_alu_result_equal_zero__gate
);
  \gold.singlecycle_datapath.alu_result_equal_zero gold (
    .\__pi_data_mem_address[0] (\__pi_data_mem_address[0] ),
    .\__pi_data_mem_address[10] (\__pi_data_mem_address[10] ),
    .\__pi_data_mem_address[11] (\__pi_data_mem_address[11] ),
    .\__pi_data_mem_address[12] (\__pi_data_mem_address[12] ),
    .\__pi_data_mem_address[13] (\__pi_data_mem_address[13] ),
    .\__pi_data_mem_address[14] (\__pi_data_mem_address[14] ),
    .\__pi_data_mem_address[15] (\__pi_data_mem_address[15] ),
    .\__pi_data_mem_address[16] (\__pi_data_mem_address[16] ),
    .\__pi_data_mem_address[17] (\__pi_data_mem_address[17] ),
    .\__pi_data_mem_address[18] (\__pi_data_mem_address[18] ),
    .\__pi_data_mem_address[19] (\__pi_data_mem_address[19] ),
    .\__pi_data_mem_address[1] (\__pi_data_mem_address[1] ),
    .\__pi_data_mem_address[20] (\__pi_data_mem_address[20] ),
    .\__pi_data_mem_address[21] (\__pi_data_mem_address[21] ),
    .\__pi_data_mem_address[22] (\__pi_data_mem_address[22] ),
    .\__pi_data_mem_address[23] (\__pi_data_mem_address[23] ),
    .\__pi_data_mem_address[24] (\__pi_data_mem_address[24] ),
    .\__pi_data_mem_address[25] (\__pi_data_mem_address[25] ),
    .\__pi_data_mem_address[26] (\__pi_data_mem_address[26] ),
    .\__pi_data_mem_address[27] (\__pi_data_mem_address[27] ),
    .\__pi_data_mem_address[28] (\__pi_data_mem_address[28] ),
    .\__pi_data_mem_address[29] (\__pi_data_mem_address[29] ),
    .\__pi_data_mem_address[2] (\__pi_data_mem_address[2] ),
    .\__pi_data_mem_address[30] (\__pi_data_mem_address[30] ),
    .\__pi_data_mem_address[31] (\__pi_data_mem_address[31] ),
    .\__pi_data_mem_address[3] (\__pi_data_mem_address[3] ),
    .\__pi_data_mem_address[4] (\__pi_data_mem_address[4] ),
    .\__pi_data_mem_address[5] (\__pi_data_mem_address[5] ),
    .\__pi_data_mem_address[6] (\__pi_data_mem_address[6] ),
    .\__pi_data_mem_address[7] (\__pi_data_mem_address[7] ),
    .\__pi_data_mem_address[8] (\__pi_data_mem_address[8] ),
    .\__pi_data_mem_address[9] (\__pi_data_mem_address[9] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_alu_result_equal_zero (\__po_alu_result_equal_zero__gold )
  );
  \gate.singlecycle_datapath.alu_result_equal_zero gate (
    .\__pi_data_mem_address[0] (\__pi_data_mem_address[0] ),
    .\__pi_data_mem_address[10] (\__pi_data_mem_address[10] ),
    .\__pi_data_mem_address[11] (\__pi_data_mem_address[11] ),
    .\__pi_data_mem_address[12] (\__pi_data_mem_address[12] ),
    .\__pi_data_mem_address[13] (\__pi_data_mem_address[13] ),
    .\__pi_data_mem_address[14] (\__pi_data_mem_address[14] ),
    .\__pi_data_mem_address[15] (\__pi_data_mem_address[15] ),
    .\__pi_data_mem_address[16] (\__pi_data_mem_address[16] ),
    .\__pi_data_mem_address[17] (\__pi_data_mem_address[17] ),
    .\__pi_data_mem_address[18] (\__pi_data_mem_address[18] ),
    .\__pi_data_mem_address[19] (\__pi_data_mem_address[19] ),
    .\__pi_data_mem_address[1] (\__pi_data_mem_address[1] ),
    .\__pi_data_mem_address[20] (\__pi_data_mem_address[20] ),
    .\__pi_data_mem_address[21] (\__pi_data_mem_address[21] ),
    .\__pi_data_mem_address[22] (\__pi_data_mem_address[22] ),
    .\__pi_data_mem_address[23] (\__pi_data_mem_address[23] ),
    .\__pi_data_mem_address[24] (\__pi_data_mem_address[24] ),
    .\__pi_data_mem_address[25] (\__pi_data_mem_address[25] ),
    .\__pi_data_mem_address[26] (\__pi_data_mem_address[26] ),
    .\__pi_data_mem_address[27] (\__pi_data_mem_address[27] ),
    .\__pi_data_mem_address[28] (\__pi_data_mem_address[28] ),
    .\__pi_data_mem_address[29] (\__pi_data_mem_address[29] ),
    .\__pi_data_mem_address[2] (\__pi_data_mem_address[2] ),
    .\__pi_data_mem_address[30] (\__pi_data_mem_address[30] ),
    .\__pi_data_mem_address[31] (\__pi_data_mem_address[31] ),
    .\__pi_data_mem_address[3] (\__pi_data_mem_address[3] ),
    .\__pi_data_mem_address[4] (\__pi_data_mem_address[4] ),
    .\__pi_data_mem_address[5] (\__pi_data_mem_address[5] ),
    .\__pi_data_mem_address[6] (\__pi_data_mem_address[6] ),
    .\__pi_data_mem_address[7] (\__pi_data_mem_address[7] ),
    .\__pi_data_mem_address[8] (\__pi_data_mem_address[8] ),
    .\__pi_data_mem_address[9] (\__pi_data_mem_address[9] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_alu_result_equal_zero (\__po_alu_result_equal_zero__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_data_mem_address[0]__assume (\__pi_data_mem_address[0] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[10]__assume (\__pi_data_mem_address[10] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[11]__assume (\__pi_data_mem_address[11] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[12]__assume (\__pi_data_mem_address[12] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[13]__assume (\__pi_data_mem_address[13] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[14]__assume (\__pi_data_mem_address[14] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[15]__assume (\__pi_data_mem_address[15] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[16]__assume (\__pi_data_mem_address[16] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[17]__assume (\__pi_data_mem_address[17] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[18]__assume (\__pi_data_mem_address[18] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[19]__assume (\__pi_data_mem_address[19] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[1]__assume (\__pi_data_mem_address[1] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[20]__assume (\__pi_data_mem_address[20] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[21]__assume (\__pi_data_mem_address[21] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[22]__assume (\__pi_data_mem_address[22] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[23]__assume (\__pi_data_mem_address[23] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[24]__assume (\__pi_data_mem_address[24] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[25]__assume (\__pi_data_mem_address[25] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[26]__assume (\__pi_data_mem_address[26] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[27]__assume (\__pi_data_mem_address[27] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[28]__assume (\__pi_data_mem_address[28] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[29]__assume (\__pi_data_mem_address[29] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[2]__assume (\__pi_data_mem_address[2] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[30]__assume (\__pi_data_mem_address[30] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[31]__assume (\__pi_data_mem_address[31] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[3]__assume (\__pi_data_mem_address[3] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[4]__assume (\__pi_data_mem_address[4] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[5]__assume (\__pi_data_mem_address[5] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[6]__assume (\__pi_data_mem_address[6] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[7]__assume (\__pi_data_mem_address[7] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[8]__assume (\__pi_data_mem_address[8] );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[9]__assume (\__pi_data_mem_address[9] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_alu_result_equal_zero__assert (\__po_alu_result_equal_zero__gold , \__po_alu_result_equal_zero__gate );
`endif
`ifdef COVER_DEF_CROSS_POINTS
  `ifdef DIRECT_CROSS_POINTS
  `else
  `endif
`endif
`ifdef COVER_DEF_GOLD_MATCH_POINTS
`endif
`ifdef COVER_DEF_GATE_MATCH_POINTS
`endif
`ifdef COVER_DEF_GOLD_OUTPUTS
  miter_def_prop #(1, "cover") \__po_alu_result_equal_zero__gold_cover (\__po_alu_result_equal_zero__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_alu_result_equal_zero__gate_cover (\__po_alu_result_equal_zero__gate );
`endif
endmodule
module miter_cmp_prop #(parameter WIDTH=1, parameter TYPE="assert") (input [WIDTH-1:0] in_gold, in_gate);
  reg okay;
  integer i;
  always @* begin
    okay = 1;
    for (i = 0; i < WIDTH; i = i+1)
      okay = okay && (in_gold[i] === 1'bx || in_gold[i] === in_gate[i]);
  end
  generate
    if (TYPE == "assert") always @* assert(okay);
    if (TYPE == "assume") always @* assume(okay);
    if (TYPE == "cover")  always @* cover(okay);
  endgenerate
endmodule
module miter_def_prop #(parameter WIDTH=1, parameter TYPE="assert") (input [WIDTH-1:0] in);
  wire okay = ^in !== 1'bx;
  generate
    if (TYPE == "assert") always @* assert(okay);
    if (TYPE == "assume") always @* assume(okay);
    if (TYPE == "cover")  always @* cover(okay);
  endgenerate
endmodule
module \gold.singlecycle_datapath.alu_result_equal_zero (
  input  [  0:0] \__pi_data_mem_address[0] ,
  input  [  0:0] \__pi_data_mem_address[10] ,
  input  [  0:0] \__pi_data_mem_address[11] ,
  input  [  0:0] \__pi_data_mem_address[12] ,
  input  [  0:0] \__pi_data_mem_address[13] ,
  input  [  0:0] \__pi_data_mem_address[14] ,
  input  [  0:0] \__pi_data_mem_address[15] ,
  input  [  0:0] \__pi_data_mem_address[16] ,
  input  [  0:0] \__pi_data_mem_address[17] ,
  input  [  0:0] \__pi_data_mem_address[18] ,
  input  [  0:0] \__pi_data_mem_address[19] ,
  input  [  0:0] \__pi_data_mem_address[1] ,
  input  [  0:0] \__pi_data_mem_address[20] ,
  input  [  0:0] \__pi_data_mem_address[21] ,
  input  [  0:0] \__pi_data_mem_address[22] ,
  input  [  0:0] \__pi_data_mem_address[23] ,
  input  [  0:0] \__pi_data_mem_address[24] ,
  input  [  0:0] \__pi_data_mem_address[25] ,
  input  [  0:0] \__pi_data_mem_address[26] ,
  input  [  0:0] \__pi_data_mem_address[27] ,
  input  [  0:0] \__pi_data_mem_address[28] ,
  input  [  0:0] \__pi_data_mem_address[29] ,
  input  [  0:0] \__pi_data_mem_address[2] ,
  input  [  0:0] \__pi_data_mem_address[30] ,
  input  [  0:0] \__pi_data_mem_address[31] ,
  input  [  0:0] \__pi_data_mem_address[3] ,
  input  [  0:0] \__pi_data_mem_address[4] ,
  input  [  0:0] \__pi_data_mem_address[5] ,
  input  [  0:0] \__pi_data_mem_address[6] ,
  input  [  0:0] \__pi_data_mem_address[7] ,
  input  [  0:0] \__pi_data_mem_address[8] ,
  input  [  0:0] \__pi_data_mem_address[9] ,
  output [  0:0] \__po_alu_result_equal_zero
);
endmodule
module \gate.singlecycle_datapath.alu_result_equal_zero (
  input  [  0:0] \__pi_data_mem_address[0] ,
  input  [  0:0] \__pi_data_mem_address[10] ,
  input  [  0:0] \__pi_data_mem_address[11] ,
  input  [  0:0] \__pi_data_mem_address[12] ,
  input  [  0:0] \__pi_data_mem_address[13] ,
  input  [  0:0] \__pi_data_mem_address[14] ,
  input  [  0:0] \__pi_data_mem_address[15] ,
  input  [  0:0] \__pi_data_mem_address[16] ,
  input  [  0:0] \__pi_data_mem_address[17] ,
  input  [  0:0] \__pi_data_mem_address[18] ,
  input  [  0:0] \__pi_data_mem_address[19] ,
  input  [  0:0] \__pi_data_mem_address[1] ,
  input  [  0:0] \__pi_data_mem_address[20] ,
  input  [  0:0] \__pi_data_mem_address[21] ,
  input  [  0:0] \__pi_data_mem_address[22] ,
  input  [  0:0] \__pi_data_mem_address[23] ,
  input  [  0:0] \__pi_data_mem_address[24] ,
  input  [  0:0] \__pi_data_mem_address[25] ,
  input  [  0:0] \__pi_data_mem_address[26] ,
  input  [  0:0] \__pi_data_mem_address[27] ,
  input  [  0:0] \__pi_data_mem_address[28] ,
  input  [  0:0] \__pi_data_mem_address[29] ,
  input  [  0:0] \__pi_data_mem_address[2] ,
  input  [  0:0] \__pi_data_mem_address[30] ,
  input  [  0:0] \__pi_data_mem_address[31] ,
  input  [  0:0] \__pi_data_mem_address[3] ,
  input  [  0:0] \__pi_data_mem_address[4] ,
  input  [  0:0] \__pi_data_mem_address[5] ,
  input  [  0:0] \__pi_data_mem_address[6] ,
  input  [  0:0] \__pi_data_mem_address[7] ,
  input  [  0:0] \__pi_data_mem_address[8] ,
  input  [  0:0] \__pi_data_mem_address[9] ,
  output [  0:0] \__po_alu_result_equal_zero
);
endmodule
