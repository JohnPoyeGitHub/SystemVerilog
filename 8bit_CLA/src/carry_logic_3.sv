module carry_logic_3 (
    input logic p0,
    input logic g0,
    input logic p1,
    input logic g1,
    input logic p2,
    input logic g2,
    input logic p3,
    input logic g3,
    input logic ci0,
    output logic co
);

    logic nand1_out;  
    logic nand2_out;  
    logic nand3_out;  
    logic nand4_out;  
    logic nand5_out;  


// co3  = g3  + p3 g2  + p3 p2 g1  + p3 p2 p1 g0  + p3 p2 p1 p0 ci0


nand5_delay u1 (
	.in1(p0), 
	.in2(p1), 
    .in3(p2),
    .in4(p3),
    .in5(ci0),
	.out(nand1_out)
	); 

nand4_delay u2 (
	.in1(p1), 
	.in2(p2), 
    .in3(p3),
    .in4(g0),
	.out(nand2_out)
	); 

nand3_delay u3 (
	.in1(p3), 
	.in2(p2), 
    .in3(g1),
	.out(nand3_out)
	); 

nand2_delay u4 (
	.in1(p3), 
	.in2(g2), 
	.out(nand4_out)
	); 

nand2_delay u5 (
	.in1(g3), 
	.in2(g3), 
	.out(nand5_out)
	); 

nand5_delay u6 (
	.in1(nand1_out), 
	.in2(nand2_out), 
    .in3(nand3_out), 
    .in4(nand4_out),
    .in5(nand5_out),
	.out(co)
	); 

endmodule