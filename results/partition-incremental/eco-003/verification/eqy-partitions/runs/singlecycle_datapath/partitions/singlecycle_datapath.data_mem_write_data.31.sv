module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][31] ,
  input  [  0:0] \__pi_regfile.register[10][31] ,
  input  [  0:0] \__pi_regfile.register[11][31] ,
  input  [  0:0] \__pi_regfile.register[12][31] ,
  input  [  0:0] \__pi_regfile.register[13][31] ,
  input  [  0:0] \__pi_regfile.register[14][31] ,
  input  [  0:0] \__pi_regfile.register[15][31] ,
  input  [  0:0] \__pi_regfile.register[16][31] ,
  input  [  0:0] \__pi_regfile.register[17][31] ,
  input  [  0:0] \__pi_regfile.register[18][31] ,
  input  [  0:0] \__pi_regfile.register[19][31] ,
  input  [  0:0] \__pi_regfile.register[1][31] ,
  input  [  0:0] \__pi_regfile.register[20][31] ,
  input  [  0:0] \__pi_regfile.register[21][31] ,
  input  [  0:0] \__pi_regfile.register[22][31] ,
  input  [  0:0] \__pi_regfile.register[23][31] ,
  input  [  0:0] \__pi_regfile.register[24][31] ,
  input  [  0:0] \__pi_regfile.register[25][31] ,
  input  [  0:0] \__pi_regfile.register[26][31] ,
  input  [  0:0] \__pi_regfile.register[27][31] ,
  input  [  0:0] \__pi_regfile.register[28][31] ,
  input  [  0:0] \__pi_regfile.register[29][31] ,
  input  [  0:0] \__pi_regfile.register[2][31] ,
  input  [  0:0] \__pi_regfile.register[30][31] ,
  input  [  0:0] \__pi_regfile.register[31][31] ,
  input  [  0:0] \__pi_regfile.register[3][31] ,
  input  [  0:0] \__pi_regfile.register[4][31] ,
  input  [  0:0] \__pi_regfile.register[5][31] ,
  input  [  0:0] \__pi_regfile.register[6][31] ,
  input  [  0:0] \__pi_regfile.register[7][31] ,
  input  [  0:0] \__pi_regfile.register[8][31] ,
  input  [  0:0] \__pi_regfile.register[9][31] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[31]__gold ,
  output [  0:0] \__po_data_mem_write_data[31]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.31 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][31] (\__pi_regfile.register[0][31] ),
    .\__pi_regfile.register[10][31] (\__pi_regfile.register[10][31] ),
    .\__pi_regfile.register[11][31] (\__pi_regfile.register[11][31] ),
    .\__pi_regfile.register[12][31] (\__pi_regfile.register[12][31] ),
    .\__pi_regfile.register[13][31] (\__pi_regfile.register[13][31] ),
    .\__pi_regfile.register[14][31] (\__pi_regfile.register[14][31] ),
    .\__pi_regfile.register[15][31] (\__pi_regfile.register[15][31] ),
    .\__pi_regfile.register[16][31] (\__pi_regfile.register[16][31] ),
    .\__pi_regfile.register[17][31] (\__pi_regfile.register[17][31] ),
    .\__pi_regfile.register[18][31] (\__pi_regfile.register[18][31] ),
    .\__pi_regfile.register[19][31] (\__pi_regfile.register[19][31] ),
    .\__pi_regfile.register[1][31] (\__pi_regfile.register[1][31] ),
    .\__pi_regfile.register[20][31] (\__pi_regfile.register[20][31] ),
    .\__pi_regfile.register[21][31] (\__pi_regfile.register[21][31] ),
    .\__pi_regfile.register[22][31] (\__pi_regfile.register[22][31] ),
    .\__pi_regfile.register[23][31] (\__pi_regfile.register[23][31] ),
    .\__pi_regfile.register[24][31] (\__pi_regfile.register[24][31] ),
    .\__pi_regfile.register[25][31] (\__pi_regfile.register[25][31] ),
    .\__pi_regfile.register[26][31] (\__pi_regfile.register[26][31] ),
    .\__pi_regfile.register[27][31] (\__pi_regfile.register[27][31] ),
    .\__pi_regfile.register[28][31] (\__pi_regfile.register[28][31] ),
    .\__pi_regfile.register[29][31] (\__pi_regfile.register[29][31] ),
    .\__pi_regfile.register[2][31] (\__pi_regfile.register[2][31] ),
    .\__pi_regfile.register[30][31] (\__pi_regfile.register[30][31] ),
    .\__pi_regfile.register[31][31] (\__pi_regfile.register[31][31] ),
    .\__pi_regfile.register[3][31] (\__pi_regfile.register[3][31] ),
    .\__pi_regfile.register[4][31] (\__pi_regfile.register[4][31] ),
    .\__pi_regfile.register[5][31] (\__pi_regfile.register[5][31] ),
    .\__pi_regfile.register[6][31] (\__pi_regfile.register[6][31] ),
    .\__pi_regfile.register[7][31] (\__pi_regfile.register[7][31] ),
    .\__pi_regfile.register[8][31] (\__pi_regfile.register[8][31] ),
    .\__pi_regfile.register[9][31] (\__pi_regfile.register[9][31] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[31] (\__po_data_mem_write_data[31]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.31 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][31] (\__pi_regfile.register[0][31] ),
    .\__pi_regfile.register[10][31] (\__pi_regfile.register[10][31] ),
    .\__pi_regfile.register[11][31] (\__pi_regfile.register[11][31] ),
    .\__pi_regfile.register[12][31] (\__pi_regfile.register[12][31] ),
    .\__pi_regfile.register[13][31] (\__pi_regfile.register[13][31] ),
    .\__pi_regfile.register[14][31] (\__pi_regfile.register[14][31] ),
    .\__pi_regfile.register[15][31] (\__pi_regfile.register[15][31] ),
    .\__pi_regfile.register[16][31] (\__pi_regfile.register[16][31] ),
    .\__pi_regfile.register[17][31] (\__pi_regfile.register[17][31] ),
    .\__pi_regfile.register[18][31] (\__pi_regfile.register[18][31] ),
    .\__pi_regfile.register[19][31] (\__pi_regfile.register[19][31] ),
    .\__pi_regfile.register[1][31] (\__pi_regfile.register[1][31] ),
    .\__pi_regfile.register[20][31] (\__pi_regfile.register[20][31] ),
    .\__pi_regfile.register[21][31] (\__pi_regfile.register[21][31] ),
    .\__pi_regfile.register[22][31] (\__pi_regfile.register[22][31] ),
    .\__pi_regfile.register[23][31] (\__pi_regfile.register[23][31] ),
    .\__pi_regfile.register[24][31] (\__pi_regfile.register[24][31] ),
    .\__pi_regfile.register[25][31] (\__pi_regfile.register[25][31] ),
    .\__pi_regfile.register[26][31] (\__pi_regfile.register[26][31] ),
    .\__pi_regfile.register[27][31] (\__pi_regfile.register[27][31] ),
    .\__pi_regfile.register[28][31] (\__pi_regfile.register[28][31] ),
    .\__pi_regfile.register[29][31] (\__pi_regfile.register[29][31] ),
    .\__pi_regfile.register[2][31] (\__pi_regfile.register[2][31] ),
    .\__pi_regfile.register[30][31] (\__pi_regfile.register[30][31] ),
    .\__pi_regfile.register[31][31] (\__pi_regfile.register[31][31] ),
    .\__pi_regfile.register[3][31] (\__pi_regfile.register[3][31] ),
    .\__pi_regfile.register[4][31] (\__pi_regfile.register[4][31] ),
    .\__pi_regfile.register[5][31] (\__pi_regfile.register[5][31] ),
    .\__pi_regfile.register[6][31] (\__pi_regfile.register[6][31] ),
    .\__pi_regfile.register[7][31] (\__pi_regfile.register[7][31] ),
    .\__pi_regfile.register[8][31] (\__pi_regfile.register[8][31] ),
    .\__pi_regfile.register[9][31] (\__pi_regfile.register[9][31] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[31] (\__po_data_mem_write_data[31]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][31]__assume (\__pi_regfile.register[0][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][31]__assume (\__pi_regfile.register[10][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][31]__assume (\__pi_regfile.register[11][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][31]__assume (\__pi_regfile.register[12][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][31]__assume (\__pi_regfile.register[13][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][31]__assume (\__pi_regfile.register[14][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][31]__assume (\__pi_regfile.register[15][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][31]__assume (\__pi_regfile.register[16][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][31]__assume (\__pi_regfile.register[17][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][31]__assume (\__pi_regfile.register[18][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][31]__assume (\__pi_regfile.register[19][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][31]__assume (\__pi_regfile.register[1][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][31]__assume (\__pi_regfile.register[20][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][31]__assume (\__pi_regfile.register[21][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][31]__assume (\__pi_regfile.register[22][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][31]__assume (\__pi_regfile.register[23][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][31]__assume (\__pi_regfile.register[24][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][31]__assume (\__pi_regfile.register[25][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][31]__assume (\__pi_regfile.register[26][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][31]__assume (\__pi_regfile.register[27][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][31]__assume (\__pi_regfile.register[28][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][31]__assume (\__pi_regfile.register[29][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][31]__assume (\__pi_regfile.register[2][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][31]__assume (\__pi_regfile.register[30][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][31]__assume (\__pi_regfile.register[31][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][31]__assume (\__pi_regfile.register[3][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][31]__assume (\__pi_regfile.register[4][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][31]__assume (\__pi_regfile.register[5][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][31]__assume (\__pi_regfile.register[6][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][31]__assume (\__pi_regfile.register[7][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][31]__assume (\__pi_regfile.register[8][31] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][31]__assume (\__pi_regfile.register[9][31] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[31]__assert (\__po_data_mem_write_data[31]__gold , \__po_data_mem_write_data[31]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[31]__gold_cover (\__po_data_mem_write_data[31]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[31]__gate_cover (\__po_data_mem_write_data[31]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.31 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][31] ,
  input  [  0:0] \__pi_regfile.register[10][31] ,
  input  [  0:0] \__pi_regfile.register[11][31] ,
  input  [  0:0] \__pi_regfile.register[12][31] ,
  input  [  0:0] \__pi_regfile.register[13][31] ,
  input  [  0:0] \__pi_regfile.register[14][31] ,
  input  [  0:0] \__pi_regfile.register[15][31] ,
  input  [  0:0] \__pi_regfile.register[16][31] ,
  input  [  0:0] \__pi_regfile.register[17][31] ,
  input  [  0:0] \__pi_regfile.register[18][31] ,
  input  [  0:0] \__pi_regfile.register[19][31] ,
  input  [  0:0] \__pi_regfile.register[1][31] ,
  input  [  0:0] \__pi_regfile.register[20][31] ,
  input  [  0:0] \__pi_regfile.register[21][31] ,
  input  [  0:0] \__pi_regfile.register[22][31] ,
  input  [  0:0] \__pi_regfile.register[23][31] ,
  input  [  0:0] \__pi_regfile.register[24][31] ,
  input  [  0:0] \__pi_regfile.register[25][31] ,
  input  [  0:0] \__pi_regfile.register[26][31] ,
  input  [  0:0] \__pi_regfile.register[27][31] ,
  input  [  0:0] \__pi_regfile.register[28][31] ,
  input  [  0:0] \__pi_regfile.register[29][31] ,
  input  [  0:0] \__pi_regfile.register[2][31] ,
  input  [  0:0] \__pi_regfile.register[30][31] ,
  input  [  0:0] \__pi_regfile.register[31][31] ,
  input  [  0:0] \__pi_regfile.register[3][31] ,
  input  [  0:0] \__pi_regfile.register[4][31] ,
  input  [  0:0] \__pi_regfile.register[5][31] ,
  input  [  0:0] \__pi_regfile.register[6][31] ,
  input  [  0:0] \__pi_regfile.register[7][31] ,
  input  [  0:0] \__pi_regfile.register[8][31] ,
  input  [  0:0] \__pi_regfile.register[9][31] ,
  output [  0:0] \__po_data_mem_write_data[31]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.31 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][31] ,
  input  [  0:0] \__pi_regfile.register[10][31] ,
  input  [  0:0] \__pi_regfile.register[11][31] ,
  input  [  0:0] \__pi_regfile.register[12][31] ,
  input  [  0:0] \__pi_regfile.register[13][31] ,
  input  [  0:0] \__pi_regfile.register[14][31] ,
  input  [  0:0] \__pi_regfile.register[15][31] ,
  input  [  0:0] \__pi_regfile.register[16][31] ,
  input  [  0:0] \__pi_regfile.register[17][31] ,
  input  [  0:0] \__pi_regfile.register[18][31] ,
  input  [  0:0] \__pi_regfile.register[19][31] ,
  input  [  0:0] \__pi_regfile.register[1][31] ,
  input  [  0:0] \__pi_regfile.register[20][31] ,
  input  [  0:0] \__pi_regfile.register[21][31] ,
  input  [  0:0] \__pi_regfile.register[22][31] ,
  input  [  0:0] \__pi_regfile.register[23][31] ,
  input  [  0:0] \__pi_regfile.register[24][31] ,
  input  [  0:0] \__pi_regfile.register[25][31] ,
  input  [  0:0] \__pi_regfile.register[26][31] ,
  input  [  0:0] \__pi_regfile.register[27][31] ,
  input  [  0:0] \__pi_regfile.register[28][31] ,
  input  [  0:0] \__pi_regfile.register[29][31] ,
  input  [  0:0] \__pi_regfile.register[2][31] ,
  input  [  0:0] \__pi_regfile.register[30][31] ,
  input  [  0:0] \__pi_regfile.register[31][31] ,
  input  [  0:0] \__pi_regfile.register[3][31] ,
  input  [  0:0] \__pi_regfile.register[4][31] ,
  input  [  0:0] \__pi_regfile.register[5][31] ,
  input  [  0:0] \__pi_regfile.register[6][31] ,
  input  [  0:0] \__pi_regfile.register[7][31] ,
  input  [  0:0] \__pi_regfile.register[8][31] ,
  input  [  0:0] \__pi_regfile.register[9][31] ,
  output [  0:0] \__po_data_mem_write_data[31]
);
endmodule
