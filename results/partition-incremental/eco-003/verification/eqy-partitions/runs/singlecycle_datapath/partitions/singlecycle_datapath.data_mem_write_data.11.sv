module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][11] ,
  input  [  0:0] \__pi_regfile.register[10][11] ,
  input  [  0:0] \__pi_regfile.register[11][11] ,
  input  [  0:0] \__pi_regfile.register[12][11] ,
  input  [  0:0] \__pi_regfile.register[13][11] ,
  input  [  0:0] \__pi_regfile.register[14][11] ,
  input  [  0:0] \__pi_regfile.register[15][11] ,
  input  [  0:0] \__pi_regfile.register[16][11] ,
  input  [  0:0] \__pi_regfile.register[17][11] ,
  input  [  0:0] \__pi_regfile.register[18][11] ,
  input  [  0:0] \__pi_regfile.register[19][11] ,
  input  [  0:0] \__pi_regfile.register[1][11] ,
  input  [  0:0] \__pi_regfile.register[20][11] ,
  input  [  0:0] \__pi_regfile.register[21][11] ,
  input  [  0:0] \__pi_regfile.register[22][11] ,
  input  [  0:0] \__pi_regfile.register[23][11] ,
  input  [  0:0] \__pi_regfile.register[24][11] ,
  input  [  0:0] \__pi_regfile.register[25][11] ,
  input  [  0:0] \__pi_regfile.register[26][11] ,
  input  [  0:0] \__pi_regfile.register[27][11] ,
  input  [  0:0] \__pi_regfile.register[28][11] ,
  input  [  0:0] \__pi_regfile.register[29][11] ,
  input  [  0:0] \__pi_regfile.register[2][11] ,
  input  [  0:0] \__pi_regfile.register[30][11] ,
  input  [  0:0] \__pi_regfile.register[31][11] ,
  input  [  0:0] \__pi_regfile.register[3][11] ,
  input  [  0:0] \__pi_regfile.register[4][11] ,
  input  [  0:0] \__pi_regfile.register[5][11] ,
  input  [  0:0] \__pi_regfile.register[6][11] ,
  input  [  0:0] \__pi_regfile.register[7][11] ,
  input  [  0:0] \__pi_regfile.register[8][11] ,
  input  [  0:0] \__pi_regfile.register[9][11] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[11]__gold ,
  output [  0:0] \__po_data_mem_write_data[11]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.11 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][11] (\__pi_regfile.register[0][11] ),
    .\__pi_regfile.register[10][11] (\__pi_regfile.register[10][11] ),
    .\__pi_regfile.register[11][11] (\__pi_regfile.register[11][11] ),
    .\__pi_regfile.register[12][11] (\__pi_regfile.register[12][11] ),
    .\__pi_regfile.register[13][11] (\__pi_regfile.register[13][11] ),
    .\__pi_regfile.register[14][11] (\__pi_regfile.register[14][11] ),
    .\__pi_regfile.register[15][11] (\__pi_regfile.register[15][11] ),
    .\__pi_regfile.register[16][11] (\__pi_regfile.register[16][11] ),
    .\__pi_regfile.register[17][11] (\__pi_regfile.register[17][11] ),
    .\__pi_regfile.register[18][11] (\__pi_regfile.register[18][11] ),
    .\__pi_regfile.register[19][11] (\__pi_regfile.register[19][11] ),
    .\__pi_regfile.register[1][11] (\__pi_regfile.register[1][11] ),
    .\__pi_regfile.register[20][11] (\__pi_regfile.register[20][11] ),
    .\__pi_regfile.register[21][11] (\__pi_regfile.register[21][11] ),
    .\__pi_regfile.register[22][11] (\__pi_regfile.register[22][11] ),
    .\__pi_regfile.register[23][11] (\__pi_regfile.register[23][11] ),
    .\__pi_regfile.register[24][11] (\__pi_regfile.register[24][11] ),
    .\__pi_regfile.register[25][11] (\__pi_regfile.register[25][11] ),
    .\__pi_regfile.register[26][11] (\__pi_regfile.register[26][11] ),
    .\__pi_regfile.register[27][11] (\__pi_regfile.register[27][11] ),
    .\__pi_regfile.register[28][11] (\__pi_regfile.register[28][11] ),
    .\__pi_regfile.register[29][11] (\__pi_regfile.register[29][11] ),
    .\__pi_regfile.register[2][11] (\__pi_regfile.register[2][11] ),
    .\__pi_regfile.register[30][11] (\__pi_regfile.register[30][11] ),
    .\__pi_regfile.register[31][11] (\__pi_regfile.register[31][11] ),
    .\__pi_regfile.register[3][11] (\__pi_regfile.register[3][11] ),
    .\__pi_regfile.register[4][11] (\__pi_regfile.register[4][11] ),
    .\__pi_regfile.register[5][11] (\__pi_regfile.register[5][11] ),
    .\__pi_regfile.register[6][11] (\__pi_regfile.register[6][11] ),
    .\__pi_regfile.register[7][11] (\__pi_regfile.register[7][11] ),
    .\__pi_regfile.register[8][11] (\__pi_regfile.register[8][11] ),
    .\__pi_regfile.register[9][11] (\__pi_regfile.register[9][11] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[11] (\__po_data_mem_write_data[11]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.11 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][11] (\__pi_regfile.register[0][11] ),
    .\__pi_regfile.register[10][11] (\__pi_regfile.register[10][11] ),
    .\__pi_regfile.register[11][11] (\__pi_regfile.register[11][11] ),
    .\__pi_regfile.register[12][11] (\__pi_regfile.register[12][11] ),
    .\__pi_regfile.register[13][11] (\__pi_regfile.register[13][11] ),
    .\__pi_regfile.register[14][11] (\__pi_regfile.register[14][11] ),
    .\__pi_regfile.register[15][11] (\__pi_regfile.register[15][11] ),
    .\__pi_regfile.register[16][11] (\__pi_regfile.register[16][11] ),
    .\__pi_regfile.register[17][11] (\__pi_regfile.register[17][11] ),
    .\__pi_regfile.register[18][11] (\__pi_regfile.register[18][11] ),
    .\__pi_regfile.register[19][11] (\__pi_regfile.register[19][11] ),
    .\__pi_regfile.register[1][11] (\__pi_regfile.register[1][11] ),
    .\__pi_regfile.register[20][11] (\__pi_regfile.register[20][11] ),
    .\__pi_regfile.register[21][11] (\__pi_regfile.register[21][11] ),
    .\__pi_regfile.register[22][11] (\__pi_regfile.register[22][11] ),
    .\__pi_regfile.register[23][11] (\__pi_regfile.register[23][11] ),
    .\__pi_regfile.register[24][11] (\__pi_regfile.register[24][11] ),
    .\__pi_regfile.register[25][11] (\__pi_regfile.register[25][11] ),
    .\__pi_regfile.register[26][11] (\__pi_regfile.register[26][11] ),
    .\__pi_regfile.register[27][11] (\__pi_regfile.register[27][11] ),
    .\__pi_regfile.register[28][11] (\__pi_regfile.register[28][11] ),
    .\__pi_regfile.register[29][11] (\__pi_regfile.register[29][11] ),
    .\__pi_regfile.register[2][11] (\__pi_regfile.register[2][11] ),
    .\__pi_regfile.register[30][11] (\__pi_regfile.register[30][11] ),
    .\__pi_regfile.register[31][11] (\__pi_regfile.register[31][11] ),
    .\__pi_regfile.register[3][11] (\__pi_regfile.register[3][11] ),
    .\__pi_regfile.register[4][11] (\__pi_regfile.register[4][11] ),
    .\__pi_regfile.register[5][11] (\__pi_regfile.register[5][11] ),
    .\__pi_regfile.register[6][11] (\__pi_regfile.register[6][11] ),
    .\__pi_regfile.register[7][11] (\__pi_regfile.register[7][11] ),
    .\__pi_regfile.register[8][11] (\__pi_regfile.register[8][11] ),
    .\__pi_regfile.register[9][11] (\__pi_regfile.register[9][11] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[11] (\__po_data_mem_write_data[11]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][11]__assume (\__pi_regfile.register[0][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][11]__assume (\__pi_regfile.register[10][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][11]__assume (\__pi_regfile.register[11][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][11]__assume (\__pi_regfile.register[12][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][11]__assume (\__pi_regfile.register[13][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][11]__assume (\__pi_regfile.register[14][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][11]__assume (\__pi_regfile.register[15][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][11]__assume (\__pi_regfile.register[16][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][11]__assume (\__pi_regfile.register[17][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][11]__assume (\__pi_regfile.register[18][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][11]__assume (\__pi_regfile.register[19][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][11]__assume (\__pi_regfile.register[1][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][11]__assume (\__pi_regfile.register[20][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][11]__assume (\__pi_regfile.register[21][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][11]__assume (\__pi_regfile.register[22][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][11]__assume (\__pi_regfile.register[23][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][11]__assume (\__pi_regfile.register[24][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][11]__assume (\__pi_regfile.register[25][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][11]__assume (\__pi_regfile.register[26][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][11]__assume (\__pi_regfile.register[27][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][11]__assume (\__pi_regfile.register[28][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][11]__assume (\__pi_regfile.register[29][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][11]__assume (\__pi_regfile.register[2][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][11]__assume (\__pi_regfile.register[30][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][11]__assume (\__pi_regfile.register[31][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][11]__assume (\__pi_regfile.register[3][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][11]__assume (\__pi_regfile.register[4][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][11]__assume (\__pi_regfile.register[5][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][11]__assume (\__pi_regfile.register[6][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][11]__assume (\__pi_regfile.register[7][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][11]__assume (\__pi_regfile.register[8][11] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][11]__assume (\__pi_regfile.register[9][11] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[11]__assert (\__po_data_mem_write_data[11]__gold , \__po_data_mem_write_data[11]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[11]__gold_cover (\__po_data_mem_write_data[11]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[11]__gate_cover (\__po_data_mem_write_data[11]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.11 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][11] ,
  input  [  0:0] \__pi_regfile.register[10][11] ,
  input  [  0:0] \__pi_regfile.register[11][11] ,
  input  [  0:0] \__pi_regfile.register[12][11] ,
  input  [  0:0] \__pi_regfile.register[13][11] ,
  input  [  0:0] \__pi_regfile.register[14][11] ,
  input  [  0:0] \__pi_regfile.register[15][11] ,
  input  [  0:0] \__pi_regfile.register[16][11] ,
  input  [  0:0] \__pi_regfile.register[17][11] ,
  input  [  0:0] \__pi_regfile.register[18][11] ,
  input  [  0:0] \__pi_regfile.register[19][11] ,
  input  [  0:0] \__pi_regfile.register[1][11] ,
  input  [  0:0] \__pi_regfile.register[20][11] ,
  input  [  0:0] \__pi_regfile.register[21][11] ,
  input  [  0:0] \__pi_regfile.register[22][11] ,
  input  [  0:0] \__pi_regfile.register[23][11] ,
  input  [  0:0] \__pi_regfile.register[24][11] ,
  input  [  0:0] \__pi_regfile.register[25][11] ,
  input  [  0:0] \__pi_regfile.register[26][11] ,
  input  [  0:0] \__pi_regfile.register[27][11] ,
  input  [  0:0] \__pi_regfile.register[28][11] ,
  input  [  0:0] \__pi_regfile.register[29][11] ,
  input  [  0:0] \__pi_regfile.register[2][11] ,
  input  [  0:0] \__pi_regfile.register[30][11] ,
  input  [  0:0] \__pi_regfile.register[31][11] ,
  input  [  0:0] \__pi_regfile.register[3][11] ,
  input  [  0:0] \__pi_regfile.register[4][11] ,
  input  [  0:0] \__pi_regfile.register[5][11] ,
  input  [  0:0] \__pi_regfile.register[6][11] ,
  input  [  0:0] \__pi_regfile.register[7][11] ,
  input  [  0:0] \__pi_regfile.register[8][11] ,
  input  [  0:0] \__pi_regfile.register[9][11] ,
  output [  0:0] \__po_data_mem_write_data[11]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.11 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][11] ,
  input  [  0:0] \__pi_regfile.register[10][11] ,
  input  [  0:0] \__pi_regfile.register[11][11] ,
  input  [  0:0] \__pi_regfile.register[12][11] ,
  input  [  0:0] \__pi_regfile.register[13][11] ,
  input  [  0:0] \__pi_regfile.register[14][11] ,
  input  [  0:0] \__pi_regfile.register[15][11] ,
  input  [  0:0] \__pi_regfile.register[16][11] ,
  input  [  0:0] \__pi_regfile.register[17][11] ,
  input  [  0:0] \__pi_regfile.register[18][11] ,
  input  [  0:0] \__pi_regfile.register[19][11] ,
  input  [  0:0] \__pi_regfile.register[1][11] ,
  input  [  0:0] \__pi_regfile.register[20][11] ,
  input  [  0:0] \__pi_regfile.register[21][11] ,
  input  [  0:0] \__pi_regfile.register[22][11] ,
  input  [  0:0] \__pi_regfile.register[23][11] ,
  input  [  0:0] \__pi_regfile.register[24][11] ,
  input  [  0:0] \__pi_regfile.register[25][11] ,
  input  [  0:0] \__pi_regfile.register[26][11] ,
  input  [  0:0] \__pi_regfile.register[27][11] ,
  input  [  0:0] \__pi_regfile.register[28][11] ,
  input  [  0:0] \__pi_regfile.register[29][11] ,
  input  [  0:0] \__pi_regfile.register[2][11] ,
  input  [  0:0] \__pi_regfile.register[30][11] ,
  input  [  0:0] \__pi_regfile.register[31][11] ,
  input  [  0:0] \__pi_regfile.register[3][11] ,
  input  [  0:0] \__pi_regfile.register[4][11] ,
  input  [  0:0] \__pi_regfile.register[5][11] ,
  input  [  0:0] \__pi_regfile.register[6][11] ,
  input  [  0:0] \__pi_regfile.register[7][11] ,
  input  [  0:0] \__pi_regfile.register[8][11] ,
  input  [  0:0] \__pi_regfile.register[9][11] ,
  output [  0:0] \__po_data_mem_write_data[11]
);
endmodule
