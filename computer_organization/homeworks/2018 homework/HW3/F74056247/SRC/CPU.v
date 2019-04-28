`timescale 1ns / 1ps

module CPU(CLK, START);

	input CLK, START;
	//PC and Instruction memory net
	wire [15:0] PC_In;
	wire [15:0] PC_Out;
	wire [25:0] Instr;
	
	//Register file net
	wire [2:0] RS_ID, RT_ID, RD_ID, Reg_W_ID;
	wire [15:0] Reg_RData1, Reg_RData2, Reg_WData;
	
	//Decoder(Control) net
	wire [5:0] OP;
	wire Reg_Dst;
	wire Jump;
	wire Branch;
	wire Mem_Read;
	wire Mem_to_Reg;
	wire [1:0] ALU_OP;
	wire Mem_Write;
	wire ALU_Src;	
	wire Reg_Write;
	
	//Sign-extend net
	wire [13:0] Immediate_In;
	wire [15:0] Extend_Sign;
	
	//ALU control net
	wire [5:0] Funct;
	wire [3:0] ALU_Ctrl_Out;
	
	//ALU net
	wire [15:0] ALU_Src1, ALU_Src2, ALU_Result;
	wire Zero;
	
	//Data memory net
	wire [15:0] DM_RData, DM_WData, Address;
	
	//MUXs net
	wire [15:0] MUX_Src2_to_ALU;
	wire [15:0] MUX_Mem_to_Reg_Out;
	wire [2:0]  MUX_Inst_to_Reg;
	wire [15:0] MUX_Branch_Out;
	wire [15:0] MUX_Jump_Out;
	wire [15:0] Jump_Address;
	
	//Adders net
	wire [15:0] PC_Count_Add_Src1, PC_Count_Add_Src2, PC_Count_Add_Result;
	wire [15:0] Branch_Add_Src1, Branch_Add_Src2, Branch_Add_Result;
	
	//Other net
	wire Branch_Select;
	
	//Old module
	PC i_PC(CLK, START, PC_In, PC_Out);
	IM i_IM(START, PC_Out, Instr);
	Reg i_Reg(CLK, RS_ID, RT_ID, Reg_W_ID, Reg_Write, Reg_WData, Reg_RData1, Reg_RData2);
	Decoder i_Decoder(OP, Reg_Dst, Jump, Branch, Mem_Read, Mem_to_Reg, ALU_OP, Mem_Write, ALU_Src, Reg_Write);
	sign_extend i_Sign_Extend(Immediate_In, Extend_Sign);
	ALU_ctrl i_ALU_Ctrl(Funct, ALU_OP, ALU_Ctrl_Out);
	ALU i_ALU(ALU_Src1, ALU_Src2, ALU_Ctrl_Out, ALU_Result, Zero);
	DM i_DM(CLK, Address, Mem_Write, Mem_Read, DM_WData, DM_RData);
	MUX_2_to_1 #(.size(16))MUX_Mem_to_Reg(ALU_Result, DM_RData, Mem_to_Reg, MUX_Mem_to_Reg_Out);
	MUX_2_to_1 #(.size(3)) MUX_Reg_Dst(RT_ID, RD_ID, Reg_Dst, MUX_Inst_to_Reg);
	MUX_2_to_1 #(.size(16))MUX_ALUSrc(Reg_RData2, Extend_Sign, ALU_Src, MUX_Src2_to_ALU);
	
	//New module
	MUX_2_to_1 #(.size(16))MUX_Branch(PC_Count_Add_Result, Branch_Add_Result, Branch_Select, MUX_Branch_Out);
	MUX_2_to_1 #(.size(16))MUX_Jump(MUX_Branch_Out, Jump_Address, Jump, MUX_Jump_Out);
	Add PC_Count_Add(PC_Count_Add_Src1, PC_Count_Add_Src2, PC_Count_Add_Result);
	Add Branch_Add(Branch_Add_Src1, Branch_Add_Src2, Branch_Add_Result);
	
	//PC net assignment
	assign PC_In = MUX_Jump_Out;
	
	//Register file net assignment
	assign RS_ID = Instr[19:17];
	assign RT_ID = Instr[16:14];
	assign RD_ID = Instr[13:11];
	assign Reg_W_ID = MUX_Inst_to_Reg;
	assign Reg_WData = MUX_Mem_to_Reg_Out;
	
	//Decoder(Control) net assignment
	assign OP = Instr[25:20];
	
	//Sign-extend net assignment
	assign Immediate_In = Instr[13:0];
	
	//ALU control net assignment
	assign Funct = Instr[5:0];
	
	//ALU net assignment
	assign ALU_Src1 = Reg_RData1;
	assign ALU_Src2 = MUX_Src2_to_ALU;
	
	//Data memory net assignment
	assign DM_WData = Reg_RData2;
	assign Address = ALU_Result;
	
	//MUXs net assignment
	assign Jump_Address = Instr[15:0];
	
	//Adders net assignment
	assign PC_Count_Add_Src1 = PC_Out;
	assign PC_Count_Add_Src2 = 1;
	assign Branch_Add_Src1 = PC_Count_Add_Result;
	assign Branch_Add_Src2 = Extend_Sign;
	
	//Other net assignment
	assign Branch_Select = Branch&Zero;
	
endmodule
