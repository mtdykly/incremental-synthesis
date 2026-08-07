module miter (
  input  [  0:0] \__pi_write_enable ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_bus_write_enable__gold ,
  output [  0:0] \__po_bus_write_enable__gate
);
  \gold.data_memory_interface.bus_write_enable gold (
    .\__pi_write_enable (\__pi_write_enable ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_bus_write_enable (\__po_bus_write_enable__gold )
  );
  \gate.data_memory_interface.bus_write_enable gate (
    .\__pi_write_enable (\__pi_write_enable ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_bus_write_enable (\__po_bus_write_enable__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_write_enable__assume (\__pi_write_enable );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_bus_write_enable__assert (\__po_bus_write_enable__gold , \__po_bus_write_enable__gate );
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
  miter_def_prop #(1, "cover") \__po_bus_write_enable__gold_cover (\__po_bus_write_enable__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_bus_write_enable__gate_cover (\__po_bus_write_enable__gate );
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
module \gold.data_memory_interface.bus_write_enable (
  input  [  0:0] \__pi_write_enable ,
  output [  0:0] \__po_bus_write_enable
);
endmodule
module \gate.data_memory_interface.bus_write_enable (
  input  [  0:0] \__pi_write_enable ,
  output [  0:0] \__po_bus_write_enable
);
endmodule
