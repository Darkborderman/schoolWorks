// ID_EX

module ID_EX ( clk,  
               rst,
               // input 
			ID_EXWrite,
			ID_Flush,
			// WB
			ID_MemtoReg,
			ID_RegWrite,
			// M
			ID_MemWrite,
			ID_Jal,
			//ID_se_DM,
			// EX
			ID_Reg_imm,
			ID_Jump,
			ID_Branch,
			ID_Jr,
			ID_Half,	   
			// pipe
			ID_PC,
			ID_ALUOp,
			ID_shamt,
			ID_Rs_data,
			ID_Rt_data,
			ID_se_imm,
			ID_WR_out,
			ID_Rs,
			ID_Rt,
			// output
			// WB
			EX_MemtoReg,
			EX_RegWrite,
			// M
			EX_MemWrite,
			EX_Jal,
			//EX_se_DM,
			// EX
			EX_Reg_imm,
			EX_Jump,
			EX_Branch,
			EX_Jr,
			EX_Half,
			// pipe
			EX_PC,
			EX_ALUOp,
			EX_shamt,
			EX_Rs_data,
			EX_Rt_data,
			EX_se_imm,
			EX_WR_out,
			EX_Rs,
			EX_Rt		   			   
			);
	
	parameter pc_size = 18;			   
	parameter data_size = 32;
	
	input clk, rst;
	input ID_EXWrite;
	input ID_Flush;
	
	// WB
	input ID_MemtoReg;
	input ID_RegWrite;

	// M
	input ID_MemWrite;
	input ID_Jal;
	//input ID_se_DM;

	// EX
	input ID_Reg_imm;
	input ID_Jump;
	input ID_Branch;
	input ID_Jr;
	input ID_Half;

	// pipe
    	input [pc_size-1:0] ID_PC;
    	input [3:0] ID_ALUOp;
    	input [4:0] ID_shamt;
    	input [data_size-1:0] ID_Rs_data;
    	input [data_size-1:0] ID_Rt_data;
    	input [data_size-1:0] ID_se_imm;
    	input [4:0] ID_WR_out;
    	input [4:0] ID_Rs;
    	input [4:0] ID_Rt;
	
	// WB
	output EX_MemtoReg;
	output EX_RegWrite;
	
	// M
	output EX_MemWrite;
	output EX_Jal;
	//output EX_se_DM;

	// EX
	output EX_Reg_imm;
	output EX_Jump;
	output EX_Branch;
	output EX_Jr;
	output EX_Half;	

	// pipe
	output [pc_size-1:0] EX_PC;
	output [3:0] EX_ALUOp;
	output [4:0] EX_shamt;
	output [data_size-1:0] EX_Rs_data;
	output [data_size-1:0] EX_Rt_data;
	output [data_size-1:0] EX_se_imm;
	output [4:0] EX_WR_out;
	output [4:0] EX_Rs;
	output [4:0] EX_Rt;
	
	reg EX_MemtoReg;
	reg EX_RegWrite;
	reg EX_MemWrite;
	reg EX_Jal;
	reg EX_Reg_imm;
	reg EX_Jump;
	reg EX_Branch;
	reg EX_Jr;
	reg EX_Half;
	reg [pc_size-1:0] EX_PC;
	reg [3:0] EX_ALUOp;
	reg [4:0] EX_shamt;
	reg [data_size-1:0] EX_Rs_data;
	reg [data_size-1:0] EX_Rt_data;
	reg [data_size-1:0] EX_se_imm;
	reg [4:0] EX_WR_out;
	reg [4:0] EX_Rs;
	reg [4:0] EX_Rt;
	
	always @(negedge clk or posedge rst) begin
		if(rst || ID_Flush)
		begin
			EX_MemtoReg = 0;
			EX_RegWrite = 0;
			EX_MemWrite = 0;
			EX_Jal = 0;
			EX_Reg_imm = 0;
			EX_Jump = 0;
			EX_Branch = 0;
			EX_Jr = 0;
			EX_Half = 0;
			EX_PC = 0;
			EX_ALUOp = 0;
			EX_shamt = 0;
			EX_Rs_data = 0;
			EX_Rt_data = 0;
			EX_se_imm = 0;
			EX_WR_out = 0;
			EX_Rs = 0;
			EX_Rt = 0;
		end
		
		else if(ID_EXWrite)
		begin
			EX_MemtoReg = ID_MemtoReg;
			EX_RegWrite = ID_RegWrite;
			EX_MemWrite = ID_MemWrite;
			EX_Jal = ID_Jal;
			EX_Reg_imm = ID_Reg_imm;
			EX_Jump = ID_Jump;
			EX_Branch = ID_Branch;
			EX_Jr = ID_Jr;
			EX_Half = ID_Half;
			EX_PC = ID_PC;
			EX_ALUOp = ID_ALUOp;
			EX_shamt = ID_shamt;
			EX_Rs_data = ID_Rs_data;
			EX_Rt_data = ID_Rt_data;
			EX_se_imm = ID_se_imm;
			EX_WR_out = ID_WR_out;
			EX_Rs = ID_Rs;
			EX_Rt = ID_Rt;
		end
	end
	
endmodule










