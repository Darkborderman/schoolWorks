`timescale 1ns/10ps
module rip_4bit_tb;

	reg [3:0]input1;
	reg [3:0]input2;
	reg cin;
	wire [3:0]sum;
	wire cout;
	reg [4:0] exp_out;
	reg tmp;
	reg [6:0] i;
	
	rip_4bit rip(.input1(input1),.input2(input2),.cin(cin),.sum(sum),.cout(cout));
	
	initial	begin
		tmp = 0;
		i = 0;
	end
	
	always begin
		input1 = $random;
		input2 = $random;
		cin = $random;
		exp_out = input1 + input2 + cin;	
		#1 if (exp_out !== {cout,sum}) begin
			if (!tmp) begin				
				$display("| num | exp_cout | exp_sum | cout |  sum | input1 | input2 | cin |");
			end
			tmp = 1;
			$display("| %d |        %b |    %b |    %b | %b |   %b |   %b |   %b |", i, exp_out[4], exp_out[3:0], cout, sum, input1, input2, cin);
		end
		#9 i = i + 1;
	end	
	
	initial begin 
		#1000 if (!tmp)
			$display("\nCongratulations! You passed all tests!\n");
		else
			$display("\nThere was something wrong with your code !!\n");
			
		$finish;
	end
	
endmodule
