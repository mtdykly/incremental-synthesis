module miter (
  input  [  0:0] \__pi_inst[0] ,
  input  [  0:0] \__pi_inst[10] ,
  input  [  0:0] \__pi_inst[11] ,
  input  [  0:0] \__pi_inst[12] ,
  input  [  0:0] \__pi_inst[13] ,
  input  [  0:0] \__pi_inst[14] ,
  input  [  0:0] \__pi_inst[15] ,
  input  [  0:0] \__pi_inst[16] ,
  input  [  0:0] \__pi_inst[17] ,
  input  [  0:0] \__pi_inst[18] ,
  input  [  0:0] \__pi_inst[19] ,
  input  [  0:0] \__pi_inst[1] ,
  input  [  0:0] \__pi_inst[20] ,
  input  [  0:0] \__pi_inst[21] ,
  input  [  0:0] \__pi_inst[22] ,
  input  [  0:0] \__pi_inst[23] ,
  input  [  0:0] \__pi_inst[24] ,
  input  [  0:0] \__pi_inst[25] ,
  input  [  0:0] \__pi_inst[26] ,
  input  [  0:0] \__pi_inst[27] ,
  input  [  0:0] \__pi_inst[28] ,
  input  [  0:0] \__pi_inst[29] ,
  input  [  0:0] \__pi_inst[2] ,
  input  [  0:0] \__pi_inst[30] ,
  input  [  0:0] \__pi_inst[31] ,
  input  [  0:0] \__pi_inst[3] ,
  input  [  0:0] \__pi_inst[4] ,
  input  [  0:0] \__pi_inst[5] ,
  input  [  0:0] \__pi_inst[6] ,
  input  [  0:0] \__pi_inst[7] ,
  input  [  0:0] \__pi_inst[8] ,
  input  [  0:0] \__pi_inst[9] ,
`ifdef DIRECT_CROSS_POINTS
`else
`endif
  output [  0:0] \__po_inst_funct3[0]__gold ,
  output [  0:0] \__po_inst_funct3[1]__gold ,
  output [  0:0] \__po_inst_funct3[2]__gold ,
  output [  0:0] \__po_inst_funct7[0]__gold ,
  output [  0:0] \__po_inst_funct7[1]__gold ,
  output [  0:0] \__po_inst_funct7[2]__gold ,
  output [  0:0] \__po_inst_funct7[3]__gold ,
  output [  0:0] \__po_inst_funct7[4]__gold ,
  output [  0:0] \__po_inst_funct7[5]__gold ,
  output [  0:0] \__po_inst_funct7[6]__gold ,
  output [  0:0] \__po_inst_opcode[0]__gold ,
  output [  0:0] \__po_inst_opcode[1]__gold ,
  output [  0:0] \__po_inst_opcode[2]__gold ,
  output [  0:0] \__po_inst_opcode[3]__gold ,
  output [  0:0] \__po_inst_opcode[4]__gold ,
  output [  0:0] \__po_inst_opcode[5]__gold ,
  output [  0:0] \__po_inst_opcode[6]__gold ,
  output [  0:0] \__po_inst_rd[0]__gold ,
  output [  0:0] \__po_inst_rd[1]__gold ,
  output [  0:0] \__po_inst_rd[2]__gold ,
  output [  0:0] \__po_inst_rd[3]__gold ,
  output [  0:0] \__po_inst_rd[4]__gold ,
  output [  0:0] \__po_inst_rs1[0]__gold ,
  output [  0:0] \__po_inst_rs1[1]__gold ,
  output [  0:0] \__po_inst_rs1[2]__gold ,
  output [  0:0] \__po_inst_rs1[3]__gold ,
  output [  0:0] \__po_inst_rs1[4]__gold ,
  output [  0:0] \__po_inst_rs2[0]__gold ,
  output [  0:0] \__po_inst_rs2[1]__gold ,
  output [  0:0] \__po_inst_rs2[2]__gold ,
  output [  0:0] \__po_inst_rs2[3]__gold ,
  output [  0:0] \__po_inst_rs2[4]__gold ,
  output [  0:0] \__po_inst_funct3[0]__gate ,
  output [  0:0] \__po_inst_funct3[1]__gate ,
  output [  0:0] \__po_inst_funct3[2]__gate ,
  output [  0:0] \__po_inst_funct7[0]__gate ,
  output [  0:0] \__po_inst_funct7[1]__gate ,
  output [  0:0] \__po_inst_funct7[2]__gate ,
  output [  0:0] \__po_inst_funct7[3]__gate ,
  output [  0:0] \__po_inst_funct7[4]__gate ,
  output [  0:0] \__po_inst_funct7[5]__gate ,
  output [  0:0] \__po_inst_funct7[6]__gate ,
  output [  0:0] \__po_inst_opcode[0]__gate ,
  output [  0:0] \__po_inst_opcode[1]__gate ,
  output [  0:0] \__po_inst_opcode[2]__gate ,
  output [  0:0] \__po_inst_opcode[3]__gate ,
  output [  0:0] \__po_inst_opcode[4]__gate ,
  output [  0:0] \__po_inst_opcode[5]__gate ,
  output [  0:0] \__po_inst_opcode[6]__gate ,
  output [  0:0] \__po_inst_rd[0]__gate ,
  output [  0:0] \__po_inst_rd[1]__gate ,
  output [  0:0] \__po_inst_rd[2]__gate ,
  output [  0:0] \__po_inst_rd[3]__gate ,
  output [  0:0] \__po_inst_rd[4]__gate ,
  output [  0:0] \__po_inst_rs1[0]__gate ,
  output [  0:0] \__po_inst_rs1[1]__gate ,
  output [  0:0] \__po_inst_rs1[2]__gate ,
  output [  0:0] \__po_inst_rs1[3]__gate ,
  output [  0:0] \__po_inst_rs1[4]__gate ,
  output [  0:0] \__po_inst_rs2[0]__gate ,
  output [  0:0] \__po_inst_rs2[1]__gate ,
  output [  0:0] \__po_inst_rs2[2]__gate ,
  output [  0:0] \__po_inst_rs2[3]__gate ,
  output [  0:0] \__po_inst_rs2[4]__gate
);
  \gold.instruction_decoder gold (
    .\__pi_inst[0] (\__pi_inst[0] ),
    .\__pi_inst[10] (\__pi_inst[10] ),
    .\__pi_inst[11] (\__pi_inst[11] ),
    .\__pi_inst[12] (\__pi_inst[12] ),
    .\__pi_inst[13] (\__pi_inst[13] ),
    .\__pi_inst[14] (\__pi_inst[14] ),
    .\__pi_inst[15] (\__pi_inst[15] ),
    .\__pi_inst[16] (\__pi_inst[16] ),
    .\__pi_inst[17] (\__pi_inst[17] ),
    .\__pi_inst[18] (\__pi_inst[18] ),
    .\__pi_inst[19] (\__pi_inst[19] ),
    .\__pi_inst[1] (\__pi_inst[1] ),
    .\__pi_inst[20] (\__pi_inst[20] ),
    .\__pi_inst[21] (\__pi_inst[21] ),
    .\__pi_inst[22] (\__pi_inst[22] ),
    .\__pi_inst[23] (\__pi_inst[23] ),
    .\__pi_inst[24] (\__pi_inst[24] ),
    .\__pi_inst[25] (\__pi_inst[25] ),
    .\__pi_inst[26] (\__pi_inst[26] ),
    .\__pi_inst[27] (\__pi_inst[27] ),
    .\__pi_inst[28] (\__pi_inst[28] ),
    .\__pi_inst[29] (\__pi_inst[29] ),
    .\__pi_inst[2] (\__pi_inst[2] ),
    .\__pi_inst[30] (\__pi_inst[30] ),
    .\__pi_inst[31] (\__pi_inst[31] ),
    .\__pi_inst[3] (\__pi_inst[3] ),
    .\__pi_inst[4] (\__pi_inst[4] ),
    .\__pi_inst[5] (\__pi_inst[5] ),
    .\__pi_inst[6] (\__pi_inst[6] ),
    .\__pi_inst[7] (\__pi_inst[7] ),
    .\__pi_inst[8] (\__pi_inst[8] ),
    .\__pi_inst[9] (\__pi_inst[9] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_inst_funct3[0] (\__po_inst_funct3[0]__gold ),
    .\__po_inst_funct3[1] (\__po_inst_funct3[1]__gold ),
    .\__po_inst_funct3[2] (\__po_inst_funct3[2]__gold ),
    .\__po_inst_funct7[0] (\__po_inst_funct7[0]__gold ),
    .\__po_inst_funct7[1] (\__po_inst_funct7[1]__gold ),
    .\__po_inst_funct7[2] (\__po_inst_funct7[2]__gold ),
    .\__po_inst_funct7[3] (\__po_inst_funct7[3]__gold ),
    .\__po_inst_funct7[4] (\__po_inst_funct7[4]__gold ),
    .\__po_inst_funct7[5] (\__po_inst_funct7[5]__gold ),
    .\__po_inst_funct7[6] (\__po_inst_funct7[6]__gold ),
    .\__po_inst_opcode[0] (\__po_inst_opcode[0]__gold ),
    .\__po_inst_opcode[1] (\__po_inst_opcode[1]__gold ),
    .\__po_inst_opcode[2] (\__po_inst_opcode[2]__gold ),
    .\__po_inst_opcode[3] (\__po_inst_opcode[3]__gold ),
    .\__po_inst_opcode[4] (\__po_inst_opcode[4]__gold ),
    .\__po_inst_opcode[5] (\__po_inst_opcode[5]__gold ),
    .\__po_inst_opcode[6] (\__po_inst_opcode[6]__gold ),
    .\__po_inst_rd[0] (\__po_inst_rd[0]__gold ),
    .\__po_inst_rd[1] (\__po_inst_rd[1]__gold ),
    .\__po_inst_rd[2] (\__po_inst_rd[2]__gold ),
    .\__po_inst_rd[3] (\__po_inst_rd[3]__gold ),
    .\__po_inst_rd[4] (\__po_inst_rd[4]__gold ),
    .\__po_inst_rs1[0] (\__po_inst_rs1[0]__gold ),
    .\__po_inst_rs1[1] (\__po_inst_rs1[1]__gold ),
    .\__po_inst_rs1[2] (\__po_inst_rs1[2]__gold ),
    .\__po_inst_rs1[3] (\__po_inst_rs1[3]__gold ),
    .\__po_inst_rs1[4] (\__po_inst_rs1[4]__gold ),
    .\__po_inst_rs2[0] (\__po_inst_rs2[0]__gold ),
    .\__po_inst_rs2[1] (\__po_inst_rs2[1]__gold ),
    .\__po_inst_rs2[2] (\__po_inst_rs2[2]__gold ),
    .\__po_inst_rs2[3] (\__po_inst_rs2[3]__gold ),
    .\__po_inst_rs2[4] (\__po_inst_rs2[4]__gold )
  );
  \gate.instruction_decoder gate (
    .\__pi_inst[0] (\__pi_inst[0] ),
    .\__pi_inst[10] (\__pi_inst[10] ),
    .\__pi_inst[11] (\__pi_inst[11] ),
    .\__pi_inst[12] (\__pi_inst[12] ),
    .\__pi_inst[13] (\__pi_inst[13] ),
    .\__pi_inst[14] (\__pi_inst[14] ),
    .\__pi_inst[15] (\__pi_inst[15] ),
    .\__pi_inst[16] (\__pi_inst[16] ),
    .\__pi_inst[17] (\__pi_inst[17] ),
    .\__pi_inst[18] (\__pi_inst[18] ),
    .\__pi_inst[19] (\__pi_inst[19] ),
    .\__pi_inst[1] (\__pi_inst[1] ),
    .\__pi_inst[20] (\__pi_inst[20] ),
    .\__pi_inst[21] (\__pi_inst[21] ),
    .\__pi_inst[22] (\__pi_inst[22] ),
    .\__pi_inst[23] (\__pi_inst[23] ),
    .\__pi_inst[24] (\__pi_inst[24] ),
    .\__pi_inst[25] (\__pi_inst[25] ),
    .\__pi_inst[26] (\__pi_inst[26] ),
    .\__pi_inst[27] (\__pi_inst[27] ),
    .\__pi_inst[28] (\__pi_inst[28] ),
    .\__pi_inst[29] (\__pi_inst[29] ),
    .\__pi_inst[2] (\__pi_inst[2] ),
    .\__pi_inst[30] (\__pi_inst[30] ),
    .\__pi_inst[31] (\__pi_inst[31] ),
    .\__pi_inst[3] (\__pi_inst[3] ),
    .\__pi_inst[4] (\__pi_inst[4] ),
    .\__pi_inst[5] (\__pi_inst[5] ),
    .\__pi_inst[6] (\__pi_inst[6] ),
    .\__pi_inst[7] (\__pi_inst[7] ),
    .\__pi_inst[8] (\__pi_inst[8] ),
    .\__pi_inst[9] (\__pi_inst[9] ),
`ifdef DIRECT_CROSS_POINTS
`else
`endif
    .\__po_inst_funct3[0] (\__po_inst_funct3[0]__gate ),
    .\__po_inst_funct3[1] (\__po_inst_funct3[1]__gate ),
    .\__po_inst_funct3[2] (\__po_inst_funct3[2]__gate ),
    .\__po_inst_funct7[0] (\__po_inst_funct7[0]__gate ),
    .\__po_inst_funct7[1] (\__po_inst_funct7[1]__gate ),
    .\__po_inst_funct7[2] (\__po_inst_funct7[2]__gate ),
    .\__po_inst_funct7[3] (\__po_inst_funct7[3]__gate ),
    .\__po_inst_funct7[4] (\__po_inst_funct7[4]__gate ),
    .\__po_inst_funct7[5] (\__po_inst_funct7[5]__gate ),
    .\__po_inst_funct7[6] (\__po_inst_funct7[6]__gate ),
    .\__po_inst_opcode[0] (\__po_inst_opcode[0]__gate ),
    .\__po_inst_opcode[1] (\__po_inst_opcode[1]__gate ),
    .\__po_inst_opcode[2] (\__po_inst_opcode[2]__gate ),
    .\__po_inst_opcode[3] (\__po_inst_opcode[3]__gate ),
    .\__po_inst_opcode[4] (\__po_inst_opcode[4]__gate ),
    .\__po_inst_opcode[5] (\__po_inst_opcode[5]__gate ),
    .\__po_inst_opcode[6] (\__po_inst_opcode[6]__gate ),
    .\__po_inst_rd[0] (\__po_inst_rd[0]__gate ),
    .\__po_inst_rd[1] (\__po_inst_rd[1]__gate ),
    .\__po_inst_rd[2] (\__po_inst_rd[2]__gate ),
    .\__po_inst_rd[3] (\__po_inst_rd[3]__gate ),
    .\__po_inst_rd[4] (\__po_inst_rd[4]__gate ),
    .\__po_inst_rs1[0] (\__po_inst_rs1[0]__gate ),
    .\__po_inst_rs1[1] (\__po_inst_rs1[1]__gate ),
    .\__po_inst_rs1[2] (\__po_inst_rs1[2]__gate ),
    .\__po_inst_rs1[3] (\__po_inst_rs1[3]__gate ),
    .\__po_inst_rs1[4] (\__po_inst_rs1[4]__gate ),
    .\__po_inst_rs2[0] (\__po_inst_rs2[0]__gate ),
    .\__po_inst_rs2[1] (\__po_inst_rs2[1]__gate ),
    .\__po_inst_rs2[2] (\__po_inst_rs2[2]__gate ),
    .\__po_inst_rs2[3] (\__po_inst_rs2[3]__gate ),
    .\__po_inst_rs2[4] (\__po_inst_rs2[4]__gate )
  );
