`timescale 1ns/10ps
`include "IM.v"
`include "DM.v"
`include "top.v"
`define PERIOD 10
`define NUM_CLK 1000

module cpu_tb;
	
	parameter bit_size = 32;
	parameter mem_size = 16;
	
	reg clk, rst;

	// Instruction Memory
	wire [mem_size-1:0] IM_Address;	
	wire [bit_size-1:0] Instruction;
	
	// Data Memory
	wire [mem_size-1:0] DM_Address;
	wire DM_enable;
	wire [bit_size-1:0] DM_Write_Data;
	wire [bit_size-1:0] DM_Read_Data;
	
	reg [31:0] golden_DM [0:1023];
	reg err_R;
	reg tag_I;
	
	IM IM1 (
	.clk(clk),
	.rst(rst),
	.IM_Address(IM_Address),
	.Instruction(Instruction)
	);
	
	DM DM1 ( 
	.clk(clk),
	.rst(rst),
	.DM_Address(DM_Address),
	.DM_enable(DM_enable),
	.DM_Write_Data(DM_Write_Data),
	.DM_Read_Data(DM_Read_Data)
	);
	
	top top1 (
	.clk(clk),
	.rst(rst),
	// Instruction Memory
	.IM_Address(IM_Address),
	.Instruction(Instruction),
	// Data Memory
	.DM_Address(DM_Address),
	.DM_enable(DM_enable),
	.DM_Write_Data(DM_Write_Data),
	.DM_Read_Data(DM_Read_Data)
	);
	
	// clk part
	always #(`PERIOD/2) clk = ~clk;
	
	integer i;
	
	initial begin
		clk = 0;
		rst = 0;
		err_R = 0;		
		$readmemh("./tb1/IM_data.dat",IM1.IM_data);
		$readmemh("./tb1/golden_DM.dat",golden_DM);
		#6 rst = 1;
		#(`PERIOD ) rst = 0;
		wait ( IM_Address==48 );
		if (!tag_I) begin
			$display("============================================================================");
			$display("\n (T_T)  The simulation result is FAIL!!! Please check jal is work or not !!!.\n");
			$display("============================================================================");
		end
		else begin
			$display("\n");
			$display("        Single Cycle CPU				            ");
			$display("        ****************************              ");
			$display("        **                        **       /|__/|");
			$display("        **  Congratulations !!    **      / O,O  |");
			$display("        **                        **    /_____   |");
			$display("        **  Simulation PASS!!     **   /^ ^ ^ \\  |");
			$display("        **                        **  |^ ^ ^ ^ |w|");
			$display("        *************** ************   \\m___m__|_|");
			$display("         student ID :                              "); 
			$display("\n");
		end
		$finish;
	end
	
	// Rtype test
	initial begin 
		wait ( IM_Address==(2*16 + 9));
		$display("[ testfuxture1.v ] Rtype test START !!");
		for (i=0;i<9;i=i+1) begin
			if (golden_DM[i] != DM1.DM_data[i]) begin			
				$display("DM_data[%d] = %h  ERROR, EXPECT DM_data[%d]= %h ",i,DM1.DM_data[i],i,golden_DM[i]);
				err_R = 1;
			end
			/*else begin
				$display("DM_data[%d] = %h  PASS",i,DM1.DM_data[i]);
			end*/
		end
		if (err_R) begin			
			$display("============================================================================");
			$display("\n (T_T)  The Rtype result of DM_data is FAIL!!! there have some errors in all.\n");
			$display("============================================================================");
			$finish;
		end
		else begin
			$display("============================================================================");
			$display("\n \\(^o^)/  The Rtype result of DM_data is PASS!!!\n");
			$display("============================================================================");		
		end
	end
	
	//Jump test
	initial begin 
		wait ( IM_Address==(2*16 + 12));
		$display("[ testfuxture1.v ] Jump test START !!");
		for (i=9;i<10;i=i+1) begin
			if (golden_DM[i] != DM1.DM_data[i]) begin			
				$display("DM_data[%d] = %h  ERROR, EXPECT DM_data[%d]= %h ",i,DM1.DM_data[i],i,golden_DM[i]);
				err_R = 1;
			end
			/*else begin
				$display("DM_data[%d] = %h  PASS",i,DM1.DM_data[i]);
			end*/
		end
		if (err_R) begin			
			$display("============================================================================");
			$display("\n (T_T)  The Jump result of DM_data is FAIL!!! there have some errors in all.\n");
			$display("============================================================================");
			$finish;
		end
		else begin
			$display("============================================================================");
			$display("\n \\(^o^)/  The Jump result of DM_data is PASS!!!\n");
			$display("============================================================================");		
		end
	end
	
	//Itype test
	initial begin 
		tag_I = 0;
		wait ( IM_Address==(4*16));
		tag_I = 1;
		$display("[ testfuxture1.v ] Itype test START !!");
		for (i=10;i<14;i=i+1) begin
			if (golden_DM[i] != DM1.DM_data[i]) begin			
				$display("DM_data[%d] = %h  ERROR, EXPECT DM_data[%d]= %h ",i,DM1.DM_data[i],i,golden_DM[i]);
				err_R = 1;
			end
			/*else begin
				$display("DM_data[%d] = %h  PASS",i,DM1.DM_data[i]);
			end*/
		end
		if (err_R) begin		
			$display("============================================================================");
			$display("\n (T_T)  The Itype result of DM_data is FAIL!!! there have some errors in all.\n");
			$display("============================================================================");
			$finish;
		end
		else begin
			$display("============================================================================");
			$display("\n \\(^o^)/  The Itype result of DM_data is PASS!!!\n");
			$display("============================================================================");		
		end
	end
	
	// to long
	initial begin 
		#(`PERIOD * `NUM_CLK)
		$display("================================================================================================================");
		$display("--------------------------- (/`n`)/ ~#  There was something wrong with your code !! ---------------------------"); 
		$display("--------------------------- The simulation can't finished!!, Please check jr is work or not !!! ---------------"); 
		$display("================================================================================================================");
		$finish;
	end
	
	
	initial begin 
		#(`PERIOD * `NUM_CLK)
		$display("================================================================================================================");
		$display("--------------------------- (/`n`)/ ~#  There was something wrong with your code !! ---------------------------"); 
		$display("--------------------------- The simulation can't finished!!, Please check it !!! ------------------------------"); 
		$display("================================================================================================================");
		$finish;
	end
	
	initial begin
	`ifdef VCD
		$dumpfile("top.vcd");
		$dumpvars;
	`endif
	end
	
	
endmodule