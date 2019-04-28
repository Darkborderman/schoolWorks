`timescale 1ns/100ps


`define ANSTXT "ans.txt"
`define TOTAL_CYCLES 76

module traffic_light_tb;

reg         sysclk;
reg         rst;
reg         pass;
wire        R,G,Y;


reg [2:0]ans[75:0];
reg [2:0]out;


reg [15:0]count;
reg start;
reg fin;
integer error;


always begin
	forever #10 sysclk=!sysclk;
end

initial begin
    sysclk=1'b0;
	pass=1'b0;
	rst=1'b0;
	error = 0;
end

initial begin
 #1 rst=1'b1;
 #1 rst=1'b0;
end

initial begin
	start = 0;
	count = 0;
	
	repeat(5)begin
		@(posedge sysclk);
	end
	@(posedge sysclk)
		pass=1'b1;
	@(posedge sysclk)
		pass=1'b0;
	@(posedge sysclk)
	@(posedge sysclk)
		pass=1'b1;
	@(posedge sysclk)
		pass=1'b0;
	repeat(20)begin
		@(posedge sysclk);
	end	
	@(posedge sysclk)
		pass=1'b1;
	@(posedge sysclk)
		pass=1'b0;
end

initial begin
	$readmemb(`ANSTXT, ans);
	fin = 0;
	#(`TOTAL_CYCLES * 20);
	fin = 1;
	#5;
	$stop;

end

traffic_light tl(
	.clk	(sysclk),
	.rst	(rst),
	.pass	(pass),
	.R		(R),
	.G		(G),
	.Y		(Y)
);

always@(posedge rst or posedge sysclk) begin
	if(start == 0 && rst == 1)
		start <= 1;
	else
		start <= start;
end

always@(posedge sysclk) begin
	if(start == 1 && count > 0) begin
		#1
		out = ans[count];
		if (out[2]!==R || out[1]!== G || out[0]!== Y)begin
			$write("Error at %0dth cycle:\n", count);
			$write("Real answer: R = %d ,G = %d ,Y = %d\n",out[2] ,out[1] ,out[0]);
			$write("Your answer: R = %d ,G = %d ,Y = %d\n",R ,G ,Y);
			error = error + 1;
		end
		count = count + 1;
	end
	else begin
		#1
		count = count + 1;
	end
end


always@(posedge fin)begin
	if(error != 0) begin
		$display("================================================================================================================");
		$display("-------------------------------- (/`n`)/ ~#  There was %2d errors in your code !! -------------------------------",error); 
		$display("--------------------------- The simulation has finished with some error, Please check it !!! -------------------"); 
		$display("================================================================================================================");
	end
	else begin
		$display("\n");
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











