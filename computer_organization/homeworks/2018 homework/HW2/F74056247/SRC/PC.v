`timescale 1ns / 1ps

module PC(CLK, START, PC);

	input CLK, START;
	output [15:0] PC;
	reg [15:0] PC;
	
	initial begin
		PC = 0;
	end
	
	always@(posedge CLK) begin
		if(START == 1)
			PC <= PC + 1;
		else
			PC <= PC;
	end	

endmodule
