`timescale 1ns/1ps

module control_transfer_tb;

    logic       result_equal_zero;
    logic [2:0] inst_funct3;
    wire        take_branch;

    integer i;

    control_transfer dut (
        .result_equal_zero(result_equal_zero),
        .inst_funct3(inst_funct3),
        .take_branch(take_branch)
    );

    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            {inst_funct3, result_equal_zero} = i[3:0];

            #1;

            $display(
                "input=%04b funct3=%03b equal_zero=%b take_branch=%b",
                i[3:0],
                inst_funct3,
                result_equal_zero,
                take_branch
            );
        end

        $finish;
    end

endmodule
