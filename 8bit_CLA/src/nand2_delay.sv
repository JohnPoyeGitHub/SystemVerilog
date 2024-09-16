`timescale 1ns / 1ps

module nand2_delay ( 
	input logic in1,   // First input 
	input logic in2,   // Second input 
	output logic out   // Output 
	); 

// Continuous assignment for XOR gate 
    assign #1ns out = ~(in1 & in2);  // Perform the XOR operation after the delay
	
endmodule