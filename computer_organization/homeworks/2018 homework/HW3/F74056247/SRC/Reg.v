`timescale 1ns / 1ps

module Reg(CLK, RS_ID, RT_ID, Reg_W_ID, Reg_Write, Reg_WData, Reg_RData1, Reg_RData2);

	input CLK;
	input [2:0] RS_ID, RT_ID, Reg_W_ID;
	input Reg_Write;
	input [15:0] Reg_WData;
	output [15:0] Reg_RData1;
	output [15:0] Reg_RData2;
	reg signed [15:0] Register [0:7];
	
	assign Reg_RData1 = Register[ RS_ID ];
	assign Reg_RData2 = Register[ RT_ID ];
	
	always@(posedge CLK) begin
			Register[ Reg_W_ID ] <= Reg_Write ? Reg_WData : Register[ Reg_W_ID ];
	end

endmodule
