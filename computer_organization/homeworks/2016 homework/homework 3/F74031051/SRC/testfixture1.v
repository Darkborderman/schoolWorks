`timescale 1ns/10ps
`include "IM.v"
`include "DM.v"
`include "top.v"
`define PERIOD 10
`define NUM_CLK 1000

module testfixture1;
	
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
	reg tag_origin;
	
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
		tag_origin = 1;
		
		#6 rst = 1;
		#(`PERIOD ) rst = 0;
		#(`PERIOD );
		
		
		$readmemh("./tb1/IM_data.dat",IM1.IM_data);
		if( IM1.IM_data[46]===32'h0c100033 &&
			IM1.IM_data[47]===32'h00000000 &&
			IM1.IM_data[48]===32'h02e0f820)
		begin
			$readmemh("./tb1/DM_data.dat",DM1.DM_data);
			$readmemh("./tb1/golden_DM.dat",golden_DM);
			wait ( IM_Address==50 );
			if (!tag_I) begin
				$display("============================================================================");
				$display("\n (T_T)  The simulation result is FAIL!!! Please check jal is work or not !!!.\n");
				$display("============================================================================");
				$finish;
			end
		end
		else//if input is not the origin IM_data (HW1-fib)
		begin
		    tag_origin = 0;			
			$display("============================================================================");
			$display("\n[ testfixture1.v ] The IM_data.dat is not the origin. Please directly check the waveform.\n");
			$display("============================================================================");
		end
	end	
	
	// Rtype test
	initial begin 
		wait ( IM_Address==(2*16 + 9));
		#(`PERIOD * 4);
		if(tag_origin)
		begin
			$display("[ testfixture1.v ] Rtype (with Forwarding) test START !!");
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
				$display("\n (T_T)  The Rtype result of DM_data is FAIL!!! there are some errors in all.\n");
				$display("============================================================================");
				$finish;
			end
			else begin
				$display("============================================================================");
				$display("\n \\(^o^)/  The Rtype result of DM_data is PASS!!!\n");
				$display("============================================================================");		
			end
		end
	end
	
	//Jump test
	initial begin 
		wait ( IM_Address==(2*16 + 12));
		#(`PERIOD * 4);
		if(tag_origin)
		begin
			$display("[ testfixture1.v ] Jump test START !!");
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
				$display("\n (T_T)  The Jump result of DM_data is FAIL!!! there are some errors in all.\n");
				$display("============================================================================");
				$finish;
			end
			else begin
				$display("============================================================================");
				$display("\n \\(^o^)/  The Jump result of DM_data is PASS!!!\n");
				$display("============================================================================");		
			end
		end
	end
	
	//Itype test
	initial begin 
		tag_I = 0;
		wait ( IM_Address==(4*16));
		#(`PERIOD * 6);
		tag_I = 1;
		if(tag_origin)
		begin
			$display("[ testfixture1.v ] Itype (with Branch delay) test START !!");
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
	end
	
	//Load Stall test
	initial begin 
		wait ( IM_Address==(4*16 + 6));
		#(`PERIOD * 6);
		if(tag_origin)
		begin
			$display("[ testfixture1.v ]  Load word test START !!");
			for (i=15;i<16;i=i+1) begin
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
				$display("\n (T_T)  The Load word test result of DM_data is FAIL!!! there are some errors in all.\n");
				$display("============================================================================");
				$finish;
			end
			else begin
				$display("============================================================================");
				$display("\n \\(^o^)/  The Load word test result of DM_data is PASS!!!\n");
				$display("============================================================================");		
			end
		end
	end
	
	initial begin
		
		wait(Instruction == 32'h0000000c);
		#(`PERIOD * 10);
		$display("================================================================================================================"); 
		$display("--------------------------- The simulation has finished at system call ! ---------------------------------------"); 
		$display("================================================================================================================");
		if(!err_R && tag_I)
		begin
				$display("\n");
				$display("        Pipeline CPU Simulation				            ");
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
		else
		begin 
				$display("================================================================================================================");
				$display("--------------------------- (/`n`)/ ~#  There was something wrong with your code !! ---------------------------"); 
				$display("--------------------------- The simulation can't finished!!, Please check it !!! ------------------------------"); 
				$display("================================================================================================================");
		end
		$finish;
	end
	
	// to long
	initial begin 
		#(`PERIOD * `NUM_CLK)
		if(tag_origin)
		begin
			$display("================================================================================================================");
			$display("--------------------------- (/`n`)/ ~#  There was something wrong with your code !! ---------------------------"); 
			$display("--------------------------- The simulation can't finished!!, Please check jr is work or not !!! ---------------"); 
			$display("================================================================================================================");
		end
		$finish;
	end
	
	
	initial begin 
		#(`PERIOD * `NUM_CLK)
		if(tag_origin)
		begin
			$display("================================================================================================================");
			$display("--------------------------- (/`n`)/ ~#  There was something wrong with your code !! ---------------------------"); 
			$display("--------------------------- The simulation can't finished!!, Please check it !!! ------------------------------"); 
			$display("================================================================================================================");
		end
		$finish;
	end
	
	initial begin
	`ifdef VCD
		$dumpfile("top.vcd");
		$dumpvars;
	`endif
	end
	
	
endmodule