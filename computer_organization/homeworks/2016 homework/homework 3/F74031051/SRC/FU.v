// Forwarding Unit

module FU ( // input 
			EX_Rs,
            EX_Rt,
			M_RegWrite,
			M_WR_out,
			WB_RegWrite,
			WB_WR_out,
			// output
			enF1,
			enF2,
			sF1,
			sF2	
			);

	input [4:0] EX_Rs;
    input [4:0] EX_Rt;
    input M_RegWrite;
    input [4:0] M_WR_out;
    input WB_RegWrite;
    input [4:0] WB_WR_out;

	output enF1;
    output enF2;
    output sF1;
    output sF2;
	
	reg enF1;
	reg enF2;
	reg sF1;
	reg sF2;

	always @(*) begin
		// Rs Forwarding
		enF1 = 0 ;
		enF2 = 0 ;
		sF1 = 0 ;
		sF2 = 0 ;
	
		if ( M_RegWrite )
		begin
			if ( M_WR_out != 0 )
			begin
				if ( M_WR_out == EX_Rs )
				begin
					enF1 = 1 ;
					sF1  = 0 ;
				end

				if ( M_WR_out == EX_Rt )
				begin
					enF2 = 1 ;
					sF2 = 0 ;
				end
			end	
		end
	
		if ( WB_RegWrite )
		begin
			if ( WB_WR_out != 0 )
			begin
				if ( M_WR_out != EX_Rs )
				begin
					if ( WB_WR_out == EX_Rs )
					begin
						enF1 = 1 ;
						sF1 = 1 ; 
					end
				end

				if ( M_WR_out != EX_Rt )
				begin
					if ( WB_WR_out == EX_Rt )
					begin
						enF2 = 1 ; 
						sF2 = 1 ;
					end
				end
			end
		end

	end
	
endmodule







