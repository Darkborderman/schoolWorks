// Hazard Detection Unit

module HDU ( // input
			 IC_stall,
			 DC_stall,
			 ID_Rs,
             ID_Rt,
			 EX_WR_out,
			 EX_MemtoReg,
			 EX_JumpOP,
			 // output
			 PCWrite,			 
			 IF_IDWrite,
			 ID_EXWrite,
			 EX_MWrite,
			 M_WBWrite,	 		 
			 IF_Flush,
			 ID_Flush
			 );
	
	parameter bit_size = 32;
	
	input IC_stall;
	input DC_stall;
	input [4:0] ID_Rs;
	input [4:0] ID_Rt;
	input [4:0] EX_WR_out;
	input EX_MemtoReg;
	input [1:0] EX_JumpOP;
	
	output PCWrite;
	output IF_IDWrite;
	output ID_EXWrite;
	output EX_MWrite;
	output M_WBWrite;	
	output IF_Flush;
	output ID_Flush;
	reg PCWrite;
	reg IF_IDWrite;
	reg ID_EXWrite;
	reg EX_MWrite;
	reg M_WBWrite;	
	reg IF_Flush;
	reg ID_Flush;
	
	always @(*) begin
		PCWrite		 = 1;
		IF_IDWrite	 = 1;
		ID_EXWrite	 = 1;
		EX_MWrite	 = 1;
		M_WBWrite	 = 1;
		IF_Flush	 = 0;
		ID_Flush	 = 0;
		// Branch
		if (EX_JumpOP != 0) begin // Jump
			IF_Flush	 = 1;
		    ID_Flush	 = 1;
		end
		// Load
		if (EX_MemtoReg && (ID_Rs==EX_WR_out || ID_Rt==EX_WR_out) ) begin
			PCWrite		 = 0;
			IF_IDWrite	 = 0;
			IF_Flush	 = 0;
			ID_Flush	 = 1;
		end
		// cache miss
		if (IC_stall || DC_stall) begin
			PCWrite		 = 0;
			IF_IDWrite	 = 0;
			ID_EXWrite	 = 0;
			EX_MWrite	 = 0;
			M_WBWrite	 = 0;
			IF_Flush	 = 0;
			ID_Flush	 = 0;
		end
		
	end
	
endmodule