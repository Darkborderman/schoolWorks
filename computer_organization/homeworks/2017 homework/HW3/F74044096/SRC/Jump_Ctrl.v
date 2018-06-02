// Jump_Ctrl

module Jump_Ctrl( Zero,
                  J,
		  Jr,
		  Branch,
                  JumpOP
		 );

    	input Zero;
	input J;
	input Jr;
	input Branch;

	output [1:0] JumpOP;	
	reg [1:0] JumpOP;
	
	always@ (*) begin
		JumpOP =  (Branch && Zero) ? 1 : 
					Jr ? 2 : 
					 J ? 3 : 0;
	end
	
endmodule





