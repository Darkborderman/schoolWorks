// Program Counter

module PC ( clk, 
			rst,
			PCWrite,
			PCin, 
			PCout);
	
	parameter pc_size = 18;
	
	input  clk, rst;
	input  PCWrite;
	input  [pc_size-1:0] PCin;
	output [pc_size-1:0] PCout;	   
	reg    [pc_size-1:0] PCout;
	
	reg    [pc_size-1:0] w_PCout;
	
	always @(*) w_PCout = PCWrite ? PCin : PCout;
	
	always @(negedge clk or posedge rst)
		PCout <= rst ? 0 : w_PCout;
		   
endmodule

