// sign_extend

module sign_extend ( in,
					 out);
					 
	input  [15:0] in;
	output [31:0] out;
	/* implement sign_extend */
  
	 assign out[31:0] = {in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15:0]};
  
endmodule	
	
	
	
	
	
	
