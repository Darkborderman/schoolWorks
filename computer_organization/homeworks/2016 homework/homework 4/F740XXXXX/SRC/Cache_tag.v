// Cache_tag

module Cache_tag ( 
				   clk,
				   rst,
				   Tag_Address,
				   Tag_enable,
				   Tag_in,
				   Tag_out
				   );

	parameter bit_size = 11;
	parameter mem_size = 5;

	input  clk, rst;
	input  [mem_size-1:0] Tag_Address;
	input  Tag_enable;
	input  [bit_size-1:0] Tag_in;
	
	output [bit_size-1:0] Tag_out;
	
	reg [bit_size-1:0] Tag [0:( 2**mem_size-1 )];
	
	assign Tag_out = Tag[Tag_Address];
	
	integer i;
	
	always @ (posedge clk or posedge rst) begin
		if (rst) 
			for (i=0;i<2**mem_size;i=i+1)
				Tag[i] <= 0;
		else if (Tag_enable)
			Tag[Tag_Address] <= Tag_in;
	end

endmodule












