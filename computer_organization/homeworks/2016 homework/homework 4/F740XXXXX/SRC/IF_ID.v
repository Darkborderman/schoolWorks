// IF_ID

module IF_ID ( clk,
               rst,
			   // input
			   IF_IDWrite,
			   IF_Flush,
			   IF_PC,
			   IF_ir,
			   // output
			   ID_PC,
			   ID_ir);
	
	parameter pc_size = 18;
	parameter data_size = 32;
	
	input clk, rst;
	input IF_IDWrite, IF_Flush;
	input [pc_size-1:0]   IF_PC;
	input [data_size-1:0] IF_ir;
	
	output [pc_size-1:0]   ID_PC;
	output [data_size-1:0] ID_ir;
	reg [pc_size-1:0]      ID_PC;
	reg [data_size-1:0]    ID_ir;	
	
	always @(negedge clk or posedge rst) begin
		ID_PC <= rst||IF_Flush ? 0 : 
				 IF_IDWrite ? IF_PC : ID_PC;
		ID_ir <= rst||IF_Flush ? 0 : 
				 IF_IDWrite ? IF_ir : ID_ir;
	end

endmodule