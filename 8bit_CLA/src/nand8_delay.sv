module nand8_delay(
    input logic in1,
    input logic in2,
    input logic in3,
    input logic in4,
    input logic in5,
    input logic in6,
    input logic in7,
    input logic in8,
    output logic out
);

logic l1, l1_inv, l2, l2_inv;

nand4_delay u1(
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .out(l1)
);

nand2_delay u1_inv (
    .in1(l1),
    .in2(l1),
    .out(l1_inv)
);

nand4_delay u2(
    .in1(in5),
    .in2(in6),
    .in3(in7),
    .in4(in8),
    .out(l2)
);

nand2_delay u2_inv (
    .in1(l2),
    .in2(l2),
    .out(l2_inv)
);

nand2_delay u3(
    .in1(l1_inv),
    .in2(l2_inv),
    .out(out)
);


endmodule