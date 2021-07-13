module DECODER(
  input  [6:0] opcode,
  input  [2:0] Funct3,
  output reg [2:0] ImmType,
  output reg RegWrite,
  output reg PCtoRegSrc,
  output reg [1:0] ALUOP,
  output reg ALUSrc,
  output reg RDSrc,
  output reg MemRead,
  output reg [3:0] MemWrite,
  output reg MemtoReg
);

// ALUSrc?     R : I
// PCtoRegSrc? PC+4 : PC+imm
// RDSrc?      pc_to_reg : alu_out

always@(opcode) begin
  case(opcode)
    7'b0110011: begin // R-type
      ImmType    <= 3'b000;
      RegWrite   <= 1;
      PCtoRegSrc <= 0;
      ALUOP      <= 2'b00;
      ALUSrc     <= 1;
      RDSrc      <= 0;
      MemRead    <= 0;
      MemWrite   <= 0;
      MemtoReg   <= 0;
    end
    7'b0000011, 7'b0010011, 7'b1100111: begin // I-type
      ImmType    <= 3'b001;
      RegWrite   <= 1;
      PCtoRegSrc <= (opcode == 7'b1100111)? 1 : 0;
      ALUOP      <= (opcode == 7'b0000011)? (2'b10) : (2'b01);
      ALUSrc     <= 0;
      RDSrc      <= (opcode == 7'b1100111)? 1 : 0;
      MemRead    <= (opcode == 7'b0000011)? 1 : 0;
      MemWrite   <= 0;
      MemtoReg   <= (opcode == 7'b0000011)? 1 : 0;
    end
    7'b0100011: begin // S-type
      ImmType    <= 3'b010;
      RegWrite   <= 0;
      PCtoRegSrc <= 0;
      ALUOP      <= 2'b10;
      ALUSrc     <= 0;
      RDSrc      <= 0;
      MemRead    <= 0;
	  case(Funct3)
		3'b010: MemWrite <= 4'b1111;
		3'b000: MemWrite <= 4'b0001;
		3'b001: MemWrite <= 4'b0011;
	  endcase
      MemtoReg   <= 0;
    end
    // special handle on CPU.v below
    7'b1100011: begin // B-type
      ImmType    <= 3'b011; 
      RegWrite   <= 0;
      MemRead    <= 0;
      MemWrite   <= 0;
    end
    7'b0010111, 7'b0110111: begin // U-type
      ImmType    <= 3'b100;
      RegWrite   <= 0;
      PCtoRegSrc <= 1;
      MemRead    <= 0;
      MemWrite   <= 0;
    end
    7'b1101111: begin // J-type
      ImmType    <= 3'b101;
      RegWrite   <= 0;
      PCtoRegSrc <= 1;
      MemRead    <= 0;
      MemWrite   <= 0;
    end
  endcase
end

endmodule