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
	wire IM_en_Read;
	wire [bit_size-1:0] Instruction;
	
	// Data Memory
	wire [mem_size-1:0] DM_Address;
	wire DM_en_Read;
	wire DM_en_Write;
	wire [bit_size-1:0] DM_Write_Data;
	wire [bit_size-1:0] DM_Read_Data;
	
	//use for test
	reg [31:0] golden_DM [0:1023];
	reg err_R;
	integer cycle_cnt;
	//For use of instruction count & hit rate calculate
	real instr_cnt;
	real hit_rate;
	real miss_cnt_double;
	wire IC_stall;
	wire [bit_size-1:0] I_cache_out;
	
	IM IM1 (
	.clk(clk),
	.rst(rst),
	.IM_Address(IM_Address),
	.IM_en_Read(IM_en_Read),
	.Instruction(Instruction)
	);
	
	DM DM1 ( 
	.clk(clk),
	.rst(rst),
	.DM_Address(DM_Address),
	.DM_en_Read(DM_en_Read),
	.DM_en_Write(DM_en_Write),
	.DM_Write_Data(DM_Write_Data),
	.DM_Read_Data(DM_Read_Data)
	);
	
	top top1 (
	.clk(clk),
	.rst(rst),
	// Instruction Memory
	.IM_Address(IM_Address),
	.IM_en_Read(IM_en_Read),
	.Instruction(Instruction),
	// Data Memory
	.DM_Address(DM_Address),
	.DM_en_Read(DM_en_Read),
	.DM_en_Write(DM_en_Write),
	.DM_Write_Data(DM_Write_Data),
	.DM_Read_Data(DM_Read_Data),
	.IC_stall_out(IC_stall),
	.I_cache_instr_out(I_cache_out)
	);
	
	// clk part
	always #(`PERIOD/2) clk = ~clk;
	
	//cycle counting 
	always @(posedge clk or posedge rst)
	begin
		cycle_cnt=rst?0:cycle_cnt+1;
	end
	
	//instruction counting & hit rate calculate
	always @(negedge clk or posedge rst)
	begin
		if(!rst)
		begin
			instr_cnt = IC_stall ? instr_cnt : instr_cnt + 1;
			miss_cnt_double = IC_stall ? miss_cnt_double + 1 : miss_cnt_double;
			if((I_cache_out[31:26] == 6'b000010||		//j
				I_cache_out[31:26] == 6'b000011||		//jal
				{I_cache_out[31:26], I_cache_out[5:0]} == 12'b000000001000) //jr
				&&!IC_stall)
				begin
				    instr_cnt = instr_cnt - 2;
				end
			if((Instruction[31:26] == 6'b000010||		//j
				Instruction[31:26] == 6'b000011||		//jal
				{Instruction[31:26], Instruction[5:0]} == 12'b000000001000) //jr
				&&IC_stall)
				begin
					miss_cnt_double = miss_cnt_double - 2;
				end
		end
		else
		begin
			instr_cnt=0;
			miss_cnt_double=0;
		end
	end
	
	integer i;
	
	initial begin
		clk = 0;
		rst = 0;
		err_R = 1;
		
		#6 rst = 1;
		#(`PERIOD ) rst = 0;
		#(`PERIOD );
		cycle_cnt=0;
		instr_cnt=0;
		miss_cnt_double=0;
		hit_rate=1;
		$readmemh("./tb1/IM_data.dat",IM1.IM_data);
		$readmemh("./tb1/DM_data.dat",DM1.DM_data);
		$readmemh("./tb1/golden_DM.dat",golden_DM);
		//wait ( IM_Address==62 );
		
		
		/*
		if (!tag_I) begin
			$display("============================================================================");
			$display("\n (T_T)  The simulation result is FAIL!!! Please check jal is work or not !!!.\n");
			$display("============================================================================");
			$finish;
		end*/
	end	
	
	// golden DM test
	initial begin 
		wait ( IM_Address==20);
		err_R=0;
		wait ( IM_Address==(3*16 + 12));
		#(`PERIOD * 12);
		
		$display("[ testfixture1.v ] Instruction test START !!");
		for (i=0;i<12;i=i+1) begin
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
			$display("\n (T_T)  The result of DM_data is FAIL!!! there are some errors in all.\n");
			$display("============================================================================");
			$finish;
		end
		else begin
			$display("============================================================================");
			$display("\n \\(^o^)/  The result of DM_data is PASS!!!\n");
			$display("============================================================================");		
		end
	end
	
	
	initial begin
		
		wait(Instruction == 32'h0000000c);
		#(`PERIOD * 3);
		hit_rate=1-(miss_cnt_double/2)/instr_cnt;
		$display("============================================================================================"); 
		$display("------- The simulation has finished at system call ! ---------------------------------------"); 
		$display("------- Your cycle count is %5d ! --------------------------------------------------------",cycle_cnt); 
		$display("------- Your instruction count is %5d ! --------------------------------------------------",instr_cnt); 
		$display("------- Your I-Cache hit rate is %0.5f ! --------------------------------------------------",hit_rate); 
		$display("============================================================================================");
		if(!err_R && hit_rate > 0.5)
		begin
				$display("\n");
				$display("        Pipeline CPU with direct map Cache Simulation				            ");
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
		else if(hit_rate <= 0.5)
		begin 
				$display("================================================================================================================");
				$display("--------------------------- (/`n`)/ ~#  There was something wrong with your code !! ----------------------------"); 
				$display("----------------- The cache didn't work well. The hit rate is too low. Please check it !!! ---------------------"); 
				$display("================================================================================================================");
		end
		else
		begin 
				$display("================================================================================================================");
				$display("--------------------------- (/`n`)/ ~#  There was something wrong with your code !! ----------------------------"); 
				$display("--------------------------- The simulation has finished with some error, Please check it !!! -------------------"); 
				$display("================================================================================================================");
		end
		$finish;
	end
	
	// to long	
	initial begin 
		#(`PERIOD * `NUM_CLK)
		$display("================================================================================================================");
		$display("--------------------------- (/`n`)/ ~#  There was something wrong with your code !! ----------------------------"); 
		$display("-----------------The simulation is timeout !!(Time Limit: 1000 cycles), Please check it !!!---------------------"); 
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