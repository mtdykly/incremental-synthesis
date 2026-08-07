module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][28] ,
  input  [  0:0] \__pi_regfile.register[10][28] ,
  input  [  0:0] \__pi_regfile.register[11][28] ,
  input  [  0:0] \__pi_regfile.register[12][28] ,
  input  [  0:0] \__pi_regfile.register[13][28] ,
  input  [  0:0] \__pi_regfile.register[14][28] ,
  input  [  0:0] \__pi_regfile.register[15][28] ,
  input  [  0:0] \__pi_regfile.register[16][28] ,
  input  [  0:0] \__pi_regfile.register[17][28] ,
  input  [  0:0] \__pi_regfile.register[18][28] ,
  input  [  0:0] \__pi_regfile.register[19][28] ,
  input  [  0:0] \__pi_regfile.register[1][28] ,
  input  [  0:0] \__pi_regfile.register[20][28] ,
  input  [  0:0] \__pi_regfile.register[21][28] ,
  input  [  0:0] \__pi_regfile.register[22][28] ,
  input  [  0:0] \__pi_regfile.register[23][28] ,
  input  [  0:0] \__pi_regfile.register[24][28] ,
  input  [  0:0] \__pi_regfile.register[25][28] ,
  input  [  0:0] \__pi_regfile.register[26][28] ,
  input  [  0:0] \__pi_regfile.register[27][28] ,
  input  [  0:0] \__pi_regfile.register[28][28] ,
  input  [  0:0] \__pi_regfile.register[29][28] ,
  input  [  0:0] \__pi_regfile.register[2][28] ,
  input  [  0:0] \__pi_regfile.register[30][28] ,
  input  [  0:0] \__pi_regfile.register[31][28] ,
  input  [  0:0] \__pi_regfile.register[3][28] ,
  input  [  0:0] \__pi_regfile.register[4][28] ,
  input  [  0:0] \__pi_regfile.register[5][28] ,
  input  [  0:0] \__pi_regfile.register[6][28] ,
  input  [  0:0] \__pi_regfile.register[7][28] ,
  input  [  0:0] \__pi_regfile.register[8][28] ,
  input  [  0:0] \__pi_regfile.register[9][28] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[28]__gold ,
  output [  0:0] \__po_data_mem_write_data[28]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.28 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][28] (\__pi_regfile.register[0][28] ),
    .\__pi_regfile.register[10][28] (\__pi_regfile.register[10][28] ),
    .\__pi_regfile.register[11][28] (\__pi_regfile.register[11][28] ),
    .\__pi_regfile.register[12][28] (\__pi_regfile.register[12][28] ),
    .\__pi_regfile.register[13][28] (\__pi_regfile.register[13][28] ),
    .\__pi_regfile.register[14][28] (\__pi_regfile.register[14][28] ),
    .\__pi_regfile.register[15][28] (\__pi_regfile.register[15][28] ),
    .\__pi_regfile.register[16][28] (\__pi_regfile.register[16][28] ),
    .\__pi_regfile.register[17][28] (\__pi_regfile.register[17][28] ),
    .\__pi_regfile.register[18][28] (\__pi_regfile.register[18][28] ),
    .\__pi_regfile.register[19][28] (\__pi_regfile.register[19][28] ),
    .\__pi_regfile.register[1][28] (\__pi_regfile.register[1][28] ),
    .\__pi_regfile.register[20][28] (\__pi_regfile.register[20][28] ),
    .\__pi_regfile.register[21][28] (\__pi_regfile.register[21][28] ),
    .\__pi_regfile.register[22][28] (\__pi_regfile.register[22][28] ),
    .\__pi_regfile.register[23][28] (\__pi_regfile.register[23][28] ),
    .\__pi_regfile.register[24][28] (\__pi_regfile.register[24][28] ),
    .\__pi_regfile.register[25][28] (\__pi_regfile.register[25][28] ),
    .\__pi_regfile.register[26][28] (\__pi_regfile.register[26][28] ),
    .\__pi_regfile.register[27][28] (\__pi_regfile.register[27][28] ),
    .\__pi_regfile.register[28][28] (\__pi_regfile.register[28][28] ),
    .\__pi_regfile.register[29][28] (\__pi_regfile.register[29][28] ),
    .\__pi_regfile.register[2][28] (\__pi_regfile.register[2][28] ),
    .\__pi_regfile.register[30][28] (\__pi_regfile.register[30][28] ),
    .\__pi_regfile.register[31][28] (\__pi_regfile.register[31][28] ),
    .\__pi_regfile.register[3][28] (\__pi_regfile.register[3][28] ),
    .\__pi_regfile.register[4][28] (\__pi_regfile.register[4][28] ),
    .\__pi_regfile.register[5][28] (\__pi_regfile.register[5][28] ),
    .\__pi_regfile.register[6][28] (\__pi_regfile.register[6][28] ),
    .\__pi_regfile.register[7][28] (\__pi_regfile.register[7][28] ),
    .\__pi_regfile.register[8][28] (\__pi_regfile.register[8][28] ),
    .\__pi_regfile.register[9][28] (\__pi_regfile.register[9][28] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[28] (\__po_data_mem_write_data[28]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.28 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][28] (\__pi_regfile.register[0][28] ),
    .\__pi_regfile.register[10][28] (\__pi_regfile.register[10][28] ),
    .\__pi_regfile.register[11][28] (\__pi_regfile.register[11][28] ),
    .\__pi_regfile.register[12][28] (\__pi_regfile.register[12][28] ),
    .\__pi_regfile.register[13][28] (\__pi_regfile.register[13][28] ),
    .\__pi_regfile.register[14][28] (\__pi_regfile.register[14][28] ),
    .\__pi_regfile.register[15][28] (\__pi_regfile.register[15][28] ),
    .\__pi_regfile.register[16][28] (\__pi_regfile.register[16][28] ),
    .\__pi_regfile.register[17][28] (\__pi_regfile.register[17][28] ),
    .\__pi_regfile.register[18][28] (\__pi_regfile.register[18][28] ),
    .\__pi_regfile.register[19][28] (\__pi_regfile.register[19][28] ),
    .\__pi_regfile.register[1][28] (\__pi_regfile.register[1][28] ),
    .\__pi_regfile.register[20][28] (\__pi_regfile.register[20][28] ),
    .\__pi_regfile.register[21][28] (\__pi_regfile.register[21][28] ),
    .\__pi_regfile.register[22][28] (\__pi_regfile.register[22][28] ),
    .\__pi_regfile.register[23][28] (\__pi_regfile.register[23][28] ),
    .\__pi_regfile.register[24][28] (\__pi_regfile.register[24][28] ),
    .\__pi_regfile.register[25][28] (\__pi_regfile.register[25][28] ),
    .\__pi_regfile.register[26][28] (\__pi_regfile.register[26][28] ),
    .\__pi_regfile.register[27][28] (\__pi_regfile.register[27][28] ),
    .\__pi_regfile.register[28][28] (\__pi_regfile.register[28][28] ),
    .\__pi_regfile.register[29][28] (\__pi_regfile.register[29][28] ),
    .\__pi_regfile.register[2][28] (\__pi_regfile.register[2][28] ),
    .\__pi_regfile.register[30][28] (\__pi_regfile.register[30][28] ),
    .\__pi_regfile.register[31][28] (\__pi_regfile.register[31][28] ),
    .\__pi_regfile.register[3][28] (\__pi_regfile.register[3][28] ),
    .\__pi_regfile.register[4][28] (\__pi_regfile.register[4][28] ),
    .\__pi_regfile.register[5][28] (\__pi_regfile.register[5][28] ),
    .\__pi_regfile.register[6][28] (\__pi_regfile.register[6][28] ),
    .\__pi_regfile.register[7][28] (\__pi_regfile.register[7][28] ),
    .\__pi_regfile.register[8][28] (\__pi_regfile.register[8][28] ),
    .\__pi_regfile.register[9][28] (\__pi_regfile.register[9][28] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[28] (\__po_data_mem_write_data[28]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][28]__assume (\__pi_regfile.register[0][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][28]__assume (\__pi_regfile.register[10][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][28]__assume (\__pi_regfile.register[11][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][28]__assume (\__pi_regfile.register[12][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][28]__assume (\__pi_regfile.register[13][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][28]__assume (\__pi_regfile.register[14][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][28]__assume (\__pi_regfile.register[15][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][28]__assume (\__pi_regfile.register[16][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][28]__assume (\__pi_regfile.register[17][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][28]__assume (\__pi_regfile.register[18][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][28]__assume (\__pi_regfile.register[19][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][28]__assume (\__pi_regfile.register[1][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][28]__assume (\__pi_regfile.register[20][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][28]__assume (\__pi_regfile.register[21][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][28]__assume (\__pi_regfile.register[22][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][28]__assume (\__pi_regfile.register[23][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][28]__assume (\__pi_regfile.register[24][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][28]__assume (\__pi_regfile.register[25][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][28]__assume (\__pi_regfile.register[26][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][28]__assume (\__pi_regfile.register[27][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][28]__assume (\__pi_regfile.register[28][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][28]__assume (\__pi_regfile.register[29][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][28]__assume (\__pi_regfile.register[2][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][28]__assume (\__pi_regfile.register[30][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][28]__assume (\__pi_regfile.register[31][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][28]__assume (\__pi_regfile.register[3][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][28]__assume (\__pi_regfile.register[4][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][28]__assume (\__pi_regfile.register[5][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][28]__assume (\__pi_regfile.register[6][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][28]__assume (\__pi_regfile.register[7][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][28]__assume (\__pi_regfile.register[8][28] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][28]__assume (\__pi_regfile.register[9][28] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[28]__assert (\__po_data_mem_write_data[28]__gold , \__po_data_mem_write_data[28]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[28]__gold_cover (\__po_data_mem_write_data[28]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[28]__gate_cover (\__po_data_mem_write_data[28]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.28 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][28] ,
  input  [  0:0] \__pi_regfile.register[10][28] ,
  input  [  0:0] \__pi_regfile.register[11][28] ,
  input  [  0:0] \__pi_regfile.register[12][28] ,
  input  [  0:0] \__pi_regfile.register[13][28] ,
  input  [  0:0] \__pi_regfile.register[14][28] ,
  input  [  0:0] \__pi_regfile.register[15][28] ,
  input  [  0:0] \__pi_regfile.register[16][28] ,
  input  [  0:0] \__pi_regfile.register[17][28] ,
  input  [  0:0] \__pi_regfile.register[18][28] ,
  input  [  0:0] \__pi_regfile.register[19][28] ,
  input  [  0:0] \__pi_regfile.register[1][28] ,
  input  [  0:0] \__pi_regfile.register[20][28] ,
  input  [  0:0] \__pi_regfile.register[21][28] ,
  input  [  0:0] \__pi_regfile.register[22][28] ,
  input  [  0:0] \__pi_regfile.register[23][28] ,
  input  [  0:0] \__pi_regfile.register[24][28] ,
  input  [  0:0] \__pi_regfile.register[25][28] ,
  input  [  0:0] \__pi_regfile.register[26][28] ,
  input  [  0:0] \__pi_regfile.register[27][28] ,
  input  [  0:0] \__pi_regfile.register[28][28] ,
  input  [  0:0] \__pi_regfile.register[29][28] ,
  input  [  0:0] \__pi_regfile.register[2][28] ,
  input  [  0:0] \__pi_regfile.register[30][28] ,
  input  [  0:0] \__pi_regfile.register[31][28] ,
  input  [  0:0] \__pi_regfile.register[3][28] ,
  input  [  0:0] \__pi_regfile.register[4][28] ,
  input  [  0:0] \__pi_regfile.register[5][28] ,
  input  [  0:0] \__pi_regfile.register[6][28] ,
  input  [  0:0] \__pi_regfile.register[7][28] ,
  input  [  0:0] \__pi_regfile.register[8][28] ,
  input  [  0:0] \__pi_regfile.register[9][28] ,
  output [  0:0] \__po_data_mem_write_data[28]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.28 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][28] ,
  input  [  0:0] \__pi_regfile.register[10][28] ,
  input  [  0:0] \__pi_regfile.register[11][28] ,
  input  [  0:0] \__pi_regfile.register[12][28] ,
  input  [  0:0] \__pi_regfile.register[13][28] ,
  input  [  0:0] \__pi_regfile.register[14][28] ,
  input  [  0:0] \__pi_regfile.register[15][28] ,
  input  [  0:0] \__pi_regfile.register[16][28] ,
  input  [  0:0] \__pi_regfile.register[17][28] ,
  input  [  0:0] \__pi_regfile.register[18][28] ,
  input  [  0:0] \__pi_regfile.register[19][28] ,
  input  [  0:0] \__pi_regfile.register[1][28] ,
  input  [  0:0] \__pi_regfile.register[20][28] ,
  input  [  0:0] \__pi_regfile.register[21][28] ,
  input  [  0:0] \__pi_regfile.register[22][28] ,
  input  [  0:0] \__pi_regfile.register[23][28] ,
  input  [  0:0] \__pi_regfile.register[24][28] ,
  input  [  0:0] \__pi_regfile.register[25][28] ,
  input  [  0:0] \__pi_regfile.register[26][28] ,
  input  [  0:0] \__pi_regfile.register[27][28] ,
  input  [  0:0] \__pi_regfile.register[28][28] ,
  input  [  0:0] \__pi_regfile.register[29][28] ,
  input  [  0:0] \__pi_regfile.register[2][28] ,
  input  [  0:0] \__pi_regfile.register[30][28] ,
  input  [  0:0] \__pi_regfile.register[31][28] ,
  input  [  0:0] \__pi_regfile.register[3][28] ,
  input  [  0:0] \__pi_regfile.register[4][28] ,
  input  [  0:0] \__pi_regfile.register[5][28] ,
  input  [  0:0] \__pi_regfile.register[6][28] ,
  input  [  0:0] \__pi_regfile.register[7][28] ,
  input  [  0:0] \__pi_regfile.register[8][28] ,
  input  [  0:0] \__pi_regfile.register[9][28] ,
  output [  0:0] \__po_data_mem_write_data[28]
);
endmodule
