module miter (
  input  [  0:0] \__pi_data_mem_address[15] ,
  input  [  0:0] \__pi_immediate[0] ,
  input  [  0:0] \__pi_immediate[10] ,
  input  [  0:0] \__pi_immediate[11] ,
  input  [  0:0] \__pi_immediate[12] ,
  input  [  0:0] \__pi_immediate[13] ,
  input  [  0:0] \__pi_immediate[14] ,
  input  [  0:0] \__pi_immediate[15] ,
  input  [  0:0] \__pi_immediate[1] ,
  input  [  0:0] \__pi_immediate[2] ,
  input  [  0:0] \__pi_immediate[3] ,
  input  [  0:0] \__pi_immediate[4] ,
  input  [  0:0] \__pi_immediate[5] ,
  input  [  0:0] \__pi_immediate[6] ,
  input  [  0:0] \__pi_immediate[7] ,
  input  [  0:0] \__pi_immediate[8] ,
  input  [  0:0] \__pi_immediate[9] ,
  input  [  0:0] \__pi_next_pc_select[0] ,
  input  [  0:0] \__pi_next_pc_select[1] ,
  input  [  0:0] \__pi_pc[0] ,
  input  [  0:0] \__pi_pc[10] ,
  input  [  0:0] \__pi_pc[11] ,
  input  [  0:0] \__pi_pc[12] ,
  input  [  0:0] \__pi_pc[13] ,
  input  [  0:0] \__pi_pc[14] ,
  input  [  0:0] \__pi_pc[15] ,
  input  [  0:0] \__pi_pc[1] ,
  input  [  0:0] \__pi_pc[2] ,
  input  [  0:0] \__pi_pc[3] ,
  input  [  0:0] \__pi_pc[4] ,
  input  [  0:0] \__pi_pc[5] ,
  input  [  0:0] \__pi_pc[6] ,
  input  [  0:0] \__pi_pc[7] ,
  input  [  0:0] \__pi_pc[8] ,
  input  [  0:0] \__pi_pc[9] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_mux_next_pc_select.multiplexer.out[15]__gold ,
  output [  0:0] \__po_mux_next_pc_select.multiplexer.out[15]__gate
);
  \gold.singlecycle_datapath.mux_next_pc_select.multiplexer.out.15 gold (
    .\__pi_data_mem_address[15] (\__pi_data_mem_address[15] ),
    .\__pi_immediate[0] (\__pi_immediate[0] ),
    .\__pi_immediate[10] (\__pi_immediate[10] ),
    .\__pi_immediate[11] (\__pi_immediate[11] ),
    .\__pi_immediate[12] (\__pi_immediate[12] ),
    .\__pi_immediate[13] (\__pi_immediate[13] ),
    .\__pi_immediate[14] (\__pi_immediate[14] ),
    .\__pi_immediate[15] (\__pi_immediate[15] ),
    .\__pi_immediate[1] (\__pi_immediate[1] ),
    .\__pi_immediate[2] (\__pi_immediate[2] ),
    .\__pi_immediate[3] (\__pi_immediate[3] ),
    .\__pi_immediate[4] (\__pi_immediate[4] ),
    .\__pi_immediate[5] (\__pi_immediate[5] ),
    .\__pi_immediate[6] (\__pi_immediate[6] ),
    .\__pi_immediate[7] (\__pi_immediate[7] ),
    .\__pi_immediate[8] (\__pi_immediate[8] ),
    .\__pi_immediate[9] (\__pi_immediate[9] ),
    .\__pi_next_pc_select[0] (\__pi_next_pc_select[0] ),
    .\__pi_next_pc_select[1] (\__pi_next_pc_select[1] ),
    .\__pi_pc[0] (\__pi_pc[0] ),
    .\__pi_pc[10] (\__pi_pc[10] ),
    .\__pi_pc[11] (\__pi_pc[11] ),
    .\__pi_pc[12] (\__pi_pc[12] ),
    .\__pi_pc[13] (\__pi_pc[13] ),
    .\__pi_pc[14] (\__pi_pc[14] ),
    .\__pi_pc[15] (\__pi_pc[15] ),
    .\__pi_pc[1] (\__pi_pc[1] ),
    .\__pi_pc[2] (\__pi_pc[2] ),
    .\__pi_pc[3] (\__pi_pc[3] ),
    .\__pi_pc[4] (\__pi_pc[4] ),
    .\__pi_pc[5] (\__pi_pc[5] ),
    .\__pi_pc[6] (\__pi_pc[6] ),
    .\__pi_pc[7] (\__pi_pc[7] ),
    .\__pi_pc[8] (\__pi_pc[8] ),
    .\__pi_pc[9] (\__pi_pc[9] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_mux_next_pc_select.multiplexer.out[15] (\__po_mux_next_pc_select.multiplexer.out[15]__gold )
  );
  \gate.singlecycle_datapath.mux_next_pc_select.multiplexer.out.15 gate (
    .\__pi_data_mem_address[15] (\__pi_data_mem_address[15] ),
    .\__pi_immediate[0] (\__pi_immediate[0] ),
    .\__pi_immediate[10] (\__pi_immediate[10] ),
    .\__pi_immediate[11] (\__pi_immediate[11] ),
    .\__pi_immediate[12] (\__pi_immediate[12] ),
    .\__pi_immediate[13] (\__pi_immediate[13] ),
    .\__pi_immediate[14] (\__pi_immediate[14] ),
    .\__pi_immediate[15] (\__pi_immediate[15] ),
    .\__pi_immediate[1] (\__pi_immediate[1] ),
    .\__pi_immediate[2] (\__pi_immediate[2] ),
    .\__pi_immediate[3] (\__pi_immediate[3] ),
    .\__pi_immediate[4] (\__pi_immediate[4] ),
    .\__pi_immediate[5] (\__pi_immediate[5] ),
    .\__pi_immediate[6] (\__pi_immediate[6] ),
    .\__pi_immediate[7] (\__pi_immediate[7] ),
    .\__pi_immediate[8] (\__pi_immediate[8] ),
    .\__pi_immediate[9] (\__pi_immediate[9] ),
    .\__pi_next_pc_select[0] (\__pi_next_pc_select[0] ),
    .\__pi_next_pc_select[1] (\__pi_next_pc_select[1] ),
    .\__pi_pc[0] (\__pi_pc[0] ),
    .\__pi_pc[10] (\__pi_pc[10] ),
    .\__pi_pc[11] (\__pi_pc[11] ),
    .\__pi_pc[12] (\__pi_pc[12] ),
    .\__pi_pc[13] (\__pi_pc[13] ),
    .\__pi_pc[14] (\__pi_pc[14] ),
    .\__pi_pc[15] (\__pi_pc[15] ),
    .\__pi_pc[1] (\__pi_pc[1] ),
    .\__pi_pc[2] (\__pi_pc[2] ),
    .\__pi_pc[3] (\__pi_pc[3] ),
    .\__pi_pc[4] (\__pi_pc[4] ),
    .\__pi_pc[5] (\__pi_pc[5] ),
    .\__pi_pc[6] (\__pi_pc[6] ),
    .\__pi_pc[7] (\__pi_pc[7] ),
    .\__pi_pc[8] (\__pi_pc[8] ),
    .\__pi_pc[9] (\__pi_pc[9] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_mux_next_pc_select.multiplexer.out[15] (\__po_mux_next_pc_select.multiplexer.out[15]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_data_mem_address[15]__assume (\__pi_data_mem_address[15] );
  miter_def_prop #(1, "assume") \__pi_immediate[0]__assume (\__pi_immediate[0] );
  miter_def_prop #(1, "assume") \__pi_immediate[10]__assume (\__pi_immediate[10] );
  miter_def_prop #(1, "assume") \__pi_immediate[11]__assume (\__pi_immediate[11] );
  miter_def_prop #(1, "assume") \__pi_immediate[12]__assume (\__pi_immediate[12] );
  miter_def_prop #(1, "assume") \__pi_immediate[13]__assume (\__pi_immediate[13] );
  miter_def_prop #(1, "assume") \__pi_immediate[14]__assume (\__pi_immediate[14] );
  miter_def_prop #(1, "assume") \__pi_immediate[15]__assume (\__pi_immediate[15] );
  miter_def_prop #(1, "assume") \__pi_immediate[1]__assume (\__pi_immediate[1] );
  miter_def_prop #(1, "assume") \__pi_immediate[2]__assume (\__pi_immediate[2] );
  miter_def_prop #(1, "assume") \__pi_immediate[3]__assume (\__pi_immediate[3] );
  miter_def_prop #(1, "assume") \__pi_immediate[4]__assume (\__pi_immediate[4] );
  miter_def_prop #(1, "assume") \__pi_immediate[5]__assume (\__pi_immediate[5] );
  miter_def_prop #(1, "assume") \__pi_immediate[6]__assume (\__pi_immediate[6] );
  miter_def_prop #(1, "assume") \__pi_immediate[7]__assume (\__pi_immediate[7] );
  miter_def_prop #(1, "assume") \__pi_immediate[8]__assume (\__pi_immediate[8] );
  miter_def_prop #(1, "assume") \__pi_immediate[9]__assume (\__pi_immediate[9] );
  miter_def_prop #(1, "assume") \__pi_next_pc_select[0]__assume (\__pi_next_pc_select[0] );
  miter_def_prop #(1, "assume") \__pi_next_pc_select[1]__assume (\__pi_next_pc_select[1] );
  miter_def_prop #(1, "assume") \__pi_pc[0]__assume (\__pi_pc[0] );
  miter_def_prop #(1, "assume") \__pi_pc[10]__assume (\__pi_pc[10] );
  miter_def_prop #(1, "assume") \__pi_pc[11]__assume (\__pi_pc[11] );
  miter_def_prop #(1, "assume") \__pi_pc[12]__assume (\__pi_pc[12] );
  miter_def_prop #(1, "assume") \__pi_pc[13]__assume (\__pi_pc[13] );
  miter_def_prop #(1, "assume") \__pi_pc[14]__assume (\__pi_pc[14] );
  miter_def_prop #(1, "assume") \__pi_pc[15]__assume (\__pi_pc[15] );
  miter_def_prop #(1, "assume") \__pi_pc[1]__assume (\__pi_pc[1] );
  miter_def_prop #(1, "assume") \__pi_pc[2]__assume (\__pi_pc[2] );
  miter_def_prop #(1, "assume") \__pi_pc[3]__assume (\__pi_pc[3] );
  miter_def_prop #(1, "assume") \__pi_pc[4]__assume (\__pi_pc[4] );
  miter_def_prop #(1, "assume") \__pi_pc[5]__assume (\__pi_pc[5] );
  miter_def_prop #(1, "assume") \__pi_pc[6]__assume (\__pi_pc[6] );
  miter_def_prop #(1, "assume") \__pi_pc[7]__assume (\__pi_pc[7] );
  miter_def_prop #(1, "assume") \__pi_pc[8]__assume (\__pi_pc[8] );
  miter_def_prop #(1, "assume") \__pi_pc[9]__assume (\__pi_pc[9] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_mux_next_pc_select.multiplexer.out[15]__assert (\__po_mux_next_pc_select.multiplexer.out[15]__gold , \__po_mux_next_pc_select.multiplexer.out[15]__gate );
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
  miter_def_prop #(1, "cover") \__po_mux_next_pc_select.multiplexer.out[15]__gold_cover (\__po_mux_next_pc_select.multiplexer.out[15]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_mux_next_pc_select.multiplexer.out[15]__gate_cover (\__po_mux_next_pc_select.multiplexer.out[15]__gate );
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
module \gold.singlecycle_datapath.mux_next_pc_select.multiplexer.out.15 (
  input  [  0:0] \__pi_data_mem_address[15] ,
  input  [  0:0] \__pi_immediate[0] ,
  input  [  0:0] \__pi_immediate[10] ,
  input  [  0:0] \__pi_immediate[11] ,
  input  [  0:0] \__pi_immediate[12] ,
  input  [  0:0] \__pi_immediate[13] ,
  input  [  0:0] \__pi_immediate[14] ,
  input  [  0:0] \__pi_immediate[15] ,
  input  [  0:0] \__pi_immediate[1] ,
  input  [  0:0] \__pi_immediate[2] ,
  input  [  0:0] \__pi_immediate[3] ,
  input  [  0:0] \__pi_immediate[4] ,
  input  [  0:0] \__pi_immediate[5] ,
  input  [  0:0] \__pi_immediate[6] ,
  input  [  0:0] \__pi_immediate[7] ,
  input  [  0:0] \__pi_immediate[8] ,
  input  [  0:0] \__pi_immediate[9] ,
  input  [  0:0] \__pi_next_pc_select[0] ,
  input  [  0:0] \__pi_next_pc_select[1] ,
  input  [  0:0] \__pi_pc[0] ,
  input  [  0:0] \__pi_pc[10] ,
  input  [  0:0] \__pi_pc[11] ,
  input  [  0:0] \__pi_pc[12] ,
  input  [  0:0] \__pi_pc[13] ,
  input  [  0:0] \__pi_pc[14] ,
  input  [  0:0] \__pi_pc[15] ,
  input  [  0:0] \__pi_pc[1] ,
  input  [  0:0] \__pi_pc[2] ,
  input  [  0:0] \__pi_pc[3] ,
  input  [  0:0] \__pi_pc[4] ,
  input  [  0:0] \__pi_pc[5] ,
  input  [  0:0] \__pi_pc[6] ,
  input  [  0:0] \__pi_pc[7] ,
  input  [  0:0] \__pi_pc[8] ,
  input  [  0:0] \__pi_pc[9] ,
  output [  0:0] \__po_mux_next_pc_select.multiplexer.out[15]
);
endmodule
module \gate.singlecycle_datapath.mux_next_pc_select.multiplexer.out.15 (
  input  [  0:0] \__pi_data_mem_address[15] ,
  input  [  0:0] \__pi_immediate[0] ,
  input  [  0:0] \__pi_immediate[10] ,
  input  [  0:0] \__pi_immediate[11] ,
  input  [  0:0] \__pi_immediate[12] ,
  input  [  0:0] \__pi_immediate[13] ,
  input  [  0:0] \__pi_immediate[14] ,
  input  [  0:0] \__pi_immediate[15] ,
  input  [  0:0] \__pi_immediate[1] ,
  input  [  0:0] \__pi_immediate[2] ,
  input  [  0:0] \__pi_immediate[3] ,
  input  [  0:0] \__pi_immediate[4] ,
  input  [  0:0] \__pi_immediate[5] ,
  input  [  0:0] \__pi_immediate[6] ,
  input  [  0:0] \__pi_immediate[7] ,
  input  [  0:0] \__pi_immediate[8] ,
  input  [  0:0] \__pi_immediate[9] ,
  input  [  0:0] \__pi_next_pc_select[0] ,
  input  [  0:0] \__pi_next_pc_select[1] ,
  input  [  0:0] \__pi_pc[0] ,
  input  [  0:0] \__pi_pc[10] ,
  input  [  0:0] \__pi_pc[11] ,
  input  [  0:0] \__pi_pc[12] ,
  input  [  0:0] \__pi_pc[13] ,
  input  [  0:0] \__pi_pc[14] ,
  input  [  0:0] \__pi_pc[15] ,
  input  [  0:0] \__pi_pc[1] ,
  input  [  0:0] \__pi_pc[2] ,
  input  [  0:0] \__pi_pc[3] ,
  input  [  0:0] \__pi_pc[4] ,
  input  [  0:0] \__pi_pc[5] ,
  input  [  0:0] \__pi_pc[6] ,
  input  [  0:0] \__pi_pc[7] ,
  input  [  0:0] \__pi_pc[8] ,
  input  [  0:0] \__pi_pc[9] ,
  output [  0:0] \__po_mux_next_pc_select.multiplexer.out[15]
);
endmodule
