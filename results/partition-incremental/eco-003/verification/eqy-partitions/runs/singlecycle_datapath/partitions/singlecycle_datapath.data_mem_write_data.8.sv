module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][8] ,
  input  [  0:0] \__pi_regfile.register[10][8] ,
  input  [  0:0] \__pi_regfile.register[11][8] ,
  input  [  0:0] \__pi_regfile.register[12][8] ,
  input  [  0:0] \__pi_regfile.register[13][8] ,
  input  [  0:0] \__pi_regfile.register[14][8] ,
  input  [  0:0] \__pi_regfile.register[15][8] ,
  input  [  0:0] \__pi_regfile.register[16][8] ,
  input  [  0:0] \__pi_regfile.register[17][8] ,
  input  [  0:0] \__pi_regfile.register[18][8] ,
  input  [  0:0] \__pi_regfile.register[19][8] ,
  input  [  0:0] \__pi_regfile.register[1][8] ,
  input  [  0:0] \__pi_regfile.register[20][8] ,
  input  [  0:0] \__pi_regfile.register[21][8] ,
  input  [  0:0] \__pi_regfile.register[22][8] ,
  input  [  0:0] \__pi_regfile.register[23][8] ,
  input  [  0:0] \__pi_regfile.register[24][8] ,
  input  [  0:0] \__pi_regfile.register[25][8] ,
  input  [  0:0] \__pi_regfile.register[26][8] ,
  input  [  0:0] \__pi_regfile.register[27][8] ,
  input  [  0:0] \__pi_regfile.register[28][8] ,
  input  [  0:0] \__pi_regfile.register[29][8] ,
  input  [  0:0] \__pi_regfile.register[2][8] ,
  input  [  0:0] \__pi_regfile.register[30][8] ,
  input  [  0:0] \__pi_regfile.register[31][8] ,
  input  [  0:0] \__pi_regfile.register[3][8] ,
  input  [  0:0] \__pi_regfile.register[4][8] ,
  input  [  0:0] \__pi_regfile.register[5][8] ,
  input  [  0:0] \__pi_regfile.register[6][8] ,
  input  [  0:0] \__pi_regfile.register[7][8] ,
  input  [  0:0] \__pi_regfile.register[8][8] ,
  input  [  0:0] \__pi_regfile.register[9][8] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[8]__gold ,
  output [  0:0] \__po_data_mem_write_data[8]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.8 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][8] (\__pi_regfile.register[0][8] ),
    .\__pi_regfile.register[10][8] (\__pi_regfile.register[10][8] ),
    .\__pi_regfile.register[11][8] (\__pi_regfile.register[11][8] ),
    .\__pi_regfile.register[12][8] (\__pi_regfile.register[12][8] ),
    .\__pi_regfile.register[13][8] (\__pi_regfile.register[13][8] ),
    .\__pi_regfile.register[14][8] (\__pi_regfile.register[14][8] ),
    .\__pi_regfile.register[15][8] (\__pi_regfile.register[15][8] ),
    .\__pi_regfile.register[16][8] (\__pi_regfile.register[16][8] ),
    .\__pi_regfile.register[17][8] (\__pi_regfile.register[17][8] ),
    .\__pi_regfile.register[18][8] (\__pi_regfile.register[18][8] ),
    .\__pi_regfile.register[19][8] (\__pi_regfile.register[19][8] ),
    .\__pi_regfile.register[1][8] (\__pi_regfile.register[1][8] ),
    .\__pi_regfile.register[20][8] (\__pi_regfile.register[20][8] ),
    .\__pi_regfile.register[21][8] (\__pi_regfile.register[21][8] ),
    .\__pi_regfile.register[22][8] (\__pi_regfile.register[22][8] ),
    .\__pi_regfile.register[23][8] (\__pi_regfile.register[23][8] ),
    .\__pi_regfile.register[24][8] (\__pi_regfile.register[24][8] ),
    .\__pi_regfile.register[25][8] (\__pi_regfile.register[25][8] ),
    .\__pi_regfile.register[26][8] (\__pi_regfile.register[26][8] ),
    .\__pi_regfile.register[27][8] (\__pi_regfile.register[27][8] ),
    .\__pi_regfile.register[28][8] (\__pi_regfile.register[28][8] ),
    .\__pi_regfile.register[29][8] (\__pi_regfile.register[29][8] ),
    .\__pi_regfile.register[2][8] (\__pi_regfile.register[2][8] ),
    .\__pi_regfile.register[30][8] (\__pi_regfile.register[30][8] ),
    .\__pi_regfile.register[31][8] (\__pi_regfile.register[31][8] ),
    .\__pi_regfile.register[3][8] (\__pi_regfile.register[3][8] ),
    .\__pi_regfile.register[4][8] (\__pi_regfile.register[4][8] ),
    .\__pi_regfile.register[5][8] (\__pi_regfile.register[5][8] ),
    .\__pi_regfile.register[6][8] (\__pi_regfile.register[6][8] ),
    .\__pi_regfile.register[7][8] (\__pi_regfile.register[7][8] ),
    .\__pi_regfile.register[8][8] (\__pi_regfile.register[8][8] ),
    .\__pi_regfile.register[9][8] (\__pi_regfile.register[9][8] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[8] (\__po_data_mem_write_data[8]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.8 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][8] (\__pi_regfile.register[0][8] ),
    .\__pi_regfile.register[10][8] (\__pi_regfile.register[10][8] ),
    .\__pi_regfile.register[11][8] (\__pi_regfile.register[11][8] ),
    .\__pi_regfile.register[12][8] (\__pi_regfile.register[12][8] ),
    .\__pi_regfile.register[13][8] (\__pi_regfile.register[13][8] ),
    .\__pi_regfile.register[14][8] (\__pi_regfile.register[14][8] ),
    .\__pi_regfile.register[15][8] (\__pi_regfile.register[15][8] ),
    .\__pi_regfile.register[16][8] (\__pi_regfile.register[16][8] ),
    .\__pi_regfile.register[17][8] (\__pi_regfile.register[17][8] ),
    .\__pi_regfile.register[18][8] (\__pi_regfile.register[18][8] ),
    .\__pi_regfile.register[19][8] (\__pi_regfile.register[19][8] ),
    .\__pi_regfile.register[1][8] (\__pi_regfile.register[1][8] ),
    .\__pi_regfile.register[20][8] (\__pi_regfile.register[20][8] ),
    .\__pi_regfile.register[21][8] (\__pi_regfile.register[21][8] ),
    .\__pi_regfile.register[22][8] (\__pi_regfile.register[22][8] ),
    .\__pi_regfile.register[23][8] (\__pi_regfile.register[23][8] ),
    .\__pi_regfile.register[24][8] (\__pi_regfile.register[24][8] ),
    .\__pi_regfile.register[25][8] (\__pi_regfile.register[25][8] ),
    .\__pi_regfile.register[26][8] (\__pi_regfile.register[26][8] ),
    .\__pi_regfile.register[27][8] (\__pi_regfile.register[27][8] ),
    .\__pi_regfile.register[28][8] (\__pi_regfile.register[28][8] ),
    .\__pi_regfile.register[29][8] (\__pi_regfile.register[29][8] ),
    .\__pi_regfile.register[2][8] (\__pi_regfile.register[2][8] ),
    .\__pi_regfile.register[30][8] (\__pi_regfile.register[30][8] ),
    .\__pi_regfile.register[31][8] (\__pi_regfile.register[31][8] ),
    .\__pi_regfile.register[3][8] (\__pi_regfile.register[3][8] ),
    .\__pi_regfile.register[4][8] (\__pi_regfile.register[4][8] ),
    .\__pi_regfile.register[5][8] (\__pi_regfile.register[5][8] ),
    .\__pi_regfile.register[6][8] (\__pi_regfile.register[6][8] ),
    .\__pi_regfile.register[7][8] (\__pi_regfile.register[7][8] ),
    .\__pi_regfile.register[8][8] (\__pi_regfile.register[8][8] ),
    .\__pi_regfile.register[9][8] (\__pi_regfile.register[9][8] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[8] (\__po_data_mem_write_data[8]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][8]__assume (\__pi_regfile.register[0][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][8]__assume (\__pi_regfile.register[10][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][8]__assume (\__pi_regfile.register[11][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][8]__assume (\__pi_regfile.register[12][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][8]__assume (\__pi_regfile.register[13][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][8]__assume (\__pi_regfile.register[14][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][8]__assume (\__pi_regfile.register[15][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][8]__assume (\__pi_regfile.register[16][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][8]__assume (\__pi_regfile.register[17][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][8]__assume (\__pi_regfile.register[18][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][8]__assume (\__pi_regfile.register[19][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][8]__assume (\__pi_regfile.register[1][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][8]__assume (\__pi_regfile.register[20][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][8]__assume (\__pi_regfile.register[21][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][8]__assume (\__pi_regfile.register[22][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][8]__assume (\__pi_regfile.register[23][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][8]__assume (\__pi_regfile.register[24][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][8]__assume (\__pi_regfile.register[25][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][8]__assume (\__pi_regfile.register[26][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][8]__assume (\__pi_regfile.register[27][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][8]__assume (\__pi_regfile.register[28][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][8]__assume (\__pi_regfile.register[29][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][8]__assume (\__pi_regfile.register[2][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][8]__assume (\__pi_regfile.register[30][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][8]__assume (\__pi_regfile.register[31][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][8]__assume (\__pi_regfile.register[3][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][8]__assume (\__pi_regfile.register[4][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][8]__assume (\__pi_regfile.register[5][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][8]__assume (\__pi_regfile.register[6][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][8]__assume (\__pi_regfile.register[7][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][8]__assume (\__pi_regfile.register[8][8] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][8]__assume (\__pi_regfile.register[9][8] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[8]__assert (\__po_data_mem_write_data[8]__gold , \__po_data_mem_write_data[8]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[8]__gold_cover (\__po_data_mem_write_data[8]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[8]__gate_cover (\__po_data_mem_write_data[8]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.8 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][8] ,
  input  [  0:0] \__pi_regfile.register[10][8] ,
  input  [  0:0] \__pi_regfile.register[11][8] ,
  input  [  0:0] \__pi_regfile.register[12][8] ,
  input  [  0:0] \__pi_regfile.register[13][8] ,
  input  [  0:0] \__pi_regfile.register[14][8] ,
  input  [  0:0] \__pi_regfile.register[15][8] ,
  input  [  0:0] \__pi_regfile.register[16][8] ,
  input  [  0:0] \__pi_regfile.register[17][8] ,
  input  [  0:0] \__pi_regfile.register[18][8] ,
  input  [  0:0] \__pi_regfile.register[19][8] ,
  input  [  0:0] \__pi_regfile.register[1][8] ,
  input  [  0:0] \__pi_regfile.register[20][8] ,
  input  [  0:0] \__pi_regfile.register[21][8] ,
  input  [  0:0] \__pi_regfile.register[22][8] ,
  input  [  0:0] \__pi_regfile.register[23][8] ,
  input  [  0:0] \__pi_regfile.register[24][8] ,
  input  [  0:0] \__pi_regfile.register[25][8] ,
  input  [  0:0] \__pi_regfile.register[26][8] ,
  input  [  0:0] \__pi_regfile.register[27][8] ,
  input  [  0:0] \__pi_regfile.register[28][8] ,
  input  [  0:0] \__pi_regfile.register[29][8] ,
  input  [  0:0] \__pi_regfile.register[2][8] ,
  input  [  0:0] \__pi_regfile.register[30][8] ,
  input  [  0:0] \__pi_regfile.register[31][8] ,
  input  [  0:0] \__pi_regfile.register[3][8] ,
  input  [  0:0] \__pi_regfile.register[4][8] ,
  input  [  0:0] \__pi_regfile.register[5][8] ,
  input  [  0:0] \__pi_regfile.register[6][8] ,
  input  [  0:0] \__pi_regfile.register[7][8] ,
  input  [  0:0] \__pi_regfile.register[8][8] ,
  input  [  0:0] \__pi_regfile.register[9][8] ,
  output [  0:0] \__po_data_mem_write_data[8]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.8 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][8] ,
  input  [  0:0] \__pi_regfile.register[10][8] ,
  input  [  0:0] \__pi_regfile.register[11][8] ,
  input  [  0:0] \__pi_regfile.register[12][8] ,
  input  [  0:0] \__pi_regfile.register[13][8] ,
  input  [  0:0] \__pi_regfile.register[14][8] ,
  input  [  0:0] \__pi_regfile.register[15][8] ,
  input  [  0:0] \__pi_regfile.register[16][8] ,
  input  [  0:0] \__pi_regfile.register[17][8] ,
  input  [  0:0] \__pi_regfile.register[18][8] ,
  input  [  0:0] \__pi_regfile.register[19][8] ,
  input  [  0:0] \__pi_regfile.register[1][8] ,
  input  [  0:0] \__pi_regfile.register[20][8] ,
  input  [  0:0] \__pi_regfile.register[21][8] ,
  input  [  0:0] \__pi_regfile.register[22][8] ,
  input  [  0:0] \__pi_regfile.register[23][8] ,
  input  [  0:0] \__pi_regfile.register[24][8] ,
  input  [  0:0] \__pi_regfile.register[25][8] ,
  input  [  0:0] \__pi_regfile.register[26][8] ,
  input  [  0:0] \__pi_regfile.register[27][8] ,
  input  [  0:0] \__pi_regfile.register[28][8] ,
  input  [  0:0] \__pi_regfile.register[29][8] ,
  input  [  0:0] \__pi_regfile.register[2][8] ,
  input  [  0:0] \__pi_regfile.register[30][8] ,
  input  [  0:0] \__pi_regfile.register[31][8] ,
  input  [  0:0] \__pi_regfile.register[3][8] ,
  input  [  0:0] \__pi_regfile.register[4][8] ,
  input  [  0:0] \__pi_regfile.register[5][8] ,
  input  [  0:0] \__pi_regfile.register[6][8] ,
  input  [  0:0] \__pi_regfile.register[7][8] ,
  input  [  0:0] \__pi_regfile.register[8][8] ,
  input  [  0:0] \__pi_regfile.register[9][8] ,
  output [  0:0] \__po_data_mem_write_data[8]
);
endmodule
