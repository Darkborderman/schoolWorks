module traffic_light(clk,rst,pass,R,G,Y);
input clk,rst,pass;
output R,G,Y;
reg [4:0]counter;
reg R,G,Y;

always@(posedge clk, posedge rst,posedge pass)
begin
	if(rst==1'b1) counter<=0;
	else if(pass==1'b1&&G==0) counter<=10;
	else if(counter==26) counter<=0;
	else counter<=counter+1;
end
always @(counter)
begin
	if(counter>=0&&counter<10)
	begin
		G<=0;
		Y<=0;
		R<=1;
	end
	else if(counter>=10&&counter<=21)
	begin
		G<=1;
		Y<=0;
		R<=0;
	end
	else
	begin
		G<=0;
		Y<=1;
		R<=0;
	end
end
endmodule