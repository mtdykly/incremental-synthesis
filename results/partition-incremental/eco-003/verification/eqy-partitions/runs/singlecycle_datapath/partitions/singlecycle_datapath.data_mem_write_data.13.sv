module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][13] ,
  input  [  0:0] \__pi_regfile.register[10][13] ,
  input  [  0:0] \__pi_regfile.register[11][13] ,
  input  [  0:0] \__pi_regfile.register[12][13] ,
  input  [  0:0] \__pi_regfile.register[13][13] ,
  input  [  0:0] \__pi_regfile.register[14][13] ,
  input  [  0:0] \__pi_regfile.register[15][13] ,
  input  [  0:0] \__pi_regfile.register[16][13] ,
  input  [  0:0] \__pi_regfile.register[17][13] ,
  input  [  0:0] \__pi_regfile.register[18][13] ,
  input  [  0:0] \__pi_regfile.register[19][13] ,
  input  [  0:0] \__pi_regfile.register[1][13] ,
  input  [  0:0] \__pi_regfile.register[20][13] ,
  input  [  0:0] \__pi_regfile.register[21][13] ,
  input  [  0:0] \__pi_regfile.register[22][13] ,
  input  [  0:0] \__pi_regfile.register[23][13] ,
  input  [  0:0] \__pi_regfile.register[24][13] ,
  input  [  0:0] \__pi_regfile.register[25][13] ,
  input  [  0:0] \__pi_regfile.register[26][13] ,
  input  [  0:0] \__pi_regfile.register[27][13] ,
  input  [  0:0] \__pi_regfile.register[28][13] ,
  input  [  0:0] \__pi_regfile.register[29][13] ,
  input  [  0:0] \__pi_regfile.register[2][13] ,
  input  [  0:0] \__pi_regfile.register[30][13] ,
  input  [  0:0] \__pi_regfile.register[31][13] ,
  input  [  0:0] \__pi_regfile.register[3][13] ,
  input  [  0:0] \__pi_regfile.register[4][13] ,
  input  [  0:0] \__pi_regfile.register[5][13] ,
  input  [  0:0] \__pi_regfile.register[6][13] ,
  input  [  0:0] \__pi_regfile.register[7][13] ,
  input  [  0:0] \__pi_regfile.register[8][13] ,
  input  [  0:0] \__pi_regfile.register[9][13] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[13]__gold ,
  output [  0:0] \__po_data_mem_write_data[13]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.13 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][13] (\__pi_regfile.register[0][13] ),
    .\__pi_regfile.register[10][13] (\__pi_regfile.register[10][13] ),
    .\__pi_regfile.register[11][13] (\__pi_regfile.register[11][13] ),
    .\__pi_regfile.register[12][13] (\__pi_regfile.register[12][13] ),
    .\__pi_regfile.register[13][13] (\__pi_regfile.register[13][13] ),
    .\__pi_regfile.register[14][13] (\__pi_regfile.register[14][13] ),
    .\__pi_regfile.register[15][13] (\__pi_regfile.register[15][13] ),
    .\__pi_regfile.register[16][13] (\__pi_regfile.register[16][13] ),
    .\__pi_regfile.register[17][13] (\__pi_regfile.register[17][13] ),
    .\__pi_regfile.register[18][13] (\__pi_regfile.register[18][13] ),
    .\__pi_regfile.register[19][13] (\__pi_regfile.register[19][13] ),
    .\__pi_regfile.register[1][13] (\__pi_regfile.register[1][13] ),
    .\__pi_regfile.register[20][13] (\__pi_regfile.register[20][13] ),
    .\__pi_regfile.register[21][13] (\__pi_regfile.register[21][13] ),
    .\__pi_regfile.register[22][13] (\__pi_regfile.register[22][13] ),
    .\__pi_regfile.register[23][13] (\__pi_regfile.register[23][13] ),
    .\__pi_regfile.register[24][13] (\__pi_regfile.register[24][13] ),
    .\__pi_regfile.register[25][13] (\__pi_regfile.register[25][13] ),
    .\__pi_regfile.register[26][13] (\__pi_regfile.register[26][13] ),
    .\__pi_regfile.register[27][13] (\__pi_regfile.register[27][13] ),
    .\__pi_regfile.register[28][13] (\__pi_regfile.register[28][13] ),
    .\__pi_regfile.register[29][13] (\__pi_regfile.register[29][13] ),
    .\__pi_regfile.register[2][13] (\__pi_regfile.register[2][13] ),
    .\__pi_regfile.register[30][13] (\__pi_regfile.register[30][13] ),
    .\__pi_regfile.register[31][13] (\__pi_regfile.register[31][13] ),
    .\__pi_regfile.register[3][13] (\__pi_regfile.register[3][13] ),
    .\__pi_regfile.register[4][13] (\__pi_regfile.register[4][13] ),
    .\__pi_regfile.register[5][13] (\__pi_regfile.register[5][13] ),
    .\__pi_regfile.register[6][13] (\__pi_regfile.register[6][13] ),
    .\__pi_regfile.register[7][13] (\__pi_regfile.register[7][13] ),
    .\__pi_regfile.register[8][13] (\__pi_regfile.register[8][13] ),
    .\__pi_regfile.register[9][13] (\__pi_regfile.register[9][13] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[13] (\__po_data_mem_write_data[13]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.13 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][13] (\__pi_regfile.register[0][13] ),
    .\__pi_regfile.register[10][13] (\__pi_regfile.register[10][13] ),
    .\__pi_regfile.register[11][13] (\__pi_regfile.register[11][13] ),
    .\__pi_regfile.register[12][13] (\__pi_regfile.register[12][13] ),
    .\__pi_regfile.register[13][13] (\__pi_regfile.register[13][13] ),
    .\__pi_regfile.register[14][13] (\__pi_regfile.register[14][13] ),
    .\__pi_regfile.register[15][13] (\__pi_regfile.register[15][13] ),
    .\__pi_regfile.register[16][13] (\__pi_regfile.register[16][13] ),
    .\__pi_regfile.register[17][13] (\__pi_regfile.register[17][13] ),
    .\__pi_regfile.register[18][13] (\__pi_regfile.register[18][13] ),
    .\__pi_regfile.register[19][13] (\__pi_regfile.register[19][13] ),
    .\__pi_regfile.register[1][13] (\__pi_regfile.register[1][13] ),
    .\__pi_regfile.register[20][13] (\__pi_regfile.register[20][13] ),
    .\__pi_regfile.register[21][13] (\__pi_regfile.register[21][13] ),
    .\__pi_regfile.register[22][13] (\__pi_regfile.register[22][13] ),
    .\__pi_regfile.register[23][13] (\__pi_regfile.register[23][13] ),
    .\__pi_regfile.register[24][13] (\__pi_regfile.register[24][13] ),
    .\__pi_regfile.register[25][13] (\__pi_regfile.register[25][13] ),
    .\__pi_regfile.register[26][13] (\__pi_regfile.register[26][13] ),
    .\__pi_regfile.register[27][13] (\__pi_regfile.register[27][13] ),
    .\__pi_regfile.register[28][13] (\__pi_regfile.register[28][13] ),
    .\__pi_regfile.register[29][13] (\__pi_regfile.register[29][13] ),
    .\__pi_regfile.register[2][13] (\__pi_regfile.register[2][13] ),
    .\__pi_regfile.register[30][13] (\__pi_regfile.register[30][13] ),
    .\__pi_regfile.register[31][13] (\__pi_regfile.register[31][13] ),
    .\__pi_regfile.register[3][13] (\__pi_regfile.register[3][13] ),
    .\__pi_regfile.register[4][13] (\__pi_regfile.register[4][13] ),
    .\__pi_regfile.register[5][13] (\__pi_regfile.register[5][13] ),
    .\__pi_regfile.register[6][13] (\__pi_regfile.register[6][13] ),
    .\__pi_regfile.register[7][13] (\__pi_regfile.register[7][13] ),
    .\__pi_regfile.register[8][13] (\__pi_regfile.register[8][13] ),
    .\__pi_regfile.register[9][13] (\__pi_regfile.register[9][13] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[13] (\__po_data_mem_write_data[13]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][13]__assume (\__pi_regfile.register[0][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][13]__assume (\__pi_regfile.register[10][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][13]__assume (\__pi_regfile.register[11][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][13]__assume (\__pi_regfile.register[12][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][13]__assume (\__pi_regfile.register[13][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][13]__assume (\__pi_regfile.register[14][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][13]__assume (\__pi_regfile.register[15][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][13]__assume (\__pi_regfile.register[16][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][13]__assume (\__pi_regfile.register[17][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][13]__assume (\__pi_regfile.register[18][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][13]__assume (\__pi_regfile.register[19][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][13]__assume (\__pi_regfile.register[1][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][13]__assume (\__pi_regfile.register[20][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][13]__assume (\__pi_regfile.register[21][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][13]__assume (\__pi_regfile.register[22][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][13]__assume (\__pi_regfile.register[23][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][13]__assume (\__pi_regfile.register[24][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][13]__assume (\__pi_regfile.register[25][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][13]__assume (\__pi_regfile.register[26][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][13]__assume (\__pi_regfile.register[27][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][13]__assume (\__pi_regfile.register[28][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][13]__assume (\__pi_regfile.register[29][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][13]__assume (\__pi_regfile.register[2][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][13]__assume (\__pi_regfile.register[30][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][13]__assume (\__pi_regfile.register[31][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][13]__assume (\__pi_regfile.register[3][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][13]__assume (\__pi_regfile.register[4][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][13]__assume (\__pi_regfile.register[5][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][13]__assume (\__pi_regfile.register[6][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][13]__assume (\__pi_regfile.register[7][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][13]__assume (\__pi_regfile.register[8][13] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][13]__assume (\__pi_regfile.register[9][13] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[13]__assert (\__po_data_mem_write_data[13]__gold , \__po_data_mem_write_data[13]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[13]__gold_cover (\__po_data_mem_write_data[13]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[13]__gate_cover (\__po_data_mem_write_data[13]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.13 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][13] ,
  input  [  0:0] \__pi_regfile.register[10][13] ,
  input  [  0:0] \__pi_regfile.register[11][13] ,
  input  [  0:0] \__pi_regfile.register[12][13] ,
  input  [  0:0] \__pi_regfile.register[13][13] ,
  input  [  0:0] \__pi_regfile.register[14][13] ,
  input  [  0:0] \__pi_regfile.register[15][13] ,
  input  [  0:0] \__pi_regfile.register[16][13] ,
  input  [  0:0] \__pi_regfile.register[17][13] ,
  input  [  0:0] \__pi_regfile.register[18][13] ,
  input  [  0:0] \__pi_regfile.register[19][13] ,
  input  [  0:0] \__pi_regfile.register[1][13] ,
  input  [  0:0] \__pi_regfile.register[20][13] ,
  input  [  0:0] \__pi_regfile.register[21][13] ,
  input  [  0:0] \__pi_regfile.register[22][13] ,
  input  [  0:0] \__pi_regfile.register[23][13] ,
  input  [  0:0] \__pi_regfile.register[24][13] ,
  input  [  0:0] \__pi_regfile.register[25][13] ,
  input  [  0:0] \__pi_regfile.register[26][13] ,
  input  [  0:0] \__pi_regfile.register[27][13] ,
  input  [  0:0] \__pi_regfile.register[28][13] ,
  input  [  0:0] \__pi_regfile.register[29][13] ,
  input  [  0:0] \__pi_regfile.register[2][13] ,
  input  [  0:0] \__pi_regfile.register[30][13] ,
  input  [  0:0] \__pi_regfile.register[31][13] ,
  input  [  0:0] \__pi_regfile.register[3][13] ,
  input  [  0:0] \__pi_regfile.register[4][13] ,
  input  [  0:0] \__pi_regfile.register[5][13] ,
  input  [  0:0] \__pi_regfile.register[6][13] ,
  input  [  0:0] \__pi_regfile.register[7][13] ,
  input  [  0:0] \__pi_regfile.register[8][13] ,
  input  [  0:0] \__pi_regfile.register[9][13] ,
  output [  0:0] \__po_data_mem_write_data[13]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.13 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][13] ,
  input  [  0:0] \__pi_regfile.register[10][13] ,
  input  [  0:0] \__pi_regfile.register[11][13] ,
  input  [  0:0] \__pi_regfile.register[12][13] ,
  input  [  0:0] \__pi_regfile.register[13][13] ,
  input  [  0:0] \__pi_regfile.register[14][13] ,
  input  [  0:0] \__pi_regfile.register[15][13] ,
  input  [  0:0] \__pi_regfile.register[16][13] ,
  input  [  0:0] \__pi_regfile.register[17][13] ,
  input  [  0:0] \__pi_regfile.register[18][13] ,
  input  [  0:0] \__pi_regfile.register[19][13] ,
  input  [  0:0] \__pi_regfile.register[1][13] ,
  input  [  0:0] \__pi_regfile.register[20][13] ,
  input  [  0:0] \__pi_regfile.register[21][13] ,
  input  [  0:0] \__pi_regfile.register[22][13] ,
  input  [  0:0] \__pi_regfile.register[23][13] ,
  input  [  0:0] \__pi_regfile.register[24][13] ,
  input  [  0:0] \__pi_regfile.register[25][13] ,
  input  [  0:0] \__pi_regfile.register[26][13] ,
  input  [  0:0] \__pi_regfile.register[27][13] ,
  input  [  0:0] \__pi_regfile.register[28][13] ,
  input  [  0:0] \__pi_regfile.register[29][13] ,
  input  [  0:0] \__pi_regfile.register[2][13] ,
  input  [  0:0] \__pi_regfile.register[30][13] ,
  input  [  0:0] \__pi_regfile.register[31][13] ,
  input  [  0:0] \__pi_regfile.register[3][13] ,
  input  [  0:0] \__pi_regfile.register[4][13] ,
  input  [  0:0] \__pi_regfile.register[5][13] ,
  input  [  0:0] \__pi_regfile.register[6][13] ,
  input  [  0:0] \__pi_regfile.register[7][13] ,
  input  [  0:0] \__pi_regfile.register[8][13] ,
  input  [  0:0] \__pi_regfile.register[9][13] ,
  output [  0:0] \__po_data_mem_write_data[13]
);
endmodule
