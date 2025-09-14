`timescale 1ns / 1ps
// 1. Realize JKFF using DFF and write verilog code for a jk flip flop and its testbench.Use all possible combination of input to test its working.

// To convert JK flip flop to D flip flop we use the following equation:-
// D=J~Q + ~KQ

//Verilog code...
module jkff_to_dff( input wire clk,input wire reset,input wire J,input wire K, output reg Q);
     wire D;

    // JK to D conversion logic
    assign D = (J & ~Q) | (~K & Q);

    always @(posedge clk or posedge reset) 
		begin
        if (reset)
            Q <= 0;
        else
            Q <= D;
		end

endmodule
