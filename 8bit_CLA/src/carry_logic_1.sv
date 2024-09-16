  
module carry_logic_1 (
    input logic p0,
    input logic g0,
	input logic p1,
    input logic g1,
    input logic carry_in0,
    output logic carry_out
);

    logic nand1;  
    logic nand2;  
	logic nand3;  


    nand3_delay u1 (
        .a(p0), 
        .b(p1), 
        .c(carry_in0),
        .y(nand1)
    ); 

    nand2_delay u2 (
        .a(p1), 
        .b(g0), 
        .y(nand2)
    ); 

    nand2_delay u3 (
        .a(g1), 
        .b(g1), 
        .y(nand3)
    ); 

    nand3_delay u4 (
        .a(nand1), 
        .b(nand2), 
        .c(nand3),
        .y(carry_out)
    ); 

endmodule