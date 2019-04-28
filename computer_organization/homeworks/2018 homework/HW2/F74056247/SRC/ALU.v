`timescale 1ns / 1ps

module ALU( source1,source2,ALU_CTRL,result);
    input [15:0] source1;
    input [15:0] source2;
    input [3:0] ALU_CTRL;
    output reg[15:0] result;

    always@(ALU_CTRL)
	begin
		if(ALU_CTRL==4'b0010) result=source1+source2; //add
		if(ALU_CTRL==4'b0110) result=source1-source2; //sub
		if(ALU_CTRL==4'b0111) result=source1<source2; //slt Got the idea from the expression, good
	end
endmodule