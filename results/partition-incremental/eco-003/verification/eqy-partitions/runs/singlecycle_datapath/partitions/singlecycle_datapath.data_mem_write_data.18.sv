module miter (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][18] ,
  input  [  0:0] \__pi_regfile.register[10][18] ,
  input  [  0:0] \__pi_regfile.register[11][18] ,
  input  [  0:0] \__pi_regfile.register[12][18] ,
  input  [  0:0] \__pi_regfile.register[13][18] ,
  input  [  0:0] \__pi_regfile.register[14][18] ,
  input  [  0:0] \__pi_regfile.register[15][18] ,
  input  [  0:0] \__pi_regfile.register[16][18] ,
  input  [  0:0] \__pi_regfile.register[17][18] ,
  input  [  0:0] \__pi_regfile.register[18][18] ,
  input  [  0:0] \__pi_regfile.register[19][18] ,
  input  [  0:0] \__pi_regfile.register[1][18] ,
  input  [  0:0] \__pi_regfile.register[20][18] ,
  input  [  0:0] \__pi_regfile.register[21][18] ,
  input  [  0:0] \__pi_regfile.register[22][18] ,
  input  [  0:0] \__pi_regfile.register[23][18] ,
  input  [  0:0] \__pi_regfile.register[24][18] ,
  input  [  0:0] \__pi_regfile.register[25][18] ,
  input  [  0:0] \__pi_regfile.register[26][18] ,
  input  [  0:0] \__pi_regfile.register[27][18] ,
  input  [  0:0] \__pi_regfile.register[28][18] ,
  input  [  0:0] \__pi_regfile.register[29][18] ,
  input  [  0:0] \__pi_regfile.register[2][18] ,
  input  [  0:0] \__pi_regfile.register[30][18] ,
  input  [  0:0] \__pi_regfile.register[31][18] ,
  input  [  0:0] \__pi_regfile.register[3][18] ,
  input  [  0:0] \__pi_regfile.register[4][18] ,
  input  [  0:0] \__pi_regfile.register[5][18] ,
  input  [  0:0] \__pi_regfile.register[6][18] ,
  input  [  0:0] \__pi_regfile.register[7][18] ,
  input  [  0:0] \__pi_regfile.register[8][18] ,
  input  [  0:0] \__pi_regfile.register[9][18] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_data_mem_write_data[18]__gold ,
  output [  0:0] \__po_data_mem_write_data[18]__gate
);
  \gold.singlecycle_datapath.data_mem_write_data.18 gold (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][18] (\__pi_regfile.register[0][18] ),
    .\__pi_regfile.register[10][18] (\__pi_regfile.register[10][18] ),
    .\__pi_regfile.register[11][18] (\__pi_regfile.register[11][18] ),
    .\__pi_regfile.register[12][18] (\__pi_regfile.register[12][18] ),
    .\__pi_regfile.register[13][18] (\__pi_regfile.register[13][18] ),
    .\__pi_regfile.register[14][18] (\__pi_regfile.register[14][18] ),
    .\__pi_regfile.register[15][18] (\__pi_regfile.register[15][18] ),
    .\__pi_regfile.register[16][18] (\__pi_regfile.register[16][18] ),
    .\__pi_regfile.register[17][18] (\__pi_regfile.register[17][18] ),
    .\__pi_regfile.register[18][18] (\__pi_regfile.register[18][18] ),
    .\__pi_regfile.register[19][18] (\__pi_regfile.register[19][18] ),
    .\__pi_regfile.register[1][18] (\__pi_regfile.register[1][18] ),
    .\__pi_regfile.register[20][18] (\__pi_regfile.register[20][18] ),
    .\__pi_regfile.register[21][18] (\__pi_regfile.register[21][18] ),
    .\__pi_regfile.register[22][18] (\__pi_regfile.register[22][18] ),
    .\__pi_regfile.register[23][18] (\__pi_regfile.register[23][18] ),
    .\__pi_regfile.register[24][18] (\__pi_regfile.register[24][18] ),
    .\__pi_regfile.register[25][18] (\__pi_regfile.register[25][18] ),
    .\__pi_regfile.register[26][18] (\__pi_regfile.register[26][18] ),
    .\__pi_regfile.register[27][18] (\__pi_regfile.register[27][18] ),
    .\__pi_regfile.register[28][18] (\__pi_regfile.register[28][18] ),
    .\__pi_regfile.register[29][18] (\__pi_regfile.register[29][18] ),
    .\__pi_regfile.register[2][18] (\__pi_regfile.register[2][18] ),
    .\__pi_regfile.register[30][18] (\__pi_regfile.register[30][18] ),
    .\__pi_regfile.register[31][18] (\__pi_regfile.register[31][18] ),
    .\__pi_regfile.register[3][18] (\__pi_regfile.register[3][18] ),
    .\__pi_regfile.register[4][18] (\__pi_regfile.register[4][18] ),
    .\__pi_regfile.register[5][18] (\__pi_regfile.register[5][18] ),
    .\__pi_regfile.register[6][18] (\__pi_regfile.register[6][18] ),
    .\__pi_regfile.register[7][18] (\__pi_regfile.register[7][18] ),
    .\__pi_regfile.register[8][18] (\__pi_regfile.register[8][18] ),
    .\__pi_regfile.register[9][18] (\__pi_regfile.register[9][18] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[18] (\__po_data_mem_write_data[18]__gold )
  );
  \gate.singlecycle_datapath.data_mem_write_data.18 gate (
    .\__pi_inst_rs2[0] (\__pi_inst_rs2[0] ),
    .\__pi_inst_rs2[1] (\__pi_inst_rs2[1] ),
    .\__pi_inst_rs2[2] (\__pi_inst_rs2[2] ),
    .\__pi_inst_rs2[3] (\__pi_inst_rs2[3] ),
    .\__pi_inst_rs2[4] (\__pi_inst_rs2[4] ),
    .\__pi_regfile.register[0][18] (\__pi_regfile.register[0][18] ),
    .\__pi_regfile.register[10][18] (\__pi_regfile.register[10][18] ),
    .\__pi_regfile.register[11][18] (\__pi_regfile.register[11][18] ),
    .\__pi_regfile.register[12][18] (\__pi_regfile.register[12][18] ),
    .\__pi_regfile.register[13][18] (\__pi_regfile.register[13][18] ),
    .\__pi_regfile.register[14][18] (\__pi_regfile.register[14][18] ),
    .\__pi_regfile.register[15][18] (\__pi_regfile.register[15][18] ),
    .\__pi_regfile.register[16][18] (\__pi_regfile.register[16][18] ),
    .\__pi_regfile.register[17][18] (\__pi_regfile.register[17][18] ),
    .\__pi_regfile.register[18][18] (\__pi_regfile.register[18][18] ),
    .\__pi_regfile.register[19][18] (\__pi_regfile.register[19][18] ),
    .\__pi_regfile.register[1][18] (\__pi_regfile.register[1][18] ),
    .\__pi_regfile.register[20][18] (\__pi_regfile.register[20][18] ),
    .\__pi_regfile.register[21][18] (\__pi_regfile.register[21][18] ),
    .\__pi_regfile.register[22][18] (\__pi_regfile.register[22][18] ),
    .\__pi_regfile.register[23][18] (\__pi_regfile.register[23][18] ),
    .\__pi_regfile.register[24][18] (\__pi_regfile.register[24][18] ),
    .\__pi_regfile.register[25][18] (\__pi_regfile.register[25][18] ),
    .\__pi_regfile.register[26][18] (\__pi_regfile.register[26][18] ),
    .\__pi_regfile.register[27][18] (\__pi_regfile.register[27][18] ),
    .\__pi_regfile.register[28][18] (\__pi_regfile.register[28][18] ),
    .\__pi_regfile.register[29][18] (\__pi_regfile.register[29][18] ),
    .\__pi_regfile.register[2][18] (\__pi_regfile.register[2][18] ),
    .\__pi_regfile.register[30][18] (\__pi_regfile.register[30][18] ),
    .\__pi_regfile.register[31][18] (\__pi_regfile.register[31][18] ),
    .\__pi_regfile.register[3][18] (\__pi_regfile.register[3][18] ),
    .\__pi_regfile.register[4][18] (\__pi_regfile.register[4][18] ),
    .\__pi_regfile.register[5][18] (\__pi_regfile.register[5][18] ),
    .\__pi_regfile.register[6][18] (\__pi_regfile.register[6][18] ),
    .\__pi_regfile.register[7][18] (\__pi_regfile.register[7][18] ),
    .\__pi_regfile.register[8][18] (\__pi_regfile.register[8][18] ),
    .\__pi_regfile.register[9][18] (\__pi_regfile.register[9][18] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_data_mem_write_data[18] (\__po_data_mem_write_data[18]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst_rs2[0]__assume (\__pi_inst_rs2[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[1]__assume (\__pi_inst_rs2[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[2]__assume (\__pi_inst_rs2[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[3]__assume (\__pi_inst_rs2[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rs2[4]__assume (\__pi_inst_rs2[4] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[0][18]__assume (\__pi_regfile.register[0][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[10][18]__assume (\__pi_regfile.register[10][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[11][18]__assume (\__pi_regfile.register[11][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[12][18]__assume (\__pi_regfile.register[12][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[13][18]__assume (\__pi_regfile.register[13][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[14][18]__assume (\__pi_regfile.register[14][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[15][18]__assume (\__pi_regfile.register[15][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[16][18]__assume (\__pi_regfile.register[16][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[17][18]__assume (\__pi_regfile.register[17][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[18][18]__assume (\__pi_regfile.register[18][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[19][18]__assume (\__pi_regfile.register[19][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[1][18]__assume (\__pi_regfile.register[1][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[20][18]__assume (\__pi_regfile.register[20][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[21][18]__assume (\__pi_regfile.register[21][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[22][18]__assume (\__pi_regfile.register[22][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[23][18]__assume (\__pi_regfile.register[23][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[24][18]__assume (\__pi_regfile.register[24][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[25][18]__assume (\__pi_regfile.register[25][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[26][18]__assume (\__pi_regfile.register[26][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[27][18]__assume (\__pi_regfile.register[27][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[28][18]__assume (\__pi_regfile.register[28][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[29][18]__assume (\__pi_regfile.register[29][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[2][18]__assume (\__pi_regfile.register[2][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[30][18]__assume (\__pi_regfile.register[30][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[31][18]__assume (\__pi_regfile.register[31][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[3][18]__assume (\__pi_regfile.register[3][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[4][18]__assume (\__pi_regfile.register[4][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[5][18]__assume (\__pi_regfile.register[5][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[6][18]__assume (\__pi_regfile.register[6][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[7][18]__assume (\__pi_regfile.register[7][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[8][18]__assume (\__pi_regfile.register[8][18] );
  miter_def_prop #(1, "assume") \__pi_regfile.register[9][18]__assume (\__pi_regfile.register[9][18] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_data_mem_write_data[18]__assert (\__po_data_mem_write_data[18]__gold , \__po_data_mem_write_data[18]__gate );
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
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[18]__gold_cover (\__po_data_mem_write_data[18]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_data_mem_write_data[18]__gate_cover (\__po_data_mem_write_data[18]__gate );
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
module \gold.singlecycle_datapath.data_mem_write_data.18 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][18] ,
  input  [  0:0] \__pi_regfile.register[10][18] ,
  input  [  0:0] \__pi_regfile.register[11][18] ,
  input  [  0:0] \__pi_regfile.register[12][18] ,
  input  [  0:0] \__pi_regfile.register[13][18] ,
  input  [  0:0] \__pi_regfile.register[14][18] ,
  input  [  0:0] \__pi_regfile.register[15][18] ,
  input  [  0:0] \__pi_regfile.register[16][18] ,
  input  [  0:0] \__pi_regfile.register[17][18] ,
  input  [  0:0] \__pi_regfile.register[18][18] ,
  input  [  0:0] \__pi_regfile.register[19][18] ,
  input  [  0:0] \__pi_regfile.register[1][18] ,
  input  [  0:0] \__pi_regfile.register[20][18] ,
  input  [  0:0] \__pi_regfile.register[21][18] ,
  input  [  0:0] \__pi_regfile.register[22][18] ,
  input  [  0:0] \__pi_regfile.register[23][18] ,
  input  [  0:0] \__pi_regfile.register[24][18] ,
  input  [  0:0] \__pi_regfile.register[25][18] ,
  input  [  0:0] \__pi_regfile.register[26][18] ,
  input  [  0:0] \__pi_regfile.register[27][18] ,
  input  [  0:0] \__pi_regfile.register[28][18] ,
  input  [  0:0] \__pi_regfile.register[29][18] ,
  input  [  0:0] \__pi_regfile.register[2][18] ,
  input  [  0:0] \__pi_regfile.register[30][18] ,
  input  [  0:0] \__pi_regfile.register[31][18] ,
  input  [  0:0] \__pi_regfile.register[3][18] ,
  input  [  0:0] \__pi_regfile.register[4][18] ,
  input  [  0:0] \__pi_regfile.register[5][18] ,
  input  [  0:0] \__pi_regfile.register[6][18] ,
  input  [  0:0] \__pi_regfile.register[7][18] ,
  input  [  0:0] \__pi_regfile.register[8][18] ,
  input  [  0:0] \__pi_regfile.register[9][18] ,
  output [  0:0] \__po_data_mem_write_data[18]
);
endmodule
module \gate.singlecycle_datapath.data_mem_write_data.18 (
  input  [  0:0] \__pi_inst_rs2[0] ,
  input  [  0:0] \__pi_inst_rs2[1] ,
  input  [  0:0] \__pi_inst_rs2[2] ,
  input  [  0:0] \__pi_inst_rs2[3] ,
  input  [  0:0] \__pi_inst_rs2[4] ,
  input  [  0:0] \__pi_regfile.register[0][18] ,
  input  [  0:0] \__pi_regfile.register[10][18] ,
  input  [  0:0] \__pi_regfile.register[11][18] ,
  input  [  0:0] \__pi_regfile.register[12][18] ,
  input  [  0:0] \__pi_regfile.register[13][18] ,
  input  [  0:0] \__pi_regfile.register[14][18] ,
  input  [  0:0] \__pi_regfile.register[15][18] ,
  input  [  0:0] \__pi_regfile.register[16][18] ,
  input  [  0:0] \__pi_regfile.register[17][18] ,
  input  [  0:0] \__pi_regfile.register[18][18] ,
  input  [  0:0] \__pi_regfile.register[19][18] ,
  input  [  0:0] \__pi_regfile.register[1][18] ,
  input  [  0:0] \__pi_regfile.register[20][18] ,
  input  [  0:0] \__pi_regfile.register[21][18] ,
  input  [  0:0] \__pi_regfile.register[22][18] ,
  input  [  0:0] \__pi_regfile.register[23][18] ,
  input  [  0:0] \__pi_regfile.register[24][18] ,
  input  [  0:0] \__pi_regfile.register[25][18] ,
  input  [  0:0] \__pi_regfile.register[26][18] ,
  input  [  0:0] \__pi_regfile.register[27][18] ,
  input  [  0:0] \__pi_regfile.register[28][18] ,
  input  [  0:0] \__pi_regfile.register[29][18] ,
  input  [  0:0] \__pi_regfile.register[2][18] ,
  input  [  0:0] \__pi_regfile.register[30][18] ,
  input  [  0:0] \__pi_regfile.register[31][18] ,
  input  [  0:0] \__pi_regfile.register[3][18] ,
  input  [  0:0] \__pi_regfile.register[4][18] ,
  input  [  0:0] \__pi_regfile.register[5][18] ,
  input  [  0:0] \__pi_regfile.register[6][18] ,
  input  [  0:0] \__pi_regfile.register[7][18] ,
  input  [  0:0] \__pi_regfile.register[8][18] ,
  input  [  0:0] \__pi_regfile.register[9][18] ,
  output [  0:0] \__po_data_mem_write_data[18]
);
endmodule
