// ADD

module ADD ( A,
			 B,
			 Cout);

	parameter n = 16;

	input  [n-1:0] A;
	input  [n-1:0] B;

	output [n-1:0] Cout;

	assign Cout = A + B;

endmodule





