module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][14] ,
  input  [  0:0] \__pi_regfile.register[10][14] ,
  input  [  0:0] \__pi_regfile.register[11][14] ,
  input  [  0:0] \__pi_regfile.register[12][14] ,
  input  [  0:0] \__pi_regfile.register[13][14] ,
  input  [  0:0] \__pi_regfile.register[14][14] ,
  input  [  0:0] \__pi_regfile.register[15][14] ,
  input  [  0:0] \__pi_regfile.register[16][14] ,
  input  [  0:0] \__pi_regfile.register[17][14] ,
  input  [  0:0] \__pi_regfile.register[18][14] ,
  input  [  0:0] \__pi_regfile.register[19][14] ,
  input  [  0:0] \__pi_regfile.register[1][14] ,
  input  [  0:0] \__pi_regfile.register[20][14] ,
  input  [  0:0] \__pi_regfile.register[21][14] ,
  input  [  0:0] \__pi_regfile.register[22][14] ,
  input  [  0:0] \__pi_regfile.register[23][14] ,
  input  [  0:0] \__pi_regfile.register[24][14] ,
  input  [  0:0] \__pi_regfile.register[25][14] ,
  input  [  0:0] \__pi_regfile.register[26][14] ,
  input  [  0:0] \__pi_regfile.register[27][14] ,
  input  [  0:0] \__pi_regfile.register[28][14] ,
  input  [  0:0] \__pi_regfile.register[29][14] ,
  input  [  0:0] \__pi_regfile.register[2][14] ,
  input  [  0:0] \__pi_regfile.register[30][14] ,
  input  [  0:0] \__pi_regfile.register[31][14] ,
  input  [  0:0] \__pi_regfile.register[3][14] ,
  input  [  0:0] \__pi_regfile.register[4][14] ,
  input  [  0:0] \__pi_regfile.register[5][14] ,
  input  [  0:0] \__pi_regfile.register[6][14] ,
  input  [  0:0] \__pi_regfile.register[7][14] ,
  input  [  0:0] \__pi_regfile.register[8][14] ,
  input  [  0:0] \__pi_regfile.register[9][14] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[14]__gold ,
  output [  0:0] \__po_data_mem_write_data[14]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.14 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][14] (\__pi_regfile.register[0][14] ),
    .\__pi_regfile.register[10][14] (\__pi_regfile.register[10][14] ),
    .\__pi_regfile.register[11][14] (\__pi_regfile.register[11][14] ),
    .\__pi_regfile.register[12][14] (\__pi_regfile.register[12][14] ),
    .\__pi_regfile.register[13][14] (\__pi_regfile.register[13][14] ),
    .\__pi_regfile.register[14][14] (\__pi_regfile.register[14][14] ),
    .\__pi_regfile.register[15][14] (\__pi_regfile.register[15][14] ),
    .\__pi_regfile.register[16][14] (\__pi_regfile.register[16][14] ),
    .\__pi_regfile.register[17][14] (\__pi_regfile.register[17][14] ),
    .\__pi_regfile.register[18][14] (\__pi_regfile.register[18][14] ),
    .\__pi_regfile.register[19][14] (\__pi_regfile.register[19][14] ),
    .\__pi_regfile.register[1][14] (\__pi_regfile.register[1][14] ),
    .\__pi_regfile.register[20][14] (\__pi_regfile.register[20][14] ),
    .\__pi_regfile.register[21][14] (\__pi_regfile.register[21][14] ),
    .\__pi_regfile.register[22][14] (\__pi_regfile.register[22][14] ),
    .\__pi_regfile.register[23][14] (\__pi_regfile.register[23][14] ),
    .\__pi_regfile.register[24][14] (\__pi_regfile.register[24][14] ),
    .\__pi_regfile.register[25][14] (\__pi_regfile.register[25][14] ),
    .\__pi_regfile.register[26][14] (\__pi_regfile.register[26][14] ),
    .\__pi_regfile.register[27][14] (\__pi_regfile.register[27][14] ),
    .\__pi_regfile.register[28][14] (\__pi_regfile.register[28][14] ),
    .\__pi_regfile.register[29][14] (\__pi_regfile.register[29][14] ),
    .\__pi_regfile.register[2][14] (\__pi_regfile.register[2][14] ),
    .\__pi_regfile.register[30][14] (\__pi_regfile.register[30][14] ),
    .\__pi_regfile.register[31][14] (\__pi_regfile.register[31][14] ),
    .\__pi_regfile.register[3][14] (\__pi_regfile.register[3][14] ),
    .\__pi_regfile.register[4][14] (\__pi_regfile.register[4][14] ),
    .\__pi_regfile.register[5][14] (\__pi_regfile.register[5][14] ),
    .\__pi_regfile.register[6][14] (\__pi_regfile.register[6][14] ),
    .\__pi_regfile.register[7][14] (\__pi_regfile.register[7][14] ),
    .\__pi_regfile.register[8][14] (\__pi_regfile.register[8][14] ),
    .\__pi_regfile.register[9][14] (\__pi_regfile.register[9][14] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[14] (\__po_data_mem_write_data[14]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.14 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][14] (\__pi_regfile.register[0][14] ),
    .\__pi_regfile.register[10][14] (\__pi_regfile.register[10][14] ),
    .\__pi_regfile.register[11][14] (\__pi_regfile.register[11][14] ),
    .\__pi_regfile.register[12][14] (\__pi_regfile.register[12][14] ),
    .\__pi_regfile.register[13][14] (\__pi_regfile.register[13][14] ),
    .\__pi_regfile.register[14][14] (\__pi_regfile.register[14][14] ),
    .\__pi_regfile.register[15][14] (\__pi_regfile.register[15][14] ),
    .\__pi_regfile.register[16][14] (\__pi_regfile.register[16][14] ),
    .\__pi_regfile.register[17][14] (\__pi_regfile.register[17][14] ),
    .\__pi_regfile.register[18][14] (\__pi_regfile.register[18][14] ),
    .\__pi_regfile.register[19][14] (\__pi_regfile.register[19][14] ),
    .\__pi_regfile.register[1][14] (\__pi_regfile.register[1][14] ),
    .\__pi_regfile.register[20][14] (\__pi_regfile.register[20][14] ),
    .\__pi_regfile.register[21][14] (\__pi_regfile.register[21][14] ),
    .\__pi_regfile.register[22][14] (\__pi_regfile.register[22][14] ),
    .\__pi_regfile.register[23][14] (\__pi_regfile.register[23][14] ),
    .\__pi_regfile.register[24][14] (\__pi_regfile.register[24][14] ),
    .\__pi_regfile.register[25][14] (\__pi_regfile.register[25][14] ),
    .\__pi_regfile.register[26][14] (\__pi_regfile.register[26][14] ),
    .\__pi_regfile.register[27][14] (\__pi_regfile.register[27][14] ),
    .\__pi_regfile.register[28][14] (\__pi_regfile.register[28][14] ),
    .\__pi_regfile.register[29][14] (\__pi_regfile.register[29][14] ),
    .\__pi_regfile.register[2][14] (\__pi_regfile.register[2][14] ),
    .\__pi_regfile.register[30][14] (\__pi_regfile.register[30][14] ),
    .\__pi_regfile.register[31][14] (\__pi_regfile.register[31][14] ),
    .\__pi_regfile.register[3][14] (\__pi_regfile.register[3][14] ),
    .\__pi_regfile.register[4][14] (\__pi_regfile.register[4][14] ),
    .\__pi_regfile.register[5][14] (\__pi_regfile.register[5][14] ),
    .\__pi_regfile.register[6][14] (\__pi_regfile.register[6][14] ),
    .\__pi_regfile.register[7][14] (\__pi_regfile.register[7][14] ),
    .\__pi_regfile.register[8][14] (\__pi_regfile.register[8][14] ),
    .\__pi_regfile.register[9][14] (\__pi_regfile.register[9][14] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[14] (\__po_data_mem_write_data[14]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][14]__assume (\__pi_regfile.register[0][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][14]__assume (\__pi_regfile.register[10][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][14]__assume (\__pi_regfile.register[11][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][14]__assume (\__pi_regfile.register[12][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][14]__assume (\__pi_regfile.register[13][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][14]__assume (\__pi_regfile.register[14][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][14]__assume (\__pi_regfile.register[15][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][14]__assume (\__pi_regfile.register[16][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][14]__assume (\__pi_regfile.register[17][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][14]__assume (\__pi_regfile.register[18][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][14]__assume (\__pi_regfile.register[19][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][14]__assume (\__pi_regfile.register[1][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][14]__assume (\__pi_regfile.register[20][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][14]__assume (\__pi_regfile.register[21][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][14]__assume (\__pi_regfile.register[22][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][14]__assume (\__pi_regfile.register[23][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][14]__assume (\__pi_regfile.register[24][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][14]__assume (\__pi_regfile.register[25][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][14]__assume (\__pi_regfile.register[26][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][14]__assume (\__pi_regfile.register[27][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][14]__assume (\__pi_regfile.register[28][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][14]__assume (\__pi_regfile.register[29][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][14]__assume (\__pi_regfile.register[2][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][14]__assume (\__pi_regfile.register[30][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][14]__assume (\__pi_regfile.register[31][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][14]__assume (\__pi_regfile.register[3][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][14]__assume (\__pi_regfile.register[4][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][14]__assume (\__pi_regfile.register[5][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][14]__assume (\__pi_regfile.register[6][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][14]__assume (\__pi_regfile.register[7][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][14]__assume (\__pi_regfile.register[8][14] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][14]__assume (\__pi_regfile.register[9][14] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[14]__assert (\__po_data_mem_write_data[14]__gold , \__po_data_mem_write_data[14]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[14]__gold_cover (\__po_data_mem_write_data[14]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[14]__gate_cover (\__po_data_mem_write_data[14]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.14 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][14] ,
  input  [  0:0] \__pi_regfile.register[10][14] ,
  input  [  0:0] \__pi_regfile.register[11][14] ,
  input  [  0:0] \__pi_regfile.register[12][14] ,
  input  [  0:0] \__pi_regfile.register[13][14] ,
  input  [  0:0] \__pi_regfile.register[14][14] ,
  input  [  0:0] \__pi_regfile.register[15][14] ,
  input  [  0:0] \__pi_regfile.register[16][14] ,
  input  [  0:0] \__pi_regfile.register[17][14] ,
  input  [  0:0] \__pi_regfile.register[18][14] ,
  input  [  0:0] \__pi_regfile.register[19][14] ,
  input  [  0:0] \__pi_regfile.register[1][14] ,
  input  [  0:0] \__pi_regfile.register[20][14] ,
  input  [  0:0] \__pi_regfile.register[21][14] ,
  input  [  0:0] \__pi_regfile.register[22][14] ,
  input  [  0:0] \__pi_regfile.register[23][14] ,
  input  [  0:0] \__pi_regfile.register[24][14] ,
  input  [  0:0] \__pi_regfile.register[25][14] ,
  input  [  0:0] \__pi_regfile.register[26][14] ,
  input  [  0:0] \__pi_regfile.register[27][14] ,
  input  [  0:0] \__pi_regfile.register[28][14] ,
  input  [  0:0] \__pi_regfile.register[29][14] ,
  input  [  0:0] \__pi_regfile.register[2][14] ,
  input  [  0:0] \__pi_regfile.register[30][14] ,
  input  [  0:0] \__pi_regfile.register[31][14] ,
  input  [  0:0] \__pi_regfile.register[3][14] ,
  input  [  0:0] \__pi_regfile.register[4][14] ,
  input  [  0:0] \__pi_regfile.register[5][14] ,
  input  [  0:0] \__pi_regfile.register[6][14] ,
  input  [  0:0] \__pi_regfile.register[7][14] ,
  input  [  0:0] \__pi_regfile.register[8][14] ,
  input  [  0:0] \__pi_regfile.register[9][14] ,
  output [  0:0] \__po_data_mem_write_data[14]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.14 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][14] ,
  input  [  0:0] \__pi_regfile.register[10][14] ,
  input  [  0:0] \__pi_regfile.register[11][14] ,
  input  [  0:0] \__pi_regfile.register[12][14] ,
  input  [  0:0] \__pi_regfile.register[13][14] ,
  input  [  0:0] \__pi_regfile.register[14][14] ,
  input  [  0:0] \__pi_regfile.register[15][14] ,
  input  [  0:0] \__pi_regfile.register[16][14] ,
  input  [  0:0] \__pi_regfile.register[17][14] ,
  input  [  0:0] \__pi_regfile.register[18][14] ,
  input  [  0:0] \__pi_regfile.register[19][14] ,
  input  [  0:0] \__pi_regfile.register[1][14] ,
  input  [  0:0] \__pi_regfile.register[20][14] ,
  input  [  0:0] \__pi_regfile.register[21][14] ,
  input  [  0:0] \__pi_regfile.register[22][14] ,
  input  [  0:0] \__pi_regfile.register[23][14] ,
  input  [  0:0] \__pi_regfile.register[24][14] ,
  input  [  0:0] \__pi_regfile.register[25][14] ,
  input  [  0:0] \__pi_regfile.register[26][14] ,
  input  [  0:0] \__pi_regfile.register[27][14] ,
  input  [  0:0] \__pi_regfile.register[28][14] ,
  input  [  0:0] \__pi_regfile.register[29][14] ,
  input  [  0:0] \__pi_regfile.register[2][14] ,
  input  [  0:0] \__pi_regfile.register[30][14] ,
  input  [  0:0] \__pi_regfile.register[31][14] ,
  input  [  0:0] \__pi_regfile.register[3][14] ,
  input  [  0:0] \__pi_regfile.register[4][14] ,
  input  [  0:0] \__pi_regfile.register[5][14] ,
  input  [  0:0] \__pi_regfile.register[6][14] ,
  input  [  0:0] \__pi_regfile.register[7][14] ,
  input  [  0:0] \__pi_regfile.register[8][14] ,
  input  [  0:0] \__pi_regfile.register[9][14] ,
  output [  0:0] \__po_data_mem_write_data[14]
);
endmodule
