`timescale 1ns / 1ps


module testbench_jkff;

	// Inputs
	reg clk;
	reg reset;
	reg J;
	reg K;

	// Outputs
	wire Q;

	// Instantiate the Unit Under Test (UUT)
	jkff_to_dff uut (
		.clk(clk), 
		.reset(reset), 
		.J(J), 
		.K(K), 
		.Q(Q)
	);

	initial begin
		//Clock generation
		clk=0;
		forever #5 clk=~clk; //clock for 10 units time period

	end
	
	//Test sequence 
	initial begin
        $display("Time\tJ\tK\tQ");
        $monitor("%0t\t%b\t%b\t%b", $time, J, K, Q);

        // Initialize
        reset = 1; //here we first initialze reset to 1 for some time that all inputs start from zero level.
        J = 0;
        K = 0;
        #10;

        reset = 0; 

        // Test all input combinations with a few clock cycles in between
        J = 0; K = 0; #10; // No change
        J = 0; K = 1; #10; // Reset
        J = 1; K = 0; #10; // Set
        J = 1; K = 1; #10; // Toggle
        J = 1; K = 1; #10; // Toggle again
		  
		  #200;
		 end
      
endmodule


