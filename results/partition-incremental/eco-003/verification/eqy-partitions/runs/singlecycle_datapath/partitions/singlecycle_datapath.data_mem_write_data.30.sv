module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][30] ,
  input  [  0:0] \__pi_regfile.register[10][30] ,
  input  [  0:0] \__pi_regfile.register[11][30] ,
  input  [  0:0] \__pi_regfile.register[12][30] ,
  input  [  0:0] \__pi_regfile.register[13][30] ,
  input  [  0:0] \__pi_regfile.register[14][30] ,
  input  [  0:0] \__pi_regfile.register[15][30] ,
  input  [  0:0] \__pi_regfile.register[16][30] ,
  input  [  0:0] \__pi_regfile.register[17][30] ,
  input  [  0:0] \__pi_regfile.register[18][30] ,
  input  [  0:0] \__pi_regfile.register[19][30] ,
  input  [  0:0] \__pi_regfile.register[1][30] ,
  input  [  0:0] \__pi_regfile.register[20][30] ,
  input  [  0:0] \__pi_regfile.register[21][30] ,
  input  [  0:0] \__pi_regfile.register[22][30] ,
  input  [  0:0] \__pi_regfile.register[23][30] ,
  input  [  0:0] \__pi_regfile.register[24][30] ,
  input  [  0:0] \__pi_regfile.register[25][30] ,
  input  [  0:0] \__pi_regfile.register[26][30] ,
  input  [  0:0] \__pi_regfile.register[27][30] ,
  input  [  0:0] \__pi_regfile.register[28][30] ,
  input  [  0:0] \__pi_regfile.register[29][30] ,
  input  [  0:0] \__pi_regfile.register[2][30] ,
  input  [  0:0] \__pi_regfile.register[30][30] ,
  input  [  0:0] \__pi_regfile.register[31][30] ,
  input  [  0:0] \__pi_regfile.register[3][30] ,
  input  [  0:0] \__pi_regfile.register[4][30] ,
  input  [  0:0] \__pi_regfile.register[5][30] ,
  input  [  0:0] \__pi_regfile.register[6][30] ,
  input  [  0:0] \__pi_regfile.register[7][30] ,
  input  [  0:0] \__pi_regfile.register[8][30] ,
  input  [  0:0] \__pi_regfile.register[9][30] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[30]__gold ,
  output [  0:0] \__po_data_mem_write_data[30]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.30 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][30] (\__pi_regfile.register[0][30] ),
    .\__pi_regfile.register[10][30] (\__pi_regfile.register[10][30] ),
    .\__pi_regfile.register[11][30] (\__pi_regfile.register[11][30] ),
    .\__pi_regfile.register[12][30] (\__pi_regfile.register[12][30] ),
    .\__pi_regfile.register[13][30] (\__pi_regfile.register[13][30] ),
    .\__pi_regfile.register[14][30] (\__pi_regfile.register[14][30] ),
    .\__pi_regfile.register[15][30] (\__pi_regfile.register[15][30] ),
    .\__pi_regfile.register[16][30] (\__pi_regfile.register[16][30] ),
    .\__pi_regfile.register[17][30] (\__pi_regfile.register[17][30] ),
    .\__pi_regfile.register[18][30] (\__pi_regfile.register[18][30] ),
    .\__pi_regfile.register[19][30] (\__pi_regfile.register[19][30] ),
    .\__pi_regfile.register[1][30] (\__pi_regfile.register[1][30] ),
    .\__pi_regfile.register[20][30] (\__pi_regfile.register[20][30] ),
    .\__pi_regfile.register[21][30] (\__pi_regfile.register[21][30] ),
    .\__pi_regfile.register[22][30] (\__pi_regfile.register[22][30] ),
    .\__pi_regfile.register[23][30] (\__pi_regfile.register[23][30] ),
    .\__pi_regfile.register[24][30] (\__pi_regfile.register[24][30] ),
    .\__pi_regfile.register[25][30] (\__pi_regfile.register[25][30] ),
    .\__pi_regfile.register[26][30] (\__pi_regfile.register[26][30] ),
    .\__pi_regfile.register[27][30] (\__pi_regfile.register[27][30] ),
    .\__pi_regfile.register[28][30] (\__pi_regfile.register[28][30] ),
    .\__pi_regfile.register[29][30] (\__pi_regfile.register[29][30] ),
    .\__pi_regfile.register[2][30] (\__pi_regfile.register[2][30] ),
    .\__pi_regfile.register[30][30] (\__pi_regfile.register[30][30] ),
    .\__pi_regfile.register[31][30] (\__pi_regfile.register[31][30] ),
    .\__pi_regfile.register[3][30] (\__pi_regfile.register[3][30] ),
    .\__pi_regfile.register[4][30] (\__pi_regfile.register[4][30] ),
    .\__pi_regfile.register[5][30] (\__pi_regfile.register[5][30] ),
    .\__pi_regfile.register[6][30] (\__pi_regfile.register[6][30] ),
    .\__pi_regfile.register[7][30] (\__pi_regfile.register[7][30] ),
    .\__pi_regfile.register[8][30] (\__pi_regfile.register[8][30] ),
    .\__pi_regfile.register[9][30] (\__pi_regfile.register[9][30] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[30] (\__po_data_mem_write_data[30]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.30 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][30] (\__pi_regfile.register[0][30] ),
    .\__pi_regfile.register[10][30] (\__pi_regfile.register[10][30] ),
    .\__pi_regfile.register[11][30] (\__pi_regfile.register[11][30] ),
    .\__pi_regfile.register[12][30] (\__pi_regfile.register[12][30] ),
    .\__pi_regfile.register[13][30] (\__pi_regfile.register[13][30] ),
    .\__pi_regfile.register[14][30] (\__pi_regfile.register[14][30] ),
    .\__pi_regfile.register[15][30] (\__pi_regfile.register[15][30] ),
    .\__pi_regfile.register[16][30] (\__pi_regfile.register[16][30] ),
    .\__pi_regfile.register[17][30] (\__pi_regfile.register[17][30] ),
    .\__pi_regfile.register[18][30] (\__pi_regfile.register[18][30] ),
    .\__pi_regfile.register[19][30] (\__pi_regfile.register[19][30] ),
    .\__pi_regfile.register[1][30] (\__pi_regfile.register[1][30] ),
    .\__pi_regfile.register[20][30] (\__pi_regfile.register[20][30] ),
    .\__pi_regfile.register[21][30] (\__pi_regfile.register[21][30] ),
    .\__pi_regfile.register[22][30] (\__pi_regfile.register[22][30] ),
    .\__pi_regfile.register[23][30] (\__pi_regfile.register[23][30] ),
    .\__pi_regfile.register[24][30] (\__pi_regfile.register[24][30] ),
    .\__pi_regfile.register[25][30] (\__pi_regfile.register[25][30] ),
    .\__pi_regfile.register[26][30] (\__pi_regfile.register[26][30] ),
    .\__pi_regfile.register[27][30] (\__pi_regfile.register[27][30] ),
    .\__pi_regfile.register[28][30] (\__pi_regfile.register[28][30] ),
    .\__pi_regfile.register[29][30] (\__pi_regfile.register[29][30] ),
    .\__pi_regfile.register[2][30] (\__pi_regfile.register[2][30] ),
    .\__pi_regfile.register[30][30] (\__pi_regfile.register[30][30] ),
    .\__pi_regfile.register[31][30] (\__pi_regfile.register[31][30] ),
    .\__pi_regfile.register[3][30] (\__pi_regfile.register[3][30] ),
    .\__pi_regfile.register[4][30] (\__pi_regfile.register[4][30] ),
    .\__pi_regfile.register[5][30] (\__pi_regfile.register[5][30] ),
    .\__pi_regfile.register[6][30] (\__pi_regfile.register[6][30] ),
    .\__pi_regfile.register[7][30] (\__pi_regfile.register[7][30] ),
    .\__pi_regfile.register[8][30] (\__pi_regfile.register[8][30] ),
    .\__pi_regfile.register[9][30] (\__pi_regfile.register[9][30] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[30] (\__po_data_mem_write_data[30]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][30]__assume (\__pi_regfile.register[0][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][30]__assume (\__pi_regfile.register[10][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][30]__assume (\__pi_regfile.register[11][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][30]__assume (\__pi_regfile.register[12][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][30]__assume (\__pi_regfile.register[13][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][30]__assume (\__pi_regfile.register[14][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][30]__assume (\__pi_regfile.register[15][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][30]__assume (\__pi_regfile.register[16][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][30]__assume (\__pi_regfile.register[17][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][30]__assume (\__pi_regfile.register[18][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][30]__assume (\__pi_regfile.register[19][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][30]__assume (\__pi_regfile.register[1][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][30]__assume (\__pi_regfile.register[20][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][30]__assume (\__pi_regfile.register[21][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][30]__assume (\__pi_regfile.register[22][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][30]__assume (\__pi_regfile.register[23][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][30]__assume (\__pi_regfile.register[24][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][30]__assume (\__pi_regfile.register[25][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][30]__assume (\__pi_regfile.register[26][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][30]__assume (\__pi_regfile.register[27][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][30]__assume (\__pi_regfile.register[28][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][30]__assume (\__pi_regfile.register[29][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][30]__assume (\__pi_regfile.register[2][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][30]__assume (\__pi_regfile.register[30][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][30]__assume (\__pi_regfile.register[31][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][30]__assume (\__pi_regfile.register[3][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][30]__assume (\__pi_regfile.register[4][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][30]__assume (\__pi_regfile.register[5][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][30]__assume (\__pi_regfile.register[6][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][30]__assume (\__pi_regfile.register[7][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][30]__assume (\__pi_regfile.register[8][30] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][30]__assume (\__pi_regfile.register[9][30] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[30]__assert (\__po_data_mem_write_data[30]__gold , \__po_data_mem_write_data[30]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[30]__gold_cover (\__po_data_mem_write_data[30]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[30]__gate_cover (\__po_data_mem_write_data[30]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.30 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][30] ,
  input  [  0:0] \__pi_regfile.register[10][30] ,
  input  [  0:0] \__pi_regfile.register[11][30] ,
  input  [  0:0] \__pi_regfile.register[12][30] ,
  input  [  0:0] \__pi_regfile.register[13][30] ,
  input  [  0:0] \__pi_regfile.register[14][30] ,
  input  [  0:0] \__pi_regfile.register[15][30] ,
  input  [  0:0] \__pi_regfile.register[16][30] ,
  input  [  0:0] \__pi_regfile.register[17][30] ,
  input  [  0:0] \__pi_regfile.register[18][30] ,
  input  [  0:0] \__pi_regfile.register[19][30] ,
  input  [  0:0] \__pi_regfile.register[1][30] ,
  input  [  0:0] \__pi_regfile.register[20][30] ,
  input  [  0:0] \__pi_regfile.register[21][30] ,
  input  [  0:0] \__pi_regfile.register[22][30] ,
  input  [  0:0] \__pi_regfile.register[23][30] ,
  input  [  0:0] \__pi_regfile.register[24][30] ,
  input  [  0:0] \__pi_regfile.register[25][30] ,
  input  [  0:0] \__pi_regfile.register[26][30] ,
  input  [  0:0] \__pi_regfile.register[27][30] ,
  input  [  0:0] \__pi_regfile.register[28][30] ,
  input  [  0:0] \__pi_regfile.register[29][30] ,
  input  [  0:0] \__pi_regfile.register[2][30] ,
  input  [  0:0] \__pi_regfile.register[30][30] ,
  input  [  0:0] \__pi_regfile.register[31][30] ,
  input  [  0:0] \__pi_regfile.register[3][30] ,
  input  [  0:0] \__pi_regfile.register[4][30] ,
  input  [  0:0] \__pi_regfile.register[5][30] ,
  input  [  0:0] \__pi_regfile.register[6][30] ,
  input  [  0:0] \__pi_regfile.register[7][30] ,
  input  [  0:0] \__pi_regfile.register[8][30] ,
  input  [  0:0] \__pi_regfile.register[9][30] ,
  output [  0:0] \__po_data_mem_write_data[30]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.30 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][30] ,
  input  [  0:0] \__pi_regfile.register[10][30] ,
  input  [  0:0] \__pi_regfile.register[11][30] ,
  input  [  0:0] \__pi_regfile.register[12][30] ,
  input  [  0:0] \__pi_regfile.register[13][30] ,
  input  [  0:0] \__pi_regfile.register[14][30] ,
  input  [  0:0] \__pi_regfile.register[15][30] ,
  input  [  0:0] \__pi_regfile.register[16][30] ,
  input  [  0:0] \__pi_regfile.register[17][30] ,
  input  [  0:0] \__pi_regfile.register[18][30] ,
  input  [  0:0] \__pi_regfile.register[19][30] ,
  input  [  0:0] \__pi_regfile.register[1][30] ,
  input  [  0:0] \__pi_regfile.register[20][30] ,
  input  [  0:0] \__pi_regfile.register[21][30] ,
  input  [  0:0] \__pi_regfile.register[22][30] ,
  input  [  0:0] \__pi_regfile.register[23][30] ,
  input  [  0:0] \__pi_regfile.register[24][30] ,
  input  [  0:0] \__pi_regfile.register[25][30] ,
  input  [  0:0] \__pi_regfile.register[26][30] ,
  input  [  0:0] \__pi_regfile.register[27][30] ,
  input  [  0:0] \__pi_regfile.register[28][30] ,
  input  [  0:0] \__pi_regfile.register[29][30] ,
  input  [  0:0] \__pi_regfile.register[2][30] ,
  input  [  0:0] \__pi_regfile.register[30][30] ,
  input  [  0:0] \__pi_regfile.register[31][30] ,
  input  [  0:0] \__pi_regfile.register[3][30] ,
  input  [  0:0] \__pi_regfile.register[4][30] ,
  input  [  0:0] \__pi_regfile.register[5][30] ,
  input  [  0:0] \__pi_regfile.register[6][30] ,
  input  [  0:0] \__pi_regfile.register[7][30] ,
  input  [  0:0] \__pi_regfile.register[8][30] ,
  input  [  0:0] \__pi_regfile.register[9][30] ,
  output [  0:0] \__po_data_mem_write_data[30]
);
endmodule
