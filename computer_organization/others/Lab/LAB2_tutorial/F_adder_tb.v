`timescale 1ns/10ps
module F_adder_tb;

reg input1;
reg input2;
reg cin;
wire sum;
wire cout;
initial begin
input1 = 1'b1;
input2 = 1'b0;
cin = 1'b1;
end

F_adder add(.input1(input1),.input2(input2),.cin(cin),.sum(sum),.cout(cout));

endmodule