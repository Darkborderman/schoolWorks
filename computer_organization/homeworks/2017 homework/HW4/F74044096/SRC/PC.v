// Program Counter

module PC ( clk, 
			rst,
			PCWrite,
			PCin, 
			PCout);
	
	parameter bit_size = 18;
	
	input   clk, rst;
	input	PCWrite;
	input   [bit_size-1:0] PCin;
	output  [bit_size-1:0] PCout;	   
	
	reg [bit_size-1:0] PCout;
	reg [bit_size-1:0] PCWout;

	always@(*) PCWout = PCWrite ? PCin : PCout;
	
	always@(negedge clk or posedge rst)
		PCout = rst ? 0 : PCWout;
		   
endmodule

