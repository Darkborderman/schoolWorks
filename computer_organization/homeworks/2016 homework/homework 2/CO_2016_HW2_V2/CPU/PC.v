// Program Counter

module PC ( clk, 
			rst,
			PCin, 
			PCout);
	
	parameter bit_size = 18;
	
	input  clk, rst;
	input  [bit_size-1:0] PCin;
	output [bit_size-1:0] PCout;	   
	reg    [bit_size-1:0] PCout;	
	
	always@ (posedge clk or posedge rst)
		PCout <= rst ? 0 : PCin;
		   
endmodule

