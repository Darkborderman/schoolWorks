`timescale 1ns / 1ps

module Decoder( OP, Reg_WE, DM_WE, ALU_OP, ALU_src,MEM_to_REG,REG_Dst,funct);
	input [5:0] OP;
	input [5:0] funct;
	output reg Reg_WE, DM_WE, ALU_src,MEM_to_REG,REG_Dst;
	output reg [1:0] ALU_OP;
	
	always@(funct)
	begin
		if(funct==6'b100000)
		begin
			Reg_WE=1;
			ALU_src=0;
			MEM_to_REG=0;
			REG_Dst=1;
			ALU_OP=2'b10;
		end
		if(funct==6'b100010)
		begin
			Reg_WE=1;
			ALU_src=0;
			MEM_to_REG=0;
			REG_Dst=1;
			ALU_OP=2'b10;
		end
		if(funct==6'b101010)
		begin
			Reg_WE=1;
			ALU_src=0;
			MEM_to_REG=0;
			REG_Dst=1;
			ALU_OP=2'b10;
		end
	end
endmodule