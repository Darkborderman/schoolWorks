`timescale 1ns / 1ps

module DM(CLK, address, DM_WE, DM_RData, DM_WData );

	input CLK ;
	input [15:0] address;
	input DM_WE;
	input [15:0] DM_WData;
	output [15:0] DM_RData;
	reg signed [15:0] DataMemory [0:7];

	reg [15:0]DM_RData;
	
	
	
	always@(negedge CLK)begin
		if(DM_WE)
			DataMemory[address[2:0]]=DM_WData;
		else
			DM_RData=DataMemory[address[2:0]];
	
	
	end
	
endmodule
