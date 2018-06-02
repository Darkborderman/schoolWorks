// Data Memory

module DM (	clk,
			rst,
			DM_Address,
			DM_enable,
			DM_Write_Data,
			DM_Read_Data);

	parameter bit_size = 32;
	parameter mem_size = 16;

	input  clk, rst;
	input  [mem_size-1:0] DM_Address;
	input  DM_enable;
	input  [bit_size-1:0] DM_Write_Data;
	
	output [bit_size-1:0] DM_Read_Data;
	
	reg [bit_size-1:0] DM_data [0:( 2**mem_size-1 )];	
	
	assign DM_Read_Data = DM_data[DM_Address];
	
	integer i;
	
	always @ (posedge clk or posedge rst) begin
		if (rst) 
			for (i=0;i<2**mem_size;i=i+1)
				DM_data[i] <= 0;
		else if (DM_enable)
			DM_data[DM_Address] <= DM_Write_Data;
	end
	
endmodule







