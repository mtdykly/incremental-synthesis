module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][12] ,
  input  [  0:0] \__pi_regfile.register[10][12] ,
  input  [  0:0] \__pi_regfile.register[11][12] ,
  input  [  0:0] \__pi_regfile.register[12][12] ,
  input  [  0:0] \__pi_regfile.register[13][12] ,
  input  [  0:0] \__pi_regfile.register[14][12] ,
  input  [  0:0] \__pi_regfile.register[15][12] ,
  input  [  0:0] \__pi_regfile.register[16][12] ,
  input  [  0:0] \__pi_regfile.register[17][12] ,
  input  [  0:0] \__pi_regfile.register[18][12] ,
  input  [  0:0] \__pi_regfile.register[19][12] ,
  input  [  0:0] \__pi_regfile.register[1][12] ,
  input  [  0:0] \__pi_regfile.register[20][12] ,
  input  [  0:0] \__pi_regfile.register[21][12] ,
  input  [  0:0] \__pi_regfile.register[22][12] ,
  input  [  0:0] \__pi_regfile.register[23][12] ,
  input  [  0:0] \__pi_regfile.register[24][12] ,
  input  [  0:0] \__pi_regfile.register[25][12] ,
  input  [  0:0] \__pi_regfile.register[26][12] ,
  input  [  0:0] \__pi_regfile.register[27][12] ,
  input  [  0:0] \__pi_regfile.register[28][12] ,
  input  [  0:0] \__pi_regfile.register[29][12] ,
  input  [  0:0] \__pi_regfile.register[2][12] ,
  input  [  0:0] \__pi_regfile.register[30][12] ,
  input  [  0:0] \__pi_regfile.register[31][12] ,
  input  [  0:0] \__pi_regfile.register[3][12] ,
  input  [  0:0] \__pi_regfile.register[4][12] ,
  input  [  0:0] \__pi_regfile.register[5][12] ,
  input  [  0:0] \__pi_regfile.register[6][12] ,
  input  [  0:0] \__pi_regfile.register[7][12] ,
  input  [  0:0] \__pi_regfile.register[8][12] ,
  input  [  0:0] \__pi_regfile.register[9][12] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[12]__gold ,
  output [  0:0] \__po_data_mem_write_data[12]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.12 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][12] (\__pi_regfile.register[0][12] ),
    .\__pi_regfile.register[10][12] (\__pi_regfile.register[10][12] ),
    .\__pi_regfile.register[11][12] (\__pi_regfile.register[11][12] ),
    .\__pi_regfile.register[12][12] (\__pi_regfile.register[12][12] ),
    .\__pi_regfile.register[13][12] (\__pi_regfile.register[13][12] ),
    .\__pi_regfile.register[14][12] (\__pi_regfile.register[14][12] ),
    .\__pi_regfile.register[15][12] (\__pi_regfile.register[15][12] ),
    .\__pi_regfile.register[16][12] (\__pi_regfile.register[16][12] ),
    .\__pi_regfile.register[17][12] (\__pi_regfile.register[17][12] ),
    .\__pi_regfile.register[18][12] (\__pi_regfile.register[18][12] ),
    .\__pi_regfile.register[19][12] (\__pi_regfile.register[19][12] ),
    .\__pi_regfile.register[1][12] (\__pi_regfile.register[1][12] ),
    .\__pi_regfile.register[20][12] (\__pi_regfile.register[20][12] ),
    .\__pi_regfile.register[21][12] (\__pi_regfile.register[21][12] ),
    .\__pi_regfile.register[22][12] (\__pi_regfile.register[22][12] ),
    .\__pi_regfile.register[23][12] (\__pi_regfile.register[23][12] ),
    .\__pi_regfile.register[24][12] (\__pi_regfile.register[24][12] ),
    .\__pi_regfile.register[25][12] (\__pi_regfile.register[25][12] ),
    .\__pi_regfile.register[26][12] (\__pi_regfile.register[26][12] ),
    .\__pi_regfile.register[27][12] (\__pi_regfile.register[27][12] ),
    .\__pi_regfile.register[28][12] (\__pi_regfile.register[28][12] ),
    .\__pi_regfile.register[29][12] (\__pi_regfile.register[29][12] ),
    .\__pi_regfile.register[2][12] (\__pi_regfile.register[2][12] ),
    .\__pi_regfile.register[30][12] (\__pi_regfile.register[30][12] ),
    .\__pi_regfile.register[31][12] (\__pi_regfile.register[31][12] ),
    .\__pi_regfile.register[3][12] (\__pi_regfile.register[3][12] ),
    .\__pi_regfile.register[4][12] (\__pi_regfile.register[4][12] ),
    .\__pi_regfile.register[5][12] (\__pi_regfile.register[5][12] ),
    .\__pi_regfile.register[6][12] (\__pi_regfile.register[6][12] ),
    .\__pi_regfile.register[7][12] (\__pi_regfile.register[7][12] ),
    .\__pi_regfile.register[8][12] (\__pi_regfile.register[8][12] ),
    .\__pi_regfile.register[9][12] (\__pi_regfile.register[9][12] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[12] (\__po_data_mem_write_data[12]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.12 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][12] (\__pi_regfile.register[0][12] ),
    .\__pi_regfile.register[10][12] (\__pi_regfile.register[10][12] ),
    .\__pi_regfile.register[11][12] (\__pi_regfile.register[11][12] ),
    .\__pi_regfile.register[12][12] (\__pi_regfile.register[12][12] ),
    .\__pi_regfile.register[13][12] (\__pi_regfile.register[13][12] ),
    .\__pi_regfile.register[14][12] (\__pi_regfile.register[14][12] ),
    .\__pi_regfile.register[15][12] (\__pi_regfile.register[15][12] ),
    .\__pi_regfile.register[16][12] (\__pi_regfile.register[16][12] ),
    .\__pi_regfile.register[17][12] (\__pi_regfile.register[17][12] ),
    .\__pi_regfile.register[18][12] (\__pi_regfile.register[18][12] ),
    .\__pi_regfile.register[19][12] (\__pi_regfile.register[19][12] ),
    .\__pi_regfile.register[1][12] (\__pi_regfile.register[1][12] ),
    .\__pi_regfile.register[20][12] (\__pi_regfile.register[20][12] ),
    .\__pi_regfile.register[21][12] (\__pi_regfile.register[21][12] ),
    .\__pi_regfile.register[22][12] (\__pi_regfile.register[22][12] ),
    .\__pi_regfile.register[23][12] (\__pi_regfile.register[23][12] ),
    .\__pi_regfile.register[24][12] (\__pi_regfile.register[24][12] ),
    .\__pi_regfile.register[25][12] (\__pi_regfile.register[25][12] ),
    .\__pi_regfile.register[26][12] (\__pi_regfile.register[26][12] ),
    .\__pi_regfile.register[27][12] (\__pi_regfile.register[27][12] ),
    .\__pi_regfile.register[28][12] (\__pi_regfile.register[28][12] ),
    .\__pi_regfile.register[29][12] (\__pi_regfile.register[29][12] ),
    .\__pi_regfile.register[2][12] (\__pi_regfile.register[2][12] ),
    .\__pi_regfile.register[30][12] (\__pi_regfile.register[30][12] ),
    .\__pi_regfile.register[31][12] (\__pi_regfile.register[31][12] ),
    .\__pi_regfile.register[3][12] (\__pi_regfile.register[3][12] ),
    .\__pi_regfile.register[4][12] (\__pi_regfile.register[4][12] ),
    .\__pi_regfile.register[5][12] (\__pi_regfile.register[5][12] ),
    .\__pi_regfile.register[6][12] (\__pi_regfile.register[6][12] ),
    .\__pi_regfile.register[7][12] (\__pi_regfile.register[7][12] ),
    .\__pi_regfile.register[8][12] (\__pi_regfile.register[8][12] ),
    .\__pi_regfile.register[9][12] (\__pi_regfile.register[9][12] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[12] (\__po_data_mem_write_data[12]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][12]__assume (\__pi_regfile.register[0][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][12]__assume (\__pi_regfile.register[10][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][12]__assume (\__pi_regfile.register[11][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][12]__assume (\__pi_regfile.register[12][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][12]__assume (\__pi_regfile.register[13][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][12]__assume (\__pi_regfile.register[14][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][12]__assume (\__pi_regfile.register[15][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][12]__assume (\__pi_regfile.register[16][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][12]__assume (\__pi_regfile.register[17][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][12]__assume (\__pi_regfile.register[18][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][12]__assume (\__pi_regfile.register[19][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][12]__assume (\__pi_regfile.register[1][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][12]__assume (\__pi_regfile.register[20][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][12]__assume (\__pi_regfile.register[21][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][12]__assume (\__pi_regfile.register[22][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][12]__assume (\__pi_regfile.register[23][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][12]__assume (\__pi_regfile.register[24][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][12]__assume (\__pi_regfile.register[25][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][12]__assume (\__pi_regfile.register[26][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][12]__assume (\__pi_regfile.register[27][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][12]__assume (\__pi_regfile.register[28][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][12]__assume (\__pi_regfile.register[29][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][12]__assume (\__pi_regfile.register[2][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][12]__assume (\__pi_regfile.register[30][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][12]__assume (\__pi_regfile.register[31][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][12]__assume (\__pi_regfile.register[3][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][12]__assume (\__pi_regfile.register[4][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][12]__assume (\__pi_regfile.register[5][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][12]__assume (\__pi_regfile.register[6][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][12]__assume (\__pi_regfile.register[7][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][12]__assume (\__pi_regfile.register[8][12] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][12]__assume (\__pi_regfile.register[9][12] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[12]__assert (\__po_data_mem_write_data[12]__gold , \__po_data_mem_write_data[12]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[12]__gold_cover (\__po_data_mem_write_data[12]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[12]__gate_cover (\__po_data_mem_write_data[12]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.12 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][12] ,
  input  [  0:0] \__pi_regfile.register[10][12] ,
  input  [  0:0] \__pi_regfile.register[11][12] ,
  input  [  0:0] \__pi_regfile.register[12][12] ,
  input  [  0:0] \__pi_regfile.register[13][12] ,
  input  [  0:0] \__pi_regfile.register[14][12] ,
  input  [  0:0] \__pi_regfile.register[15][12] ,
  input  [  0:0] \__pi_regfile.register[16][12] ,
  input  [  0:0] \__pi_regfile.register[17][12] ,
  input  [  0:0] \__pi_regfile.register[18][12] ,
  input  [  0:0] \__pi_regfile.register[19][12] ,
  input  [  0:0] \__pi_regfile.register[1][12] ,
  input  [  0:0] \__pi_regfile.register[20][12] ,
  input  [  0:0] \__pi_regfile.register[21][12] ,
  input  [  0:0] \__pi_regfile.register[22][12] ,
  input  [  0:0] \__pi_regfile.register[23][12] ,
  input  [  0:0] \__pi_regfile.register[24][12] ,
  input  [  0:0] \__pi_regfile.register[25][12] ,
  input  [  0:0] \__pi_regfile.register[26][12] ,
  input  [  0:0] \__pi_regfile.register[27][12] ,
  input  [  0:0] \__pi_regfile.register[28][12] ,
  input  [  0:0] \__pi_regfile.register[29][12] ,
  input  [  0:0] \__pi_regfile.register[2][12] ,
  input  [  0:0] \__pi_regfile.register[30][12] ,
  input  [  0:0] \__pi_regfile.register[31][12] ,
  input  [  0:0] \__pi_regfile.register[3][12] ,
  input  [  0:0] \__pi_regfile.register[4][12] ,
  input  [  0:0] \__pi_regfile.register[5][12] ,
  input  [  0:0] \__pi_regfile.register[6][12] ,
  input  [  0:0] \__pi_regfile.register[7][12] ,
  input  [  0:0] \__pi_regfile.register[8][12] ,
  input  [  0:0] \__pi_regfile.register[9][12] ,
  output [  0:0] \__po_data_mem_write_data[12]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.12 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][12] ,
  input  [  0:0] \__pi_regfile.register[10][12] ,
  input  [  0:0] \__pi_regfile.register[11][12] ,
  input  [  0:0] \__pi_regfile.register[12][12] ,
  input  [  0:0] \__pi_regfile.register[13][12] ,
  input  [  0:0] \__pi_regfile.register[14][12] ,
  input  [  0:0] \__pi_regfile.register[15][12] ,
  input  [  0:0] \__pi_regfile.register[16][12] ,
  input  [  0:0] \__pi_regfile.register[17][12] ,
  input  [  0:0] \__pi_regfile.register[18][12] ,
  input  [  0:0] \__pi_regfile.register[19][12] ,
  input  [  0:0] \__pi_regfile.register[1][12] ,
  input  [  0:0] \__pi_regfile.register[20][12] ,
  input  [  0:0] \__pi_regfile.register[21][12] ,
  input  [  0:0] \__pi_regfile.register[22][12] ,
  input  [  0:0] \__pi_regfile.register[23][12] ,
  input  [  0:0] \__pi_regfile.register[24][12] ,
  input  [  0:0] \__pi_regfile.register[25][12] ,
  input  [  0:0] \__pi_regfile.register[26][12] ,
  input  [  0:0] \__pi_regfile.register[27][12] ,
  input  [  0:0] \__pi_regfile.register[28][12] ,
  input  [  0:0] \__pi_regfile.register[29][12] ,
  input  [  0:0] \__pi_regfile.register[2][12] ,
  input  [  0:0] \__pi_regfile.register[30][12] ,
  input  [  0:0] \__pi_regfile.register[31][12] ,
  input  [  0:0] \__pi_regfile.register[3][12] ,
  input  [  0:0] \__pi_regfile.register[4][12] ,
  input  [  0:0] \__pi_regfile.register[5][12] ,
  input  [  0:0] \__pi_regfile.register[6][12] ,
  input  [  0:0] \__pi_regfile.register[7][12] ,
  input  [  0:0] \__pi_regfile.register[8][12] ,
  input  [  0:0] \__pi_regfile.register[9][12] ,
  output [  0:0] \__po_data_mem_write_data[12]
);
endmodule
