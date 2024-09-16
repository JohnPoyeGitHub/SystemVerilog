module propagate_logic (
	input  logic a,
    input  logic b,
    output logic p
);
	logic not_a, not_b;

    nand2_delay u1 (
        .a(a),
        .b(a),
        .y(not_a)
    );
    nand2_delay u2 (
        .a(b),
        .b(b),
        .y(not_b)
    );

    nand2_delay u3 (
        .a(not_a),
        .b(not_b),
        .y(p)
    );

endmodule
