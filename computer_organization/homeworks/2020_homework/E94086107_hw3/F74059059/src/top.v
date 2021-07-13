// Please DO NOT modify this file !!!

`include "CPU.v"
`include "SRAM.v"

module top(
    input clk, 
    input rst
);

wire        instr_read;
wire [31:0] instr_addr;
wire [31:0] instr_out;
wire        data_read;
wire [3:0]  data_write;
wire [31:0] data_addr;
wire [31:0] data_in;
wire [31:0] data_out;

CPU i_CPU(
    .clk        ( clk              ),
    .rst        ( rst              ),
    .instr_read ( instr_read       ),
    .instr_addr ( instr_addr       ),
    .instr_out  ( instr_out        ),
    .data_read  ( data_read        ),
    .data_write ( data_write       ),
    .data_addr  ( data_addr        ),
    .data_in    ( data_in          ),
    .data_out   ( data_out         )
);

SRAM i_IM(
    .clk        ( clk              ),
    .rst        ( rst              ),
    .addr       ( instr_addr[15:2] ),
    .read       ( instr_read       ),
    .write      ( 4'b0             ),
    .DI         ( 32'b0            ),
    .DO         ( instr_out        )
);

SRAM i_DM(
    .clk        ( clk             ),
    .rst        ( rst             ),
    .addr       ( data_addr[15:2] ),
    .read       ( data_read       ),
    .write      ( data_write      ),
    .DI         ( data_in         ),
    .DO         ( data_out        )
);

endmodule
