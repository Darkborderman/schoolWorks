// Please DO NOT modify this file !!!

module SRAM(
    clk,
    rst,
    addr,
    read,
    write,
    DI,
    DO
);

parameter BYTES_SIZE     = 8;
parameter BYTES_CNT      = 4;
parameter WORD_SIZE      = BYTES_SIZE * BYTES_CNT;
parameter WORD_ADDR_BITS = 14;
parameter WORD_CNT       = 1 << WORD_ADDR_BITS;

input                       clk;
input                       rst;
input  [WORD_ADDR_BITS-1:0] addr;
input                       read;
input  [3:0]                write;
input  [     WORD_SIZE-1:0] DI;
output reg [     WORD_SIZE-1:0] DO;

reg [BYTES_SIZE-1:0] Memory_byte3 [0:WORD_CNT-1];
reg [BYTES_SIZE-1:0] Memory_byte2 [0:WORD_CNT-1];
reg [BYTES_SIZE-1:0] Memory_byte1 [0:WORD_CNT-1];
reg [BYTES_SIZE-1:0] Memory_byte0 [0:WORD_CNT-1];
wire [     WORD_SIZE-1:0] tmp_DO;
assign tmp_DO = {  Memory_byte3[addr],
                   Memory_byte2[addr],
                   Memory_byte1[addr],
                   Memory_byte0[addr] };

always @(posedge clk) begin
    DO <= (read)?tmp_DO:32'bz;
end

always @(posedge clk) begin
    if(write[0]) Memory_byte0[addr] <= DI[7:0];
    if(write[1]) Memory_byte1[addr] <= DI[15:8];
    if(write[2]) Memory_byte2[addr] <= DI[23:16];
    if(write[3]) Memory_byte3[addr] <= DI[31:24];
end

endmodule
