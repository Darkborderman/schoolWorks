// Forwarding Unit

module FU ( // input 
			EX_Rs,
            		EX_Rt,
			M_RegWrite,
			M_WR_out,
			WB_RegWrite,
			WB_WR_out,
			// output
			src1_f,
			src1_b,
			src2_f,
			src2_b
			);

	input [4:0] EX_Rs;
    	input [4:0] EX_Rt;
    	input M_RegWrite;
    	input [4:0] M_WR_out;
    	input WB_RegWrite;
    	input [4:0] WB_WR_out;

	output src1_f;
	output src1_b;
	output src2_f;
	output src2_b;
	
	reg src1_f;
	reg src1_b;
	reg src2_f;
	reg src2_b;
	
	always @(*) begin
		src1_f = 0;
		src1_b = 0;
		src2_f = 0;
		src2_b = 0;

		if(M_RegWrite)
		begin
			if(M_WR_out != 0)
			begin
				if(M_WR_out == EX_Rs)
				begin
					src1_f = 1;
					src1_b = 1;
				end
				
				if(M_WR_out == EX_Rt)
				begin
					src2_f = 1;
					src2_b = 1;
				end
			end
		end

		if(WB_RegWrite)
		begin
			if(WB_WR_out != 0)
			begin
				if(!(M_RegWrite && M_WR_out == EX_Rs))
				begin
					if(WB_WR_out == EX_Rs)
					begin
						src1_f = 0;
						src1_b = 1;
					end
				end

				if(!(M_RegWrite && M_WR_out == EX_Rt))
				begin
				
					if(WB_WR_out == EX_Rt)
					begin
						src2_f = 0;
						src2_b = 1;
					end
				end
			end
		end
	end
	
endmodule




























