  
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
        .in1(p0), 
        .in2(p1), 
        .in3(carry_in0),
        .out(nand1)
    ); 

    nand2_delay u2 (
        .in1(p1), 
        .in2(g0), 
        .out(nand2)
    ); 

    nand2_delay u3 (
        .in1(g1), 
        .in2(g1), 
        .out(nand3)
    ); 

    nand3_delay u4 (
        .in1(nand1), 
        .in2(nand2), 
        .in3(nand3),
        .out(carry_out)
    ); 

endmodule