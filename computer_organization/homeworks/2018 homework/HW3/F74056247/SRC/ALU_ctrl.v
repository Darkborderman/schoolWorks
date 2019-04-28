`timescale 1ns / 1ps

module ALU_ctrl(Funct, ALU_OP, ALU_Ctrl_Out);

    input [5:0] Funct;
	input [1:0] ALU_OP;
    output [3:0] ALU_Ctrl_Out;
	reg [3:0]ALU_Ctrl_Out;
	
	////  ALUOP  ////   ////  Function  ////
	//  R-type 10  //   //   add 100000   //
	//  beq    01  //   //   sub 100010   //
	//  else   00  //   //   slt 101010   //
	/////////////////   ////////////////////
	
	///  ALUOP  Function  ALU_Ctrl  ///
	//    10     000000     0000     //
	//    10     100000     0010     //
	//    10     100010     0110     //
	//    10     101010     0111     //
	//    01     XXXXXX     0110     //
	//    00     XXXXXX     0010     //
	///////////////////////////////////
	

	always@(Funct or ALU_OP)
	begin
		if(ALU_OP==2'b00) ALU_Ctrl_Out=4'b0010;
		else if(ALU_OP==2'b01) ALU_Ctrl_Out=4'b0110;
		else if(Funct==6'b000000&&ALU_OP==2'b10) ALU_Ctrl_Out=4'b0000;
		else if(Funct==6'b100000&&ALU_OP==2'b10) ALU_Ctrl_Out=4'b0010;
		else if(Funct==6'b100010&&ALU_OP==2'b10) ALU_Ctrl_Out=4'b0110;
		else if(Funct==6'b101010&&ALU_OP==2'b10) ALU_Ctrl_Out=4'b0111;
    end
	
endmodule
