module miter (
  input  [  0:0] \__pi_bus_address[0] ,
  input  [  0:0] \__pi_bus_address[1] ,
  input  [  0:0] \__pi_write_data[12] ,
  input  [  0:0] \__pi_write_data[4] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_bus_write_data[12]__gold ,
  output [  0:0] \__po_bus_write_data[12]__gate
);
  \gold.data_memory_interface.bus_write_data.12 gold (
    .\__pi_bus_address[0] (\__pi_bus_address[0] ),
    .\__pi_bus_address[1] (\__pi_bus_address[1] ),
    .\__pi_write_data[12] (\__pi_write_data[12] ),
    .\__pi_write_data[4] (\__pi_write_data[4] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_bus_write_data[12] (\__po_bus_write_data[12]__gold )
  );
  \gate.data_memory_interface.bus_write_data.12 gate (
    .\__pi_bus_address[0] (\__pi_bus_address[0] ),
    .\__pi_bus_address[1] (\__pi_bus_address[1] ),
    .\__pi_write_data[12] (\__pi_write_data[12] ),
    .\__pi_write_data[4] (\__pi_write_data[4] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_bus_write_data[12] (\__po_bus_write_data[12]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_bus_address[0]__assume (\__pi_bus_address[0] );
  miter_def_prop #(1, "assume") \__pi_bus_address[1]__assume (\__pi_bus_address[1] );
  miter_def_prop #(1, "assume") \__pi_write_data[12]__assume (\__pi_write_data[12] );
  miter_def_prop #(1, "assume") \__pi_write_data[4]__assume (\__pi_write_data[4] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_bus_write_data[12]__assert (\__po_bus_write_data[12]__gold , \__po_bus_write_data[12]__gate );
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
  miter_def_prop #(1, "cover") \__po_bus_write_data[12]__gold_cover (\__po_bus_write_data[12]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_bus_write_data[12]__gate_cover (\__po_bus_write_data[12]__gate );
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
module \gold.data_memory_interface.bus_write_data.12 (
  input  [  0:0] \__pi_bus_address[0] ,
  input  [  0:0] \__pi_bus_address[1] ,
  input  [  0:0] \__pi_write_data[12] ,
  input  [  0:0] \__pi_write_data[4] ,
  output [  0:0] \__po_bus_write_data[12]
);
endmodule
module \gate.data_memory_interface.bus_write_data.12 (
  input  [  0:0] \__pi_bus_address[0] ,
  input  [  0:0] \__pi_bus_address[1] ,
  input  [  0:0] \__pi_write_data[12] ,
  input  [  0:0] \__pi_write_data[4] ,
  output [  0:0] \__po_bus_write_data[12]
);
endmodule
