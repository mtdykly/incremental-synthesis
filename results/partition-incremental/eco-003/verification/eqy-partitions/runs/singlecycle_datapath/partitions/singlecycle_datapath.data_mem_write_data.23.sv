module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][23] ,
  input  [  0:0] \__pi_regfile.register[10][23] ,
  input  [  0:0] \__pi_regfile.register[11][23] ,
  input  [  0:0] \__pi_regfile.register[12][23] ,
  input  [  0:0] \__pi_regfile.register[13][23] ,
  input  [  0:0] \__pi_regfile.register[14][23] ,
  input  [  0:0] \__pi_regfile.register[15][23] ,
  input  [  0:0] \__pi_regfile.register[16][23] ,
  input  [  0:0] \__pi_regfile.register[17][23] ,
  input  [  0:0] \__pi_regfile.register[18][23] ,
  input  [  0:0] \__pi_regfile.register[19][23] ,
  input  [  0:0] \__pi_regfile.register[1][23] ,
  input  [  0:0] \__pi_regfile.register[20][23] ,
  input  [  0:0] \__pi_regfile.register[21][23] ,
  input  [  0:0] \__pi_regfile.register[22][23] ,
  input  [  0:0] \__pi_regfile.register[23][23] ,
  input  [  0:0] \__pi_regfile.register[24][23] ,
  input  [  0:0] \__pi_regfile.register[25][23] ,
  input  [  0:0] \__pi_regfile.register[26][23] ,
  input  [  0:0] \__pi_regfile.register[27][23] ,
  input  [  0:0] \__pi_regfile.register[28][23] ,
  input  [  0:0] \__pi_regfile.register[29][23] ,
  input  [  0:0] \__pi_regfile.register[2][23] ,
  input  [  0:0] \__pi_regfile.register[30][23] ,
  input  [  0:0] \__pi_regfile.register[31][23] ,
  input  [  0:0] \__pi_regfile.register[3][23] ,
  input  [  0:0] \__pi_regfile.register[4][23] ,
  input  [  0:0] \__pi_regfile.register[5][23] ,
  input  [  0:0] \__pi_regfile.register[6][23] ,
  input  [  0:0] \__pi_regfile.register[7][23] ,
  input  [  0:0] \__pi_regfile.register[8][23] ,
  input  [  0:0] \__pi_regfile.register[9][23] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[23]__gold ,
  output [  0:0] \__po_data_mem_write_data[23]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.23 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][23] (\__pi_regfile.register[0][23] ),
    .\__pi_regfile.register[10][23] (\__pi_regfile.register[10][23] ),
    .\__pi_regfile.register[11][23] (\__pi_regfile.register[11][23] ),
    .\__pi_regfile.register[12][23] (\__pi_regfile.register[12][23] ),
    .\__pi_regfile.register[13][23] (\__pi_regfile.register[13][23] ),
    .\__pi_regfile.register[14][23] (\__pi_regfile.register[14][23] ),
    .\__pi_regfile.register[15][23] (\__pi_regfile.register[15][23] ),
    .\__pi_regfile.register[16][23] (\__pi_regfile.register[16][23] ),
    .\__pi_regfile.register[17][23] (\__pi_regfile.register[17][23] ),
    .\__pi_regfile.register[18][23] (\__pi_regfile.register[18][23] ),
    .\__pi_regfile.register[19][23] (\__pi_regfile.register[19][23] ),
    .\__pi_regfile.register[1][23] (\__pi_regfile.register[1][23] ),
    .\__pi_regfile.register[20][23] (\__pi_regfile.register[20][23] ),
    .\__pi_regfile.register[21][23] (\__pi_regfile.register[21][23] ),
    .\__pi_regfile.register[22][23] (\__pi_regfile.register[22][23] ),
    .\__pi_regfile.register[23][23] (\__pi_regfile.register[23][23] ),
    .\__pi_regfile.register[24][23] (\__pi_regfile.register[24][23] ),
    .\__pi_regfile.register[25][23] (\__pi_regfile.register[25][23] ),
    .\__pi_regfile.register[26][23] (\__pi_regfile.register[26][23] ),
    .\__pi_regfile.register[27][23] (\__pi_regfile.register[27][23] ),
    .\__pi_regfile.register[28][23] (\__pi_regfile.register[28][23] ),
    .\__pi_regfile.register[29][23] (\__pi_regfile.register[29][23] ),
    .\__pi_regfile.register[2][23] (\__pi_regfile.register[2][23] ),
    .\__pi_regfile.register[30][23] (\__pi_regfile.register[30][23] ),
    .\__pi_regfile.register[31][23] (\__pi_regfile.register[31][23] ),
    .\__pi_regfile.register[3][23] (\__pi_regfile.register[3][23] ),
    .\__pi_regfile.register[4][23] (\__pi_regfile.register[4][23] ),
    .\__pi_regfile.register[5][23] (\__pi_regfile.register[5][23] ),
    .\__pi_regfile.register[6][23] (\__pi_regfile.register[6][23] ),
    .\__pi_regfile.register[7][23] (\__pi_regfile.register[7][23] ),
    .\__pi_regfile.register[8][23] (\__pi_regfile.register[8][23] ),
    .\__pi_regfile.register[9][23] (\__pi_regfile.register[9][23] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[23] (\__po_data_mem_write_data[23]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.23 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][23] (\__pi_regfile.register[0][23] ),
    .\__pi_regfile.register[10][23] (\__pi_regfile.register[10][23] ),
    .\__pi_regfile.register[11][23] (\__pi_regfile.register[11][23] ),
    .\__pi_regfile.register[12][23] (\__pi_regfile.register[12][23] ),
    .\__pi_regfile.register[13][23] (\__pi_regfile.register[13][23] ),
    .\__pi_regfile.register[14][23] (\__pi_regfile.register[14][23] ),
    .\__pi_regfile.register[15][23] (\__pi_regfile.register[15][23] ),
    .\__pi_regfile.register[16][23] (\__pi_regfile.register[16][23] ),
    .\__pi_regfile.register[17][23] (\__pi_regfile.register[17][23] ),
    .\__pi_regfile.register[18][23] (\__pi_regfile.register[18][23] ),
    .\__pi_regfile.register[19][23] (\__pi_regfile.register[19][23] ),
    .\__pi_regfile.register[1][23] (\__pi_regfile.register[1][23] ),
    .\__pi_regfile.register[20][23] (\__pi_regfile.register[20][23] ),
    .\__pi_regfile.register[21][23] (\__pi_regfile.register[21][23] ),
    .\__pi_regfile.register[22][23] (\__pi_regfile.register[22][23] ),
    .\__pi_regfile.register[23][23] (\__pi_regfile.register[23][23] ),
    .\__pi_regfile.register[24][23] (\__pi_regfile.register[24][23] ),
    .\__pi_regfile.register[25][23] (\__pi_regfile.register[25][23] ),
    .\__pi_regfile.register[26][23] (\__pi_regfile.register[26][23] ),
    .\__pi_regfile.register[27][23] (\__pi_regfile.register[27][23] ),
    .\__pi_regfile.register[28][23] (\__pi_regfile.register[28][23] ),
    .\__pi_regfile.register[29][23] (\__pi_regfile.register[29][23] ),
    .\__pi_regfile.register[2][23] (\__pi_regfile.register[2][23] ),
    .\__pi_regfile.register[30][23] (\__pi_regfile.register[30][23] ),
    .\__pi_regfile.register[31][23] (\__pi_regfile.register[31][23] ),
    .\__pi_regfile.register[3][23] (\__pi_regfile.register[3][23] ),
    .\__pi_regfile.register[4][23] (\__pi_regfile.register[4][23] ),
    .\__pi_regfile.register[5][23] (\__pi_regfile.register[5][23] ),
    .\__pi_regfile.register[6][23] (\__pi_regfile.register[6][23] ),
    .\__pi_regfile.register[7][23] (\__pi_regfile.register[7][23] ),
    .\__pi_regfile.register[8][23] (\__pi_regfile.register[8][23] ),
    .\__pi_regfile.register[9][23] (\__pi_regfile.register[9][23] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[23] (\__po_data_mem_write_data[23]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][23]__assume (\__pi_regfile.register[0][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][23]__assume (\__pi_regfile.register[10][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][23]__assume (\__pi_regfile.register[11][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][23]__assume (\__pi_regfile.register[12][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][23]__assume (\__pi_regfile.register[13][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][23]__assume (\__pi_regfile.register[14][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][23]__assume (\__pi_regfile.register[15][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][23]__assume (\__pi_regfile.register[16][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][23]__assume (\__pi_regfile.register[17][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][23]__assume (\__pi_regfile.register[18][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][23]__assume (\__pi_regfile.register[19][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][23]__assume (\__pi_regfile.register[1][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][23]__assume (\__pi_regfile.register[20][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][23]__assume (\__pi_regfile.register[21][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][23]__assume (\__pi_regfile.register[22][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][23]__assume (\__pi_regfile.register[23][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][23]__assume (\__pi_regfile.register[24][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][23]__assume (\__pi_regfile.register[25][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][23]__assume (\__pi_regfile.register[26][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][23]__assume (\__pi_regfile.register[27][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][23]__assume (\__pi_regfile.register[28][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][23]__assume (\__pi_regfile.register[29][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][23]__assume (\__pi_regfile.register[2][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][23]__assume (\__pi_regfile.register[30][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][23]__assume (\__pi_regfile.register[31][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][23]__assume (\__pi_regfile.register[3][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][23]__assume (\__pi_regfile.register[4][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][23]__assume (\__pi_regfile.register[5][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][23]__assume (\__pi_regfile.register[6][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][23]__assume (\__pi_regfile.register[7][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][23]__assume (\__pi_regfile.register[8][23] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][23]__assume (\__pi_regfile.register[9][23] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[23]__assert (\__po_data_mem_write_data[23]__gold , \__po_data_mem_write_data[23]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[23]__gold_cover (\__po_data_mem_write_data[23]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[23]__gate_cover (\__po_data_mem_write_data[23]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.23 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][23] ,
  input  [  0:0] \__pi_regfile.register[10][23] ,
  input  [  0:0] \__pi_regfile.register[11][23] ,
  input  [  0:0] \__pi_regfile.register[12][23] ,
  input  [  0:0] \__pi_regfile.register[13][23] ,
  input  [  0:0] \__pi_regfile.register[14][23] ,
  input  [  0:0] \__pi_regfile.register[15][23] ,
  input  [  0:0] \__pi_regfile.register[16][23] ,
  input  [  0:0] \__pi_regfile.register[17][23] ,
  input  [  0:0] \__pi_regfile.register[18][23] ,
  input  [  0:0] \__pi_regfile.register[19][23] ,
  input  [  0:0] \__pi_regfile.register[1][23] ,
  input  [  0:0] \__pi_regfile.register[20][23] ,
  input  [  0:0] \__pi_regfile.register[21][23] ,
  input  [  0:0] \__pi_regfile.register[22][23] ,
  input  [  0:0] \__pi_regfile.register[23][23] ,
  input  [  0:0] \__pi_regfile.register[24][23] ,
  input  [  0:0] \__pi_regfile.register[25][23] ,
  input  [  0:0] \__pi_regfile.register[26][23] ,
  input  [  0:0] \__pi_regfile.register[27][23] ,
  input  [  0:0] \__pi_regfile.register[28][23] ,
  input  [  0:0] \__pi_regfile.register[29][23] ,
  input  [  0:0] \__pi_regfile.register[2][23] ,
  input  [  0:0] \__pi_regfile.register[30][23] ,
  input  [  0:0] \__pi_regfile.register[31][23] ,
  input  [  0:0] \__pi_regfile.register[3][23] ,
  input  [  0:0] \__pi_regfile.register[4][23] ,
  input  [  0:0] \__pi_regfile.register[5][23] ,
  input  [  0:0] \__pi_regfile.register[6][23] ,
  input  [  0:0] \__pi_regfile.register[7][23] ,
  input  [  0:0] \__pi_regfile.register[8][23] ,
  input  [  0:0] \__pi_regfile.register[9][23] ,
  output [  0:0] \__po_data_mem_write_data[23]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.23 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][23] ,
  input  [  0:0] \__pi_regfile.register[10][23] ,
  input  [  0:0] \__pi_regfile.register[11][23] ,
  input  [  0:0] \__pi_regfile.register[12][23] ,
  input  [  0:0] \__pi_regfile.register[13][23] ,
  input  [  0:0] \__pi_regfile.register[14][23] ,
  input  [  0:0] \__pi_regfile.register[15][23] ,
  input  [  0:0] \__pi_regfile.register[16][23] ,
  input  [  0:0] \__pi_regfile.register[17][23] ,
  input  [  0:0] \__pi_regfile.register[18][23] ,
  input  [  0:0] \__pi_regfile.register[19][23] ,
  input  [  0:0] \__pi_regfile.register[1][23] ,
  input  [  0:0] \__pi_regfile.register[20][23] ,
  input  [  0:0] \__pi_regfile.register[21][23] ,
  input  [  0:0] \__pi_regfile.register[22][23] ,
  input  [  0:0] \__pi_regfile.register[23][23] ,
  input  [  0:0] \__pi_regfile.register[24][23] ,
  input  [  0:0] \__pi_regfile.register[25][23] ,
  input  [  0:0] \__pi_regfile.register[26][23] ,
  input  [  0:0] \__pi_regfile.register[27][23] ,
  input  [  0:0] \__pi_regfile.register[28][23] ,
  input  [  0:0] \__pi_regfile.register[29][23] ,
  input  [  0:0] \__pi_regfile.register[2][23] ,
  input  [  0:0] \__pi_regfile.register[30][23] ,
  input  [  0:0] \__pi_regfile.register[31][23] ,
  input  [  0:0] \__pi_regfile.register[3][23] ,
  input  [  0:0] \__pi_regfile.register[4][23] ,
  input  [  0:0] \__pi_regfile.register[5][23] ,
  input  [  0:0] \__pi_regfile.register[6][23] ,
  input  [  0:0] \__pi_regfile.register[7][23] ,
  input  [  0:0] \__pi_regfile.register[8][23] ,
  input  [  0:0] \__pi_regfile.register[9][23] ,
  output [  0:0] \__po_data_mem_write_data[23]
);
endmodule
