`timescale 1ns / 1ps

module ALU_ctrl( funct, ALU_OP,ALU_CTRL );
    input [5:0] funct;
	input [1:0] ALU_OP;
    output reg[3:0]ALU_CTRL;
    
    always@(funct)
	begin
		if(funct==6'b100000) ALU_CTRL=4'b0010; //add
		if(funct==6'b100010) ALU_CTRL=4'b0110; //sub
		if(funct==6'b101010) ALU_CTRL=4'b0111; //slt
    end
endmodule