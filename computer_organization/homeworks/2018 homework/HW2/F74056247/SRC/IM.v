`timescale 1ns / 1ps

module IM(START, PC, Instr);

	input START;
	input [15:0] PC;
	output [25:0] Instr;
	reg [25:0] InstrMemory [0:31];
	integer i;
	
	assign Instr = (START == 1 && PC >=0 && PC < 32) ? InstrMemory[PC] : 0;

endmodule
