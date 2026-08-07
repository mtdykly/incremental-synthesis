module miter (
  input  [  0:0] \__pi_clock ,
  input  [  0:0] \__pi_data_mem_address[29] ,
  input  [  0:0] \__pi_data_mem_read_data[29] ,
  input  [  0:0] \__pi_immediate[29] ,
  input  [  0:0] \__pi_inst_rd[0] ,
  input  [  0:0] \__pi_inst_rd[1] ,
  input  [  0:0] \__pi_inst_rd[2] ,
  input  [  0:0] \__pi_inst_rd[3] ,
  input  [  0:0] \__pi_inst_rd[4] ,
  input  [  0:0] \__pi_pc[10] ,
  input  [  0:0] \__pi_pc[11] ,
  input  [  0:0] \__pi_pc[12] ,
  input  [  0:0] \__pi_pc[13] ,
  input  [  0:0] \__pi_pc[14] ,
  input  [  0:0] \__pi_pc[15] ,
  input  [  0:0] \__pi_pc[16] ,
  input  [  0:0] \__pi_pc[17] ,
  input  [  0:0] \__pi_pc[18] ,
  input  [  0:0] \__pi_pc[19] ,
  input  [  0:0] \__pi_pc[20] ,
  input  [  0:0] \__pi_pc[21] ,
  input  [  0:0] \__pi_pc[22] ,
  input  [  0:0] \__pi_pc[23] ,
  input  [  0:0] \__pi_pc[24] ,
  input  [  0:0] \__pi_pc[25] ,
  input  [  0:0] \__pi_pc[26] ,
  input  [  0:0] \__pi_pc[27] ,
  input  [  0:0] \__pi_pc[28] ,
  input  [  0:0] \__pi_pc[29] ,
  input  [  0:0] \__pi_pc[2] ,
  input  [  0:0] \__pi_pc[3] ,
  input  [  0:0] \__pi_pc[4] ,
  input  [  0:0] \__pi_pc[5] ,
  input  [  0:0] \__pi_pc[6] ,
  input  [  0:0] \__pi_pc[7] ,
  input  [  0:0] \__pi_pc[8] ,
  input  [  0:0] \__pi_pc[9] ,
  input  [  0:0] \__pi_reg_writeback_select[0] ,
  input  [  0:0] \__pi_reg_writeback_select[1] ,
  input  [  0:0] \__pi_reg_writeback_select[2] ,
  input  [  0:0] \__pi_regfile_write_enable ,
  input  [  0:0] \__pi_reset ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_regfile.register[28][29]__gold ,
  output [  0:0] \__po_regfile.register[28][29]__gate
);
  \gold.singlecycle_datapath.regfile.register.28.29 gold (
    .\__pi_clock (\__pi_clock ),
    .\__pi_data_mem_address[29] (\__pi_data_mem_address[29] ),
    .\__pi_data_mem_read_data[29] (\__pi_data_mem_read_data[29] ),
    .\__pi_immediate[29] (\__pi_immediate[29] ),
    .\__pi_inst_rd[0] (\__pi_inst_rd[0] ),
    .\__pi_inst_rd[1] (\__pi_inst_rd[1] ),
    .\__pi_inst_rd[2] (\__pi_inst_rd[2] ),
    .\__pi_inst_rd[3] (\__pi_inst_rd[3] ),
    .\__pi_inst_rd[4] (\__pi_inst_rd[4] ),
    .\__pi_pc[10] (\__pi_pc[10] ),
    .\__pi_pc[11] (\__pi_pc[11] ),
    .\__pi_pc[12] (\__pi_pc[12] ),
    .\__pi_pc[13] (\__pi_pc[13] ),
    .\__pi_pc[14] (\__pi_pc[14] ),
    .\__pi_pc[15] (\__pi_pc[15] ),
    .\__pi_pc[16] (\__pi_pc[16] ),
    .\__pi_pc[17] (\__pi_pc[17] ),
    .\__pi_pc[18] (\__pi_pc[18] ),
    .\__pi_pc[19] (\__pi_pc[19] ),
    .\__pi_pc[20] (\__pi_pc[20] ),
    .\__pi_pc[21] (\__pi_pc[21] ),
    .\__pi_pc[22] (\__pi_pc[22] ),
    .\__pi_pc[23] (\__pi_pc[23] ),
    .\__pi_pc[24] (\__pi_pc[24] ),
    .\__pi_pc[25] (\__pi_pc[25] ),
    .\__pi_pc[26] (\__pi_pc[26] ),
    .\__pi_pc[27] (\__pi_pc[27] ),
    .\__pi_pc[28] (\__pi_pc[28] ),
    .\__pi_pc[29] (\__pi_pc[29] ),
    .\__pi_pc[2] (\__pi_pc[2] ),
    .\__pi_pc[3] (\__pi_pc[3] ),
    .\__pi_pc[4] (\__pi_pc[4] ),
    .\__pi_pc[5] (\__pi_pc[5] ),
    .\__pi_pc[6] (\__pi_pc[6] ),
    .\__pi_pc[7] (\__pi_pc[7] ),
    .\__pi_pc[8] (\__pi_pc[8] ),
    .\__pi_pc[9] (\__pi_pc[9] ),
    .\__pi_reg_writeback_select[0] (\__pi_reg_writeback_select[0] ),
    .\__pi_reg_writeback_select[1] (\__pi_reg_writeback_select[1] ),
    .\__pi_reg_writeback_select[2] (\__pi_reg_writeback_select[2] ),
    .\__pi_regfile_write_enable (\__pi_regfile_write_enable ),
    .\__pi_reset (\__pi_reset ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_regfile.register[28][29] (\__po_regfile.register[28][29]__gold )
  );
  \gate.singlecycle_datapath.regfile.register.28.29 gate (
    .\__pi_clock (\__pi_clock ),
    .\__pi_data_mem_address[29] (\__pi_data_mem_address[29] ),
    .\__pi_data_mem_read_data[29] (\__pi_data_mem_read_data[29] ),
    .\__pi_immediate[29] (\__pi_immediate[29] ),
    .\__pi_inst_rd[0] (\__pi_inst_rd[0] ),
    .\__pi_inst_rd[1] (\__pi_inst_rd[1] ),
    .\__pi_inst_rd[2] (\__pi_inst_rd[2] ),
    .\__pi_inst_rd[3] (\__pi_inst_rd[3] ),
    .\__pi_inst_rd[4] (\__pi_inst_rd[4] ),
    .\__pi_pc[10] (\__pi_pc[10] ),
    .\__pi_pc[11] (\__pi_pc[11] ),
    .\__pi_pc[12] (\__pi_pc[12] ),
    .\__pi_pc[13] (\__pi_pc[13] ),
    .\__pi_pc[14] (\__pi_pc[14] ),
    .\__pi_pc[15] (\__pi_pc[15] ),
    .\__pi_pc[16] (\__pi_pc[16] ),
    .\__pi_pc[17] (\__pi_pc[17] ),
    .\__pi_pc[18] (\__pi_pc[18] ),
    .\__pi_pc[19] (\__pi_pc[19] ),
    .\__pi_pc[20] (\__pi_pc[20] ),
    .\__pi_pc[21] (\__pi_pc[21] ),
    .\__pi_pc[22] (\__pi_pc[22] ),
    .\__pi_pc[23] (\__pi_pc[23] ),
    .\__pi_pc[24] (\__pi_pc[24] ),
    .\__pi_pc[25] (\__pi_pc[25] ),
    .\__pi_pc[26] (\__pi_pc[26] ),
    .\__pi_pc[27] (\__pi_pc[27] ),
    .\__pi_pc[28] (\__pi_pc[28] ),
    .\__pi_pc[29] (\__pi_pc[29] ),
    .\__pi_pc[2] (\__pi_pc[2] ),
    .\__pi_pc[3] (\__pi_pc[3] ),
    .\__pi_pc[4] (\__pi_pc[4] ),
    .\__pi_pc[5] (\__pi_pc[5] ),
    .\__pi_pc[6] (\__pi_pc[6] ),
    .\__pi_pc[7] (\__pi_pc[7] ),
    .\__pi_pc[8] (\__pi_pc[8] ),
    .\__pi_pc[9] (\__pi_pc[9] ),
    .\__pi_reg_writeback_select[0] (\__pi_reg_writeback_select[0] ),
    .\__pi_reg_writeback_select[1] (\__pi_reg_writeback_select[1] ),
    .\__pi_reg_writeback_select[2] (\__pi_reg_writeback_select[2] ),
    .\__pi_regfile_write_enable (\__pi_regfile_write_enable ),
    .\__pi_reset (\__pi_reset ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_regfile.register[28][29] (\__po_regfile.register[28][29]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_clock__assume (\__pi_clock );
  miter_def_prop #(1, "assume") \__pi_data_mem_address[29]__assume (\__pi_data_mem_address[29] );
  miter_def_prop #(1, "assume") \__pi_data_mem_read_data[29]__assume (\__pi_data_mem_read_data[29] );
  miter_def_prop #(1, "assume") \__pi_immediate[29]__assume (\__pi_immediate[29] );
  miter_def_prop #(1, "assume") \__pi_inst_rd[0]__assume (\__pi_inst_rd[0] );
  miter_def_prop #(1, "assume") \__pi_inst_rd[1]__assume (\__pi_inst_rd[1] );
  miter_def_prop #(1, "assume") \__pi_inst_rd[2]__assume (\__pi_inst_rd[2] );
  miter_def_prop #(1, "assume") \__pi_inst_rd[3]__assume (\__pi_inst_rd[3] );
  miter_def_prop #(1, "assume") \__pi_inst_rd[4]__assume (\__pi_inst_rd[4] );
  miter_def_prop #(1, "assume") \__pi_pc[10]__assume (\__pi_pc[10] );
  miter_def_prop #(1, "assume") \__pi_pc[11]__assume (\__pi_pc[11] );
  miter_def_prop #(1, "assume") \__pi_pc[12]__assume (\__pi_pc[12] );
  miter_def_prop #(1, "assume") \__pi_pc[13]__assume (\__pi_pc[13] );
  miter_def_prop #(1, "assume") \__pi_pc[14]__assume (\__pi_pc[14] );
  miter_def_prop #(1, "assume") \__pi_pc[15]__assume (\__pi_pc[15] );
  miter_def_prop #(1, "assume") \__pi_pc[16]__assume (\__pi_pc[16] );
  miter_def_prop #(1, "assume") \__pi_pc[17]__assume (\__pi_pc[17] );
  miter_def_prop #(1, "assume") \__pi_pc[18]__assume (\__pi_pc[18] );
  miter_def_prop #(1, "assume") \__pi_pc[19]__assume (\__pi_pc[19] );
  miter_def_prop #(1, "assume") \__pi_pc[20]__assume (\__pi_pc[20] );
  miter_def_prop #(1, "assume") \__pi_pc[21]__assume (\__pi_pc[21] );
  miter_def_prop #(1, "assume") \__pi_pc[22]__assume (\__pi_pc[22] );
  miter_def_prop #(1, "assume") \__pi_pc[23]__assume (\__pi_pc[23] );
  miter_def_prop #(1, "assume") \__pi_pc[24]__assume (\__pi_pc[24] );
  miter_def_prop #(1, "assume") \__pi_pc[25]__assume (\__pi_pc[25] );
  miter_def_prop #(1, "assume") \__pi_pc[26]__assume (\__pi_pc[26] );
  miter_def_prop #(1, "assume") \__pi_pc[27]__assume (\__pi_pc[27] );
  miter_def_prop #(1, "assume") \__pi_pc[28]__assume (\__pi_pc[28] );
  miter_def_prop #(1, "assume") \__pi_pc[29]__assume (\__pi_pc[29] );
  miter_def_prop #(1, "assume") \__pi_pc[2]__assume (\__pi_pc[2] );
  miter_def_prop #(1, "assume") \__pi_pc[3]__assume (\__pi_pc[3] );
  miter_def_prop #(1, "assume") \__pi_pc[4]__assume (\__pi_pc[4] );
  miter_def_prop #(1, "assume") \__pi_pc[5]__assume (\__pi_pc[5] );
  miter_def_prop #(1, "assume") \__pi_pc[6]__assume (\__pi_pc[6] );
  miter_def_prop #(1, "assume") \__pi_pc[7]__assume (\__pi_pc[7] );
  miter_def_prop #(1, "assume") \__pi_pc[8]__assume (\__pi_pc[8] );
  miter_def_prop #(1, "assume") \__pi_pc[9]__assume (\__pi_pc[9] );
  miter_def_prop #(1, "assume") \__pi_reg_writeback_select[0]__assume (\__pi_reg_writeback_select[0] );
  miter_def_prop #(1, "assume") \__pi_reg_writeback_select[1]__assume (\__pi_reg_writeback_select[1] );
  miter_def_prop #(1, "assume") \__pi_reg_writeback_select[2]__assume (\__pi_reg_writeback_select[2] );
  miter_def_prop #(1, "assume") \__pi_regfile_write_enable__assume (\__pi_regfile_write_enable );
  miter_def_prop #(1, "assume") \__pi_reset__assume (\__pi_reset );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_regfile.register[28][29]__assert (\__po_regfile.register[28][29]__gold , \__po_regfile.register[28][29]__gate );
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
  miter_def_prop #(1, "cover") \__po_regfile.register[28][29]__gold_cover (\__po_regfile.register[28][29]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_regfile.register[28][29]__gate_cover (\__po_regfile.register[28][29]__gate );
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
module \gold.singlecycle_datapath.regfile.register.28.29 (
  input  [  0:0] \__pi_clock ,
  input  [  0:0] \__pi_data_mem_address[29] ,
  input  [  0:0] \__pi_data_mem_read_data[29] ,
  input  [  0:0] \__pi_immediate[29] ,
  input  [  0:0] \__pi_inst_rd[0] ,
  input  [  0:0] \__pi_inst_rd[1] ,
  input  [  0:0] \__pi_inst_rd[2] ,
  input  [  0:0] \__pi_inst_rd[3] ,
  input  [  0:0] \__pi_inst_rd[4] ,
  input  [  0:0] \__pi_pc[10] ,
  input  [  0:0] \__pi_pc[11] ,
  input  [  0:0] \__pi_pc[12] ,
  input  [  0:0] \__pi_pc[13] ,
  input  [  0:0] \__pi_pc[14] ,
  input  [  0:0] \__pi_pc[15] ,
  input  [  0:0] \__pi_pc[16] ,
  input  [  0:0] \__pi_pc[17] ,
  input  [  0:0] \__pi_pc[18] ,
  input  [  0:0] \__pi_pc[19] ,
  input  [  0:0] \__pi_pc[20] ,
  input  [  0:0] \__pi_pc[21] ,
  input  [  0:0] \__pi_pc[22] ,
  input  [  0:0] \__pi_pc[23] ,
  input  [  0:0] \__pi_pc[24] ,
  input  [  0:0] \__pi_pc[25] ,
  input  [  0:0] \__pi_pc[26] ,
  input  [  0:0] \__pi_pc[27] ,
  input  [  0:0] \__pi_pc[28] ,
  input  [  0:0] \__pi_pc[29] ,
  input  [  0:0] \__pi_pc[2] ,
  input  [  0:0] \__pi_pc[3] ,
  input  [  0:0] \__pi_pc[4] ,
  input  [  0:0] \__pi_pc[5] ,
  input  [  0:0] \__pi_pc[6] ,
  input  [  0:0] \__pi_pc[7] ,
  input  [  0:0] \__pi_pc[8] ,
  input  [  0:0] \__pi_pc[9] ,
  input  [  0:0] \__pi_reg_writeback_select[0] ,
  input  [  0:0] \__pi_reg_writeback_select[1] ,
  input  [  0:0] \__pi_reg_writeback_select[2] ,
  input  [  0:0] \__pi_regfile_write_enable ,
  input  [  0:0] \__pi_reset ,
  output [  0:0] \__po_regfile.register[28][29]
);
endmodule
module \gate.singlecycle_datapath.regfile.register.28.29 (
  input  [  0:0] \__pi_clock ,
  input  [  0:0] \__pi_data_mem_address[29] ,
  input  [  0:0] \__pi_data_mem_read_data[29] ,
  input  [  0:0] \__pi_immediate[29] ,
  input  [  0:0] \__pi_inst_rd[0] ,
  input  [  0:0] \__pi_inst_rd[1] ,
  input  [  0:0] \__pi_inst_rd[2] ,
  input  [  0:0] \__pi_inst_rd[3] ,
  input  [  0:0] \__pi_inst_rd[4] ,
  input  [  0:0] \__pi_pc[10] ,
  input  [  0:0] \__pi_pc[11] ,
  input  [  0:0] \__pi_pc[12] ,
  input  [  0:0] \__pi_pc[13] ,
  input  [  0:0] \__pi_pc[14] ,
  input  [  0:0] \__pi_pc[15] ,
  input  [  0:0] \__pi_pc[16] ,
  input  [  0:0] \__pi_pc[17] ,
  input  [  0:0] \__pi_pc[18] ,
  input  [  0:0] \__pi_pc[19] ,
  input  [  0:0] \__pi_pc[20] ,
  input  [  0:0] \__pi_pc[21] ,
  input  [  0:0] \__pi_pc[22] ,
  input  [  0:0] \__pi_pc[23] ,
  input  [  0:0] \__pi_pc[24] ,
  input  [  0:0] \__pi_pc[25] ,
  input  [  0:0] \__pi_pc[26] ,
  input  [  0:0] \__pi_pc[27] ,
  input  [  0:0] \__pi_pc[28] ,
  input  [  0:0] \__pi_pc[29] ,
  input  [  0:0] \__pi_pc[2] ,
  input  [  0:0] \__pi_pc[3] ,
  input  [  0:0] \__pi_pc[4] ,
  input  [  0:0] \__pi_pc[5] ,
  input  [  0:0] \__pi_pc[6] ,
  input  [  0:0] \__pi_pc[7] ,
  input  [  0:0] \__pi_pc[8] ,
  input  [  0:0] \__pi_pc[9] ,
  input  [  0:0] \__pi_reg_writeback_select[0] ,
  input  [  0:0] \__pi_reg_writeback_select[1] ,
  input  [  0:0] \__pi_reg_writeback_select[2] ,
  input  [  0:0] \__pi_regfile_write_enable ,
  input  [  0:0] \__pi_reset ,
  output [  0:0] \__po_regfile.register[28][29]
);
endmodule
