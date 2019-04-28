`timescale 1ns / 1ps

module MUX_2_to_1(data0_i,data1_i,select_i,data_o);

    parameter size = 0;	
    input   [size-1:0] data0_i;          
    input   [size-1:0] data1_i;
	 input              select_i;
    output  [size-1:0] data_o; 
	 wire [size-1:0] data_o;
	 
    assign data_o=(select_i ==1 )?data1_i:data0_i;

endmodule
