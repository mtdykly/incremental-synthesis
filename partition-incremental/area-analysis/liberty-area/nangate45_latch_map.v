module \$_DLATCH_N_ (
    input E,
    input D,
    output Q
);

    wire enable_high;

    INV_X1 u_enable_inv (
        .A  (E),
        .ZN (enable_high)
    );

    DLH_X1 u_latch (
        .D (D),
        .G (enable_high),
        .Q (Q)
    );

endmodule