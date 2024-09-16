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
        .in1(p0), 
        .in2(p1), 
        .in3(p2),
        .in4(carry_in0),
        .out(nand1)
    ); 

    nand3_delay u2 (
        .in1(p2), 
        .in2(p1), 
        .in3(g0),
        .out(nand2)
    ); 

    nand2_delay u3 (
        .in1(p2), 
        .in2(g1), 
        .out(nand3)
    ); 

    nand2_delay u4 (
        .in1(g2), 
        .in2(g2), 
        .out(nand4)
    ); 

    nand4_delay u5 (
        .in1(nand1), 
        .in2(nand2), 
        .in3(nand3), 
        .in4(nand4),
        .out(carry_out)
    ); 

endmodule