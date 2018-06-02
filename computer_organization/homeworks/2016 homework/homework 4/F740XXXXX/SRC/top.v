// top
`include "core.v"
`include "Cache.v"

module top ( clk,
             rst,
			 // Instruction Memory
			 IM_Address,
			 IM_en_Read,
             Instruction,
			 // Data Memory
			 DM_Address,
			 DM_en_Read,
			 DM_en_Write,
			 DM_Write_Data,
			 DM_Read_Data,
			 //For use of instruction count
			 IC_stall_out,
			 I_cache_instr_out,
			 );

	parameter data_size = 32;
	parameter mem_size = 16;	
	
	input  clk, rst;
	
	// Instruction Memory
	output [mem_size-1:0] IM_Address;
	output IM_en_Read;
	input  [data_size-1:0] Instruction;
	
	// Data Memory
	output [mem_size-1:0] DM_Address;
	output DM_en_Read;
	output DM_en_Write;
	output [data_size-1:0] DM_Write_Data;	
    input  [data_size-1:0] DM_Read_Data;
	
	//For use of Instruction count & hit rate caculate
	output IC_stall_out;
	output [data_size-1:0]I_cache_instr_out;
	
	// I$
	wire IC_stall;
	wire [data_size-1:0] I_cache_out;
	
	// D$
	wire DC_stall;
	wire [data_size-1:0] D_cache_out;
	
	// core
	wire [mem_size-1:0] IC_Address;
	wire [mem_size-1:0] DC_Address;
	wire DC_Read_enable;
	wire DC_Write_enable;
	wire [data_size-1:0] DC_Write_Data;
	
	//For use of Instruction count
	assign IC_stall_out=IC_stall;
	assign I_cache_instr_out=I_cache_out;
	
	// I$ 
	Cache I_cache ( 
	.clk(clk),
	.rst(rst),
	//to core
	.stall(IC_stall),
	.cache_addr(IC_Address),
	.en_R(1'b1),
	.en_W(1'b0),
	.cache_in(),
	.cache_out(I_cache_out),
	//to mem
	.mem_addr(IM_Address),
	.mem_en_R(IM_en_Read),
	.mem_en_W(),
	.mem_out(Instruction),
	.mem_in()
	);
	
	// D$
	Cache D_cache ( 
	.clk(clk),
	.rst(rst),
	//to core
	.stall(DC_stall),
	.cache_addr(DC_Address),
	.en_R(DC_Read_enable),
	.en_W(DC_Write_enable),
	.cache_in(DC_Write_Data),
	.cache_out(D_cache_out),
	//to mem
	.mem_addr(DM_Address),
	.mem_en_R(DM_en_Read),
	.mem_en_W(DM_en_Write),
	.mem_out(DM_Read_Data),
	.mem_in(DM_Write_Data)
	);	
	
	// core
	core core1 (
	.clk(clk),
	.rst(rst),
	// Instruction Cache
	.IC_stall(IC_stall),
	.IC_Address(IC_Address),
	.Instruction(I_cache_out),
	// Data Cache
	.DC_stall(DC_stall),
	.DC_Address(DC_Address),
	.DC_Read_enable(DC_Read_enable),
	.DC_Write_enable(DC_Write_enable),
	.DC_Write_Data(DC_Write_Data),
	.DC_Read_Data(D_cache_out)
	);

endmodule


















