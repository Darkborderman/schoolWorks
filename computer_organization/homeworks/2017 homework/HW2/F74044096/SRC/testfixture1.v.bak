`timescale 1ns/10ps

`define TEST_DATA "./tb1/IM_data.dat"
`define golden_DM_DATA "./tb1/golden_DM.dat"
`define PERIOD 10
`define NUM_CLK 1000

module testfixture1;
	
parameter bit_size = 32;
parameter mem_size = 16;

reg clk, rst;
reg [31:0] golden_DM [0:99];
reg err_R, err_I, err_J;


// Instruction Memory
wire [mem_size-1:0] IM_Address;	
wire [bit_size-1:0] Instruction;

// Data Memory
wire [mem_size-1:0] DM_Address;
wire DM_enable;
wire [bit_size-1:0] DM_Write_Data;
wire [bit_size-1:0] DM_Read_Data;

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

// to long
initial begin 
  #(`PERIOD * `NUM_CLK)
  $display("================================================================================================================");
  $display("--------------------------- (/`n`)/ ~#  There was something wrong with your code !! ---------------------------"); 
  $display("------------------ The simulation can't finished!!, Please check Branch, Jtype or jr is work or not !!! -------"); 
  $display("================================================================================================================");
  $finish;
end

// Check
initial begin

  // Check Rtype
  $display("[ testfuxture1.v ] Rtype test START !!");
  wait(IM_Address==31);
	#1
  for (i=0;i<10;i=i+1) begin
    if(golden_DM[i] != DM1.DM_data[i]) begin
	  $display("DM_data[%d] = %h  ERROR, EXPECT DM_data[%d]= %h ", i, DM1.DM_data[i], i, golden_DM[i]);
	  err_R = 1;
	end
  end
  if (err_R) begin			
	$display("============================================================================================");
	$display("\n (T_T)  The Rtype result of DM_data is FAIL(include addi)!!! there have some errors in all.\n");
	$display("============================================================================================");
	$finish;
  end
  else begin
	$display("============================================================================");
	$display("\n \\(^o^)/  The Rtype result of DM_data is PASS!!!\n");
	$display("============================================================================");		
  end
  
  // Check Itype
  $display("[ testfuxture1.v ] Itype test START !!");
  wait(IM_Address==42);
	#1
  for (i=10;i<15;i=i+1) begin
    if(golden_DM[i] != DM1.DM_data[i]) begin
      $display("DM_data[%d] = %h  ERROR, EXPECT DM_data[%d]= %h ", i, DM1.DM_data[i], i, golden_DM[i]);
      err_I = 1;
    end
  end
  if (err_I) begin		
    $display("============================================================================================");
    $display("\n (T_T)  The Itype result of DM_data is FAIL!!! there have some errors in all.\n");
    $display("============================================================================================");
    $finish;
  end
  else begin
    $display("============================================================================");
    $display("\n \\(^o^)/  The Itype result of DM_data is PASS!!!\n");
    $display("============================================================================");		
  end
  
  // Check Jtype
  $display("[ testfuxture1.v ] Jtype test START !!");
  wait(IM_Address==44);
  #(`PERIOD * 2) if(IM_Address < 51) begin
    err_J = 1;
  end
  #(`PERIOD * 4) if(IM_Address > 54) begin
    err_J = 1;
  end
  if (err_J) begin		
    $display("============================================================================================");
    $display("\n (T_T) The Jtype or Jr result of DM_data is FAIL!!! there have some errors in all.\n");
    $display("============================================================================================");
    $finish;
  end
  wait(IM_Address==60);
  $display("============================================================================");
  $display("\n \\(^o^)/  The Jtype result of DM_data is PASS!!!\n");
  $display("============================================================================");
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
  $finish;
end

// Reset
initial begin
  clk = 0;
  rst = 0;
  err_R = 0;
  err_I = 0;
  err_J = 0;
  $readmemh(`TEST_DATA, IM1.IM_data);
  $readmemh(`golden_DM_DATA, golden_DM);
  #6 rst = 1;
  #(`PERIOD ) rst = 0;
end

`ifdef VCD
initial begin
  $dumpfile("top.vcd");
  $dumpvars;
end
`endif
	
	
endmodule