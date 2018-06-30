module adder(input1,input2,cout,sum);

	input input1;
	input input2;
	
	output cout;
	output sum;

	assign sum = input1 ^ input2;
	assign cout = input1 & input2;

	

endmodule