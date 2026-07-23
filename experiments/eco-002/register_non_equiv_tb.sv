`timescale 1ns/1ps

module register_non_equiv_tb;

    logic clock;
    logic reset;
    logic write_enable;
    logic [31:0] next;

    wire [31:0] value_gold;
    wire [31:0] value_gate;

    register_gold gold (
        .clock(clock),
        .reset(reset),
        .write_enable(write_enable),
        .next(next),
        .value(value_gold)
    );

    register_gate gate (
        .clock(clock),
        .reset(reset),
        .write_enable(write_enable),
        .next(next),
        .value(value_gate)
    );

    always #5 clock = ~clock;

    initial begin
        $dumpfile("results/eco-002/equiv/register_non_equiv.vcd");
        $dumpvars(0, register_non_equiv_tb);

        clock = 1'b0;
        reset = 1'b0;
        write_enable = 1'b1;
        next = 32'h1234_5678;

        // t = 5 ns：
        // 先通过一个共同的时钟上升沿，
        // 将两个寄存器置为同一个已知状态。
        @(posedge clock);
        #1;

        if (value_gold !== 32'h1234_5678 ||
            value_gate !== 32'h1234_5678) begin
            $fatal(
                1,
                "初始化失败：gold=%h gate=%h",
                value_gold,
                value_gate
            );
        end

        write_enable = 1'b0;

        // 当前为 t = 6 ns。
        // 在两个时钟上升沿之间，于 t = 8 ns 拉高 reset。
        #2;
        reset = 1'b1;

        // 等待异步逻辑完成更新，但还未到下一个时钟沿。
        #1;

        $display(
            "reset asserted between clocks: gold=%h gate=%h",
            value_gold,
            value_gate
        );

        // base 是异步复位，应该已经变成 0x00400000。
        // new 是同步复位，应该仍保持 0x12345678。
        if (value_gold === 32'h0040_0000 &&
            value_gate === 32'h1234_5678) begin

            $display("COUNTEREXAMPLE FOUND");
            $display("base async reset changed immediately");
            $display("new sync reset waited for the next clock edge");

        end else begin
            $fatal(
                1,
                "未观察到预期反例：gold=%h gate=%h",
                value_gold,
                value_gate
            );
        end

        // 下一个时钟上升沿到来后，同步复位才生效。
        @(posedge clock);
        #1;

        $display(
            "after next posedge: gold=%h gate=%h",
            value_gold,
            value_gate
        );

        if (value_gold !== 32'h0040_0000 ||
            value_gate !== 32'h0040_0000) begin
            $fatal(
                1,
                "时钟沿后复位结果错误：gold=%h gate=%h",
                value_gold,
                value_gate
            );
        end

        $display("REGISTER NON-EQUIVALENCE WITNESS PASSED");
        $finish;
    end

endmodule