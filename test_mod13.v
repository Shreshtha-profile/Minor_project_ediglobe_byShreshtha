`timescale 1ns / 1ps

module test_mod13;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] count;

	// Instantiate the Unit Under Test (UUT)
	mod_13_counter uut (
		.clk(clk), 
		.rst(rst), 
		.count(count)
	);

	initial begin
		// clock initialization
			clk = 0;
			forever #5 clk=~clk; // 10 units time period
		end

		 // Test counter
    initial begin
        $display("Time\tReset\tCount");
        $monitor("%0t\t%b\t%b", $time, rst, count);

        // Apply reset
        rst = 1; #10;
        rst = 0;

        // Run for several cycles to observe multiple MOD-13 wraps
        #300;
		  
		  $finish;
 

	end
      
endmodule

