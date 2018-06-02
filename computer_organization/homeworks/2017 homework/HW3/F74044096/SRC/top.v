// top

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
	parameter pc_size = 18;

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
	wire [pc_size-1:0] PCout;	 
	wire [pc_size-1:0] PC_add4;
	
	// IF_ID pipe---------------------------------
	wire [pc_size-1:0]   ID_PC;
	wire [data_size-1:0] ID_ir;
	
	// Hazard Detection Unit	
	wire	PCWrite;			 
	wire	IF_IDWrite;
	wire	IF_Flush;
	wire	ID_Flush;

	// Controller
	wire [5:0] opcode;
	wire [5:0] funct;
	wire Reg_imm;
	wire J;
	wire Branch;
	wire Jal;
	wire Jr;
	wire MemtoReg;
	wire [3:0] ALUOp;
	wire RegWrite;
	wire MemWrite;
	wire Half;
	
	// Registers
	wire [4:0] Rd;
	wire [4:0] Rs;
	wire [4:0] Rt;
	wire [data_size-1:0] Rs_Data;
	wire [data_size-1:0] Rt_Data;
	wire [4:0] shamt;
	wire [data_size-1:0] WB_Data;
	wire [data_size-1:0] WD_Data;
	wire [data_size-1:0] M_DM_Read_Data;
	wire [data_size-1:0] M_Rt_Data_temp;
	
	// sign_extend	
	wire [15:0] imm;
	wire [data_size-1:0] se_imm;
	wire [data_size-1:0] se_DM_Read_Data;
	wire [data_size-1:0] se_M_Rt_Data_temp;
	
	// ID Mux part
	wire [4:0] Rd_Rt_out;
	wire [4:0] WR_out;
	
	// ID_EX 

	// WB
	wire   EX_MemtoReg;
	wire   EX_RegWrite;
	// M
	wire   EX_MemWrite;
	wire   EX_Jal;
	// EX
	wire   EX_Reg_imm;
	wire   EX_J;
	wire   EX_Branch;
	wire   EX_Jr;
	wire   EX_Half;
	// pipe
	wire   [pc_size-1:0] EX_PC;
	wire   [3:0] EX_ALUOp;
	wire   [4:0] EX_shamt;
	wire   [data_size-1:0] EX_Rs_Data;
	wire   [data_size-1:0] EX_Rt_Data;
	wire   [data_size-1:0] EX_se_imm;
	wire   [4:0] EX_WR_out;
	wire   [4:0] EX_Rs;
	wire   [4:0] EX_Rt;

	/*-----------------------------------------------------*/
	//Jump Part
	wire [pc_size-1:0] BranchAddr;
	wire [pc_size-1:0] JumpAddr;
	wire [1:0] EX_JumpOP;
	wire [pc_size-1:0] PCin;
	
	// Forwarding Unit part
	wire	src1_f;
	wire	src1_b;
	wire	src2_f;
	wire	src2_b;
	
	wire [data_size-1:0] src1_f_Data;
	wire [data_size-1:0] src1_b_Data;
	wire [data_size-1:0] src2_f_Data;	
	wire [data_size-1:0] src2_b_Data;
	
	// ALU part
	wire [data_size-1:0] src2;	
	wire [data_size-1:0] EX_ALU_result;
	wire EX_Zero;
	
	// PCplus4 adder used for Jal
	wire [pc_size-1:0] EX_PCplus8;

	// EX_M

	// WB
	wire  M_MemtoReg;
	wire  M_RegWrite;
	// M
	wire  M_MemWrite;
	wire  M_Jal;
	wire M_Half;
	// pipe
	wire  [data_size-1:0] M_ALU_result;
	wire  [data_size-1:0] M_Rt_Data;
	wire  [pc_size-1:0] M_PCplus8;
	wire  [4:0] M_WR_out;

	// M Jal part
	wire [data_size-1:0] M_WD_out;
	
	// M_WB

	// WB
	wire  WB_MemtoReg;
	wire  WB_RegWrite;
	wire WB_Half;
	// pipe
	wire  [data_size-1:0] WB_DM_Read_Data;
	wire  [data_size-1:0] WB_WD_out;
        wire  [4:0] WB_WR_out;
	
	/*-----------------------------------------------------*/
	
	// WD or DM Read data mux out
	wire [data_size-1:0] WB_Final_WD_out;
	
	
	// Wire Connect Part
	
		// PC
	assign IM_Address = PCout[pc_size-1:2];	
	
		// Controller
	assign opcode		 = ID_ir[31:26];
	assign funct		 = ID_ir[5:0];
	
		// Registers
	assign Rd			 = ID_ir[15:11];
	assign Rs			 = ID_ir[25:21];
	assign Rt			 = ID_ir[20:16];
	
		// sign_extend
	assign imm			 = ID_ir[15:0];
	
		// shamt to ID_EX pipe
	assign shamt		 = ID_ir[10:6];
	
		//Jump Part
	assign JumpAddr		 = {EX_se_imm[15:0],2'b0};
	//assign JumpAddr		 = ID_ir[25:0];
	
		// Data Memory

	assign DM_Address	 = M_ALU_result[17:2];
	assign DM_enable	 = M_MemWrite;	
	assign DM_Write_Data 	 = M_Rt_Data;
	
	
	
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
	.ID_Rs(Rs),
    	.ID_Rt(Rt),
	.EX_WR_out(EX_WR_out),
	.EX_MemtoReg(EX_MemtoReg),
	.EX_JumpOP(EX_JumpOP),
	// output
	.PCWrite(PCWrite),			 
	.IF_IDWrite(IF_IDWrite),
	.IF_Flush(IF_Flush),
	.ID_Flush(ID_Flush)
	);
	
	// Controller
	Controller Controller1 ( 
	.opcode(opcode),
	.funct(funct),
	.ALUOp(ALUOp),
	.Reg_imm(Reg_imm),
	.RegWrite(RegWrite),
	.MemtoReg(MemtoReg),
	.MemWrite(MemWrite),
	.Branch(Branch),
	.J(J),
	.Jal(Jal),
	.Jr(Jr),	
	.Half(Half)
	);

	// Registers
	Regfile Regfile1 ( 
	.clk(clk), 
	.rst(rst),
	.Read_addr_1(Rs),
	.Read_addr_2(Rt),
	.Read_data_1(Rs_Data),
	.Read_data_2(Rt_Data),
	.RegWrite(WB_RegWrite),
	.Write_addr(WB_WR_out),
	.Write_data(WB_Final_WD_out)
	);
	
	// sign_extend	
	Sign_extend sign_extend1 ( 
	.in(imm),
	.out(se_imm)
	);
	
	// ID Mux part
	// Mux - select Rd or Rt
	Mux2to1#(5) Rd_Rt ( 
	.I0(Rd),
	.I1(Rt),
	.S(Reg_imm),
	.out(Rd_Rt_out)
	);
	
	// Mux - select $ra(5'd31, of jal instrction) or Rd_Rt mux out
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
	.ID_Flush(ID_Flush),
	// WB
	.ID_MemtoReg(MemtoReg),
	.ID_RegWrite(RegWrite),
	// M
	.ID_MemWrite(MemWrite),
	.ID_Jal(Jal),
	// EX
	.ID_Reg_imm(Reg_imm),
	.ID_J(J),
	.ID_Branch(Branch),
	.ID_Jr(Jr),
	.ID_Half(Half),		   
	// pipe
	.ID_PC(ID_PC),
	.ID_ALUOp(ALUOp),
	.ID_shamt(shamt),
	.ID_Rs_data(Rs_Data),
	.ID_Rt_data(Rt_Data),
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
	.EX_J(EX_J),
	.EX_Branch(EX_Branch),
	.EX_Jr(EX_Jr),
	.EX_Half(EX_Half),
	// pipe
	.EX_PC(EX_PC),
	.EX_ALUOp(EX_ALUOp),
	.EX_shamt(EX_shamt),
	.EX_Rs_data(EX_Rs_Data),
	.EX_Rt_data(EX_Rt_Data),
	.EX_se_imm(EX_se_imm),
	.EX_WR_out(EX_WR_out),
	.EX_Rs(EX_Rs),
	.EX_Rt(EX_Rt)	
	);
	// EX
	/*-----------------------------------------------------------*/	
	// Jump Part
	// Adder - Branch address adder
	ADD#(pc_size) ADD_Branch ( 
	.A(EX_PC),
	.B({EX_se_imm[15:0],2'b0}),
	.Cout(BranchAddr)
	);
	
	// Mux - select the next PC source (PC+4, or Branch addr, or jr's $Rs, or JumpAddr)
	Mux4to1#(pc_size) PC_Mux (
	.I0(PC_add4),
	.I1(BranchAddr),
	.I2(src1_b_Data[pc_size-1:0]),
	.I3(JumpAddr),
	.S(EX_JumpOP),
	.out(PCin)
	);
	
	//Jump control
	Jump_Ctrl Jump_Ctrl1 (
	.Branch(EX_Branch),
    	.Zero(EX_Zero),
    	.Jr(EX_Jr),
    	.J(EX_J),
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
	.src1_f(src1_f),
	.src1_b(src1_b),
	.src2_f(src2_f),
	.src2_b(src2_b)	
	);
	
	// Mux - select forward data from M or WB (the Rs part)
	Mux2to1#(data_size) src1_f_Mux ( 
	.I0(WB_Final_WD_out),
	.I1(M_WD_out),
	.S(src1_f),
	.out(src1_f_Data)
	);
	
	// Mux - select origin Rs or the forward data (the Rs part)
	Mux2to1#(data_size) src1_b_Mux ( 
	.I0(EX_Rs_Data),
	.I1(src1_f_Data),
	.S(src1_b),
	.out(src1_b_Data)
	);

	// Mux - select forward data from M or WB (the Rt part)
	Mux2to1#(data_size) src2_f_Mux ( 
	.I0(WB_Final_WD_out),
	.I1(M_WD_out),
	.S(src2_f),
	.out(src2_f_Data)
	);
	
	// Mux - select origin Rt or the forward data (the Rt part)
	Mux2to1#(data_size) src2_b_Mux ( 
	.I0(EX_Rt_Data),
	.I1(src2_f_Data),
	.S(src2_b),
	.out(src2_b_Data)
	);

	// ALU part
	// Mux - select Rt or imm (the Rt part)
	Mux2to1#(data_size) Rt_imm (
	.I0(src2_b_Data),
	.I1(EX_se_imm),
	.S(EX_Reg_imm),
	.out(src2)
	);	
	
	ALU ALU1 ( 
	.ALUOp(EX_ALUOp),
	.src1(src1_b_Data),
	.src2(src2),
	.shamt(EX_shamt),
	.ALU_result(EX_ALU_result),
	.Zero(EX_Zero)
	);
	
	// PCplus4 used for Jal
	ADD#(pc_size) ADD_Plus4_2 ( 
	.A(EX_PC),
	.B(18'd4),
	.Cout(EX_PCplus8)
	);
	
	// EX_M pipe
	/*-----------------------------------------------------------*/	
	EX_M EX_M1 ( 
	.clk(clk),
	.rst(rst),
	// input 
	// WB
	.EX_MemtoReg(EX_MemtoReg),
	.EX_RegWrite(EX_RegWrite),
	// M
	.EX_MemWrite(EX_MemWrite),
	.EX_Jal(EX_Jal),
	.EX_Half(EX_Half),
	// pipe
	.EX_ALU_result(EX_ALU_result),
	.EX_Rt_data(src2_b_Data),
	.EX_PCplus8(EX_PCplus8),
	.EX_WR_out(EX_WR_out),

	// output
	// WB
	.M_MemtoReg(M_MemtoReg),
	.M_RegWrite(M_RegWrite),
	// M
	.M_MemWrite(M_MemWrite),
	.M_Jal(M_Jal),
	.M_Half(M_Half),
	// pipe
	.M_ALU_result(M_ALU_result),
	.M_Rt_data(M_Rt_Data_temp),
	.M_PCplus8(M_PCplus8),
	.M_WR_out(M_WR_out)			  		  			  
	);
	
	// M
	/*-----------------------------------------------------------*/	
	// M Jal part

	// Mux - select Jal or ALU result
	
	Sign_extend se_Rt(.in({M_Rt_Data_temp[15:0]}),.out(se_M_Rt_Data_temp));

	Mux2to1#(data_size) Rt_Half (
	.I0(M_Rt_Data_temp),
	.I1(se_M_Rt_Data_temp),
	.S(M_Half),
	.out(M_Rt_Data)
	);

	Sign_extend se_DM(.in({DM_Read_Data[15:0]}),.out(se_DM_Read_Data));

	Mux2to1#(data_size) DM_Half (
	.I0(DM_Read_Data),
	.I1(se_DM_Read_Data),
	.S(M_Half),
	.out(M_DM_Read_Data)
	);

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
	// WB
	.M_MemtoReg(M_MemtoReg),
	.M_RegWrite(M_RegWrite),
	// pipe
	.M_DM_Read_Data(M_DM_Read_Data),
	.M_WD_out(M_WD_out),
	.M_WR_out(M_WR_out),

	// output
	// WB
	.WB_MemtoReg(WB_MemtoReg),
	.WB_RegWrite(WB_RegWrite),
	// pipe
	.WB_DM_Read_Data(WB_DM_Read_Data),
	.WB_WD_out(WB_WD_out),
    	.WB_WR_out(WB_WR_out)
	);
	
	// WB
	/*-----------------------------------------------------------*/	

	// Mux - select the WD or DM Read data
	Mux2to1#(data_size) DM_RD_Select (
	.I0(WB_WD_out),
	.I1(WB_DM_Read_Data),
	.S(WB_MemtoReg),
	.out(WB_Final_WD_out)
	);	
	
endmodule
