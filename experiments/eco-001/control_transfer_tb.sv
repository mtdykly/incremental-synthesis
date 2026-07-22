`timescale 1ns/1ps

`include "config.sv"
`include "constants.sv"

module control_transfer_tb;

    logic result_equal_zero;
    logic [2:0] inst_funct3;
    logic take_branch;

    control_transfer dut (
        .result_equal_zero(result_equal_zero),
        .inst_funct3(inst_funct3),
        .take_branch(take_branch)
    );

    task automatic check(
        input logic [2:0] funct3,
        input logic equal_zero,
        input logic expected
    );
        begin
            inst_funct3 = funct3;
            result_equal_zero = equal_zero;
            #1;

            if (take_branch !== expected) begin
                $error(
                    "funct3=%b equal_zero=%b expected=%b actual=%b",
                    funct3,
                    equal_zero,
                    expected,
                    take_branch
                );
            end
        end
    endtask

    initial begin
        check(`FUNCT3_BRANCH_EQ,  1'b0, 1'b1);
        check(`FUNCT3_BRANCH_EQ,  1'b1, 1'b0);

        check(`FUNCT3_BRANCH_NE,  1'b0, 1'b0);
        check(`FUNCT3_BRANCH_NE,  1'b1, 1'b1);

        check(`FUNCT3_BRANCH_LT,  1'b0, 1'b1);
        check(`FUNCT3_BRANCH_LT,  1'b1, 1'b0);

        check(`FUNCT3_BRANCH_GE,  1'b0, 1'b0);
        check(`FUNCT3_BRANCH_GE,  1'b1, 1'b1);

        check(`FUNCT3_BRANCH_LTU, 1'b0, 1'b1);
        check(`FUNCT3_BRANCH_LTU, 1'b1, 1'b0);

        check(`FUNCT3_BRANCH_GEU, 1'b0, 1'b0);
        check(`FUNCT3_BRANCH_GEU, 1'b1, 1'b1);

        // 本次 ECO 新规定的行为
        check(3'b010, 1'b0, 1'b0);
        check(3'b010, 1'b1, 1'b0);
        check(3'b011, 1'b0, 1'b0);
        check(3'b011, 1'b1, 1'b0);

        $display("PASS");
        $finish;
    end

endmodule