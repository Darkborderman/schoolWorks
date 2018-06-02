// top
`include "PC.v"
`include "ADD.v"
`include "Controller.v"
`include "Registers.v"
`include "Mux2to1.v"
`include "Mux4to1.v"
`include "sign_extend.v"
`include "ALU.v"
`include "Jump_Ctrl.v"

module top ( clk,
             rst,
			 // Instruction Memory
			 IM_Address,
             Instruction,
			 // Data Memory
			 DM_Address,
			 DM_enable,
			 DM_Write_Data,
			 DM_Read_Data);

	parameter data_size = 32;
	parameter mem_size = 16;	

	input  clk, rst;
	
	// Instruction Memory
	output [mem_size-1:0] IM_Address;	
	input  [data_size-1:0] Instruction;

	// Data Memory
	output [mem_size-1:0] DM_Address;
	output DM_enable;
	output [data_size-1:0] DM_Write_Data;	
    input  [data_size-1:0] DM_Read_Data;
	
	// PC
	parameter pc_size = 18;
	wire [pc_size-1:0] PCout;
	wire [pc_size-1:0] PC_add4;
	wire [pc_size-1:0] PC_add8;
	
	
	// Controller
	wire [5:0] opcode;
	wire [5:0] funct;
	
	wire Reg_imm;
	wire Jump;
	wire Branch;
	wire Jal;
	wire Jr;
	wire MemtoReg;
	wire [3:0] ALUOp;
	wire RegWrite;
	wire MemWrite;
	
	// Registers
	wire [4:0] Rd;
	wire [4:0] Rs;
	wire [4:0] Rt;
	
	wire [4:0] Rd_Rt_out;
	wire [4:0] WR_out;
	wire [data_size-1:0] WD_out;
	
	wire [data_size-1:0] Rs_data;
	wire [data_size-1:0] Rt_data;
	
	// sign_extend	
	wire [15:0] imm;
	wire [data_size-1:0] se_imm;
	
	// ALU
	wire [data_size-1:0] scr2;
	wire [4:0] shamt;	
	wire [data_size-1:0] ALU_result;
	wire Zero;
	
	//Jump Part
	wire [pc_size-1:0] BranchAddr;
	wire [pc_size-1:0] JumpAddr;
	wire [1:0] JumpOP;
	wire [pc_size-1:0] PCin;
	
	// write back
	wire [data_size-1:0] WB_data;
	
	// Wire connect
	/*-----------------------------------------------------------*/
		// PC
	assign IM_Address	 = PCout[pc_size-1:2];
		// Controller
	assign opcode		 = Instruction[31:26];
	assign funct		 = Instruction[5:0];
		// Registers
	assign Rd			 = Instruction[15:11];
	assign Rs			 = Instruction[25:21];
	assign Rt			 = Instruction[20:16];
		// sign_extend
	assign imm			 = Instruction[15:0];
		// ALU
	assign shamt		 = Instruction[10:6];
	assign JumpAddr		 = {Instruction[15:0],2'b0};
		// Data Memory
	assign DM_Address	 = ALU_result[17:2];
	assign DM_enable	 = MemWrite;
	assign DM_Write_Data = Rt_data;
	
	// CPU
	/*-----------------------------------------------------------*/	
	// PC
	PC#(pc_size) PC1 ( .clk(clk), 
					   .rst(rst),
					   .PCin(PCin), 
					   .PCout(PCout));
					   
	ADD#(pc_size) ADD_Plus4 ( 
	.A(PCout),
	.B(18'd4),
	.Cout(PC_add4)
	);
	
	ADD#(pc_size) ADD_Plus_other_4 (	
	.A(PC_add4),	
	.B(18'd4),	
	.Cout(PC_add8)
	);	
	
	// Controller
	Controller Controller1 ( 
	.opcode(opcode),
	.funct(funct),
	.Reg_imm(Reg_imm),
	.Jump(Jump),
	.Branch(Branch),
	.Jal(Jal),
	.Jr(Jr),
	.MemtoReg(MemtoReg),
	.ALUOp(ALUOp),
	.RegWrite(RegWrite),
	.MemWrite(MemWrite)
	);
	
	// Registers
	Mux2to1#(5) Rd_Rt ( 
	.I0(Rd),
	.I1(Rt),
	.S(Reg_imm),
	.out(Rd_Rt_out)
	);
	
	Mux2to1#(5) WR ( 
	.I0(Rd_Rt_out),
	.I1(5'd31),
	.S(Jal),
	.out(WR_out)
	);
	
	Mux2to1#(data_size) WD (
	.I0(WB_data),
	.I1({14'b0,PC_add8}),
	.S(Jal),
	.out(WD_out)
	);	
	
	Registers Registers1 ( 
	.clk(clk), 
	.rst(rst),
	.Read_addr_1(Rs),
	.Read_addr_2(Rt),
	.Read_data_1(Rs_data),
	.Read_data_2(Rt_data),
	.RegWrite(RegWrite),
	.Write_addr(WR_out),
	.Write_data(WD_out)
	);
	
	// sign_extend	
	sign_extend sign_extend1 ( 
	.in(imm),
	.out(se_imm)
	);
	
	// ALU
	Mux2to1#(data_size) Rt_imm (
	.I0(Rt_data),
	.I1(se_imm),
	.S(Reg_imm),
	.out(scr2)
	);	
	
	ALU ALU1 ( 
	.ALUOp(ALUOp),
	.scr1(Rs_data),
	.scr2(scr2),
	.shamt(shamt),
	.ALU_result(ALU_result),
	.Zero(Zero)
	);
	
	//Jump Part
	ADD#(pc_size) ADD_Branch ( 
	.A(PC_add4),
	.B({se_imm[15:0],2'b0}),
	.Cout(BranchAddr)
	);
	
	Mux4to1#(pc_size) PC_Mux (
	.I0(PC_add4),
	.I1(BranchAddr),
	.I2(Rs_data[pc_size-1:0]),
	.I3(JumpAddr),
	.S(JumpOP),
	.out(PCin)
	);
	
	Jump_Ctrl Jump_Ctrl1 (
	.Branch(Branch),
    .Zero(Zero),
    .Jr(Jr),
    .Jump(Jump),
    .JumpOP(JumpOP)
	);

	// write back
	Mux2to1#(data_size) WB_Mux (
    .I0(ALU_result),
    .I1(DM_Read_Data),
    .S(MemtoReg),
    .out(WB_data)
    );	
	
endmodule


























