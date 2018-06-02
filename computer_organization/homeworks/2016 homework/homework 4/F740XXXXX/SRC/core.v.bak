// top
`include "PC.v"
`include "ADD.v"
`include "IF_ID.v"
`include "HDU.v"
`include "Controller.v"
`include "Registers.v"
`include "sign_extend.v"
`include "Mux2to1.v"
`include "ID_EX.v"
`include "Mux4to1.v"
`include "Jump_Ctrl.v"
`include "FU.v"
`include "ALU.v"
`include "EX_M.v"
`include "M_WB.v"

module core (
			  clk,
              rst,
			  // Instruction Cache
			  IC_stall,
			  IC_Address,
              Instruction,
			  // Data Cache
			  DC_stall,
			  DC_Address,
			  DC_Read_enable,
			  DC_Write_enable,
			  DC_Write_Data,
			  DC_Read_Data
			  );

	parameter data_size = 32;
	parameter mem_size = 16;
	parameter pc_size = 18;
	
	input  clk, rst;
	
	// Instruction Cache
	input  IC_stall;
	output [mem_size-1:0] IC_Address;
	input  [data_size-1:0] Instruction;
	
	// Data Cache
	input  DC_stall;
	output [mem_size-1:0] DC_Address;
	output DC_Read_enable;
	output DC_Write_enable;
	output [data_size-1:0] DC_Write_Data;
    input  [data_size-1:0] DC_Read_Data;
	
	// PC
	wire [pc_size-1:0] PCout;
	wire [pc_size-1:0] PC_add4;
	
	// IF_ID pipe
	wire [pc_size-1:0]   ID_PC;
	wire [data_size-1:0] ID_ir;
	
	// Hazard Detection Unit
	wire PCWrite;
	wire IF_IDWrite;
	wire ID_EXWrite;
	wire EX_MWrite;
	wire M_WBWrite;	
	wire IF_Flush;
	wire ID_Flush;
	
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
	wire [data_size-1:0] Rs_data;
	wire [data_size-1:0] Rt_data;
	
	// sign_extend
	wire [15:0] imm;
	wire [data_size-1:0] se_imm;
	
	// ID Mux part
	wire [4:0] Rd_Rt_out;
	wire [4:0] WR_out;
	
	// ID_EX
	wire [4:0] shamt;
	// WB
	wire EX_MemtoReg;
	wire EX_RegWrite;
	// M
	wire EX_MemWrite;
	wire EX_Jal;
	// EX
	wire EX_Reg_imm;
	wire EX_Jump;
	wire EX_Branch;
	wire EX_Jr;		
	// pipe
	wire [pc_size-1:0] EX_PC;
	wire [3:0] EX_ALUOp;
	wire [4:0] EX_shamt;
	wire [data_size-1:0] EX_Rs_data;
	wire [data_size-1:0] EX_Rt_data;
	wire [data_size-1:0] EX_se_imm;
	wire [4:0] EX_WR_out;
	wire [4:0] EX_Rs;
	wire [4:0] EX_Rt;

	//Jump Part
	wire [pc_size-1:0] BranchAddr;
	wire [pc_size-1:0] JumpAddr;
	wire [1:0] EX_JumpOP;
	wire [pc_size-1:0] PCin;
	
	// Forwarding Unit part
	wire enF1;
	wire enF2;
	wire sF1;
	wire sF2;
	wire [data_size-1:0] sF1_data;
	wire [data_size-1:0] sF2_data;
	wire [data_size-1:0] enF1_data;
	wire [data_size-1:0] enF2_data;
	
	// ALU part
	wire [data_size-1:0] scr2;	
	wire [data_size-1:0] EX_ALU_result;
	wire EX_Zero;
	
	// Jal PCplus4
	wire [pc_size-1:0] EX_PC_add4;
	
	// EX_M
	// WB
	wire M_MemtoReg;	
	wire M_RegWrite;	
	// M	
	wire M_MemWrite;	
	wire M_Jal;		
	// pipe		  
	wire [data_size-1:0] M_ALU_result;
	wire [data_size-1:0] M_Rt_data;
	wire [pc_size-1:0] M_PCplus8;
	wire [4:0] M_WR_out;
	
	// M Jal part
	wire [data_size-1:0] M_WD_out;
	
	// M_WB
	// WB
	wire WB_MemtoReg;
	wire WB_RegWrite;
	// pipe
    wire [data_size-1:0] WB_DC_Read_Data;
    wire [data_size-1:0] WB_WD_out;
    wire [4:0] WB_WR_out;
	
	// DM WD Select
	wire [data_size-1:0] WB_Final_WD_out;
	
	// Wire connect
	/*-----------------------------------------------------------*/
		// PC
	assign IC_Address		 = PCout[pc_size-1:2];	
		// Controller	
	assign opcode			 = ID_ir[31:26];
	assign funct			 = ID_ir[5:0];	
		// Registers	
	assign Rd				 = ID_ir[15:11];
	assign Rs				 = ID_ir[25:21];
	assign Rt				 = ID_ir[20:16];
		// sign_extend	
	assign imm				 = ID_ir[15:0];
		// ID_EX	
	assign shamt			 = ID_ir[10:6];
		//Jump Part	
	assign JumpAddr			 = {EX_se_imm[15:0],2'b0};
		// Data Cache	
	assign DC_Address		 = M_ALU_result[17:2];
	assign DC_Read_enable	 = M_MemtoReg;
	assign DC_Write_enable	 = M_MemWrite;
	assign DC_Write_Data	 = M_Rt_data;
	
	// core
	// IF
	/*-----------------------------------------------------------*/	
	// PC
	PC PC1 ( 
	.clk(clk), 
	.rst(rst),
	.PCWrite(PCWrite),
	.PCin(PCin), 
	.PCout(PCout)
	);
	
	ADD#(pc_size) ADD_Plus4 ( 
	.A(PCout),
	.B(18'd4),
	.Cout(PC_add4)
	);
	
	// IF_ID pipe
	/*-----------------------------------------------------------*/	
	IF_ID IF_ID1 ( 
	.clk(clk),
	.rst(rst),
	// input
	.IF_IDWrite(IF_IDWrite),
	.IF_Flush(IF_Flush),
	.IF_PC(PC_add4),
	.IF_ir(Instruction),
	// output
	.ID_PC(ID_PC),
	.ID_ir(ID_ir)
	);
	
	// ID
	/*-----------------------------------------------------------*/	
	// Hazard Detection Unit
	HDU HDU1 ( 
	// input
	.IC_stall(IC_stall),
	.DC_stall(DC_stall),
	.ID_Rs(Rs),
    .ID_Rt(Rt),
	.EX_WR_out(EX_WR_out),
	.EX_MemtoReg(EX_MemtoReg),
	.EX_JumpOP(EX_JumpOP),
	// output
	.PCWrite(PCWrite),			 
	.IF_IDWrite(IF_IDWrite),
	.ID_EXWrite(ID_EXWrite),
	.EX_MWrite(EX_MWrite),
	.M_WBWrite(M_WBWrite),
	.IF_Flush(IF_Flush),
	.ID_Flush(ID_Flush)
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
	Registers Registers1 ( 
	.clk(clk), 
	.rst(rst),
	.Read_addr_1(Rs),
	.Read_addr_2(Rt),
	.Read_data_1(Rs_data),
	.Read_data_2(Rt_data),
	.RegWrite(WB_RegWrite),
	.Write_addr(WB_WR_out),
	.Write_data(WB_Final_WD_out)
	);
	
	// sign_extend	
	sign_extend sign_extend1 ( 
	.in(imm),
	.out(se_imm)
	);
	
	// ID Mux part
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
	
	// ID_EX pipe
	/*-----------------------------------------------------------*/	
	ID_EX ID_EX1 ( 
	.clk(clk), 
	.rst(rst),
    // input
	.ID_EXWrite(ID_EXWrite),
	.ID_Flush(ID_Flush),
	// WB
	.ID_MemtoReg(MemtoReg),
	.ID_RegWrite(RegWrite),
	// M
	.ID_MemWrite(MemWrite),
	.ID_Jal(Jal),
	// EX
	.ID_Reg_imm(Reg_imm),
	.ID_Jump(Jump),
	.ID_Branch(Branch),
	.ID_Jr(Jr),			   
	// pipe
	.ID_PC(ID_PC),
	.ID_ALUOp(ALUOp),
	.ID_shamt(shamt),
	.ID_Rs_data(Rs_data),
	.ID_Rt_data(Rt_data),
	.ID_se_imm(se_imm),
	.ID_WR_out(WR_out),
	.ID_Rs(Rs),
	.ID_Rt(Rt),
	// output
	// WB
	.EX_MemtoReg(EX_MemtoReg),
	.EX_RegWrite(EX_RegWrite),
	// M
	.EX_MemWrite(EX_MemWrite),
	.EX_Jal(EX_Jal),
	// EX
	.EX_Reg_imm(EX_Reg_imm),
	.EX_Jump(EX_Jump),
	.EX_Branch(EX_Branch),
	.EX_Jr(EX_Jr),
	// pipe
	.EX_PC(EX_PC),
	.EX_ALUOp(EX_ALUOp),
	.EX_shamt(EX_shamt),
	.EX_Rs_data(EX_Rs_data),
	.EX_Rt_data(EX_Rt_data),
	.EX_se_imm(EX_se_imm),
	.EX_WR_out(EX_WR_out),
	.EX_Rs(EX_Rs),
	.EX_Rt(EX_Rt)		   			   
	);
	// EX
	/*-----------------------------------------------------------*/	
	// Jump Part
	ADD#(pc_size) ADD_Branch ( 
	.A(EX_PC),
	.B({EX_se_imm[15:0],2'b0}),
	.Cout(BranchAddr)
	);
	
	Mux4to1#(pc_size) PC_Mux (
	.I0(PC_add4),
	.I1(BranchAddr),
	.I2(EX_Rs_data[pc_size-1:0]),
	.I3(JumpAddr),
	.S(EX_JumpOP),
	.out(PCin)
	);
	
	Jump_Ctrl Jump_Ctrl1 (
	.Branch(EX_Branch),
    .Zero(EX_Zero),
    .Jr(EX_Jr),
    .Jump(EX_Jump),
    .JumpOP(EX_JumpOP)
	);
	
	// Forwarding Unit part
	FU FU1 ( 
	// input 
	.EX_Rs(EX_Rs),
    .EX_Rt(EX_Rt),
	.M_RegWrite(M_RegWrite),
	.M_WR_out(M_WR_out),
	.WB_RegWrite(WB_RegWrite),
	.WB_WR_out(WB_WR_out),
	// output
	.enF1(enF1),
	.enF2(enF2),
	.sF1(sF1),
	.sF2(sF2)	
	);
	
	Mux2to1#(data_size) sF1_Mux ( 
	.I0(M_WD_out),
	.I1(WB_Final_WD_out),
	.S(sF1),
	.out(sF1_data)
	);
	
	Mux2to1#(data_size) sF2_Mux ( 
	.I0(M_WD_out),
	.I1(WB_Final_WD_out),
	.S(sF2),
	.out(sF2_data)
	);
	
	Mux2to1#(data_size) enF1_Mux ( 
	.I0(EX_Rs_data),
	.I1(sF1_data),
	.S(enF1),
	.out(enF1_data)
	);
	
	Mux2to1#(data_size) enF2_Mux ( 
	.I0(EX_Rt_data),
	.I1(sF2_data),
	.S(enF2),
	.out(enF2_data)
	);
	
	// ALU part
	Mux2to1#(data_size) Rt_imm (
	.I0(enF2_data),
	.I1(EX_se_imm),
	.S(EX_Reg_imm),
	.out(scr2)
	);	
	
	ALU ALU1 ( 
	.ALUOp(EX_ALUOp),
	.scr1(enF1_data),
	.scr2(scr2),
	.shamt(EX_shamt),
	.ALU_result(EX_ALU_result),
	.Zero(EX_Zero)
	);
	
	// Jal PCplus4
	ADD#(pc_size) ADD_Plus4_2 ( 
	.A(EX_PC),
	.B(18'd4),
	.Cout(EX_PC_add4)
	);
	
	// EX_M pipe
	/*-----------------------------------------------------------*/	
	EX_M EX_M1 ( 
	.clk(clk),
	.rst(rst),
	// input 
	.EX_MWrite(EX_MWrite),
	// WB
	.EX_MemtoReg(EX_MemtoReg),
	.EX_RegWrite(EX_RegWrite),
	// M
	.EX_MemWrite(EX_MemWrite),
	.EX_Jal(EX_Jal),
	// pipe
	.EX_ALU_result(EX_ALU_result),
	.EX_Rt_data(enF2_data),
	.EX_PCplus8(EX_PC_add4),
	.EX_WR_out(EX_WR_out),
	// output
	// WB
	.M_MemtoReg(M_MemtoReg),
	.M_RegWrite(M_RegWrite),
	// M
	.M_MemWrite(M_MemWrite),
	.M_Jal(M_Jal),
	// pipe
	.M_ALU_result(M_ALU_result),
	.M_Rt_data(M_Rt_data),
	.M_PCplus8(M_PCplus8),
	.M_WR_out(M_WR_out)			  		  			  
	);
	
	// M
	/*-----------------------------------------------------------*/	
	// M Jal part
	Mux2to1#(data_size) Jal_RD_Select (
	.I0(M_ALU_result),
	.I1({14'b0,M_PCplus8}),
	.S(M_Jal),
	.out(M_WD_out)
	);	
	
	// M_WB pipe
	/*-----------------------------------------------------------*/	
	M_WB M_WB1 ( 
	.clk(clk),
    .rst(rst),
	// input 
	.M_WBWrite(M_WBWrite),
	// WB
	.M_MemtoReg(M_MemtoReg),
	.M_RegWrite(M_RegWrite),
	// pipe
	.M_DM_Read_Data(DC_Read_Data),
	.M_WD_out(M_WD_out),
	.M_WR_out(M_WR_out),
	// output
	// WB
	.WB_MemtoReg(WB_MemtoReg),
	.WB_RegWrite(WB_RegWrite),
	// pipe
	.WB_DM_Read_Data(WB_DC_Read_Data),
	.WB_WD_out(WB_WD_out),
    .WB_WR_out(WB_WR_out)
	);
	
	// WB
	/*-----------------------------------------------------------*/	
	// DM WD Select
	Mux2to1#(data_size) DM_RD_Select (
	.I0(WB_WD_out),
	.I1(WB_DC_Read_Data),
	.S(WB_MemtoReg),
	.out(WB_Final_WD_out)
	);
	
endmodule


























