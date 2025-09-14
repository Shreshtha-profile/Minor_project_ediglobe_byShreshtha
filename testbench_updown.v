`timescale 1ns / 1ps
module testbench_updown;

    reg clk;
    reg rst;
    reg up_down;
    wire [3:0] count;

    // Instantiate the counter
    up_down_counter uut (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .count(count)
    );
// Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        up_down = 1;

        // Apply reset
        #10 rst = 0;

        // Count up for 10 cycles
        #100 up_down = 0;

        // Count down for 10 cycles
        #100;

        
      
    end
	 // Monitor count value
    initial begin
        $monitor("Time=%0t | Reset=%b | Up_Down=%b | Count=%b", $time, rst, up_down, count);
    end

endmodule

