// Data Memory

module DM (	clk,
			rst,
			DM_Address,
			DM_en_Read,
			DM_en_Write,
			DM_Write_Data,
			DM_Read_Data);

	parameter bit_size = 32;
	parameter mem_size = 16;

	input  clk, rst;
	input  [mem_size-1:0] DM_Address;
	input  DM_en_Read;
	input  DM_en_Write;
	input  [bit_size-1:0] DM_Write_Data;
	
	output [bit_size-1:0] DM_Read_Data;
	
	reg [bit_size-1:0] DM_data [0:( 2**mem_size-1 )];	
	
	// state
	parameter Idle		 = 0,
			  Read_data  = 1;

	reg nxt_state;
	reg cur_state;
	reg [mem_size-1:0] r_DM_Addr;
	
	assign DM_Read_Data = DM_data[r_DM_Addr];
	
	// FSM
	always @ (*) begin
		case (cur_state)
		Idle		 : nxt_state = DM_en_Read ?
								   Read_data : Idle;
		Read_data	 : nxt_state = Idle;
		endcase
	end	
	
	integer i;
	
	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			for (i=0;i<2**mem_size;i=i+1)
				DM_data[i] <= 0;
			r_DM_Addr <= 0;	
			cur_state <= Idle;
		end
		else begin
			// read
			if (cur_state==Read_data)
				r_DM_Addr <= DM_Address;
			cur_state <= nxt_state;
			
			// write
			if (DM_en_Write)
				DM_data[DM_Address] <= DM_Write_Data;
		end
	end
	
endmodule







