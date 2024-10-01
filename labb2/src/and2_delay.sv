module nand2_delay(
    input  logic a,
    input  logic b,
    output logic prod_terms
);
    logic c;

    prod_terms = a&b;

endmodule