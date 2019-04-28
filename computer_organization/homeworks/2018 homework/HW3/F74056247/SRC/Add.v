`timescale 1ns / 1ps

module Add(Source1, Source2, Result);

	input [15:0] Source1, Source2;
	output [15:0] Result;
	
	assign Result=Source1+Source2;

endmodule
