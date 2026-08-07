module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][5] ,
  input  [  0:0] \__pi_regfile.register[10][5] ,
  input  [  0:0] \__pi_regfile.register[11][5] ,
  input  [  0:0] \__pi_regfile.register[12][5] ,
  input  [  0:0] \__pi_regfile.register[13][5] ,
  input  [  0:0] \__pi_regfile.register[14][5] ,
  input  [  0:0] \__pi_regfile.register[15][5] ,
  input  [  0:0] \__pi_regfile.register[16][5] ,
  input  [  0:0] \__pi_regfile.register[17][5] ,
  input  [  0:0] \__pi_regfile.register[18][5] ,
  input  [  0:0] \__pi_regfile.register[19][5] ,
  input  [  0:0] \__pi_regfile.register[1][5] ,
  input  [  0:0] \__pi_regfile.register[20][5] ,
  input  [  0:0] \__pi_regfile.register[21][5] ,
  input  [  0:0] \__pi_regfile.register[22][5] ,
  input  [  0:0] \__pi_regfile.register[23][5] ,
  input  [  0:0] \__pi_regfile.register[24][5] ,
  input  [  0:0] \__pi_regfile.register[25][5] ,
  input  [  0:0] \__pi_regfile.register[26][5] ,
  input  [  0:0] \__pi_regfile.register[27][5] ,
  input  [  0:0] \__pi_regfile.register[28][5] ,
  input  [  0:0] \__pi_regfile.register[29][5] ,
  input  [  0:0] \__pi_regfile.register[2][5] ,
  input  [  0:0] \__pi_regfile.register[30][5] ,
  input  [  0:0] \__pi_regfile.register[31][5] ,
  input  [  0:0] \__pi_regfile.register[3][5] ,
  input  [  0:0] \__pi_regfile.register[4][5] ,
  input  [  0:0] \__pi_regfile.register[5][5] ,
  input  [  0:0] \__pi_regfile.register[6][5] ,
  input  [  0:0] \__pi_regfile.register[7][5] ,
  input  [  0:0] \__pi_regfile.register[8][5] ,
  input  [  0:0] \__pi_regfile.register[9][5] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[5]__gold ,
  output [  0:0] \__po_data_mem_write_data[5]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.5 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][5] (\__pi_regfile.register[0][5] ),
    .\__pi_regfile.register[10][5] (\__pi_regfile.register[10][5] ),
    .\__pi_regfile.register[11][5] (\__pi_regfile.register[11][5] ),
    .\__pi_regfile.register[12][5] (\__pi_regfile.register[12][5] ),
    .\__pi_regfile.register[13][5] (\__pi_regfile.register[13][5] ),
    .\__pi_regfile.register[14][5] (\__pi_regfile.register[14][5] ),
    .\__pi_regfile.register[15][5] (\__pi_regfile.register[15][5] ),
    .\__pi_regfile.register[16][5] (\__pi_regfile.register[16][5] ),
    .\__pi_regfile.register[17][5] (\__pi_regfile.register[17][5] ),
    .\__pi_regfile.register[18][5] (\__pi_regfile.register[18][5] ),
    .\__pi_regfile.register[19][5] (\__pi_regfile.register[19][5] ),
    .\__pi_regfile.register[1][5] (\__pi_regfile.register[1][5] ),
    .\__pi_regfile.register[20][5] (\__pi_regfile.register[20][5] ),
    .\__pi_regfile.register[21][5] (\__pi_regfile.register[21][5] ),
    .\__pi_regfile.register[22][5] (\__pi_regfile.register[22][5] ),
    .\__pi_regfile.register[23][5] (\__pi_regfile.register[23][5] ),
    .\__pi_regfile.register[24][5] (\__pi_regfile.register[24][5] ),
    .\__pi_regfile.register[25][5] (\__pi_regfile.register[25][5] ),
    .\__pi_regfile.register[26][5] (\__pi_regfile.register[26][5] ),
    .\__pi_regfile.register[27][5] (\__pi_regfile.register[27][5] ),
    .\__pi_regfile.register[28][5] (\__pi_regfile.register[28][5] ),
    .\__pi_regfile.register[29][5] (\__pi_regfile.register[29][5] ),
    .\__pi_regfile.register[2][5] (\__pi_regfile.register[2][5] ),
    .\__pi_regfile.register[30][5] (\__pi_regfile.register[30][5] ),
    .\__pi_regfile.register[31][5] (\__pi_regfile.register[31][5] ),
    .\__pi_regfile.register[3][5] (\__pi_regfile.register[3][5] ),
    .\__pi_regfile.register[4][5] (\__pi_regfile.register[4][5] ),
    .\__pi_regfile.register[5][5] (\__pi_regfile.register[5][5] ),
    .\__pi_regfile.register[6][5] (\__pi_regfile.register[6][5] ),
    .\__pi_regfile.register[7][5] (\__pi_regfile.register[7][5] ),
    .\__pi_regfile.register[8][5] (\__pi_regfile.register[8][5] ),
    .\__pi_regfile.register[9][5] (\__pi_regfile.register[9][5] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[5] (\__po_data_mem_write_data[5]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.5 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][5] (\__pi_regfile.register[0][5] ),
    .\__pi_regfile.register[10][5] (\__pi_regfile.register[10][5] ),
    .\__pi_regfile.register[11][5] (\__pi_regfile.register[11][5] ),
    .\__pi_regfile.register[12][5] (\__pi_regfile.register[12][5] ),
    .\__pi_regfile.register[13][5] (\__pi_regfile.register[13][5] ),
    .\__pi_regfile.register[14][5] (\__pi_regfile.register[14][5] ),
    .\__pi_regfile.register[15][5] (\__pi_regfile.register[15][5] ),
    .\__pi_regfile.register[16][5] (\__pi_regfile.register[16][5] ),
    .\__pi_regfile.register[17][5] (\__pi_regfile.register[17][5] ),
    .\__pi_regfile.register[18][5] (\__pi_regfile.register[18][5] ),
    .\__pi_regfile.register[19][5] (\__pi_regfile.register[19][5] ),
    .\__pi_regfile.register[1][5] (\__pi_regfile.register[1][5] ),
    .\__pi_regfile.register[20][5] (\__pi_regfile.register[20][5] ),
    .\__pi_regfile.register[21][5] (\__pi_regfile.register[21][5] ),
    .\__pi_regfile.register[22][5] (\__pi_regfile.register[22][5] ),
    .\__pi_regfile.register[23][5] (\__pi_regfile.register[23][5] ),
    .\__pi_regfile.register[24][5] (\__pi_regfile.register[24][5] ),
    .\__pi_regfile.register[25][5] (\__pi_regfile.register[25][5] ),
    .\__pi_regfile.register[26][5] (\__pi_regfile.register[26][5] ),
    .\__pi_regfile.register[27][5] (\__pi_regfile.register[27][5] ),
    .\__pi_regfile.register[28][5] (\__pi_regfile.register[28][5] ),
    .\__pi_regfile.register[29][5] (\__pi_regfile.register[29][5] ),
    .\__pi_regfile.register[2][5] (\__pi_regfile.register[2][5] ),
    .\__pi_regfile.register[30][5] (\__pi_regfile.register[30][5] ),
    .\__pi_regfile.register[31][5] (\__pi_regfile.register[31][5] ),
    .\__pi_regfile.register[3][5] (\__pi_regfile.register[3][5] ),
    .\__pi_regfile.register[4][5] (\__pi_regfile.register[4][5] ),
    .\__pi_regfile.register[5][5] (\__pi_regfile.register[5][5] ),
    .\__pi_regfile.register[6][5] (\__pi_regfile.register[6][5] ),
    .\__pi_regfile.register[7][5] (\__pi_regfile.register[7][5] ),
    .\__pi_regfile.register[8][5] (\__pi_regfile.register[8][5] ),
    .\__pi_regfile.register[9][5] (\__pi_regfile.register[9][5] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[5] (\__po_data_mem_write_data[5]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][5]__assume (\__pi_regfile.register[0][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][5]__assume (\__pi_regfile.register[10][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][5]__assume (\__pi_regfile.register[11][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][5]__assume (\__pi_regfile.register[12][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][5]__assume (\__pi_regfile.register[13][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][5]__assume (\__pi_regfile.register[14][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][5]__assume (\__pi_regfile.register[15][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][5]__assume (\__pi_regfile.register[16][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][5]__assume (\__pi_regfile.register[17][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][5]__assume (\__pi_regfile.register[18][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][5]__assume (\__pi_regfile.register[19][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][5]__assume (\__pi_regfile.register[1][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][5]__assume (\__pi_regfile.register[20][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][5]__assume (\__pi_regfile.register[21][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][5]__assume (\__pi_regfile.register[22][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][5]__assume (\__pi_regfile.register[23][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][5]__assume (\__pi_regfile.register[24][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][5]__assume (\__pi_regfile.register[25][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][5]__assume (\__pi_regfile.register[26][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][5]__assume (\__pi_regfile.register[27][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][5]__assume (\__pi_regfile.register[28][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][5]__assume (\__pi_regfile.register[29][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][5]__assume (\__pi_regfile.register[2][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][5]__assume (\__pi_regfile.register[30][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][5]__assume (\__pi_regfile.register[31][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][5]__assume (\__pi_regfile.register[3][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][5]__assume (\__pi_regfile.register[4][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][5]__assume (\__pi_regfile.register[5][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][5]__assume (\__pi_regfile.register[6][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][5]__assume (\__pi_regfile.register[7][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][5]__assume (\__pi_regfile.register[8][5] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][5]__assume (\__pi_regfile.register[9][5] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[5]__assert (\__po_data_mem_write_data[5]__gold , \__po_data_mem_write_data[5]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[5]__gold_cover (\__po_data_mem_write_data[5]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[5]__gate_cover (\__po_data_mem_write_data[5]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.5 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][5] ,
  input  [  0:0] \__pi_regfile.register[10][5] ,
  input  [  0:0] \__pi_regfile.register[11][5] ,
  input  [  0:0] \__pi_regfile.register[12][5] ,
  input  [  0:0] \__pi_regfile.register[13][5] ,
  input  [  0:0] \__pi_regfile.register[14][5] ,
  input  [  0:0] \__pi_regfile.register[15][5] ,
  input  [  0:0] \__pi_regfile.register[16][5] ,
  input  [  0:0] \__pi_regfile.register[17][5] ,
  input  [  0:0] \__pi_regfile.register[18][5] ,
  input  [  0:0] \__pi_regfile.register[19][5] ,
  input  [  0:0] \__pi_regfile.register[1][5] ,
  input  [  0:0] \__pi_regfile.register[20][5] ,
  input  [  0:0] \__pi_regfile.register[21][5] ,
  input  [  0:0] \__pi_regfile.register[22][5] ,
  input  [  0:0] \__pi_regfile.register[23][5] ,
  input  [  0:0] \__pi_regfile.register[24][5] ,
  input  [  0:0] \__pi_regfile.register[25][5] ,
  input  [  0:0] \__pi_regfile.register[26][5] ,
  input  [  0:0] \__pi_regfile.register[27][5] ,
  input  [  0:0] \__pi_regfile.register[28][5] ,
  input  [  0:0] \__pi_regfile.register[29][5] ,
  input  [  0:0] \__pi_regfile.register[2][5] ,
  input  [  0:0] \__pi_regfile.register[30][5] ,
  input  [  0:0] \__pi_regfile.register[31][5] ,
  input  [  0:0] \__pi_regfile.register[3][5] ,
  input  [  0:0] \__pi_regfile.register[4][5] ,
  input  [  0:0] \__pi_regfile.register[5][5] ,
  input  [  0:0] \__pi_regfile.register[6][5] ,
  input  [  0:0] \__pi_regfile.register[7][5] ,
  input  [  0:0] \__pi_regfile.register[8][5] ,
  input  [  0:0] \__pi_regfile.register[9][5] ,
  output [  0:0] \__po_data_mem_write_data[5]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.5 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][5] ,
  input  [  0:0] \__pi_regfile.register[10][5] ,
  input  [  0:0] \__pi_regfile.register[11][5] ,
  input  [  0:0] \__pi_regfile.register[12][5] ,
  input  [  0:0] \__pi_regfile.register[13][5] ,
  input  [  0:0] \__pi_regfile.register[14][5] ,
  input  [  0:0] \__pi_regfile.register[15][5] ,
  input  [  0:0] \__pi_regfile.register[16][5] ,
  input  [  0:0] \__pi_regfile.register[17][5] ,
  input  [  0:0] \__pi_regfile.register[18][5] ,
  input  [  0:0] \__pi_regfile.register[19][5] ,
  input  [  0:0] \__pi_regfile.register[1][5] ,
  input  [  0:0] \__pi_regfile.register[20][5] ,
  input  [  0:0] \__pi_regfile.register[21][5] ,
  input  [  0:0] \__pi_regfile.register[22][5] ,
  input  [  0:0] \__pi_regfile.register[23][5] ,
  input  [  0:0] \__pi_regfile.register[24][5] ,
  input  [  0:0] \__pi_regfile.register[25][5] ,
  input  [  0:0] \__pi_regfile.register[26][5] ,
  input  [  0:0] \__pi_regfile.register[27][5] ,
  input  [  0:0] \__pi_regfile.register[28][5] ,
  input  [  0:0] \__pi_regfile.register[29][5] ,
  input  [  0:0] \__pi_regfile.register[2][5] ,
  input  [  0:0] \__pi_regfile.register[30][5] ,
  input  [  0:0] \__pi_regfile.register[31][5] ,
  input  [  0:0] \__pi_regfile.register[3][5] ,
  input  [  0:0] \__pi_regfile.register[4][5] ,
  input  [  0:0] \__pi_regfile.register[5][5] ,
  input  [  0:0] \__pi_regfile.register[6][5] ,
  input  [  0:0] \__pi_regfile.register[7][5] ,
  input  [  0:0] \__pi_regfile.register[8][5] ,
  input  [  0:0] \__pi_regfile.register[9][5] ,
  output [  0:0] \__po_data_mem_write_data[5]
);
endmodule
