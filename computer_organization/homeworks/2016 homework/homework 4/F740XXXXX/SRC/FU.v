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
		enF1 = ( M_RegWrite && EX_Rs==M_WR_out )   ? 1 : 
			   ( WB_RegWrite && EX_Rs==WB_WR_out ) ? 1 : 0;
		sF1	 = ( M_RegWrite && EX_Rs==M_WR_out )   ? 0 : 
		       ( WB_RegWrite && EX_Rs==WB_WR_out ) ? 1 : 0;
		
		// Rt Forwarding
		enF2 = ( M_RegWrite && EX_Rt==M_WR_out )   ? 1 : 
			   ( WB_RegWrite && EX_Rt==WB_WR_out ) ? 1 : 0;
		sF2	 = ( M_RegWrite && EX_Rt==M_WR_out )   ? 0 : 
		       ( WB_RegWrite && EX_Rt==WB_WR_out ) ? 1 : 0;		
	end
	
endmodule




























