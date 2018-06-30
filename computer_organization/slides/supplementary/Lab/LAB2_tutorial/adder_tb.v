`timescale 1ns/10ps
module adder_tb;

reg input1;
reg input2;
wire sum;
wire cout;
initial begin
input1 = 1'b1;
input2 = 1'b1;
end

adder add(.input1(input1),.input2(input2),.cout(cout),.sum(sum));

endmodule