module miter (
  input  [  0:0] \__pi_clock ,
  input  [  0:0] \__pi_mux_next_pc_select.multiplexer.out[17] ,
  input  [  0:0] \__pi_pc_write_enable ,
  input  [  0:0] \__pi_reset ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_pc[17]__gold ,
  output [  0:0] \__po_pc[17]__gate
);
  \gold.singlecycle_datapath.pc.17 gold (
    .\__pi_clock (\__pi_clock ),
    .\__pi_mux_next_pc_select.multiplexer.out[17] (\__pi_mux_next_pc_select.multiplexer.out[17] ),
    .\__pi_pc_write_enable (\__pi_pc_write_enable ),
    .\__pi_reset (\__pi_reset ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_pc[17] (\__po_pc[17]__gold )
  );
  \gate.singlecycle_datapath.pc.17 gate (
    .\__pi_clock (\__pi_clock ),
    .\__pi_mux_next_pc_select.multiplexer.out[17] (\__pi_mux_next_pc_select.multiplexer.out[17] ),
    .\__pi_pc_write_enable (\__pi_pc_write_enable ),
    .\__pi_reset (\__pi_reset ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_pc[17] (\__po_pc[17]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_clock__assume (\__pi_clock );
  miter_def_prop #(1, "assume") \__pi_mux_next_pc_select.multiplexer.out[17]__assume (\__pi_mux_next_pc_select.multiplexer.out[17] );
  miter_def_prop #(1, "assume") \__pi_pc_write_enable__assume (\__pi_pc_write_enable );
  miter_def_prop #(1, "assume") \__pi_reset__assume (\__pi_reset );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_pc[17]__assert (\__po_pc[17]__gold , \__po_pc[17]__gate );
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
  miter_def_prop #(1, "cover") \__po_pc[17]__gold_cover (\__po_pc[17]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_pc[17]__gate_cover (\__po_pc[17]__gate );
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
module \gold.singlecycle_datapath.pc.17 (
  input  [  0:0] \__pi_clock ,
  input  [  0:0] \__pi_mux_next_pc_select.multiplexer.out[17] ,
  input  [  0:0] \__pi_pc_write_enable ,
  input  [  0:0] \__pi_reset ,
  output [  0:0] \__po_pc[17]
);
endmodule
module \gate.singlecycle_datapath.pc.17 (
  input  [  0:0] \__pi_clock ,
  input  [  0:0] \__pi_mux_next_pc_select.multiplexer.out[17] ,
  input  [  0:0] \__pi_pc_write_enable ,
  input  [  0:0] \__pi_reset ,
  output [  0:0] \__po_pc[17]
);
endmodule
