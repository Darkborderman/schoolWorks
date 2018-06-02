// ALU

module ALU ( ALUOp,
			 scr1,
			 scr2,
			 shamt,
			 ALU_result,
			 Zero);
	
	parameter bit_size = 32;
	
	input [3:0] ALUOp;
	input [bit_size-1:0] scr1;
	input [bit_size-1:0] scr2;
	input [4:0] shamt;
	
	output [bit_size-1:0] ALU_result;
	output Zero;
	reg [bit_size-1:0] ALU_result;
	reg Zero;
	
	wire [bit_size-1:0] sub_result;
	assign sub_result = scr1 - scr2;
	
	parameter //op_nop = 0,
			  op_add = 1,
			  op_sub = 2,
			  op_and = 3,
			  op_or  = 4,
			  op_xor = 5,
			  op_nor = 6,
			  op_slt = 7,
			  op_sll = 8,
			  op_srl = 9,
			  op_beq = 10,
			  op_bne = 11;
			
	always@ (*) begin
		ALU_result	 = 0;
		Zero		 = 0;
		/*
		case (ALUOp)
		//implement all operation  
    
 		   op_add : ALU_result = ;
		   op_sub : ALU_result = ;
		   op_and : ALU_result = ;
		   op_or  : ALU_result = ;
		   op_xor : ALU_result = ;
       op_nor : ALU_result = ;
       op_slt : ALU_result = ;
       op_sll : ALU_result = ;
       op_srl : ALU_result = ;
       op_beq : Zero = ;
       op_bne : Zero = ;
    
		endcase // ALUOp
		*/
	end

endmodule





