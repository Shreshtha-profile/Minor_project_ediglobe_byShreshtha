`timescale 1ns / 1ps

//D flip flop 
module dff( input clk,rst,d, output reg q);
    
	 always@(posedge clk or posedge rst)
		begin
			if(rst)
				q<=1'b0;
			else
				q<=d;
		end
	
endmodule

// MOD 13 up cunter using above defined D flip flop

module mod_13_counter(input clk,rst , output [3:0]count);
		
		wire [3:0]q;
		wire [3:0]d;
		
		assign count=q;  //output current state
		wire [3:0]nxt_cnt;
		
		assign nxt_cnt=(q==4'd12)? 4'd0:q+1; //checks if current state of counter if 12 then next state will go to 0.
		assign d=nxt_cnt;
		
		//Instantiate 4 flip flops
		dff dff0(.clk(clk),.rst(rst),.d(d[0]),.q(q[0]));
		dff dff1(.clk(clk),.rst(rst),.d(d[1]),.q(q[1]));
		dff dff2(.clk(clk),.rst(rst),.d(d[2]),.q(q[2]));
		dff dff3(.clk(clk),.rst(rst),.d(d[3]),.q(q[3]));
		
		
		
endmodule
