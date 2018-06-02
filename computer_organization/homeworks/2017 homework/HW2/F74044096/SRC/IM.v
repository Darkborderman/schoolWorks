// Instruction Memory

module IM (	clk,
			rst,
			IM_Address,
			Instruction);

	parameter bit_size = 32;
	parameter mem_size = 16;

	input  clk, rst;
	input  [mem_size-1:0] IM_Address;
	
	output [bit_size-1:0] Instruction;
	
	reg [bit_size-1:0] IM_data [0:( 2**mem_size-1 )];	
	
	assign Instruction = IM_data[IM_Address];
	
endmodule







