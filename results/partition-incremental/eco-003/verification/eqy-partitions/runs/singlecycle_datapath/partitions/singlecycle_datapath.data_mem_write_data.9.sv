module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][9] ,
  input  [  0:0] \__pi_regfile.register[10][9] ,
  input  [  0:0] \__pi_regfile.register[11][9] ,
  input  [  0:0] \__pi_regfile.register[12][9] ,
  input  [  0:0] \__pi_regfile.register[13][9] ,
  input  [  0:0] \__pi_regfile.register[14][9] ,
  input  [  0:0] \__pi_regfile.register[15][9] ,
  input  [  0:0] \__pi_regfile.register[16][9] ,
  input  [  0:0] \__pi_regfile.register[17][9] ,
  input  [  0:0] \__pi_regfile.register[18][9] ,
  input  [  0:0] \__pi_regfile.register[19][9] ,
  input  [  0:0] \__pi_regfile.register[1][9] ,
  input  [  0:0] \__pi_regfile.register[20][9] ,
  input  [  0:0] \__pi_regfile.register[21][9] ,
  input  [  0:0] \__pi_regfile.register[22][9] ,
  input  [  0:0] \__pi_regfile.register[23][9] ,
  input  [  0:0] \__pi_regfile.register[24][9] ,
  input  [  0:0] \__pi_regfile.register[25][9] ,
  input  [  0:0] \__pi_regfile.register[26][9] ,
  input  [  0:0] \__pi_regfile.register[27][9] ,
  input  [  0:0] \__pi_regfile.register[28][9] ,
  input  [  0:0] \__pi_regfile.register[29][9] ,
  input  [  0:0] \__pi_regfile.register[2][9] ,
  input  [  0:0] \__pi_regfile.register[30][9] ,
  input  [  0:0] \__pi_regfile.register[31][9] ,
  input  [  0:0] \__pi_regfile.register[3][9] ,
  input  [  0:0] \__pi_regfile.register[4][9] ,
  input  [  0:0] \__pi_regfile.register[5][9] ,
  input  [  0:0] \__pi_regfile.register[6][9] ,
  input  [  0:0] \__pi_regfile.register[7][9] ,
  input  [  0:0] \__pi_regfile.register[8][9] ,
  input  [  0:0] \__pi_regfile.register[9][9] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[9]__gold ,
  output [  0:0] \__po_data_mem_write_data[9]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.9 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][9] (\__pi_regfile.register[0][9] ),
    .\__pi_regfile.register[10][9] (\__pi_regfile.register[10][9] ),
    .\__pi_regfile.register[11][9] (\__pi_regfile.register[11][9] ),
    .\__pi_regfile.register[12][9] (\__pi_regfile.register[12][9] ),
    .\__pi_regfile.register[13][9] (\__pi_regfile.register[13][9] ),
    .\__pi_regfile.register[14][9] (\__pi_regfile.register[14][9] ),
    .\__pi_regfile.register[15][9] (\__pi_regfile.register[15][9] ),
    .\__pi_regfile.register[16][9] (\__pi_regfile.register[16][9] ),
    .\__pi_regfile.register[17][9] (\__pi_regfile.register[17][9] ),
    .\__pi_regfile.register[18][9] (\__pi_regfile.register[18][9] ),
    .\__pi_regfile.register[19][9] (\__pi_regfile.register[19][9] ),
    .\__pi_regfile.register[1][9] (\__pi_regfile.register[1][9] ),
    .\__pi_regfile.register[20][9] (\__pi_regfile.register[20][9] ),
    .\__pi_regfile.register[21][9] (\__pi_regfile.register[21][9] ),
    .\__pi_regfile.register[22][9] (\__pi_regfile.register[22][9] ),
    .\__pi_regfile.register[23][9] (\__pi_regfile.register[23][9] ),
    .\__pi_regfile.register[24][9] (\__pi_regfile.register[24][9] ),
    .\__pi_regfile.register[25][9] (\__pi_regfile.register[25][9] ),
    .\__pi_regfile.register[26][9] (\__pi_regfile.register[26][9] ),
    .\__pi_regfile.register[27][9] (\__pi_regfile.register[27][9] ),
    .\__pi_regfile.register[28][9] (\__pi_regfile.register[28][9] ),
    .\__pi_regfile.register[29][9] (\__pi_regfile.register[29][9] ),
    .\__pi_regfile.register[2][9] (\__pi_regfile.register[2][9] ),
    .\__pi_regfile.register[30][9] (\__pi_regfile.register[30][9] ),
    .\__pi_regfile.register[31][9] (\__pi_regfile.register[31][9] ),
    .\__pi_regfile.register[3][9] (\__pi_regfile.register[3][9] ),
    .\__pi_regfile.register[4][9] (\__pi_regfile.register[4][9] ),
    .\__pi_regfile.register[5][9] (\__pi_regfile.register[5][9] ),
    .\__pi_regfile.register[6][9] (\__pi_regfile.register[6][9] ),
    .\__pi_regfile.register[7][9] (\__pi_regfile.register[7][9] ),
    .\__pi_regfile.register[8][9] (\__pi_regfile.register[8][9] ),
    .\__pi_regfile.register[9][9] (\__pi_regfile.register[9][9] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[9] (\__po_data_mem_write_data[9]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.9 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][9] (\__pi_regfile.register[0][9] ),
    .\__pi_regfile.register[10][9] (\__pi_regfile.register[10][9] ),
    .\__pi_regfile.register[11][9] (\__pi_regfile.register[11][9] ),
    .\__pi_regfile.register[12][9] (\__pi_regfile.register[12][9] ),
    .\__pi_regfile.register[13][9] (\__pi_regfile.register[13][9] ),
    .\__pi_regfile.register[14][9] (\__pi_regfile.register[14][9] ),
    .\__pi_regfile.register[15][9] (\__pi_regfile.register[15][9] ),
    .\__pi_regfile.register[16][9] (\__pi_regfile.register[16][9] ),
    .\__pi_regfile.register[17][9] (\__pi_regfile.register[17][9] ),
    .\__pi_regfile.register[18][9] (\__pi_regfile.register[18][9] ),
    .\__pi_regfile.register[19][9] (\__pi_regfile.register[19][9] ),
    .\__pi_regfile.register[1][9] (\__pi_regfile.register[1][9] ),
    .\__pi_regfile.register[20][9] (\__pi_regfile.register[20][9] ),
    .\__pi_regfile.register[21][9] (\__pi_regfile.register[21][9] ),
    .\__pi_regfile.register[22][9] (\__pi_regfile.register[22][9] ),
    .\__pi_regfile.register[23][9] (\__pi_regfile.register[23][9] ),
    .\__pi_regfile.register[24][9] (\__pi_regfile.register[24][9] ),
    .\__pi_regfile.register[25][9] (\__pi_regfile.register[25][9] ),
    .\__pi_regfile.register[26][9] (\__pi_regfile.register[26][9] ),
    .\__pi_regfile.register[27][9] (\__pi_regfile.register[27][9] ),
    .\__pi_regfile.register[28][9] (\__pi_regfile.register[28][9] ),
    .\__pi_regfile.register[29][9] (\__pi_regfile.register[29][9] ),
    .\__pi_regfile.register[2][9] (\__pi_regfile.register[2][9] ),
    .\__pi_regfile.register[30][9] (\__pi_regfile.register[30][9] ),
    .\__pi_regfile.register[31][9] (\__pi_regfile.register[31][9] ),
    .\__pi_regfile.register[3][9] (\__pi_regfile.register[3][9] ),
    .\__pi_regfile.register[4][9] (\__pi_regfile.register[4][9] ),
    .\__pi_regfile.register[5][9] (\__pi_regfile.register[5][9] ),
    .\__pi_regfile.register[6][9] (\__pi_regfile.register[6][9] ),
    .\__pi_regfile.register[7][9] (\__pi_regfile.register[7][9] ),
    .\__pi_regfile.register[8][9] (\__pi_regfile.register[8][9] ),
    .\__pi_regfile.register[9][9] (\__pi_regfile.register[9][9] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[9] (\__po_data_mem_write_data[9]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][9]__assume (\__pi_regfile.register[0][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][9]__assume (\__pi_regfile.register[10][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][9]__assume (\__pi_regfile.register[11][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][9]__assume (\__pi_regfile.register[12][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][9]__assume (\__pi_regfile.register[13][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][9]__assume (\__pi_regfile.register[14][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][9]__assume (\__pi_regfile.register[15][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][9]__assume (\__pi_regfile.register[16][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][9]__assume (\__pi_regfile.register[17][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][9]__assume (\__pi_regfile.register[18][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][9]__assume (\__pi_regfile.register[19][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][9]__assume (\__pi_regfile.register[1][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][9]__assume (\__pi_regfile.register[20][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][9]__assume (\__pi_regfile.register[21][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][9]__assume (\__pi_regfile.register[22][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][9]__assume (\__pi_regfile.register[23][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][9]__assume (\__pi_regfile.register[24][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][9]__assume (\__pi_regfile.register[25][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][9]__assume (\__pi_regfile.register[26][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][9]__assume (\__pi_regfile.register[27][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][9]__assume (\__pi_regfile.register[28][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][9]__assume (\__pi_regfile.register[29][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][9]__assume (\__pi_regfile.register[2][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][9]__assume (\__pi_regfile.register[30][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][9]__assume (\__pi_regfile.register[31][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][9]__assume (\__pi_regfile.register[3][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][9]__assume (\__pi_regfile.register[4][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][9]__assume (\__pi_regfile.register[5][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][9]__assume (\__pi_regfile.register[6][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][9]__assume (\__pi_regfile.register[7][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][9]__assume (\__pi_regfile.register[8][9] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][9]__assume (\__pi_regfile.register[9][9] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[9]__assert (\__po_data_mem_write_data[9]__gold , \__po_data_mem_write_data[9]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[9]__gold_cover (\__po_data_mem_write_data[9]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[9]__gate_cover (\__po_data_mem_write_data[9]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.9 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][9] ,
  input  [  0:0] \__pi_regfile.register[10][9] ,
  input  [  0:0] \__pi_regfile.register[11][9] ,
  input  [  0:0] \__pi_regfile.register[12][9] ,
  input  [  0:0] \__pi_regfile.register[13][9] ,
  input  [  0:0] \__pi_regfile.register[14][9] ,
  input  [  0:0] \__pi_regfile.register[15][9] ,
  input  [  0:0] \__pi_regfile.register[16][9] ,
  input  [  0:0] \__pi_regfile.register[17][9] ,
  input  [  0:0] \__pi_regfile.register[18][9] ,
  input  [  0:0] \__pi_regfile.register[19][9] ,
  input  [  0:0] \__pi_regfile.register[1][9] ,
  input  [  0:0] \__pi_regfile.register[20][9] ,
  input  [  0:0] \__pi_regfile.register[21][9] ,
  input  [  0:0] \__pi_regfile.register[22][9] ,
  input  [  0:0] \__pi_regfile.register[23][9] ,
  input  [  0:0] \__pi_regfile.register[24][9] ,
  input  [  0:0] \__pi_regfile.register[25][9] ,
  input  [  0:0] \__pi_regfile.register[26][9] ,
  input  [  0:0] \__pi_regfile.register[27][9] ,
  input  [  0:0] \__pi_regfile.register[28][9] ,
  input  [  0:0] \__pi_regfile.register[29][9] ,
  input  [  0:0] \__pi_regfile.register[2][9] ,
  input  [  0:0] \__pi_regfile.register[30][9] ,
  input  [  0:0] \__pi_regfile.register[31][9] ,
  input  [  0:0] \__pi_regfile.register[3][9] ,
  input  [  0:0] \__pi_regfile.register[4][9] ,
  input  [  0:0] \__pi_regfile.register[5][9] ,
  input  [  0:0] \__pi_regfile.register[6][9] ,
  input  [  0:0] \__pi_regfile.register[7][9] ,
  input  [  0:0] \__pi_regfile.register[8][9] ,
  input  [  0:0] \__pi_regfile.register[9][9] ,
  output [  0:0] \__po_data_mem_write_data[9]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.9 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][9] ,
  input  [  0:0] \__pi_regfile.register[10][9] ,
  input  [  0:0] \__pi_regfile.register[11][9] ,
  input  [  0:0] \__pi_regfile.register[12][9] ,
  input  [  0:0] \__pi_regfile.register[13][9] ,
  input  [  0:0] \__pi_regfile.register[14][9] ,
  input  [  0:0] \__pi_regfile.register[15][9] ,
  input  [  0:0] \__pi_regfile.register[16][9] ,
  input  [  0:0] \__pi_regfile.register[17][9] ,
  input  [  0:0] \__pi_regfile.register[18][9] ,
  input  [  0:0] \__pi_regfile.register[19][9] ,
  input  [  0:0] \__pi_regfile.register[1][9] ,
  input  [  0:0] \__pi_regfile.register[20][9] ,
  input  [  0:0] \__pi_regfile.register[21][9] ,
  input  [  0:0] \__pi_regfile.register[22][9] ,
  input  [  0:0] \__pi_regfile.register[23][9] ,
  input  [  0:0] \__pi_regfile.register[24][9] ,
  input  [  0:0] \__pi_regfile.register[25][9] ,
  input  [  0:0] \__pi_regfile.register[26][9] ,
  input  [  0:0] \__pi_regfile.register[27][9] ,
  input  [  0:0] \__pi_regfile.register[28][9] ,
  input  [  0:0] \__pi_regfile.register[29][9] ,
  input  [  0:0] \__pi_regfile.register[2][9] ,
  input  [  0:0] \__pi_regfile.register[30][9] ,
  input  [  0:0] \__pi_regfile.register[31][9] ,
  input  [  0:0] \__pi_regfile.register[3][9] ,
  input  [  0:0] \__pi_regfile.register[4][9] ,
  input  [  0:0] \__pi_regfile.register[5][9] ,
  input  [  0:0] \__pi_regfile.register[6][9] ,
  input  [  0:0] \__pi_regfile.register[7][9] ,
  input  [  0:0] \__pi_regfile.register[8][9] ,
  input  [  0:0] \__pi_regfile.register[9][9] ,
  output [  0:0] \__po_data_mem_write_data[9]
);
endmodule
