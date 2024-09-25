module nand2_delay(
    input  logic a,
    input  logic b,
    output logic prod_terms
);
    logic c;

    nand2_delay u1(
        .a(a),
        .b(b),
        .y(c)
    );
    nand2_delay u2(
        .a(c),
        .b(c),
        .y(prod_terms)
    );

endmodule