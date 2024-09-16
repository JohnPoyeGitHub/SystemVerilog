`timescale 1ns / 1ps

module nand4_delay ( 
	input logic in1,   // First input 
	input logic in2,   // Second input 
    input logic in3,   // third input 
    input logic in4,   // fourth input 
	output logic out   // Output 
	); 

// Continuous assignment for XOR gate 
    assign #1.5ns out = ~(in1 & in2 & in3 & in4);  // Perform the XOR operation after the delay
	//assign y = ~(a & b & c & d);  // Perform the XOR operation after the delay

	
endmodule