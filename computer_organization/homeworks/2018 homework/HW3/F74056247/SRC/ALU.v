`timescale 1ns / 1ps

module ALU(Source1, Source2, ALU_Ctrl, Result, Zero);

    input [15:0] Source1;
    input [15:0] Source2;
    input [3:0] ALU_Ctrl;
    output [15:0] Result;
    output Zero;
	
	/// ALU_Ctrl  ///
	//  0010  add  //
	//  0110  sub  //
	//  0111  slt  //
	/////////////////
	
	assign Result = ALU_Ctrl[0] ? ((Source1 < Source2) ? 1 : 0) : (ALU_Ctrl[2] ? Source1 - Source2 : (ALU_Ctrl[1] ? Source1 + Source2 : Source1));
	assign Zero = !Result;

endmodule
