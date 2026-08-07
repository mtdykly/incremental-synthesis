module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][17] ,
  input  [  0:0] \__pi_regfile.register[10][17] ,
  input  [  0:0] \__pi_regfile.register[11][17] ,
  input  [  0:0] \__pi_regfile.register[12][17] ,
  input  [  0:0] \__pi_regfile.register[13][17] ,
  input  [  0:0] \__pi_regfile.register[14][17] ,
  input  [  0:0] \__pi_regfile.register[15][17] ,
  input  [  0:0] \__pi_regfile.register[16][17] ,
  input  [  0:0] \__pi_regfile.register[17][17] ,
  input  [  0:0] \__pi_regfile.register[18][17] ,
  input  [  0:0] \__pi_regfile.register[19][17] ,
  input  [  0:0] \__pi_regfile.register[1][17] ,
  input  [  0:0] \__pi_regfile.register[20][17] ,
  input  [  0:0] \__pi_regfile.register[21][17] ,
  input  [  0:0] \__pi_regfile.register[22][17] ,
  input  [  0:0] \__pi_regfile.register[23][17] ,
  input  [  0:0] \__pi_regfile.register[24][17] ,
  input  [  0:0] \__pi_regfile.register[25][17] ,
  input  [  0:0] \__pi_regfile.register[26][17] ,
  input  [  0:0] \__pi_regfile.register[27][17] ,
  input  [  0:0] \__pi_regfile.register[28][17] ,
  input  [  0:0] \__pi_regfile.register[29][17] ,
  input  [  0:0] \__pi_regfile.register[2][17] ,
  input  [  0:0] \__pi_regfile.register[30][17] ,
  input  [  0:0] \__pi_regfile.register[31][17] ,
  input  [  0:0] \__pi_regfile.register[3][17] ,
  input  [  0:0] \__pi_regfile.register[4][17] ,
  input  [  0:0] \__pi_regfile.register[5][17] ,
  input  [  0:0] \__pi_regfile.register[6][17] ,
  input  [  0:0] \__pi_regfile.register[7][17] ,
  input  [  0:0] \__pi_regfile.register[8][17] ,
  input  [  0:0] \__pi_regfile.register[9][17] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[17]__gold ,
  output [  0:0] \__po_data_mem_write_data[17]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.17 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][17] (\__pi_regfile.register[0][17] ),
    .\__pi_regfile.register[10][17] (\__pi_regfile.register[10][17] ),
    .\__pi_regfile.register[11][17] (\__pi_regfile.register[11][17] ),
    .\__pi_regfile.register[12][17] (\__pi_regfile.register[12][17] ),
    .\__pi_regfile.register[13][17] (\__pi_regfile.register[13][17] ),
    .\__pi_regfile.register[14][17] (\__pi_regfile.register[14][17] ),
    .\__pi_regfile.register[15][17] (\__pi_regfile.register[15][17] ),
    .\__pi_regfile.register[16][17] (\__pi_regfile.register[16][17] ),
    .\__pi_regfile.register[17][17] (\__pi_regfile.register[17][17] ),
    .\__pi_regfile.register[18][17] (\__pi_regfile.register[18][17] ),
    .\__pi_regfile.register[19][17] (\__pi_regfile.register[19][17] ),
    .\__pi_regfile.register[1][17] (\__pi_regfile.register[1][17] ),
    .\__pi_regfile.register[20][17] (\__pi_regfile.register[20][17] ),
    .\__pi_regfile.register[21][17] (\__pi_regfile.register[21][17] ),
    .\__pi_regfile.register[22][17] (\__pi_regfile.register[22][17] ),
    .\__pi_regfile.register[23][17] (\__pi_regfile.register[23][17] ),
    .\__pi_regfile.register[24][17] (\__pi_regfile.register[24][17] ),
    .\__pi_regfile.register[25][17] (\__pi_regfile.register[25][17] ),
    .\__pi_regfile.register[26][17] (\__pi_regfile.register[26][17] ),
    .\__pi_regfile.register[27][17] (\__pi_regfile.register[27][17] ),
    .\__pi_regfile.register[28][17] (\__pi_regfile.register[28][17] ),
    .\__pi_regfile.register[29][17] (\__pi_regfile.register[29][17] ),
    .\__pi_regfile.register[2][17] (\__pi_regfile.register[2][17] ),
    .\__pi_regfile.register[30][17] (\__pi_regfile.register[30][17] ),
    .\__pi_regfile.register[31][17] (\__pi_regfile.register[31][17] ),
    .\__pi_regfile.register[3][17] (\__pi_regfile.register[3][17] ),
    .\__pi_regfile.register[4][17] (\__pi_regfile.register[4][17] ),
    .\__pi_regfile.register[5][17] (\__pi_regfile.register[5][17] ),
    .\__pi_regfile.register[6][17] (\__pi_regfile.register[6][17] ),
    .\__pi_regfile.register[7][17] (\__pi_regfile.register[7][17] ),
    .\__pi_regfile.register[8][17] (\__pi_regfile.register[8][17] ),
    .\__pi_regfile.register[9][17] (\__pi_regfile.register[9][17] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[17] (\__po_data_mem_write_data[17]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.17 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][17] (\__pi_regfile.register[0][17] ),
    .\__pi_regfile.register[10][17] (\__pi_regfile.register[10][17] ),
    .\__pi_regfile.register[11][17] (\__pi_regfile.register[11][17] ),
    .\__pi_regfile.register[12][17] (\__pi_regfile.register[12][17] ),
    .\__pi_regfile.register[13][17] (\__pi_regfile.register[13][17] ),
    .\__pi_regfile.register[14][17] (\__pi_regfile.register[14][17] ),
    .\__pi_regfile.register[15][17] (\__pi_regfile.register[15][17] ),
    .\__pi_regfile.register[16][17] (\__pi_regfile.register[16][17] ),
    .\__pi_regfile.register[17][17] (\__pi_regfile.register[17][17] ),
    .\__pi_regfile.register[18][17] (\__pi_regfile.register[18][17] ),
    .\__pi_regfile.register[19][17] (\__pi_regfile.register[19][17] ),
    .\__pi_regfile.register[1][17] (\__pi_regfile.register[1][17] ),
    .\__pi_regfile.register[20][17] (\__pi_regfile.register[20][17] ),
    .\__pi_regfile.register[21][17] (\__pi_regfile.register[21][17] ),
    .\__pi_regfile.register[22][17] (\__pi_regfile.register[22][17] ),
    .\__pi_regfile.register[23][17] (\__pi_regfile.register[23][17] ),
    .\__pi_regfile.register[24][17] (\__pi_regfile.register[24][17] ),
    .\__pi_regfile.register[25][17] (\__pi_regfile.register[25][17] ),
    .\__pi_regfile.register[26][17] (\__pi_regfile.register[26][17] ),
    .\__pi_regfile.register[27][17] (\__pi_regfile.register[27][17] ),
    .\__pi_regfile.register[28][17] (\__pi_regfile.register[28][17] ),
    .\__pi_regfile.register[29][17] (\__pi_regfile.register[29][17] ),
    .\__pi_regfile.register[2][17] (\__pi_regfile.register[2][17] ),
    .\__pi_regfile.register[30][17] (\__pi_regfile.register[30][17] ),
    .\__pi_regfile.register[31][17] (\__pi_regfile.register[31][17] ),
    .\__pi_regfile.register[3][17] (\__pi_regfile.register[3][17] ),
    .\__pi_regfile.register[4][17] (\__pi_regfile.register[4][17] ),
    .\__pi_regfile.register[5][17] (\__pi_regfile.register[5][17] ),
    .\__pi_regfile.register[6][17] (\__pi_regfile.register[6][17] ),
    .\__pi_regfile.register[7][17] (\__pi_regfile.register[7][17] ),
    .\__pi_regfile.register[8][17] (\__pi_regfile.register[8][17] ),
    .\__pi_regfile.register[9][17] (\__pi_regfile.register[9][17] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[17] (\__po_data_mem_write_data[17]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][17]__assume (\__pi_regfile.register[0][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][17]__assume (\__pi_regfile.register[10][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][17]__assume (\__pi_regfile.register[11][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][17]__assume (\__pi_regfile.register[12][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][17]__assume (\__pi_regfile.register[13][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][17]__assume (\__pi_regfile.register[14][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][17]__assume (\__pi_regfile.register[15][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][17]__assume (\__pi_regfile.register[16][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][17]__assume (\__pi_regfile.register[17][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][17]__assume (\__pi_regfile.register[18][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][17]__assume (\__pi_regfile.register[19][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][17]__assume (\__pi_regfile.register[1][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][17]__assume (\__pi_regfile.register[20][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][17]__assume (\__pi_regfile.register[21][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][17]__assume (\__pi_regfile.register[22][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][17]__assume (\__pi_regfile.register[23][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][17]__assume (\__pi_regfile.register[24][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][17]__assume (\__pi_regfile.register[25][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][17]__assume (\__pi_regfile.register[26][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][17]__assume (\__pi_regfile.register[27][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][17]__assume (\__pi_regfile.register[28][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][17]__assume (\__pi_regfile.register[29][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][17]__assume (\__pi_regfile.register[2][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][17]__assume (\__pi_regfile.register[30][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][17]__assume (\__pi_regfile.register[31][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][17]__assume (\__pi_regfile.register[3][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][17]__assume (\__pi_regfile.register[4][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][17]__assume (\__pi_regfile.register[5][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][17]__assume (\__pi_regfile.register[6][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][17]__assume (\__pi_regfile.register[7][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][17]__assume (\__pi_regfile.register[8][17] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][17]__assume (\__pi_regfile.register[9][17] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[17]__assert (\__po_data_mem_write_data[17]__gold , \__po_data_mem_write_data[17]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[17]__gold_cover (\__po_data_mem_write_data[17]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[17]__gate_cover (\__po_data_mem_write_data[17]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.17 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][17] ,
  input  [  0:0] \__pi_regfile.register[10][17] ,
  input  [  0:0] \__pi_regfile.register[11][17] ,
  input  [  0:0] \__pi_regfile.register[12][17] ,
  input  [  0:0] \__pi_regfile.register[13][17] ,
  input  [  0:0] \__pi_regfile.register[14][17] ,
  input  [  0:0] \__pi_regfile.register[15][17] ,
  input  [  0:0] \__pi_regfile.register[16][17] ,
  input  [  0:0] \__pi_regfile.register[17][17] ,
  input  [  0:0] \__pi_regfile.register[18][17] ,
  input  [  0:0] \__pi_regfile.register[19][17] ,
  input  [  0:0] \__pi_regfile.register[1][17] ,
  input  [  0:0] \__pi_regfile.register[20][17] ,
  input  [  0:0] \__pi_regfile.register[21][17] ,
  input  [  0:0] \__pi_regfile.register[22][17] ,
  input  [  0:0] \__pi_regfile.register[23][17] ,
  input  [  0:0] \__pi_regfile.register[24][17] ,
  input  [  0:0] \__pi_regfile.register[25][17] ,
  input  [  0:0] \__pi_regfile.register[26][17] ,
  input  [  0:0] \__pi_regfile.register[27][17] ,
  input  [  0:0] \__pi_regfile.register[28][17] ,
  input  [  0:0] \__pi_regfile.register[29][17] ,
  input  [  0:0] \__pi_regfile.register[2][17] ,
  input  [  0:0] \__pi_regfile.register[30][17] ,
  input  [  0:0] \__pi_regfile.register[31][17] ,
  input  [  0:0] \__pi_regfile.register[3][17] ,
  input  [  0:0] \__pi_regfile.register[4][17] ,
  input  [  0:0] \__pi_regfile.register[5][17] ,
  input  [  0:0] \__pi_regfile.register[6][17] ,
  input  [  0:0] \__pi_regfile.register[7][17] ,
  input  [  0:0] \__pi_regfile.register[8][17] ,
  input  [  0:0] \__pi_regfile.register[9][17] ,
  output [  0:0] \__po_data_mem_write_data[17]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.17 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][17] ,
  input  [  0:0] \__pi_regfile.register[10][17] ,
  input  [  0:0] \__pi_regfile.register[11][17] ,
  input  [  0:0] \__pi_regfile.register[12][17] ,
  input  [  0:0] \__pi_regfile.register[13][17] ,
  input  [  0:0] \__pi_regfile.register[14][17] ,
  input  [  0:0] \__pi_regfile.register[15][17] ,
  input  [  0:0] \__pi_regfile.register[16][17] ,
  input  [  0:0] \__pi_regfile.register[17][17] ,
  input  [  0:0] \__pi_regfile.register[18][17] ,
  input  [  0:0] \__pi_regfile.register[19][17] ,
  input  [  0:0] \__pi_regfile.register[1][17] ,
  input  [  0:0] \__pi_regfile.register[20][17] ,
  input  [  0:0] \__pi_regfile.register[21][17] ,
  input  [  0:0] \__pi_regfile.register[22][17] ,
  input  [  0:0] \__pi_regfile.register[23][17] ,
  input  [  0:0] \__pi_regfile.register[24][17] ,
  input  [  0:0] \__pi_regfile.register[25][17] ,
  input  [  0:0] \__pi_regfile.register[26][17] ,
  input  [  0:0] \__pi_regfile.register[27][17] ,
  input  [  0:0] \__pi_regfile.register[28][17] ,
  input  [  0:0] \__pi_regfile.register[29][17] ,
  input  [  0:0] \__pi_regfile.register[2][17] ,
  input  [  0:0] \__pi_regfile.register[30][17] ,
  input  [  0:0] \__pi_regfile.register[31][17] ,
  input  [  0:0] \__pi_regfile.register[3][17] ,
  input  [  0:0] \__pi_regfile.register[4][17] ,
  input  [  0:0] \__pi_regfile.register[5][17] ,
  input  [  0:0] \__pi_regfile.register[6][17] ,
  input  [  0:0] \__pi_regfile.register[7][17] ,
  input  [  0:0] \__pi_regfile.register[8][17] ,
  input  [  0:0] \__pi_regfile.register[9][17] ,
  output [  0:0] \__po_data_mem_write_data[17]
);
endmodule
