`timescale 1ns / 1ps

module sign_extend(immediate_in, sign_extend );
    input [13:0] immediate_in;
	output [15:0] sign_extend;

	assign sign_extend=immediate_in*4;
endmodule