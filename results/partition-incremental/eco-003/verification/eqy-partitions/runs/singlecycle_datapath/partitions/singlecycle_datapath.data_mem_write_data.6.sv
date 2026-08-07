module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][6] ,
  input  [  0:0] \__pi_regfile.register[10][6] ,
  input  [  0:0] \__pi_regfile.register[11][6] ,
  input  [  0:0] \__pi_regfile.register[12][6] ,
  input  [  0:0] \__pi_regfile.register[13][6] ,
  input  [  0:0] \__pi_regfile.register[14][6] ,
  input  [  0:0] \__pi_regfile.register[15][6] ,
  input  [  0:0] \__pi_regfile.register[16][6] ,
  input  [  0:0] \__pi_regfile.register[17][6] ,
  input  [  0:0] \__pi_regfile.register[18][6] ,
  input  [  0:0] \__pi_regfile.register[19][6] ,
  input  [  0:0] \__pi_regfile.register[1][6] ,
  input  [  0:0] \__pi_regfile.register[20][6] ,
  input  [  0:0] \__pi_regfile.register[21][6] ,
  input  [  0:0] \__pi_regfile.register[22][6] ,
  input  [  0:0] \__pi_regfile.register[23][6] ,
  input  [  0:0] \__pi_regfile.register[24][6] ,
  input  [  0:0] \__pi_regfile.register[25][6] ,
  input  [  0:0] \__pi_regfile.register[26][6] ,
  input  [  0:0] \__pi_regfile.register[27][6] ,
  input  [  0:0] \__pi_regfile.register[28][6] ,
  input  [  0:0] \__pi_regfile.register[29][6] ,
  input  [  0:0] \__pi_regfile.register[2][6] ,
  input  [  0:0] \__pi_regfile.register[30][6] ,
  input  [  0:0] \__pi_regfile.register[31][6] ,
  input  [  0:0] \__pi_regfile.register[3][6] ,
  input  [  0:0] \__pi_regfile.register[4][6] ,
  input  [  0:0] \__pi_regfile.register[5][6] ,
  input  [  0:0] \__pi_regfile.register[6][6] ,
  input  [  0:0] \__pi_regfile.register[7][6] ,
  input  [  0:0] \__pi_regfile.register[8][6] ,
  input  [  0:0] \__pi_regfile.register[9][6] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[6]__gold ,
  output [  0:0] \__po_data_mem_write_data[6]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.6 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][6] (\__pi_regfile.register[0][6] ),
    .\__pi_regfile.register[10][6] (\__pi_regfile.register[10][6] ),
    .\__pi_regfile.register[11][6] (\__pi_regfile.register[11][6] ),
    .\__pi_regfile.register[12][6] (\__pi_regfile.register[12][6] ),
    .\__pi_regfile.register[13][6] (\__pi_regfile.register[13][6] ),
    .\__pi_regfile.register[14][6] (\__pi_regfile.register[14][6] ),
    .\__pi_regfile.register[15][6] (\__pi_regfile.register[15][6] ),
    .\__pi_regfile.register[16][6] (\__pi_regfile.register[16][6] ),
    .\__pi_regfile.register[17][6] (\__pi_regfile.register[17][6] ),
    .\__pi_regfile.register[18][6] (\__pi_regfile.register[18][6] ),
    .\__pi_regfile.register[19][6] (\__pi_regfile.register[19][6] ),
    .\__pi_regfile.register[1][6] (\__pi_regfile.register[1][6] ),
    .\__pi_regfile.register[20][6] (\__pi_regfile.register[20][6] ),
    .\__pi_regfile.register[21][6] (\__pi_regfile.register[21][6] ),
    .\__pi_regfile.register[22][6] (\__pi_regfile.register[22][6] ),
    .\__pi_regfile.register[23][6] (\__pi_regfile.register[23][6] ),
    .\__pi_regfile.register[24][6] (\__pi_regfile.register[24][6] ),
    .\__pi_regfile.register[25][6] (\__pi_regfile.register[25][6] ),
    .\__pi_regfile.register[26][6] (\__pi_regfile.register[26][6] ),
    .\__pi_regfile.register[27][6] (\__pi_regfile.register[27][6] ),
    .\__pi_regfile.register[28][6] (\__pi_regfile.register[28][6] ),
    .\__pi_regfile.register[29][6] (\__pi_regfile.register[29][6] ),
    .\__pi_regfile.register[2][6] (\__pi_regfile.register[2][6] ),
    .\__pi_regfile.register[30][6] (\__pi_regfile.register[30][6] ),
    .\__pi_regfile.register[31][6] (\__pi_regfile.register[31][6] ),
    .\__pi_regfile.register[3][6] (\__pi_regfile.register[3][6] ),
    .\__pi_regfile.register[4][6] (\__pi_regfile.register[4][6] ),
    .\__pi_regfile.register[5][6] (\__pi_regfile.register[5][6] ),
    .\__pi_regfile.register[6][6] (\__pi_regfile.register[6][6] ),
    .\__pi_regfile.register[7][6] (\__pi_regfile.register[7][6] ),
    .\__pi_regfile.register[8][6] (\__pi_regfile.register[8][6] ),
    .\__pi_regfile.register[9][6] (\__pi_regfile.register[9][6] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[6] (\__po_data_mem_write_data[6]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.6 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][6] (\__pi_regfile.register[0][6] ),
    .\__pi_regfile.register[10][6] (\__pi_regfile.register[10][6] ),
    .\__pi_regfile.register[11][6] (\__pi_regfile.register[11][6] ),
    .\__pi_regfile.register[12][6] (\__pi_regfile.register[12][6] ),
    .\__pi_regfile.register[13][6] (\__pi_regfile.register[13][6] ),
    .\__pi_regfile.register[14][6] (\__pi_regfile.register[14][6] ),
    .\__pi_regfile.register[15][6] (\__pi_regfile.register[15][6] ),
    .\__pi_regfile.register[16][6] (\__pi_regfile.register[16][6] ),
    .\__pi_regfile.register[17][6] (\__pi_regfile.register[17][6] ),
    .\__pi_regfile.register[18][6] (\__pi_regfile.register[18][6] ),
    .\__pi_regfile.register[19][6] (\__pi_regfile.register[19][6] ),
    .\__pi_regfile.register[1][6] (\__pi_regfile.register[1][6] ),
    .\__pi_regfile.register[20][6] (\__pi_regfile.register[20][6] ),
    .\__pi_regfile.register[21][6] (\__pi_regfile.register[21][6] ),
    .\__pi_regfile.register[22][6] (\__pi_regfile.register[22][6] ),
    .\__pi_regfile.register[23][6] (\__pi_regfile.register[23][6] ),
    .\__pi_regfile.register[24][6] (\__pi_regfile.register[24][6] ),
    .\__pi_regfile.register[25][6] (\__pi_regfile.register[25][6] ),
    .\__pi_regfile.register[26][6] (\__pi_regfile.register[26][6] ),
    .\__pi_regfile.register[27][6] (\__pi_regfile.register[27][6] ),
    .\__pi_regfile.register[28][6] (\__pi_regfile.register[28][6] ),
    .\__pi_regfile.register[29][6] (\__pi_regfile.register[29][6] ),
    .\__pi_regfile.register[2][6] (\__pi_regfile.register[2][6] ),
    .\__pi_regfile.register[30][6] (\__pi_regfile.register[30][6] ),
    .\__pi_regfile.register[31][6] (\__pi_regfile.register[31][6] ),
    .\__pi_regfile.register[3][6] (\__pi_regfile.register[3][6] ),
    .\__pi_regfile.register[4][6] (\__pi_regfile.register[4][6] ),
    .\__pi_regfile.register[5][6] (\__pi_regfile.register[5][6] ),
    .\__pi_regfile.register[6][6] (\__pi_regfile.register[6][6] ),
    .\__pi_regfile.register[7][6] (\__pi_regfile.register[7][6] ),
    .\__pi_regfile.register[8][6] (\__pi_regfile.register[8][6] ),
    .\__pi_regfile.register[9][6] (\__pi_regfile.register[9][6] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[6] (\__po_data_mem_write_data[6]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][6]__assume (\__pi_regfile.register[0][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][6]__assume (\__pi_regfile.register[10][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][6]__assume (\__pi_regfile.register[11][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][6]__assume (\__pi_regfile.register[12][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][6]__assume (\__pi_regfile.register[13][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][6]__assume (\__pi_regfile.register[14][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][6]__assume (\__pi_regfile.register[15][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][6]__assume (\__pi_regfile.register[16][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][6]__assume (\__pi_regfile.register[17][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][6]__assume (\__pi_regfile.register[18][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][6]__assume (\__pi_regfile.register[19][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][6]__assume (\__pi_regfile.register[1][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][6]__assume (\__pi_regfile.register[20][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][6]__assume (\__pi_regfile.register[21][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][6]__assume (\__pi_regfile.register[22][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][6]__assume (\__pi_regfile.register[23][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][6]__assume (\__pi_regfile.register[24][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][6]__assume (\__pi_regfile.register[25][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][6]__assume (\__pi_regfile.register[26][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][6]__assume (\__pi_regfile.register[27][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][6]__assume (\__pi_regfile.register[28][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][6]__assume (\__pi_regfile.register[29][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][6]__assume (\__pi_regfile.register[2][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][6]__assume (\__pi_regfile.register[30][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][6]__assume (\__pi_regfile.register[31][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][6]__assume (\__pi_regfile.register[3][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][6]__assume (\__pi_regfile.register[4][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][6]__assume (\__pi_regfile.register[5][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][6]__assume (\__pi_regfile.register[6][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][6]__assume (\__pi_regfile.register[7][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][6]__assume (\__pi_regfile.register[8][6] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][6]__assume (\__pi_regfile.register[9][6] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[6]__assert (\__po_data_mem_write_data[6]__gold , \__po_data_mem_write_data[6]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[6]__gold_cover (\__po_data_mem_write_data[6]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[6]__gate_cover (\__po_data_mem_write_data[6]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.6 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][6] ,
  input  [  0:0] \__pi_regfile.register[10][6] ,
  input  [  0:0] \__pi_regfile.register[11][6] ,
  input  [  0:0] \__pi_regfile.register[12][6] ,
  input  [  0:0] \__pi_regfile.register[13][6] ,
  input  [  0:0] \__pi_regfile.register[14][6] ,
  input  [  0:0] \__pi_regfile.register[15][6] ,
  input  [  0:0] \__pi_regfile.register[16][6] ,
  input  [  0:0] \__pi_regfile.register[17][6] ,
  input  [  0:0] \__pi_regfile.register[18][6] ,
  input  [  0:0] \__pi_regfile.register[19][6] ,
  input  [  0:0] \__pi_regfile.register[1][6] ,
  input  [  0:0] \__pi_regfile.register[20][6] ,
  input  [  0:0] \__pi_regfile.register[21][6] ,
  input  [  0:0] \__pi_regfile.register[22][6] ,
  input  [  0:0] \__pi_regfile.register[23][6] ,
  input  [  0:0] \__pi_regfile.register[24][6] ,
  input  [  0:0] \__pi_regfile.register[25][6] ,
  input  [  0:0] \__pi_regfile.register[26][6] ,
  input  [  0:0] \__pi_regfile.register[27][6] ,
  input  [  0:0] \__pi_regfile.register[28][6] ,
  input  [  0:0] \__pi_regfile.register[29][6] ,
  input  [  0:0] \__pi_regfile.register[2][6] ,
  input  [  0:0] \__pi_regfile.register[30][6] ,
  input  [  0:0] \__pi_regfile.register[31][6] ,
  input  [  0:0] \__pi_regfile.register[3][6] ,
  input  [  0:0] \__pi_regfile.register[4][6] ,
  input  [  0:0] \__pi_regfile.register[5][6] ,
  input  [  0:0] \__pi_regfile.register[6][6] ,
  input  [  0:0] \__pi_regfile.register[7][6] ,
  input  [  0:0] \__pi_regfile.register[8][6] ,
  input  [  0:0] \__pi_regfile.register[9][6] ,
  output [  0:0] \__po_data_mem_write_data[6]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.6 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][6] ,
  input  [  0:0] \__pi_regfile.register[10][6] ,
  input  [  0:0] \__pi_regfile.register[11][6] ,
  input  [  0:0] \__pi_regfile.register[12][6] ,
  input  [  0:0] \__pi_regfile.register[13][6] ,
  input  [  0:0] \__pi_regfile.register[14][6] ,
  input  [  0:0] \__pi_regfile.register[15][6] ,
  input  [  0:0] \__pi_regfile.register[16][6] ,
  input  [  0:0] \__pi_regfile.register[17][6] ,
  input  [  0:0] \__pi_regfile.register[18][6] ,
  input  [  0:0] \__pi_regfile.register[19][6] ,
  input  [  0:0] \__pi_regfile.register[1][6] ,
  input  [  0:0] \__pi_regfile.register[20][6] ,
  input  [  0:0] \__pi_regfile.register[21][6] ,
  input  [  0:0] \__pi_regfile.register[22][6] ,
  input  [  0:0] \__pi_regfile.register[23][6] ,
  input  [  0:0] \__pi_regfile.register[24][6] ,
  input  [  0:0] \__pi_regfile.register[25][6] ,
  input  [  0:0] \__pi_regfile.register[26][6] ,
  input  [  0:0] \__pi_regfile.register[27][6] ,
  input  [  0:0] \__pi_regfile.register[28][6] ,
  input  [  0:0] \__pi_regfile.register[29][6] ,
  input  [  0:0] \__pi_regfile.register[2][6] ,
  input  [  0:0] \__pi_regfile.register[30][6] ,
  input  [  0:0] \__pi_regfile.register[31][6] ,
  input  [  0:0] \__pi_regfile.register[3][6] ,
  input  [  0:0] \__pi_regfile.register[4][6] ,
  input  [  0:0] \__pi_regfile.register[5][6] ,
  input  [  0:0] \__pi_regfile.register[6][6] ,
  input  [  0:0] \__pi_regfile.register[7][6] ,
  input  [  0:0] \__pi_regfile.register[8][6] ,
  input  [  0:0] \__pi_regfile.register[9][6] ,
  output [  0:0] \__po_data_mem_write_data[6]
);
endmodule
