`timescale 1ns / 1ps

module PC(CLK, START, PC_In, PC_Out);

	input CLK, START;
	input [15:0] PC_In;
	output [15:0] PC_Out;
	reg [15:0] PC_Out;
	
	initial begin
		PC_Out = 0;
	end
	
	always@(posedge CLK) begin
		if(START == 1)
			PC_Out <= PC_In;
		else
			PC_Out <= 0;
	end	

endmodule
