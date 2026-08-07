module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][20] ,
  input  [  0:0] \__pi_regfile.register[10][20] ,
  input  [  0:0] \__pi_regfile.register[11][20] ,
  input  [  0:0] \__pi_regfile.register[12][20] ,
  input  [  0:0] \__pi_regfile.register[13][20] ,
  input  [  0:0] \__pi_regfile.register[14][20] ,
  input  [  0:0] \__pi_regfile.register[15][20] ,
  input  [  0:0] \__pi_regfile.register[16][20] ,
  input  [  0:0] \__pi_regfile.register[17][20] ,
  input  [  0:0] \__pi_regfile.register[18][20] ,
  input  [  0:0] \__pi_regfile.register[19][20] ,
  input  [  0:0] \__pi_regfile.register[1][20] ,
  input  [  0:0] \__pi_regfile.register[20][20] ,
  input  [  0:0] \__pi_regfile.register[21][20] ,
  input  [  0:0] \__pi_regfile.register[22][20] ,
  input  [  0:0] \__pi_regfile.register[23][20] ,
  input  [  0:0] \__pi_regfile.register[24][20] ,
  input  [  0:0] \__pi_regfile.register[25][20] ,
  input  [  0:0] \__pi_regfile.register[26][20] ,
  input  [  0:0] \__pi_regfile.register[27][20] ,
  input  [  0:0] \__pi_regfile.register[28][20] ,
  input  [  0:0] \__pi_regfile.register[29][20] ,
  input  [  0:0] \__pi_regfile.register[2][20] ,
  input  [  0:0] \__pi_regfile.register[30][20] ,
  input  [  0:0] \__pi_regfile.register[31][20] ,
  input  [  0:0] \__pi_regfile.register[3][20] ,
  input  [  0:0] \__pi_regfile.register[4][20] ,
  input  [  0:0] \__pi_regfile.register[5][20] ,
  input  [  0:0] \__pi_regfile.register[6][20] ,
  input  [  0:0] \__pi_regfile.register[7][20] ,
  input  [  0:0] \__pi_regfile.register[8][20] ,
  input  [  0:0] \__pi_regfile.register[9][20] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[20]__gold ,
  output [  0:0] \__po_data_mem_write_data[20]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.20 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][20] (\__pi_regfile.register[0][20] ),
    .\__pi_regfile.register[10][20] (\__pi_regfile.register[10][20] ),
    .\__pi_regfile.register[11][20] (\__pi_regfile.register[11][20] ),
    .\__pi_regfile.register[12][20] (\__pi_regfile.register[12][20] ),
    .\__pi_regfile.register[13][20] (\__pi_regfile.register[13][20] ),
    .\__pi_regfile.register[14][20] (\__pi_regfile.register[14][20] ),
    .\__pi_regfile.register[15][20] (\__pi_regfile.register[15][20] ),
    .\__pi_regfile.register[16][20] (\__pi_regfile.register[16][20] ),
    .\__pi_regfile.register[17][20] (\__pi_regfile.register[17][20] ),
    .\__pi_regfile.register[18][20] (\__pi_regfile.register[18][20] ),
    .\__pi_regfile.register[19][20] (\__pi_regfile.register[19][20] ),
    .\__pi_regfile.register[1][20] (\__pi_regfile.register[1][20] ),
    .\__pi_regfile.register[20][20] (\__pi_regfile.register[20][20] ),
    .\__pi_regfile.register[21][20] (\__pi_regfile.register[21][20] ),
    .\__pi_regfile.register[22][20] (\__pi_regfile.register[22][20] ),
    .\__pi_regfile.register[23][20] (\__pi_regfile.register[23][20] ),
    .\__pi_regfile.register[24][20] (\__pi_regfile.register[24][20] ),
    .\__pi_regfile.register[25][20] (\__pi_regfile.register[25][20] ),
    .\__pi_regfile.register[26][20] (\__pi_regfile.register[26][20] ),
    .\__pi_regfile.register[27][20] (\__pi_regfile.register[27][20] ),
    .\__pi_regfile.register[28][20] (\__pi_regfile.register[28][20] ),
    .\__pi_regfile.register[29][20] (\__pi_regfile.register[29][20] ),
    .\__pi_regfile.register[2][20] (\__pi_regfile.register[2][20] ),
    .\__pi_regfile.register[30][20] (\__pi_regfile.register[30][20] ),
    .\__pi_regfile.register[31][20] (\__pi_regfile.register[31][20] ),
    .\__pi_regfile.register[3][20] (\__pi_regfile.register[3][20] ),
    .\__pi_regfile.register[4][20] (\__pi_regfile.register[4][20] ),
    .\__pi_regfile.register[5][20] (\__pi_regfile.register[5][20] ),
    .\__pi_regfile.register[6][20] (\__pi_regfile.register[6][20] ),
    .\__pi_regfile.register[7][20] (\__pi_regfile.register[7][20] ),
    .\__pi_regfile.register[8][20] (\__pi_regfile.register[8][20] ),
    .\__pi_regfile.register[9][20] (\__pi_regfile.register[9][20] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[20] (\__po_data_mem_write_data[20]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.20 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][20] (\__pi_regfile.register[0][20] ),
    .\__pi_regfile.register[10][20] (\__pi_regfile.register[10][20] ),
    .\__pi_regfile.register[11][20] (\__pi_regfile.register[11][20] ),
    .\__pi_regfile.register[12][20] (\__pi_regfile.register[12][20] ),
    .\__pi_regfile.register[13][20] (\__pi_regfile.register[13][20] ),
    .\__pi_regfile.register[14][20] (\__pi_regfile.register[14][20] ),
    .\__pi_regfile.register[15][20] (\__pi_regfile.register[15][20] ),
    .\__pi_regfile.register[16][20] (\__pi_regfile.register[16][20] ),
    .\__pi_regfile.register[17][20] (\__pi_regfile.register[17][20] ),
    .\__pi_regfile.register[18][20] (\__pi_regfile.register[18][20] ),
    .\__pi_regfile.register[19][20] (\__pi_regfile.register[19][20] ),
    .\__pi_regfile.register[1][20] (\__pi_regfile.register[1][20] ),
    .\__pi_regfile.register[20][20] (\__pi_regfile.register[20][20] ),
    .\__pi_regfile.register[21][20] (\__pi_regfile.register[21][20] ),
    .\__pi_regfile.register[22][20] (\__pi_regfile.register[22][20] ),
    .\__pi_regfile.register[23][20] (\__pi_regfile.register[23][20] ),
    .\__pi_regfile.register[24][20] (\__pi_regfile.register[24][20] ),
    .\__pi_regfile.register[25][20] (\__pi_regfile.register[25][20] ),
    .\__pi_regfile.register[26][20] (\__pi_regfile.register[26][20] ),
    .\__pi_regfile.register[27][20] (\__pi_regfile.register[27][20] ),
    .\__pi_regfile.register[28][20] (\__pi_regfile.register[28][20] ),
    .\__pi_regfile.register[29][20] (\__pi_regfile.register[29][20] ),
    .\__pi_regfile.register[2][20] (\__pi_regfile.register[2][20] ),
    .\__pi_regfile.register[30][20] (\__pi_regfile.register[30][20] ),
    .\__pi_regfile.register[31][20] (\__pi_regfile.register[31][20] ),
    .\__pi_regfile.register[3][20] (\__pi_regfile.register[3][20] ),
    .\__pi_regfile.register[4][20] (\__pi_regfile.register[4][20] ),
    .\__pi_regfile.register[5][20] (\__pi_regfile.register[5][20] ),
    .\__pi_regfile.register[6][20] (\__pi_regfile.register[6][20] ),
    .\__pi_regfile.register[7][20] (\__pi_regfile.register[7][20] ),
    .\__pi_regfile.register[8][20] (\__pi_regfile.register[8][20] ),
    .\__pi_regfile.register[9][20] (\__pi_regfile.register[9][20] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[20] (\__po_data_mem_write_data[20]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][20]__assume (\__pi_regfile.register[0][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][20]__assume (\__pi_regfile.register[10][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][20]__assume (\__pi_regfile.register[11][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][20]__assume (\__pi_regfile.register[12][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][20]__assume (\__pi_regfile.register[13][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][20]__assume (\__pi_regfile.register[14][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][20]__assume (\__pi_regfile.register[15][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][20]__assume (\__pi_regfile.register[16][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][20]__assume (\__pi_regfile.register[17][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][20]__assume (\__pi_regfile.register[18][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][20]__assume (\__pi_regfile.register[19][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][20]__assume (\__pi_regfile.register[1][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][20]__assume (\__pi_regfile.register[20][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][20]__assume (\__pi_regfile.register[21][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][20]__assume (\__pi_regfile.register[22][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][20]__assume (\__pi_regfile.register[23][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][20]__assume (\__pi_regfile.register[24][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][20]__assume (\__pi_regfile.register[25][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][20]__assume (\__pi_regfile.register[26][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][20]__assume (\__pi_regfile.register[27][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][20]__assume (\__pi_regfile.register[28][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][20]__assume (\__pi_regfile.register[29][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][20]__assume (\__pi_regfile.register[2][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][20]__assume (\__pi_regfile.register[30][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][20]__assume (\__pi_regfile.register[31][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][20]__assume (\__pi_regfile.register[3][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][20]__assume (\__pi_regfile.register[4][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][20]__assume (\__pi_regfile.register[5][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][20]__assume (\__pi_regfile.register[6][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][20]__assume (\__pi_regfile.register[7][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][20]__assume (\__pi_regfile.register[8][20] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][20]__assume (\__pi_regfile.register[9][20] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[20]__assert (\__po_data_mem_write_data[20]__gold , \__po_data_mem_write_data[20]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[20]__gold_cover (\__po_data_mem_write_data[20]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[20]__gate_cover (\__po_data_mem_write_data[20]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.20 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][20] ,
  input  [  0:0] \__pi_regfile.register[10][20] ,
  input  [  0:0] \__pi_regfile.register[11][20] ,
  input  [  0:0] \__pi_regfile.register[12][20] ,
  input  [  0:0] \__pi_regfile.register[13][20] ,
  input  [  0:0] \__pi_regfile.register[14][20] ,
  input  [  0:0] \__pi_regfile.register[15][20] ,
  input  [  0:0] \__pi_regfile.register[16][20] ,
  input  [  0:0] \__pi_regfile.register[17][20] ,
  input  [  0:0] \__pi_regfile.register[18][20] ,
  input  [  0:0] \__pi_regfile.register[19][20] ,
  input  [  0:0] \__pi_regfile.register[1][20] ,
  input  [  0:0] \__pi_regfile.register[20][20] ,
  input  [  0:0] \__pi_regfile.register[21][20] ,
  input  [  0:0] \__pi_regfile.register[22][20] ,
  input  [  0:0] \__pi_regfile.register[23][20] ,
  input  [  0:0] \__pi_regfile.register[24][20] ,
  input  [  0:0] \__pi_regfile.register[25][20] ,
  input  [  0:0] \__pi_regfile.register[26][20] ,
  input  [  0:0] \__pi_regfile.register[27][20] ,
  input  [  0:0] \__pi_regfile.register[28][20] ,
  input  [  0:0] \__pi_regfile.register[29][20] ,
  input  [  0:0] \__pi_regfile.register[2][20] ,
  input  [  0:0] \__pi_regfile.register[30][20] ,
  input  [  0:0] \__pi_regfile.register[31][20] ,
  input  [  0:0] \__pi_regfile.register[3][20] ,
  input  [  0:0] \__pi_regfile.register[4][20] ,
  input  [  0:0] \__pi_regfile.register[5][20] ,
  input  [  0:0] \__pi_regfile.register[6][20] ,
  input  [  0:0] \__pi_regfile.register[7][20] ,
  input  [  0:0] \__pi_regfile.register[8][20] ,
  input  [  0:0] \__pi_regfile.register[9][20] ,
  output [  0:0] \__po_data_mem_write_data[20]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.20 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][20] ,
  input  [  0:0] \__pi_regfile.register[10][20] ,
  input  [  0:0] \__pi_regfile.register[11][20] ,
  input  [  0:0] \__pi_regfile.register[12][20] ,
  input  [  0:0] \__pi_regfile.register[13][20] ,
  input  [  0:0] \__pi_regfile.register[14][20] ,
  input  [  0:0] \__pi_regfile.register[15][20] ,
  input  [  0:0] \__pi_regfile.register[16][20] ,
  input  [  0:0] \__pi_regfile.register[17][20] ,
  input  [  0:0] \__pi_regfile.register[18][20] ,
  input  [  0:0] \__pi_regfile.register[19][20] ,
  input  [  0:0] \__pi_regfile.register[1][20] ,
  input  [  0:0] \__pi_regfile.register[20][20] ,
  input  [  0:0] \__pi_regfile.register[21][20] ,
  input  [  0:0] \__pi_regfile.register[22][20] ,
  input  [  0:0] \__pi_regfile.register[23][20] ,
  input  [  0:0] \__pi_regfile.register[24][20] ,
  input  [  0:0] \__pi_regfile.register[25][20] ,
  input  [  0:0] \__pi_regfile.register[26][20] ,
  input  [  0:0] \__pi_regfile.register[27][20] ,
  input  [  0:0] \__pi_regfile.register[28][20] ,
  input  [  0:0] \__pi_regfile.register[29][20] ,
  input  [  0:0] \__pi_regfile.register[2][20] ,
  input  [  0:0] \__pi_regfile.register[30][20] ,
  input  [  0:0] \__pi_regfile.register[31][20] ,
  input  [  0:0] \__pi_regfile.register[3][20] ,
  input  [  0:0] \__pi_regfile.register[4][20] ,
  input  [  0:0] \__pi_regfile.register[5][20] ,
  input  [  0:0] \__pi_regfile.register[6][20] ,
  input  [  0:0] \__pi_regfile.register[7][20] ,
  input  [  0:0] \__pi_regfile.register[8][20] ,
  input  [  0:0] \__pi_regfile.register[9][20] ,
  output [  0:0] \__po_data_mem_write_data[20]
);
endmodule