`ifdef ASSUME_DEFINED_INPUTS
  miter_def_prop #(1, "assume") \__pi_inst[0]__assume (\__pi_inst[0] );
  miter_def_prop #(1, "assume") \__pi_inst[10]__assume (\__pi_inst[10] );
  miter_def_prop #(1, "assume") \__pi_inst[11]__assume (\__pi_inst[11] );
  miter_def_prop #(1, "assume") \__pi_inst[12]__assume (\__pi_inst[12] );
  miter_def_prop #(1, "assume") \__pi_inst[13]__assume (\__pi_inst[13] );
  miter_def_prop #(1, "assume") \__pi_inst[14]__assume (\__pi_inst[14] );
  miter_def_prop #(1, "assume") \__pi_inst[15]__assume (\__pi_inst[15] );
  miter_def_prop #(1, "assume") \__pi_inst[16]__assume (\__pi_inst[16] );
  miter_def_prop #(1, "assume") \__pi_inst[17]__assume (\__pi_inst[17] );
  miter_def_prop #(1, "assume") \__pi_inst[18]__assume (\__pi_inst[18] );
  miter_def_prop #(1, "assume") \__pi_inst[19]__assume (\__pi_inst[19] );
  miter_def_prop #(1, "assume") \__pi_inst[1]__assume (\__pi_inst[1] );
  miter_def_prop #(1, "assume") \__pi_inst[20]__assume (\__pi_inst[20] );
  miter_def_prop #(1, "assume") \__pi_inst[21]__assume (\__pi_inst[21] );
  miter_def_prop #(1, "assume") \__pi_inst[22]__assume (\__pi_inst[22] );
  miter_def_prop #(1, "assume") \__pi_inst[23]__assume (\__pi_inst[23] );
  miter_def_prop #(1, "assume") \__pi_inst[24]__assume (\__pi_inst[24] );
  miter_def_prop #(1, "assume") \__pi_inst[25]__assume (\__pi_inst[25] );
  miter_def_prop #(1, "assume") \__pi_inst[26]__assume (\__pi_inst[26] );
  miter_def_prop #(1, "assume") \__pi_inst[27]__assume (\__pi_inst[27] );
  miter_def_prop #(1, "assume") \__pi_inst[28]__assume (\__pi_inst[28] );
  miter_def_prop #(1, "assume") \__pi_inst[29]__assume (\__pi_inst[29] );
  miter_def_prop #(1, "assume") \__pi_inst[2]__assume (\__pi_inst[2] );
  miter_def_prop #(1, "assume") \__pi_inst[30]__assume (\__pi_inst[30] );
  miter_def_prop #(1, "assume") \__pi_inst[31]__assume (\__pi_inst[31] );
  miter_def_prop #(1, "assume") \__pi_inst[3]__assume (\__pi_inst[3] );
  miter_def_prop #(1, "assume") \__pi_inst[4]__assume (\__pi_inst[4] );
  miter_def_prop #(1, "assume") \__pi_inst[5]__assume (\__pi_inst[5] );
  miter_def_prop #(1, "assume") \__pi_inst[6]__assume (\__pi_inst[6] );
  miter_def_prop #(1, "assume") \__pi_inst[7]__assume (\__pi_inst[7] );
  miter_def_prop #(1, "assume") \__pi_inst[8]__assume (\__pi_inst[8] );
  miter_def_prop #(1, "assume") \__pi_inst[9]__assume (\__pi_inst[9] );
`endif
`ifndef DIRECT_CROSS_POINTS
`endif
`ifdef CHECK_MATCH_POINTS
`endif
`ifdef CHECK_OUTPUTS
  miter_cmp_prop #(1, "assert") \__po_inst_funct3[0]__assert (\__po_inst_funct3[0]__gold , \__po_inst_funct3[0]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_funct3[1]__assert (\__po_inst_funct3[1]__gold , \__po_inst_funct3[1]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_funct3[2]__assert (\__po_inst_funct3[2]__gold , \__po_inst_funct3[2]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_funct7[0]__assert (\__po_inst_funct7[0]__gold , \__po_inst_funct7[0]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_funct7[1]__assert (\__po_inst_funct7[1]__gold , \__po_inst_funct7[1]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_funct7[2]__assert (\__po_inst_funct7[2]__gold , \__po_inst_funct7[2]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_funct7[3]__assert (\__po_inst_funct7[3]__gold , \__po_inst_funct7[3]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_funct7[4]__assert (\__po_inst_funct7[4]__gold , \__po_inst_funct7[4]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_funct7[5]__assert (\__po_inst_funct7[5]__gold , \__po_inst_funct7[5]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_funct7[6]__assert (\__po_inst_funct7[6]__gold , \__po_inst_funct7[6]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_opcode[0]__assert (\__po_inst_opcode[0]__gold , \__po_inst_opcode[0]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_opcode[1]__assert (\__po_inst_opcode[1]__gold , \__po_inst_opcode[1]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_opcode[2]__assert (\__po_inst_opcode[2]__gold , \__po_inst_opcode[2]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_opcode[3]__assert (\__po_inst_opcode[3]__gold , \__po_inst_opcode[3]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_opcode[4]__assert (\__po_inst_opcode[4]__gold , \__po_inst_opcode[4]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_opcode[5]__assert (\__po_inst_opcode[5]__gold , \__po_inst_opcode[5]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_opcode[6]__assert (\__po_inst_opcode[6]__gold , \__po_inst_opcode[6]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_rd[0]__assert (\__po_inst_rd[0]__gold , \__po_inst_rd[0]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_rd[1]__assert (\__po_inst_rd[1]__gold , \__po_inst_rd[1]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_rd[2]__assert (\__po_inst_rd[2]__gold , \__po_inst_rd[2]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_rd[3]__assert (\__po_inst_rd[3]__gold , \__po_inst_rd[3]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_rd[4]__assert (\__po_inst_rd[4]__gold , \__po_inst_rd[4]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_rs1[0]__assert (\__po_inst_rs1[0]__gold , \__po_inst_rs1[0]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_rs1[1]__assert (\__po_inst_rs1[1]__gold , \__po_inst_rs1[1]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_rs1[2]__assert (\__po_inst_rs1[2]__gold , \__po_inst_rs1[2]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_rs1[3]__assert (\__po_inst_rs1[3]__gold , \__po_inst_rs1[3]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_rs1[4]__assert (\__po_inst_rs1[4]__gold , \__po_inst_rs1[4]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_rs2[0]__assert (\__po_inst_rs2[0]__gold , \__po_inst_rs2[0]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_rs2[1]__assert (\__po_inst_rs2[1]__gold , \__po_inst_rs2[1]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_rs2[2]__assert (\__po_inst_rs2[2]__gold , \__po_inst_rs2[2]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_rs2[3]__assert (\__po_inst_rs2[3]__gold , \__po_inst_rs2[3]__gate );
  miter_cmp_prop #(1, "assert") \__po_inst_rs2[4]__assert (\__po_inst_rs2[4]__gold , \__po_inst_rs2[4]__gate );
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
  miter_def_prop #(1, "cover") \__po_inst_funct3[0]__gold_cover (\__po_inst_funct3[0]__gold );
  miter_def_prop #(1, "cover") \__po_inst_funct3[1]__gold_cover (\__po_inst_funct3[1]__gold );
  miter_def_prop #(1, "cover") \__po_inst_funct3[2]__gold_cover (\__po_inst_funct3[2]__gold );
  miter_def_prop #(1, "cover") \__po_inst_funct7[0]__gold_cover (\__po_inst_funct7[0]__gold );
  miter_def_prop #(1, "cover") \__po_inst_funct7[1]__gold_cover (\__po_inst_funct7[1]__gold );
  miter_def_prop #(1, "cover") \__po_inst_funct7[2]__gold_cover (\__po_inst_funct7[2]__gold );
  miter_def_prop #(1, "cover") \__po_inst_funct7[3]__gold_cover (\__po_inst_funct7[3]__gold );
  miter_def_prop #(1, "cover") \__po_inst_funct7[4]__gold_cover (\__po_inst_funct7[4]__gold );
  miter_def_prop #(1, "cover") \__po_inst_funct7[5]__gold_cover (\__po_inst_funct7[5]__gold );
  miter_def_prop #(1, "cover") \__po_inst_funct7[6]__gold_cover (\__po_inst_funct7[6]__gold );
  miter_def_prop #(1, "cover") \__po_inst_opcode[0]__gold_cover (\__po_inst_opcode[0]__gold );
  miter_def_prop #(1, "cover") \__po_inst_opcode[1]__gold_cover (\__po_inst_opcode[1]__gold );
  miter_def_prop #(1, "cover") \__po_inst_opcode[2]__gold_cover (\__po_inst_opcode[2]__gold );
  miter_def_prop #(1, "cover") \__po_inst_opcode[3]__gold_cover (\__po_inst_opcode[3]__gold );
  miter_def_prop #(1, "cover") \__po_inst_opcode[4]__gold_cover (\__po_inst_opcode[4]__gold );
  miter_def_prop #(1, "cover") \__po_inst_opcode[5]__gold_cover (\__po_inst_opcode[5]__gold );
  miter_def_prop #(1, "cover") \__po_inst_opcode[6]__gold_cover (\__po_inst_opcode[6]__gold );
  miter_def_prop #(1, "cover") \__po_inst_rd[0]__gold_cover (\__po_inst_rd[0]__gold );
  miter_def_prop #(1, "cover") \__po_inst_rd[1]__gold_cover (\__po_inst_rd[1]__gold );
  miter_def_prop #(1, "cover") \__po_inst_rd[2]__gold_cover (\__po_inst_rd[2]__gold );
  miter_def_prop #(1, "cover") \__po_inst_rd[3]__gold_cover (\__po_inst_rd[3]__gold );
  miter_def_prop #(1, "cover") \__po_inst_rd[4]__gold_cover (\__po_inst_rd[4]__gold );
  miter_def_prop #(1, "cover") \__po_inst_rs1[0]__gold_cover (\__po_inst_rs1[0]__gold );
  miter_def_prop #(1, "cover") \__po_inst_rs1[1]__gold_cover (\__po_inst_rs1[1]__gold );
  miter_def_prop #(1, "cover") \__po_inst_rs1[2]__gold_cover (\__po_inst_rs1[2]__gold );
  miter_def_prop #(1, "cover") \__po_inst_rs1[3]__gold_cover (\__po_inst_rs1[3]__gold );
  miter_def_prop #(1, "cover") \__po_inst_rs1[4]__gold_cover (\__po_inst_rs1[4]__gold );
  miter_def_prop #(1, "cover") \__po_inst_rs2[0]__gold_cover (\__po_inst_rs2[0]__gold );
  miter_def_prop #(1, "cover") \__po_inst_rs2[1]__gold_cover (\__po_inst_rs2[1]__gold );
  miter_def_prop #(1, "cover") \__po_inst_rs2[2]__gold_cover (\__po_inst_rs2[2]__gold );
  miter_def_prop #(1, "cover") \__po_inst_rs2[3]__gold_cover (\__po_inst_rs2[3]__gold );
  miter_def_prop #(1, "cover") \__po_inst_rs2[4]__gold_cover (\__po_inst_rs2[4]__gold );
`endif
`ifdef COVER_DEF_GATE_OUTPUTS
  miter_def_prop #(1, "cover") \__po_inst_funct3[0]__gate_cover (\__po_inst_funct3[0]__gate );
  miter_def_prop #(1, "cover") \__po_inst_funct3[1]__gate_cover (\__po_inst_funct3[1]__gate );
  miter_def_prop #(1, "cover") \__po_inst_funct3[2]__gate_cover (\__po_inst_funct3[2]__gate );
  miter_def_prop #(1, "cover") \__po_inst_funct7[0]__gate_cover (\__po_inst_funct7[0]__gate );
  miter_def_prop #(1, "cover") \__po_inst_funct7[1]__gate_cover (\__po_inst_funct7[1]__gate );
  miter_def_prop #(1, "cover") \__po_inst_funct7[2]__gate_cover (\__po_inst_funct7[2]__gate );
  miter_def_prop #(1, "cover") \__po_inst_funct7[3]__gate_cover (\__po_inst_funct7[3]__gate );
  miter_def_prop #(1, "cover") \__po_inst_funct7[4]__gate_cover (\__po_inst_funct7[4]__gate );
  miter_def_prop #(1, "cover") \__po_inst_funct7[5]__gate_cover (\__po_inst_funct7[5]__gate );
  miter_def_prop #(1, "cover") \__po_inst_funct7[6]__gate_cover (\__po_inst_funct7[6]__gate );
  miter_def_prop #(1, "cover") \__po_inst_opcode[0]__gate_cover (\__po_inst_opcode[0]__gate );
  miter_def_prop #(1, "cover") \__po_inst_opcode[1]__gate_cover (\__po_inst_opcode[1]__gate );
  miter_def_prop #(1, "cover") \__po_inst_opcode[2]__gate_cover (\__po_inst_opcode[2]__gate );
  miter_def_prop #(1, "cover") \__po_inst_opcode[3]__gate_cover (\__po_inst_opcode[3]__gate );
  miter_def_prop #(1, "cover") \__po_inst_opcode[4]__gate_cover (\__po_inst_opcode[4]__gate );
  miter_def_prop #(1, "cover") \__po_inst_opcode[5]__gate_cover (\__po_inst_opcode[5]__gate );
  miter_def_prop #(1, "cover") \__po_inst_opcode[6]__gate_cover (\__po_inst_opcode[6]__gate );
  miter_def_prop #(1, "cover") \__po_inst_rd[0]__gate_cover (\__po_inst_rd[0]__gate );
  miter_def_prop #(1, "cover") \__po_inst_rd[1]__gate_cover (\__po_inst_rd[1]__gate );
  miter_def_prop #(1, "cover") \__po_inst_rd[2]__gate_cover (\__po_inst_rd[2]__gate );
  miter_def_prop #(1, "cover") \__po_inst_rd[3]__gate_cover (\__po_inst_rd[3]__gate );
  miter_def_prop #(1, "cover") \__po_inst_rd[4]__gate_cover (\__po_inst_rd[4]__gate );
  miter_def_prop #(1, "cover") \__po_inst_rs1[0]__gate_cover (\__po_inst_rs1[0]__gate );
  miter_def_prop #(1, "cover") \__po_inst_rs1[1]__gate_cover (\__po_inst_rs1[1]__gate );
  miter_def_prop #(1, "cover") \__po_inst_rs1[2]__gate_cover (\__po_inst_rs1[2]__gate );
  miter_def_prop #(1, "cover") \__po_inst_rs1[3]__gate_cover (\__po_inst_rs1[3]__gate );
  miter_def_prop #(1, "cover") \__po_inst_rs1[4]__gate_cover (\__po_inst_rs1[4]__gate );
  miter_def_prop #(1, "cover") \__po_inst_rs2[0]__gate_cover (\__po_inst_rs2[0]__gate );
  miter_def_prop #(1, "cover") \__po_inst_rs2[1]__gate_cover (\__po_inst_rs2[1]__gate );
  miter_def_prop #(1, "cover") \__po_inst_rs2[2]__gate_cover (\__po_inst_rs2[2]__gate );
  miter_def_prop #(1, "cover") \__po_inst_rs2[3]__gate_cover (\__po_inst_rs2[3]__gate );
  miter_def_prop #(1, "cover") \__po_inst_rs2[4]__gate_cover (\__po_inst_rs2[4]__gate );
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
module \gold.instruction_decoder (
  input  [  0:0] \__pi_inst[0] ,
  input  [  0:0] \__pi_inst[10] ,
  input  [  0:0] \__pi_inst[11] ,
  input  [  0:0] \__pi_inst[12] ,
  input  [  0:0] \__pi_inst[13] ,
  input  [  0:0] \__pi_inst[14] ,
  input  [  0:0] \__pi_inst[15] ,
  input  [  0:0] \__pi_inst[16] ,
  input  [  0:0] \__pi_inst[17] ,
  input  [  0:0] \__pi_inst[18] ,
  input  [  0:0] \__pi_inst[19] ,
  input  [  0:0] \__pi_inst[1] ,
  input  [  0:0] \__pi_inst[20] ,
  input  [  0:0] \__pi_inst[21] ,
  input  [  0:0] \__pi_inst[22] ,
  input  [  0:0] \__pi_inst[23] ,
  input  [  0:0] \__pi_inst[24] ,
  input  [  0:0] \__pi_inst[25] ,
  input  [  0:0] \__pi_inst[26] ,
  input  [  0:0] \__pi_inst[27] ,
  input  [  0:0] \__pi_inst[28] ,
  input  [  0:0] \__pi_inst[29] ,
  input  [  0:0] \__pi_inst[2] ,
  input  [  0:0] \__pi_inst[30] ,
  input  [  0:0] \__pi_inst[31] ,
  input  [  0:0] \__pi_inst[3] ,
  input  [  0:0] \__pi_inst[4] ,
  input  [  0:0] \__pi_inst[5] ,
  input  [  0:0] \__pi_inst[6] ,
  input  [  0:0] \__pi_inst[7] ,
  input  [  0:0] \__pi_inst[8] ,
  input  [  0:0] \__pi_inst[9] ,
  output [  0:0] \__po_inst_funct3[0] ,
  output [  0:0] \__po_inst_funct3[1] ,
  output [  0:0] \__po_inst_funct3[2] ,
  output [  0:0] \__po_inst_funct7[0] ,
  output [  0:0] \__po_inst_funct7[1] ,
  output [  0:0] \__po_inst_funct7[2] ,
  output [  0:0] \__po_inst_funct7[3] ,
  output [  0:0] \__po_inst_funct7[4] ,
  output [  0:0] \__po_inst_funct7[5] ,
  output [  0:0] \__po_inst_funct7[6] ,
  output [  0:0] \__po_inst_opcode[0] ,
  output [  0:0] \__po_inst_opcode[1] ,
  output [  0:0] \__po_inst_opcode[2] ,
  output [  0:0] \__po_inst_opcode[3] ,
  output [  0:0] \__po_inst_opcode[4] ,
  output [  0:0] \__po_inst_opcode[5] ,
  output [  0:0] \__po_inst_opcode[6] ,
  output [  0:0] \__po_inst_rd[0] ,
  output [  0:0] \__po_inst_rd[1] ,
  output [  0:0] \__po_inst_rd[2] ,
  output [  0:0] \__po_inst_rd[3] ,
  output [  0:0] \__po_inst_rd[4] ,
  output [  0:0] \__po_inst_rs1[0] ,
  output [  0:0] \__po_inst_rs1[1] ,
  output [  0:0] \__po_inst_rs1[2] ,
  output [  0:0] \__po_inst_rs1[3] ,
  output [  0:0] \__po_inst_rs1[4] ,
  output [  0:0] \__po_inst_rs2[0] ,
  output [  0:0] \__po_inst_rs2[1] ,
  output [  0:0] \__po_inst_rs2[2] ,
  output [  0:0] \__po_inst_rs2[3] ,
  output [  0:0] \__po_inst_rs2[4]
);
endmodule
module \gate.instruction_decoder (
  input  [  0:0] \__pi_inst[0] ,
  input  [  0:0] \__pi_inst[10] ,
  input  [  0:0] \__pi_inst[11] ,
  input  [  0:0] \__pi_inst[12] ,
  input  [  0:0] \__pi_inst[13] ,
  input  [  0:0] \__pi_inst[14] ,
  input  [  0:0] \__pi_inst[15] ,
  input  [  0:0] \__pi_inst[16] ,
  input  [  0:0] \__pi_inst[17] ,
  input  [  0:0] \__pi_inst[18] ,
  input  [  0:0] \__pi_inst[19] ,
  input  [  0:0] \__pi_inst[1] ,
  input  [  0:0] \__pi_inst[20] ,
  input  [  0:0] \__pi_inst[21] ,
  input  [  0:0] \__pi_inst[22] ,
  input  [  0:0] \__pi_inst[23] ,
  input  [  0:0] \__pi_inst[24] ,
  input  [  0:0] \__pi_inst[25] ,
  input  [  0:0] \__pi_inst[26] ,
  input  [  0:0] \__pi_inst[27] ,
  input  [  0:0] \__pi_inst[28] ,
  input  [  0:0] \__pi_inst[29] ,
  input  [  0:0] \__pi_inst[2] ,
  input  [  0:0] \__pi_inst[30] ,
  input  [  0:0] \__pi_inst[31] ,
  input  [  0:0] \__pi_inst[3] ,
  input  [  0:0] \__pi_inst[4] ,
  input  [  0:0] \__pi_inst[5] ,
  input  [  0:0] \__pi_inst[6] ,
  input  [  0:0] \__pi_inst[7] ,
  input  [  0:0] \__pi_inst[8] ,
  input  [  0:0] \__pi_inst[9] ,
  output [  0:0] \__po_inst_funct3[0] ,
  output [  0:0] \__po_inst_funct3[1] ,
  output [  0:0] \__po_inst_funct3[2] ,
  output [  0:0] \__po_inst_funct7[0] ,
  output [  0:0] \__po_inst_funct7[1] ,
  output [  0:0] \__po_inst_funct7[2] ,
  output [  0:0] \__po_inst_funct7[3] ,
  output [  0:0] \__po_inst_funct7[4] ,
  output [  0:0] \__po_inst_funct7[5] ,
  output [  0:0] \__po_inst_funct7[6] ,
  output [  0:0] \__po_inst_opcode[0] ,
  output [  0:0] \__po_inst_opcode[1] ,
  output [  0:0] \__po_inst_opcode[2] ,
  output [  0:0] \__po_inst_opcode[3] ,
  output [  0:0] \__po_inst_opcode[4] ,
  output [  0:0] \__po_inst_opcode[5] ,
  output [  0:0] \__po_inst_opcode[6] ,
  output [  0:0] \__po_inst_rd[0] ,
  output [  0:0] \__po_inst_rd[1] ,
  output [  0:0] \__po_inst_rd[2] ,
  output [  0:0] \__po_inst_rd[3] ,
  output [  0:0] \__po_inst_rd[4] ,
  output [  0:0] \__po_inst_rs1[0] ,
  output [  0:0] \__po_inst_rs1[1] ,
  output [  0:0] \__po_inst_rs1[2] ,
  output [  0:0] \__po_inst_rs1[3] ,
  output [  0:0] \__po_inst_rs1[4] ,
  output [  0:0] \__po_inst_rs2[0] ,
  output [  0:0] \__po_inst_rs2[1] ,
  output [  0:0] \__po_inst_rs2[2] ,
  output [  0:0] \__po_inst_rs2[3] ,
  output [  0:0] \__po_inst_rs2[4]
);
endmodule
