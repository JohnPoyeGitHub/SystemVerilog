module carry_logic_2 (
    input logic p0,
    input logic g0,
    input logic p1,
    input logic g1,
    input logic p2,
    input logic g2,
    input logic carry_in0,
    output logic carry_out
);

    logic nand1;  
    logic nand2;  
    logic nand3;  
    logic nand4;  


    nand4_delay u1 (
        .a(p0), 
        .b(p1), 
        .c(p2),
        .d(carry_in0),
        .y(nand1)
    ); 

    nand3_delay u2 (
        .a(p2), 
        .b(p1), 
        .c(g0),
        .y(nand2)
    ); 

    nand2_delay u3 (
        .a(p2), 
        .b(g1), 
        .y(nand3)
    ); 

    nand2_delay u4 (
        .a(g2), 
        .b(g2), 
        .y(nand4)
    ); 

    nand4_delay u5 (
        .a(nand1), 
        .b(nand2), 
        .c(nand3), 
        .d(nand4),
        .y(carry_out)
    ); 

endmodule