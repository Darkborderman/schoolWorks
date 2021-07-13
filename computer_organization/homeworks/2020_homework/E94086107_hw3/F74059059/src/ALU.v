module ALU(
    input        ex,
    input [1:0]  ALUOP,
    input [2:0]  Funct3,
    input [6:0]  Funct7,
    input [31:0] rs1,
    input [31:0] rs2,
    output reg [31:0] alu_out
);

always@(posedge ex) begin
    alu_out <= 0;

    case(ALUOP)
        2'b00, 2'b01: begin // R-type, I-type
            case(Funct3)
                3'b000: begin
                    if(ALUOP == 2'b00) alu_out <= (Funct7[5])? rs1 - rs2 : rs1 + rs2;
                    else alu_out <= rs1 + rs2;
                end
                3'b001: alu_out <= $unsigned(rs1) << rs2[4:0];
                3'b010: alu_out <= $signed(rs1)   < $signed(rs2)   ? 1 : 0;
                3'b011: alu_out <= $unsigned(rs1) < $unsigned(rs2) ? 1 : 0;
                3'b100: alu_out <= rs1 ^ rs2;
                3'b101: begin
                    if(ALUOP == 2'b01) begin
                        alu_out <= (rs2[10] && rs1[31]) ? ((rs1 >> rs2[4:0]) | ~(-32'd1 >> rs2[4:0])) : (rs1 >> rs2[4:0]);
                    end
                    else begin
                        alu_out <= (Funct7[5] && rs1[31]) ? ((rs1 >> rs2[4:0]) | ~(-32'd1 >> rs2[4:0])) : (rs1 >> rs2[4:0]);
                    end
                end
                3'b110: alu_out <= rs1 | rs2;
                3'b111: alu_out <= rs1 & rs2;
            endcase
        end
        2'b10: begin
            alu_out <= rs1 + rs2;
        end
    endcase
end

endmodule