`timescale 1ns / 1ps

module DM(CLK, Address, Mem_Write, Mem_Read, DM_WData, DM_RData);

	input CLK ;
	input [15:0] Address;
	input Mem_Write, Mem_Read;
	input [15:0] DM_WData;
	output [15:0] DM_RData;
	reg signed [15:0] DataMemory [0:7];
	
	assign DM_RData = Mem_Read ? DataMemory[ Address ] : 0;
		
	always@(posedge CLK) begin
			DataMemory[ Address ] <= Mem_Write ? DM_WData : DataMemory[ Address ];	
	end
	
endmodule
