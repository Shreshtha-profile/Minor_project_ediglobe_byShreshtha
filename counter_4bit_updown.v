`timescale 1ns / 1ps
module counter_4bit_updown(
    input clk,              // Clock signal
    input rst,              // Asynchronous reset
    input up_down,          // Direction control: 1 = up, 0 = down
    output reg [3:0] count  // 4-bit counter output
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b0000;
        else if (up_down)
            count <= count + 1;
        else
            count <= count - 1;
    end

endmodule

