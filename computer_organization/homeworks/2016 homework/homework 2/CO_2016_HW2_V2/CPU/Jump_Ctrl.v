// Jump_Ctrl

module Jump_Ctrl( Branch,
				  Zero,
				  Jr,
				  Jump,
				  JumpOP);

	input Branch;
    input Zero;
    input Jr;
    input Jump;
	
	output [1:0] JumpOP;
	reg [1:0] JumpOP;
	
	always@ (*) begin
		JumpOP = (Branch&&Zero) ? 1 :
				  Jr		    ? 2 :
				  Jump		    ? 3 : 0;
	end
	
endmodule





