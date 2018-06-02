// Controller

module Controller ( opcode,
		    funct,
		    ALUOp,
		    Reg_imm,
		    RegWrite,
		    MemtoReg,
		    MemWrite,
		    Branch,
		    Jump,
		    Jal,
		    Jr,
		    Half
		   );

	input  [5:0] opcode;
    	input  [5:0] funct;

	output [3:0] ALUOp;
	output Reg_imm;
	output RegWrite;
	output MemtoReg;
	output MemWrite;
	output Branch;
	output Jump;
	output Jal;
	output Jr;
	output Half;

	reg [3:0] ALUOp;
	reg Reg_imm;
	reg RegWrite;
	reg MemtoReg;
	reg MemWrite;
	reg Branch;
	reg Jump;
	reg Jal;
	reg Jr;
	reg Half;
	
	parameter
		Reg_data = 0,
		imm_data = 1;

	parameter 
		//op_nop = 0,
		op_add = 1,
		op_sub = 2,
		op_and = 3,
		op_or = 4,
		op_xor = 5,
		op_nor = 6,
		op_slt = 7,
		op_sll = 8,
		op_srl = 9,
		op_beq = 10,
		op_bne = 11;

	always@ (*) begin
		ALUOp = 0;
		Reg_imm = Reg_data;
		RegWrite = 0;
		MemtoReg = 0;
		MemWrite = 0;
		Branch = 0;
		Jump = 0;
		Jal = 0;
		Jr = 0;
		Half = 0;
		
		case(opcode)
			6'b00_0000 : begin// R type
				case(funct)
					/*6'b00_0000 : begin
						ALUOp = op_nop ;
					end*/

					6'b10_0000 : begin // add
						Reg_imm = Reg_data;
						ALUOp = op_add ;
						RegWrite = 1 ;
					end

					6'b10_0010 : begin // sub
						Reg_imm = Reg_data;
						ALUOp = op_sub ;
						RegWrite = 1 ;
					end

					6'b10_0100 : begin // and
						Reg_imm = Reg_data;
						ALUOp = op_and;
			  			RegWrite = 1 ;
					end

					6'b10_0101 : begin // or
						Reg_imm = Reg_data;
						ALUOp = op_or;
			 			RegWrite = 1 ;
					end
	
					6'b10_0110 : begin // xor
						Reg_imm = Reg_data;
						ALUOp = op_xor;
						RegWrite = 1 ;
					end

					6'b10_0111 : begin // nor
						Reg_imm = Reg_data;
						ALUOp = op_nor;
			  			RegWrite = 1 ;
					end
	
					6'b10_1010 : begin // slt
						Reg_imm = Reg_data;
						Branch = 1 ;
						ALUOp = op_slt;
						RegWrite = 1 ;
					end
	
					6'b00_0000 : begin // sll
						Reg_imm = Reg_data;
						ALUOp = op_sll;
						RegWrite = 1 ;
					end

					6'b00_0010 : begin // srl
						Reg_imm = Reg_data;
						ALUOp = op_srl;
			  			RegWrite = 1 ;
					end

					6'b00_1000 : begin // jr
						Jr = 1 ;
					end

					6'b00_1001 : begin // jalr
						Jal = 1 ;
						Jr = 1;
						RegWrite = 1;
					end
				endcase
			end
			
			// I type
			6'b00_1000 : begin // addi
				Reg_imm = imm_data;
			 	ALUOp = op_add;
				RegWrite = 1 ;
			end

			6'b00_1100 : begin // andi
			  	Reg_imm = imm_data;
		  	  	ALUOp = op_and;
		 	  	RegWrite = 1 ;
			end

			6'b00_1010 : begin // slti
				Reg_imm = imm_data;
			 	ALUOp = op_slt;
			 	RegWrite = 1 ;
			end

			6'b00_0100 : begin // beq
			 	Branch = 1 ;
			  	ALUOp = op_beq;
			end

			6'b00_0101 : begin // bne
			  	Branch = 1 ;
		          	ALUOp = op_bne;
			end

			6'b10_0011 : begin // lw
				Reg_imm = imm_data;
				MemtoReg = 1;
				ALUOp = op_add;
				RegWrite = 1 ;
			end

			6'b10_0001 : begin // lh
				Reg_imm = imm_data;
				MemtoReg = 1;
				ALUOp = op_add;
				RegWrite = 1;
				Half = 1;
			end

			6'b10_1011 : begin // sw
				Reg_imm = imm_data;
		  		ALUOp = op_add;
				MemWrite = 1;
			end

			6'b10_1001 : begin //sh
				Reg_imm = imm_data;
		  		ALUOp = op_add;
				MemWrite = 1;
				Half = 1;
			end

			// J Type
			6'b00_0010 : begin // j
        			Jump = 1 ;
	    		end	

			6'b00_0011 : begin // jal
				Jump = 1 ;
				Jal = 1 ;
				RegWrite = 1;
			end
		endcase
	end
	
endmodule




