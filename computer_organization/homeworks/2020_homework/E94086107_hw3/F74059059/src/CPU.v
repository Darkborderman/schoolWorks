`include "DECODER.v"
`include "IMMEDIATE_GENERATOR.v"
`include "ALU.v"

module CPU(
    input             clk,
    input             rst,
    input      [31:0] data_out,
    input      [31:0] instr_out,
    output reg        instr_read,
    output reg        data_read,
    output reg [31:0] instr_addr,
    output reg [31:0] data_addr,
    output reg [3:0]  data_write,
    output reg [31:0] data_in
);

reg [31:0] x [31:0];
//wire [31:0] data;
wire [31:0] imm;

wire [6:0] Funct7;
wire [4:0] rs2_addr, rs1_addr, rd_addr;
wire [2:0] Funct3;
wire [6:0] opcode;

assign Funct7   = instr_out[31:25];
assign rs2_addr = instr_out[24:20];
assign rs1_addr = instr_out[19:15];
assign Funct3   = instr_out[14:12];
assign rd_addr  = instr_out[11:7];
assign opcode   = instr_out[6:0];

wire [1:0] ALUOP;
wire [2:0] ImmType;
wire RegWrite, PCtoRegSrc, ALUSrc, RDSrc, MemRead, MemtoReg;
wire [3:0] MemWrite;

DECODER i_DE(
  .opcode     (opcode),
  .Funct3     (Funct3),
  .ImmType    (ImmType),
  .RegWrite   (RegWrite),
  .PCtoRegSrc (PCtoRegSrc), // may no need
  .ALUOP      (ALUOP),
  .ALUSrc     (ALUSrc),
  .RDSrc      (RDSrc),
  .MemRead    (MemRead),
  .MemWrite   (MemWrite),
  .MemtoReg   (MemtoReg)
);

reg id;

IMMEDIATE_GENERATOR i_IG(
    .id (id),
    .ImmType (ImmType),
    .instr (instr_out),
    .imm (imm)
);

reg ex;
wire [31:0] alu_out, pc_or_alu_out; 
reg [31:0] rs1_data, rs2_data; 

ALU i_ALU(
    .ex      (ex),
    .ALUOP   (ALUOP),
    .Funct3  (Funct3),
    .Funct7  (Funct7),
    .rs1     (rs1_data),
    .rs2     (ALUSrc? rs2_data : imm),
    .alu_out (alu_out)
);

reg [31:0] PC, mem_out;
integer stage;

always@(negedge clk) begin
    if(rst) begin
        PC <= 0;
        instr_read <= 1;
        id <= 0;
        ex <= 0;
        data_read <= 0;
        data_write <= 0;
        stage = 0;
        instr_addr <= 32'hfffffffc;
    end
    else begin
        case(stage)
            0: begin // IF
                instr_read <= 1;
                x[0] <= 0;
                instr_addr <= PC;
            end
            1: begin // ID
                id <= 1;
                rs1_data <= x[rs1_addr];
                rs2_data <= x[rs2_addr];
            end
            2: begin // EX
                ex <= 1;
            end
            3: begin // MEM
                //if(MemRead || MemWrite) data_addr <= alu_out;
                data_write <= MemWrite;
                data_read <= MemRead;
                data_addr <= alu_out;
				
				if(opcode == 7'b0100011) begin
					case(Funct3)
						3'b000: begin
							rs2_data = {24'b000000000000000000000000, rs2_data[7:0]};
						end
						3'b001: begin
							rs2_data = {16'b0000000000000000, rs2_data[15:0]};
						end
					endcase
					
					rs2_data = rs2_data << 8 * imm[1:0];
				end
				
                data_in <= rs2_data;
				
                /*
                if(MemWrite) begin
                    //data_write <= 1;
                    data_addr <= alu_out;
                    //data_in <= rs2_data;
                end
                else if(MemRead) begin
                    //data_read <= 1;
                    data_addr <= alu_out;
                    //mem_out <= data_out;
                end
                */
            end
            4: begin // WB
            /*
                if(MemWrite) begin
                    data_in <= rs2_data;
                end
                */
                if(RegWrite) begin
                    //pc_or_alu_out = RDSrc? alu_out : pc_to_reg;

                    //x[rd_addr] <= MemtoReg? mem_out : alu_out;
					if(opcode == 7'b0000011) begin
						case(Funct3)
							3'b010: x[rd_addr] = data_out;
							3'b000: begin
								if(data_out[7]) begin
									x[rd_addr] = {24'b111111111111111111111111, data_out[7:0]};
								end
								else begin
									x[rd_addr] = {24'b000000000000000000000000, data_out[7:0]};
								end
							end
							3'b001: begin
								if(data_out[15]) begin
									x[rd_addr] = {16'b1111111111111111, data_out[15:0]};
								end
								else begin
									x[rd_addr] = {16'b0000000000000000, data_out[15:0]};
								end
							end
							3'b100: x[rd_addr] = {24'b000000000000000000000000, data_out[7:0]};
							3'b101: x[rd_addr] = {16'b0000000000000000, data_out[15:0]};
						endcase
					end
					else if(MemtoReg == 0) begin
						x[rd_addr] = alu_out;
					end
					
					//x[rd_addr] <= MemtoReg? data : alu_out;
                end
                
                if(opcode == 7'b1100111) begin
                    x[rd_addr] <= PC + 4;
                    PC <= imm + rs1_data;
                    PC[0] = 0;
                end 
                else if(opcode == 7'b1100011) begin
                    case(Funct3)
                        3'b000: PC <= (rs1_data == rs2_data)? PC + imm : PC + 4;
                        3'b001: PC <= (rs1_data != rs2_data)? PC + imm : PC + 4;
                        3'b100: PC <= ($signed(rs1_data) <  $signed(rs2_data))? PC + imm : PC + 4;
                        3'b101: PC <= ($signed(rs1_data) >= $signed(rs2_data))? PC + imm : PC + 4;
                        3'b110: PC <= ($unsigned(rs1_data) <  $unsigned(rs2_data))? PC + imm : PC + 4;
                        3'b111: PC <= ($unsigned(rs1_data) >= $unsigned(rs2_data))? PC + imm : PC + 4;
                    endcase
                end 
                else if(opcode == 7'b0010111) begin // AUIPC
                    x[rd_addr] <= PC + imm;
                    PC <= PC + 4;
                end
                else if(opcode == 7'b0110111) begin // LUI
                    x[rd_addr] <= imm;
                    PC <= PC + 4;
                end
                else if(opcode == 7'b1101111) begin // JAL
                    x[rd_addr] <= PC + 4;
                    PC <= PC + imm;
                end
                else begin
                    PC <= PC + 4;
                end

                // init
                instr_read <= 1;
                id <= 0;
                ex <= 0;
                data_read <= 0;
                data_write <= 0;
            end
        endcase

        
        stage = (stage + 1) % 5;
    end
end
endmodule