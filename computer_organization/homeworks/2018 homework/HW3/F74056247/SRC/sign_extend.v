`timescale 1ns / 1ps

module sign_extend(Immediate_In, Sign_Extend );

   input [13:0] Immediate_In;
	output [15:0] Sign_Extend;
	wire [15:0] Sign_Extend;
	
	assign Sign_Extend= {Immediate_In[13],Immediate_In[13],Immediate_In};

endmodule
