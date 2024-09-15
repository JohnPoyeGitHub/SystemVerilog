`timescale 1ns / 1ps

module nand3_delay ( 
	input logic in1,   // First input 
	input logic in2,   // Second input 
	input logic in3,   // third input 
	output logic out   // Output 
	); 

// Continuous assignment for XOR gate 
    assign #1.25ns out = ~(in1 & in2 & in3);  // Perform the XOR operation after the delay
	//assign y = ~(a & b & c);  // Perform the XOR operation after the delay
endmodule