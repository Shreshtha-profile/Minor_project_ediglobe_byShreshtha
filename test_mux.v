`timescale 1ns / 1ps


module test_mux;

	// Inputs
	reg a;
	reg b;
	reg c;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	mux_4x1_ uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.y(y)
	);
	
	integer i;
	
	initial begin
        $display("Time\t a b c | y");
        $display("-------------------");
        $monitor("%4t\t %b %b %b | %b", $time, a, b, c, y);

        // Loop through all 8 combinations of a, b, c
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, c} = i;  // Assign a, b, c from i
            #10;            // Wait 10 ns
        end

        #300;
      end
endmodule

