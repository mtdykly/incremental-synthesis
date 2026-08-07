module miter (
  input  [  0:0] \__pi_bus_address[0] ,
  input  [  0:0] \__pi_bus_address[1] ,
  input  [  0:0] \__pi_bus_read_data[17] ,
  input  [  0:0] \__pi_bus_read_data[25] ,
  input  [  0:0] \__pi_bus_read_data[9] ,
  input  [  0:0] \__pi_data_format[0] ,
  input  [  0:0] \__pi_data_format[1] ,
  input  [  0:0] \__pi_data_format[2] ,
  input  [  0:0] \__pi_read_data[7] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_read_data[9]__gold ,
  output [  0:0] \__po_read_data[9]__gate
);
  \gold.data_memory_interface.read_data.9 gold (
    .\__pi_bus_address[0] (\__pi_bus_address[0] ),
    .\__pi_bus_address[1] (\__pi_bus_address[1] ),
    .\__pi_bus_read_data[17] (\__pi_bus_read_data[17] ),
    .\__pi_bus_read_data[25] (\__pi_bus_read_data[25] ),
    .\__pi_bus_read_data[9] (\__pi_bus_read_data[9] ),
    .\__pi_data_format[0] (\__pi_data_format[0] ),
    .\__pi_data_format[1] (\__pi_data_format[1] ),
    .\__pi_data_format[2] (\__pi_data_format[2] ),
    .\__pi_read_data[7] (\__pi_read_data[7] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_read_data[9] (\__po_read_data[9]__gold )
  );
  \gate.data_memory_interface.read_data.9 gate (
    .\__pi_bus_address[0] (\__pi_bus_address[0] ),
    .\__pi_bus_address[1] (\__pi_bus_address[1] ),
    .\__pi_bus_read_data[17] (\__pi_bus_read_data[17] ),
    .\__pi_bus_read_data[25] (\__pi_bus_read_data[25] ),
    .\__pi_bus_read_data[9] (\__pi_bus_read_data[9] ),
    .\__pi_data_format[0] (\__pi_data_format[0] ),
    .\__pi_data_format[1] (\__pi_data_format[1] ),
    .\__pi_data_format[2] (\__pi_data_format[2] ),
    .\__pi_read_data[7] (\__pi_read_data[7] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_read_data[9] (\__po_read_data[9]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_bus_address[0]__assume (\__pi_bus_address[0] );
  miter_def_prop #(1, "assume") \__pi_bus_address[1]__assume (\__pi_bus_address[1] );
  miter_def_prop #(1, "assume") \__pi_bus_read_data[17]__assume (\__pi_bus_read_data[17] );
  miter_def_prop #(1, "assume") \__pi_bus_read_data[25]__assume (\__pi_bus_read_data[25] );
  miter_def_prop #(1, "assume") \__pi_bus_read_data[9]__assume (\__pi_bus_read_data[9] );
  miter_def_prop #(1, "assume") \__pi_data_format[0]__assume (\__pi_data_format[0] );
  miter_def_prop #(1, "assume") \__pi_data_format[1]__assume (\__pi_data_format[1] );
  miter_def_prop #(1, "assume") \__pi_data_format[2]__assume (\__pi_data_format[2] );
  miter_def_prop #(1, "assume") \__pi_read_data[7]__assume (\__pi_read_data[7] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_read_data[9]__assert (\__po_read_data[9]__gold , \__po_read_data[9]__gate );
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
  miter_def_prop #(1, "cover") \__po_read_data[9]__gold_cover (\__po_read_data[9]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_read_data[9]__gate_cover (\__po_read_data[9]__gate );
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
module \gold.data_memory_interface.read_data.9 (
  input  [  0:0] \__pi_bus_address[0] ,
  input  [  0:0] \__pi_bus_address[1] ,
  input  [  0:0] \__pi_bus_read_data[17] ,
  input  [  0:0] \__pi_bus_read_data[25] ,
  input  [  0:0] \__pi_bus_read_data[9] ,
  input  [  0:0] \__pi_data_format[0] ,
  input  [  0:0] \__pi_data_format[1] ,
  input  [  0:0] \__pi_data_format[2] ,
  input  [  0:0] \__pi_read_data[7] ,
  output [  0:0] \__po_read_data[9]
);
endmodule
module \gate.data_memory_interface.read_data.9 (
  input  [  0:0] \__pi_bus_address[0] ,
  input  [  0:0] \__pi_bus_address[1] ,
  input  [  0:0] \__pi_bus_read_data[17] ,
  input  [  0:0] \__pi_bus_read_data[25] ,
  input  [  0:0] \__pi_bus_read_data[9] ,
  input  [  0:0] \__pi_data_format[0] ,
  input  [  0:0] \__pi_data_format[1] ,
  input  [  0:0] \__pi_data_format[2] ,
  input  [  0:0] \__pi_read_data[7] ,
  output [  0:0] \__po_read_data[9]
);
endmodule
