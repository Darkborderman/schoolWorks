`timescale 1ns / 1ps
`define test_file "test1.txt"

`define ans_reg "ans_reg.txt"
`define ans_mem "ans_mem.txt"

`define total_cycles 25 //2 cycles

module TestBench();

reg CLK, START;

reg [15:0]ansREG[200:0];
reg [15:0]ansMEM[200:0];
reg [15:0]out_temp;
reg fin;




reg [15:0] count;
integer i;
integer exp_num_reg;
integer exp_num_mem;
integer err;


CPU i_CPU(CLK, START);

initial begin
	fin=0;
	CLK = 0;
	START = 0;
	count = 0;
	exp_num_reg = 0;
	exp_num_mem = 0;
	err = 0;
	for(i = 0; i < 32; i = i + 1)
		i_CPU.i_IM.InstrMemory[i] = 0;
	$readmemb(`test_file, i_CPU.i_IM.InstrMemory);
	$readmemh(`ans_reg, ansREG);
	$readmemh(`ans_mem, ansMEM);
	for(i = 0; i < 8; i = i + 1) begin
		i_CPU.i_Reg.Register[i] = 0;
		if(i==0)
			i_CPU.i_DM.DataMemory[i] = 5;
		else
			i_CPU.i_DM.DataMemory[i] = 0;
	end
		
	#5
	//start
	#(`total_cycles * 10)
	//running
	#5
	//end
	fin=1;
	#1
	$stop;
end

always #5 CLK = ~CLK;

always@(posedge CLK) begin
	if(START == 0)
		START <= 1;
	else
		START <= START;
end

always@(posedge CLK) begin
	if(START == 1 && count > 0) begin
		#1
		
		
		for(i = 0; i < 8; i = i + 1)begin
			out_temp = ansREG[exp_num_reg+i];
			if(i_CPU.i_Reg.Register[i]!==out_temp)begin
				$display("ERROR at cycle %3d   reg %3d : value %4h !=expect %4h " , count, i , i_CPU.i_Reg.Register[i], out_temp);
				err = 1;
			end
		end	
		
		
		
		for(i = 0; i < 8; i = i + 1)begin
			out_temp = ansMEM[exp_num_reg+i];
			if(i_CPU.i_DM.DataMemory[i]!==out_temp)begin
				$display("ERROR at cycle %3d   MEM %3d : value %4h !=expect %4h " , count, i , i_CPU.i_DM.DataMemory[i], out_temp);
				err = 1;
			end
		end	
		
		#1
		exp_num_reg = exp_num_reg + 8;
		exp_num_mem = exp_num_mem + 8;
		count = count + 1;
	end
	else begin
		#1
		count = count + 1;
	end
end


always@(posedge fin) begin
	$display("\n");
	$display("MIPS CPU");
	if(err) begin
		$display("================================================================================================================");
		$display("--------------------------- (/`n`)/ ~#  There was something wrong with your code !! ----------------------------"); 
		$display("--------------------------- The simulation has finished with some error, Please check it !!! -------------------"); 
		$display("================================================================================================================");
	end
	else begin
		$display("        ****************************              ");
		$display("        **                        **       /|__/|");
		$display("        **  Congratulations !!    **      / O,O  |");
		$display("        **                        **    /_____   |");
		$display("        **  Simulation PASS!!     **   /^ ^ ^ \\  |");
		$display("        **                        **  |^ ^ ^ ^ |w|");
		$display("        *************** ************   \\m___m__|_|");
		$display("\n");
	end
end



endmodule
