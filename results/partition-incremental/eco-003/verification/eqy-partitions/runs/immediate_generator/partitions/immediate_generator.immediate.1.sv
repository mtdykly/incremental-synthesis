module miter (
  input  [  0:0] \__pi_inst[0] ,
  input  [  0:0] \__pi_inst[1] ,
  input  [  0:0] \__pi_inst[21] ,
  input  [  0:0] \__pi_inst[2] ,
  input  [  0:0] \__pi_inst[3] ,
  input  [  0:0] \__pi_inst[4] ,
  input  [  0:0] \__pi_inst[5] ,
  input  [  0:0] \__pi_inst[6] ,
  input  [  0:0] \__pi_inst[8] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_immediate[1]__gold ,
  output [  0:0] \__po_immediate[1]__gate
);
  \gold.immediate_generator.immediate.1 gold (
    .\__pi_inst[0] (\__pi_inst[0] ),
    .\__pi_inst[1] (\__pi_inst[1] ),
    .\__pi_inst[21] (\__pi_inst[21] ),
    .\__pi_inst[2] (\__pi_inst[2] ),
    .\__pi_inst[3] (\__pi_inst[3] ),
    .\__pi_inst[4] (\__pi_inst[4] ),
    .\__pi_inst[5] (\__pi_inst[5] ),
    .\__pi_inst[6] (\__pi_inst[6] ),
    .\__pi_inst[8] (\__pi_inst[8] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_immediate[1] (\__po_immediate[1]__gold )
  );
  \gate.immediate_generator.immediate.1 gate (
    .\__pi_inst[0] (\__pi_inst[0] ),
    .\__pi_inst[1] (\__pi_inst[1] ),
    .\__pi_inst[21] (\__pi_inst[21] ),
    .\__pi_inst[2] (\__pi_inst[2] ),
    .\__pi_inst[3] (\__pi_inst[3] ),
    .\__pi_inst[4] (\__pi_inst[4] ),
    .\__pi_inst[5] (\__pi_inst[5] ),
    .\__pi_inst[6] (\__pi_inst[6] ),
    .\__pi_inst[8] (\__pi_inst[8] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_immediate[1] (\__po_immediate[1]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst[0]__assume (\__pi_inst[0] );
  miter_def_prop #(1, "assume") \__pi_inst[1]__assume (\__pi_inst[1] );
  miter_def_prop #(1, "assume") \__pi_inst[21]__assume (\__pi_inst[21] );
  miter_def_prop #(1, "assume") \__pi_inst[2]__assume (\__pi_inst[2] );
  miter_def_prop #(1, "assume") \__pi_inst[3]__assume (\__pi_inst[3] );
  miter_def_prop #(1, "assume") \__pi_inst[4]__assume (\__pi_inst[4] );
  miter_def_prop #(1, "assume") \__pi_inst[5]__assume (\__pi_inst[5] );
  miter_def_prop #(1, "assume") \__pi_inst[6]__assume (\__pi_inst[6] );
  miter_def_prop #(1, "assume") \__pi_inst[8]__assume (\__pi_inst[8] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_immediate[1]__assert (\__po_immediate[1]__gold , \__po_immediate[1]__gate );
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
  miter_def_prop #(1, "cover") \__po_immediate[1]__gold_cover (\__po_immediate[1]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_immediate[1]__gate_cover (\__po_immediate[1]__gate );
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
module \gold.immediate_generator.immediate.1 (
  input  [  0:0] \__pi_inst[0] ,
  input  [  0:0] \__pi_inst[1] ,
  input  [  0:0] \__pi_inst[21] ,
  input  [  0:0] \__pi_inst[2] ,
  input  [  0:0] \__pi_inst[3] ,
  input  [  0:0] \__pi_inst[4] ,
  input  [  0:0] \__pi_inst[5] ,
  input  [  0:0] \__pi_inst[6] ,
  input  [  0:0] \__pi_inst[8] ,
  output [  0:0] \__po_immediate[1]
);
endmodule
module \gate.immediate_generator.immediate.1 (
  input  [  0:0] \__pi_inst[0] ,
  input  [  0:0] \__pi_inst[1] ,
  input  [  0:0] \__pi_inst[21] ,
  input  [  0:0] \__pi_inst[2] ,
  input  [  0:0] \__pi_inst[3] ,
  input  [  0:0] \__pi_inst[4] ,
  input  [  0:0] \__pi_inst[5] ,
  input  [  0:0] \__pi_inst[6] ,
  input  [  0:0] \__pi_inst[8] ,
  output [  0:0] \__po_immediate[1]
);
endmodule
