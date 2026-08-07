module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][15] ,
  input  [  0:0] \__pi_regfile.register[10][15] ,
  input  [  0:0] \__pi_regfile.register[11][15] ,
  input  [  0:0] \__pi_regfile.register[12][15] ,
  input  [  0:0] \__pi_regfile.register[13][15] ,
  input  [  0:0] \__pi_regfile.register[14][15] ,
  input  [  0:0] \__pi_regfile.register[15][15] ,
  input  [  0:0] \__pi_regfile.register[16][15] ,
  input  [  0:0] \__pi_regfile.register[17][15] ,
  input  [  0:0] \__pi_regfile.register[18][15] ,
  input  [  0:0] \__pi_regfile.register[19][15] ,
  input  [  0:0] \__pi_regfile.register[1][15] ,
  input  [  0:0] \__pi_regfile.register[20][15] ,
  input  [  0:0] \__pi_regfile.register[21][15] ,
  input  [  0:0] \__pi_regfile.register[22][15] ,
  input  [  0:0] \__pi_regfile.register[23][15] ,
  input  [  0:0] \__pi_regfile.register[24][15] ,
  input  [  0:0] \__pi_regfile.register[25][15] ,
  input  [  0:0] \__pi_regfile.register[26][15] ,
  input  [  0:0] \__pi_regfile.register[27][15] ,
  input  [  0:0] \__pi_regfile.register[28][15] ,
  input  [  0:0] \__pi_regfile.register[29][15] ,
  input  [  0:0] \__pi_regfile.register[2][15] ,
  input  [  0:0] \__pi_regfile.register[30][15] ,
  input  [  0:0] \__pi_regfile.register[31][15] ,
  input  [  0:0] \__pi_regfile.register[3][15] ,
  input  [  0:0] \__pi_regfile.register[4][15] ,
  input  [  0:0] \__pi_regfile.register[5][15] ,
  input  [  0:0] \__pi_regfile.register[6][15] ,
  input  [  0:0] \__pi_regfile.register[7][15] ,
  input  [  0:0] \__pi_regfile.register[8][15] ,
  input  [  0:0] \__pi_regfile.register[9][15] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[15]__gold ,
  output [  0:0] \__po_data_mem_write_data[15]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.15 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][15] (\__pi_regfile.register[0][15] ),
    .\__pi_regfile.register[10][15] (\__pi_regfile.register[10][15] ),
    .\__pi_regfile.register[11][15] (\__pi_regfile.register[11][15] ),
    .\__pi_regfile.register[12][15] (\__pi_regfile.register[12][15] ),
    .\__pi_regfile.register[13][15] (\__pi_regfile.register[13][15] ),
    .\__pi_regfile.register[14][15] (\__pi_regfile.register[14][15] ),
    .\__pi_regfile.register[15][15] (\__pi_regfile.register[15][15] ),
    .\__pi_regfile.register[16][15] (\__pi_regfile.register[16][15] ),
    .\__pi_regfile.register[17][15] (\__pi_regfile.register[17][15] ),
    .\__pi_regfile.register[18][15] (\__pi_regfile.register[18][15] ),
    .\__pi_regfile.register[19][15] (\__pi_regfile.register[19][15] ),
    .\__pi_regfile.register[1][15] (\__pi_regfile.register[1][15] ),
    .\__pi_regfile.register[20][15] (\__pi_regfile.register[20][15] ),
    .\__pi_regfile.register[21][15] (\__pi_regfile.register[21][15] ),
    .\__pi_regfile.register[22][15] (\__pi_regfile.register[22][15] ),
    .\__pi_regfile.register[23][15] (\__pi_regfile.register[23][15] ),
    .\__pi_regfile.register[24][15] (\__pi_regfile.register[24][15] ),
    .\__pi_regfile.register[25][15] (\__pi_regfile.register[25][15] ),
    .\__pi_regfile.register[26][15] (\__pi_regfile.register[26][15] ),
    .\__pi_regfile.register[27][15] (\__pi_regfile.register[27][15] ),
    .\__pi_regfile.register[28][15] (\__pi_regfile.register[28][15] ),
    .\__pi_regfile.register[29][15] (\__pi_regfile.register[29][15] ),
    .\__pi_regfile.register[2][15] (\__pi_regfile.register[2][15] ),
    .\__pi_regfile.register[30][15] (\__pi_regfile.register[30][15] ),
    .\__pi_regfile.register[31][15] (\__pi_regfile.register[31][15] ),
    .\__pi_regfile.register[3][15] (\__pi_regfile.register[3][15] ),
    .\__pi_regfile.register[4][15] (\__pi_regfile.register[4][15] ),
    .\__pi_regfile.register[5][15] (\__pi_regfile.register[5][15] ),
    .\__pi_regfile.register[6][15] (\__pi_regfile.register[6][15] ),
    .\__pi_regfile.register[7][15] (\__pi_regfile.register[7][15] ),
    .\__pi_regfile.register[8][15] (\__pi_regfile.register[8][15] ),
    .\__pi_regfile.register[9][15] (\__pi_regfile.register[9][15] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[15] (\__po_data_mem_write_data[15]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.15 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][15] (\__pi_regfile.register[0][15] ),
    .\__pi_regfile.register[10][15] (\__pi_regfile.register[10][15] ),
    .\__pi_regfile.register[11][15] (\__pi_regfile.register[11][15] ),
    .\__pi_regfile.register[12][15] (\__pi_regfile.register[12][15] ),
    .\__pi_regfile.register[13][15] (\__pi_regfile.register[13][15] ),
    .\__pi_regfile.register[14][15] (\__pi_regfile.register[14][15] ),
    .\__pi_regfile.register[15][15] (\__pi_regfile.register[15][15] ),
    .\__pi_regfile.register[16][15] (\__pi_regfile.register[16][15] ),
    .\__pi_regfile.register[17][15] (\__pi_regfile.register[17][15] ),
    .\__pi_regfile.register[18][15] (\__pi_regfile.register[18][15] ),
    .\__pi_regfile.register[19][15] (\__pi_regfile.register[19][15] ),
    .\__pi_regfile.register[1][15] (\__pi_regfile.register[1][15] ),
    .\__pi_regfile.register[20][15] (\__pi_regfile.register[20][15] ),
    .\__pi_regfile.register[21][15] (\__pi_regfile.register[21][15] ),
    .\__pi_regfile.register[22][15] (\__pi_regfile.register[22][15] ),
    .\__pi_regfile.register[23][15] (\__pi_regfile.register[23][15] ),
    .\__pi_regfile.register[24][15] (\__pi_regfile.register[24][15] ),
    .\__pi_regfile.register[25][15] (\__pi_regfile.register[25][15] ),
    .\__pi_regfile.register[26][15] (\__pi_regfile.register[26][15] ),
    .\__pi_regfile.register[27][15] (\__pi_regfile.register[27][15] ),
    .\__pi_regfile.register[28][15] (\__pi_regfile.register[28][15] ),
    .\__pi_regfile.register[29][15] (\__pi_regfile.register[29][15] ),
    .\__pi_regfile.register[2][15] (\__pi_regfile.register[2][15] ),
    .\__pi_regfile.register[30][15] (\__pi_regfile.register[30][15] ),
    .\__pi_regfile.register[31][15] (\__pi_regfile.register[31][15] ),
    .\__pi_regfile.register[3][15] (\__pi_regfile.register[3][15] ),
    .\__pi_regfile.register[4][15] (\__pi_regfile.register[4][15] ),
    .\__pi_regfile.register[5][15] (\__pi_regfile.register[5][15] ),
    .\__pi_regfile.register[6][15] (\__pi_regfile.register[6][15] ),
    .\__pi_regfile.register[7][15] (\__pi_regfile.register[7][15] ),
    .\__pi_regfile.register[8][15] (\__pi_regfile.register[8][15] ),
    .\__pi_regfile.register[9][15] (\__pi_regfile.register[9][15] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[15] (\__po_data_mem_write_data[15]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][15]__assume (\__pi_regfile.register[0][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][15]__assume (\__pi_regfile.register[10][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][15]__assume (\__pi_regfile.register[11][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][15]__assume (\__pi_regfile.register[12][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][15]__assume (\__pi_regfile.register[13][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][15]__assume (\__pi_regfile.register[14][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][15]__assume (\__pi_regfile.register[15][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][15]__assume (\__pi_regfile.register[16][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][15]__assume (\__pi_regfile.register[17][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][15]__assume (\__pi_regfile.register[18][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][15]__assume (\__pi_regfile.register[19][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][15]__assume (\__pi_regfile.register[1][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][15]__assume (\__pi_regfile.register[20][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][15]__assume (\__pi_regfile.register[21][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][15]__assume (\__pi_regfile.register[22][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][15]__assume (\__pi_regfile.register[23][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][15]__assume (\__pi_regfile.register[24][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][15]__assume (\__pi_regfile.register[25][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][15]__assume (\__pi_regfile.register[26][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][15]__assume (\__pi_regfile.register[27][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][15]__assume (\__pi_regfile.register[28][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][15]__assume (\__pi_regfile.register[29][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][15]__assume (\__pi_regfile.register[2][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][15]__assume (\__pi_regfile.register[30][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][15]__assume (\__pi_regfile.register[31][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][15]__assume (\__pi_regfile.register[3][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][15]__assume (\__pi_regfile.register[4][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][15]__assume (\__pi_regfile.register[5][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][15]__assume (\__pi_regfile.register[6][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][15]__assume (\__pi_regfile.register[7][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][15]__assume (\__pi_regfile.register[8][15] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][15]__assume (\__pi_regfile.register[9][15] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[15]__assert (\__po_data_mem_write_data[15]__gold , \__po_data_mem_write_data[15]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[15]__gold_cover (\__po_data_mem_write_data[15]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[15]__gate_cover (\__po_data_mem_write_data[15]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.15 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][15] ,
  input  [  0:0] \__pi_regfile.register[10][15] ,
  input  [  0:0] \__pi_regfile.register[11][15] ,
  input  [  0:0] \__pi_regfile.register[12][15] ,
  input  [  0:0] \__pi_regfile.register[13][15] ,
  input  [  0:0] \__pi_regfile.register[14][15] ,
  input  [  0:0] \__pi_regfile.register[15][15] ,
  input  [  0:0] \__pi_regfile.register[16][15] ,
  input  [  0:0] \__pi_regfile.register[17][15] ,
  input  [  0:0] \__pi_regfile.register[18][15] ,
  input  [  0:0] \__pi_regfile.register[19][15] ,
  input  [  0:0] \__pi_regfile.register[1][15] ,
  input  [  0:0] \__pi_regfile.register[20][15] ,
  input  [  0:0] \__pi_regfile.register[21][15] ,
  input  [  0:0] \__pi_regfile.register[22][15] ,
  input  [  0:0] \__pi_regfile.register[23][15] ,
  input  [  0:0] \__pi_regfile.register[24][15] ,
  input  [  0:0] \__pi_regfile.register[25][15] ,
  input  [  0:0] \__pi_regfile.register[26][15] ,
  input  [  0:0] \__pi_regfile.register[27][15] ,
  input  [  0:0] \__pi_regfile.register[28][15] ,
  input  [  0:0] \__pi_regfile.register[29][15] ,
  input  [  0:0] \__pi_regfile.register[2][15] ,
  input  [  0:0] \__pi_regfile.register[30][15] ,
  input  [  0:0] \__pi_regfile.register[31][15] ,
  input  [  0:0] \__pi_regfile.register[3][15] ,
  input  [  0:0] \__pi_regfile.register[4][15] ,
  input  [  0:0] \__pi_regfile.register[5][15] ,
  input  [  0:0] \__pi_regfile.register[6][15] ,
  input  [  0:0] \__pi_regfile.register[7][15] ,
  input  [  0:0] \__pi_regfile.register[8][15] ,
  input  [  0:0] \__pi_regfile.register[9][15] ,
  output [  0:0] \__po_data_mem_write_data[15]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.15 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][15] ,
  input  [  0:0] \__pi_regfile.register[10][15] ,
  input  [  0:0] \__pi_regfile.register[11][15] ,
  input  [  0:0] \__pi_regfile.register[12][15] ,
  input  [  0:0] \__pi_regfile.register[13][15] ,
  input  [  0:0] \__pi_regfile.register[14][15] ,
  input  [  0:0] \__pi_regfile.register[15][15] ,
  input  [  0:0] \__pi_regfile.register[16][15] ,
  input  [  0:0] \__pi_regfile.register[17][15] ,
  input  [  0:0] \__pi_regfile.register[18][15] ,
  input  [  0:0] \__pi_regfile.register[19][15] ,
  input  [  0:0] \__pi_regfile.register[1][15] ,
  input  [  0:0] \__pi_regfile.register[20][15] ,
  input  [  0:0] \__pi_regfile.register[21][15] ,
  input  [  0:0] \__pi_regfile.register[22][15] ,
  input  [  0:0] \__pi_regfile.register[23][15] ,
  input  [  0:0] \__pi_regfile.register[24][15] ,
  input  [  0:0] \__pi_regfile.register[25][15] ,
  input  [  0:0] \__pi_regfile.register[26][15] ,
  input  [  0:0] \__pi_regfile.register[27][15] ,
  input  [  0:0] \__pi_regfile.register[28][15] ,
  input  [  0:0] \__pi_regfile.register[29][15] ,
  input  [  0:0] \__pi_regfile.register[2][15] ,
  input  [  0:0] \__pi_regfile.register[30][15] ,
  input  [  0:0] \__pi_regfile.register[31][15] ,
  input  [  0:0] \__pi_regfile.register[3][15] ,
  input  [  0:0] \__pi_regfile.register[4][15] ,
  input  [  0:0] \__pi_regfile.register[5][15] ,
  input  [  0:0] \__pi_regfile.register[6][15] ,
  input  [  0:0] \__pi_regfile.register[7][15] ,
  input  [  0:0] \__pi_regfile.register[8][15] ,
  input  [  0:0] \__pi_regfile.register[9][15] ,
  output [  0:0] \__po_data_mem_write_data[15]
);
endmodule
