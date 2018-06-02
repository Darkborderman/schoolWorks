// Cache valid

module Cache_valid ( 
					 clk,
					 rst,
					 Valid_Address,
					 Valid_enable,
					 Valid_in,
					 Valid_out
					 );

	parameter mem_size = 5;

	input  clk, rst;
	input  [mem_size-1:0] Valid_Address;
	input  Valid_enable;
	input  Valid_in;
	
	output Valid_out;
	
	reg Valid [0:( 2**mem_size-1 )];
	
	assign Valid_out = Valid[Valid_Address];
	
	integer i;
	
	always @ (posedge clk or posedge rst) begin
		if (rst) 
			for (i=0;i<2**mem_size;i=i+1)
				Valid[i] <= 0;
		else if (Valid_enable)
			Valid[Valid_Address] <= Valid_in;
	end

endmodule