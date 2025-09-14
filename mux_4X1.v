`timescale 1ns / 1ps
//Realize the function using 4x1 multiplexer module f(a,b,c) = (a+b`) (b`+c) a) Find the
//minterms of the function realize by the circuit shown , write the HDL for the function.
 module mux_4x1_(
    input wire a,b,c,
	 output reg y
);
	wire [1:0]sel;
	assign sel={b,c};
	
 always@(*)
	begin
		case(sel)
			2'b00: y=~a;
			2'b01: y=~a;
			2'b10: y=a;
			2'b11: y=a;
		endcase
	end
	
endmodule

