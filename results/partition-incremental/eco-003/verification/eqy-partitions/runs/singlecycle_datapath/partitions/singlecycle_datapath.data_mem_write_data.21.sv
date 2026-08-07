module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][21] ,
  input  [  0:0] \__pi_regfile.register[10][21] ,
  input  [  0:0] \__pi_regfile.register[11][21] ,
  input  [  0:0] \__pi_regfile.register[12][21] ,
  input  [  0:0] \__pi_regfile.register[13][21] ,
  input  [  0:0] \__pi_regfile.register[14][21] ,
  input  [  0:0] \__pi_regfile.register[15][21] ,
  input  [  0:0] \__pi_regfile.register[16][21] ,
  input  [  0:0] \__pi_regfile.register[17][21] ,
  input  [  0:0] \__pi_regfile.register[18][21] ,
  input  [  0:0] \__pi_regfile.register[19][21] ,
  input  [  0:0] \__pi_regfile.register[1][21] ,
  input  [  0:0] \__pi_regfile.register[20][21] ,
  input  [  0:0] \__pi_regfile.register[21][21] ,
  input  [  0:0] \__pi_regfile.register[22][21] ,
  input  [  0:0] \__pi_regfile.register[23][21] ,
  input  [  0:0] \__pi_regfile.register[24][21] ,
  input  [  0:0] \__pi_regfile.register[25][21] ,
  input  [  0:0] \__pi_regfile.register[26][21] ,
  input  [  0:0] \__pi_regfile.register[27][21] ,
  input  [  0:0] \__pi_regfile.register[28][21] ,
  input  [  0:0] \__pi_regfile.register[29][21] ,
  input  [  0:0] \__pi_regfile.register[2][21] ,
  input  [  0:0] \__pi_regfile.register[30][21] ,
  input  [  0:0] \__pi_regfile.register[31][21] ,
  input  [  0:0] \__pi_regfile.register[3][21] ,
  input  [  0:0] \__pi_regfile.register[4][21] ,
  input  [  0:0] \__pi_regfile.register[5][21] ,
  input  [  0:0] \__pi_regfile.register[6][21] ,
  input  [  0:0] \__pi_regfile.register[7][21] ,
  input  [  0:0] \__pi_regfile.register[8][21] ,
  input  [  0:0] \__pi_regfile.register[9][21] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[21]__gold ,
  output [  0:0] \__po_data_mem_write_data[21]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.21 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][21] (\__pi_regfile.register[0][21] ),
    .\__pi_regfile.register[10][21] (\__pi_regfile.register[10][21] ),
    .\__pi_regfile.register[11][21] (\__pi_regfile.register[11][21] ),
    .\__pi_regfile.register[12][21] (\__pi_regfile.register[12][21] ),
    .\__pi_regfile.register[13][21] (\__pi_regfile.register[13][21] ),
    .\__pi_regfile.register[14][21] (\__pi_regfile.register[14][21] ),
    .\__pi_regfile.register[15][21] (\__pi_regfile.register[15][21] ),
    .\__pi_regfile.register[16][21] (\__pi_regfile.register[16][21] ),
    .\__pi_regfile.register[17][21] (\__pi_regfile.register[17][21] ),
    .\__pi_regfile.register[18][21] (\__pi_regfile.register[18][21] ),
    .\__pi_regfile.register[19][21] (\__pi_regfile.register[19][21] ),
    .\__pi_regfile.register[1][21] (\__pi_regfile.register[1][21] ),
    .\__pi_regfile.register[20][21] (\__pi_regfile.register[20][21] ),
    .\__pi_regfile.register[21][21] (\__pi_regfile.register[21][21] ),
    .\__pi_regfile.register[22][21] (\__pi_regfile.register[22][21] ),
    .\__pi_regfile.register[23][21] (\__pi_regfile.register[23][21] ),
    .\__pi_regfile.register[24][21] (\__pi_regfile.register[24][21] ),
    .\__pi_regfile.register[25][21] (\__pi_regfile.register[25][21] ),
    .\__pi_regfile.register[26][21] (\__pi_regfile.register[26][21] ),
    .\__pi_regfile.register[27][21] (\__pi_regfile.register[27][21] ),
    .\__pi_regfile.register[28][21] (\__pi_regfile.register[28][21] ),
    .\__pi_regfile.register[29][21] (\__pi_regfile.register[29][21] ),
    .\__pi_regfile.register[2][21] (\__pi_regfile.register[2][21] ),
    .\__pi_regfile.register[30][21] (\__pi_regfile.register[30][21] ),
    .\__pi_regfile.register[31][21] (\__pi_regfile.register[31][21] ),
    .\__pi_regfile.register[3][21] (\__pi_regfile.register[3][21] ),
    .\__pi_regfile.register[4][21] (\__pi_regfile.register[4][21] ),
    .\__pi_regfile.register[5][21] (\__pi_regfile.register[5][21] ),
    .\__pi_regfile.register[6][21] (\__pi_regfile.register[6][21] ),
    .\__pi_regfile.register[7][21] (\__pi_regfile.register[7][21] ),
    .\__pi_regfile.register[8][21] (\__pi_regfile.register[8][21] ),
    .\__pi_regfile.register[9][21] (\__pi_regfile.register[9][21] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[21] (\__po_data_mem_write_data[21]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.21 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][21] (\__pi_regfile.register[0][21] ),
    .\__pi_regfile.register[10][21] (\__pi_regfile.register[10][21] ),
    .\__pi_regfile.register[11][21] (\__pi_regfile.register[11][21] ),
    .\__pi_regfile.register[12][21] (\__pi_regfile.register[12][21] ),
    .\__pi_regfile.register[13][21] (\__pi_regfile.register[13][21] ),
    .\__pi_regfile.register[14][21] (\__pi_regfile.register[14][21] ),
    .\__pi_regfile.register[15][21] (\__pi_regfile.register[15][21] ),
    .\__pi_regfile.register[16][21] (\__pi_regfile.register[16][21] ),
    .\__pi_regfile.register[17][21] (\__pi_regfile.register[17][21] ),
    .\__pi_regfile.register[18][21] (\__pi_regfile.register[18][21] ),
    .\__pi_regfile.register[19][21] (\__pi_regfile.register[19][21] ),
    .\__pi_regfile.register[1][21] (\__pi_regfile.register[1][21] ),
    .\__pi_regfile.register[20][21] (\__pi_regfile.register[20][21] ),
    .\__pi_regfile.register[21][21] (\__pi_regfile.register[21][21] ),
    .\__pi_regfile.register[22][21] (\__pi_regfile.register[22][21] ),
    .\__pi_regfile.register[23][21] (\__pi_regfile.register[23][21] ),
    .\__pi_regfile.register[24][21] (\__pi_regfile.register[24][21] ),
    .\__pi_regfile.register[25][21] (\__pi_regfile.register[25][21] ),
    .\__pi_regfile.register[26][21] (\__pi_regfile.register[26][21] ),
    .\__pi_regfile.register[27][21] (\__pi_regfile.register[27][21] ),
    .\__pi_regfile.register[28][21] (\__pi_regfile.register[28][21] ),
    .\__pi_regfile.register[29][21] (\__pi_regfile.register[29][21] ),
    .\__pi_regfile.register[2][21] (\__pi_regfile.register[2][21] ),
    .\__pi_regfile.register[30][21] (\__pi_regfile.register[30][21] ),
    .\__pi_regfile.register[31][21] (\__pi_regfile.register[31][21] ),
    .\__pi_regfile.register[3][21] (\__pi_regfile.register[3][21] ),
    .\__pi_regfile.register[4][21] (\__pi_regfile.register[4][21] ),
    .\__pi_regfile.register[5][21] (\__pi_regfile.register[5][21] ),
    .\__pi_regfile.register[6][21] (\__pi_regfile.register[6][21] ),
    .\__pi_regfile.register[7][21] (\__pi_regfile.register[7][21] ),
    .\__pi_regfile.register[8][21] (\__pi_regfile.register[8][21] ),
    .\__pi_regfile.register[9][21] (\__pi_regfile.register[9][21] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[21] (\__po_data_mem_write_data[21]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][21]__assume (\__pi_regfile.register[0][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][21]__assume (\__pi_regfile.register[10][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][21]__assume (\__pi_regfile.register[11][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][21]__assume (\__pi_regfile.register[12][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][21]__assume (\__pi_regfile.register[13][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][21]__assume (\__pi_regfile.register[14][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][21]__assume (\__pi_regfile.register[15][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][21]__assume (\__pi_regfile.register[16][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][21]__assume (\__pi_regfile.register[17][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][21]__assume (\__pi_regfile.register[18][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][21]__assume (\__pi_regfile.register[19][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][21]__assume (\__pi_regfile.register[1][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][21]__assume (\__pi_regfile.register[20][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][21]__assume (\__pi_regfile.register[21][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][21]__assume (\__pi_regfile.register[22][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][21]__assume (\__pi_regfile.register[23][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][21]__assume (\__pi_regfile.register[24][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][21]__assume (\__pi_regfile.register[25][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][21]__assume (\__pi_regfile.register[26][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][21]__assume (\__pi_regfile.register[27][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][21]__assume (\__pi_regfile.register[28][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][21]__assume (\__pi_regfile.register[29][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][21]__assume (\__pi_regfile.register[2][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][21]__assume (\__pi_regfile.register[30][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][21]__assume (\__pi_regfile.register[31][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][21]__assume (\__pi_regfile.register[3][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][21]__assume (\__pi_regfile.register[4][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][21]__assume (\__pi_regfile.register[5][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][21]__assume (\__pi_regfile.register[6][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][21]__assume (\__pi_regfile.register[7][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][21]__assume (\__pi_regfile.register[8][21] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][21]__assume (\__pi_regfile.register[9][21] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[21]__assert (\__po_data_mem_write_data[21]__gold , \__po_data_mem_write_data[21]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[21]__gold_cover (\__po_data_mem_write_data[21]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[21]__gate_cover (\__po_data_mem_write_data[21]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.21 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][21] ,
  input  [  0:0] \__pi_regfile.register[10][21] ,
  input  [  0:0] \__pi_regfile.register[11][21] ,
  input  [  0:0] \__pi_regfile.register[12][21] ,
  input  [  0:0] \__pi_regfile.register[13][21] ,
  input  [  0:0] \__pi_regfile.register[14][21] ,
  input  [  0:0] \__pi_regfile.register[15][21] ,
  input  [  0:0] \__pi_regfile.register[16][21] ,
  input  [  0:0] \__pi_regfile.register[17][21] ,
  input  [  0:0] \__pi_regfile.register[18][21] ,
  input  [  0:0] \__pi_regfile.register[19][21] ,
  input  [  0:0] \__pi_regfile.register[1][21] ,
  input  [  0:0] \__pi_regfile.register[20][21] ,
  input  [  0:0] \__pi_regfile.register[21][21] ,
  input  [  0:0] \__pi_regfile.register[22][21] ,
  input  [  0:0] \__pi_regfile.register[23][21] ,
  input  [  0:0] \__pi_regfile.register[24][21] ,
  input  [  0:0] \__pi_regfile.register[25][21] ,
  input  [  0:0] \__pi_regfile.register[26][21] ,
  input  [  0:0] \__pi_regfile.register[27][21] ,
  input  [  0:0] \__pi_regfile.register[28][21] ,
  input  [  0:0] \__pi_regfile.register[29][21] ,
  input  [  0:0] \__pi_regfile.register[2][21] ,
  input  [  0:0] \__pi_regfile.register[30][21] ,
  input  [  0:0] \__pi_regfile.register[31][21] ,
  input  [  0:0] \__pi_regfile.register[3][21] ,
  input  [  0:0] \__pi_regfile.register[4][21] ,
  input  [  0:0] \__pi_regfile.register[5][21] ,
  input  [  0:0] \__pi_regfile.register[6][21] ,
  input  [  0:0] \__pi_regfile.register[7][21] ,
  input  [  0:0] \__pi_regfile.register[8][21] ,
  input  [  0:0] \__pi_regfile.register[9][21] ,
  output [  0:0] \__po_data_mem_write_data[21]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.21 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][21] ,
  input  [  0:0] \__pi_regfile.register[10][21] ,
  input  [  0:0] \__pi_regfile.register[11][21] ,
  input  [  0:0] \__pi_regfile.register[12][21] ,
  input  [  0:0] \__pi_regfile.register[13][21] ,
  input  [  0:0] \__pi_regfile.register[14][21] ,
  input  [  0:0] \__pi_regfile.register[15][21] ,
  input  [  0:0] \__pi_regfile.register[16][21] ,
  input  [  0:0] \__pi_regfile.register[17][21] ,
  input  [  0:0] \__pi_regfile.register[18][21] ,
  input  [  0:0] \__pi_regfile.register[19][21] ,
  input  [  0:0] \__pi_regfile.register[1][21] ,
  input  [  0:0] \__pi_regfile.register[20][21] ,
  input  [  0:0] \__pi_regfile.register[21][21] ,
  input  [  0:0] \__pi_regfile.register[22][21] ,
  input  [  0:0] \__pi_regfile.register[23][21] ,
  input  [  0:0] \__pi_regfile.register[24][21] ,
  input  [  0:0] \__pi_regfile.register[25][21] ,
  input  [  0:0] \__pi_regfile.register[26][21] ,
  input  [  0:0] \__pi_regfile.register[27][21] ,
  input  [  0:0] \__pi_regfile.register[28][21] ,
  input  [  0:0] \__pi_regfile.register[29][21] ,
  input  [  0:0] \__pi_regfile.register[2][21] ,
  input  [  0:0] \__pi_regfile.register[30][21] ,
  input  [  0:0] \__pi_regfile.register[31][21] ,
  input  [  0:0] \__pi_regfile.register[3][21] ,
  input  [  0:0] \__pi_regfile.register[4][21] ,
  input  [  0:0] \__pi_regfile.register[5][21] ,
  input  [  0:0] \__pi_regfile.register[6][21] ,
  input  [  0:0] \__pi_regfile.register[7][21] ,
  input  [  0:0] \__pi_regfile.register[8][21] ,
  input  [  0:0] \__pi_regfile.register[9][21] ,
  output [  0:0] \__po_data_mem_write_data[21]
);
endmodule
