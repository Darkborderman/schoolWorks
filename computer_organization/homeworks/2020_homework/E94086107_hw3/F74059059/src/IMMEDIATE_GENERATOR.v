module IMMEDIATE_GENERATOR(
    input            id,
    input      [2:0] ImmType,
    input      [31:0] instr,
    output reg [31:0] imm
);

always@(posedge id) begin
    imm <= 0;

    case(ImmType)
        3'b001: begin // I-type
            /*
            imm <= instr[31:20];
            if(imm[11]) begin
                imm[31:0] <= {21'b111111111111111111111, imm[10:0]};
            end
            */
            if(instr[31]) begin
                imm[31:0] <= {20'b11111111111111111111, instr[31:20]};
            end
            else begin
                imm[31:0] <= {20'b00000000000000000000, instr[31:20]};
            end
        end
        3'b010: begin // S-type
            /*
            imm <= {instr[31:25], instr[11:7]};
            if(imm[11]) begin
                imm[31:0] <= {21'b111111111111111111111, imm[10:0]};
            end
            */
            if(instr[31]) begin
                imm[31:0] <= {20'b11111111111111111111, instr[31:25], instr[11:7]};
            end
            else begin
                imm[31:0] <= {20'b00000000000000000000, instr[31:25], instr[11:7]};
            end
        end
        3'b011: begin // B-type
            /*
            imm[12]   <= instr[31];
            imm[11]   <= instr[7];
            imm[10:5] <= instr[30:25];
            imm[4:1]  <= instr[11:8];
            */
            //imm[31:0] <= {19'b0000000000000000000, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};

            if(instr[31]) begin
                imm[31:0] <= {19'b1111111111111111111, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
            end
            else begin
                imm[31:0] <= {19'b0000000000000000000, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
            end
        end
        3'b100: begin // U-type
            imm[31:12] <= instr[31:12];
            imm[11:0] <= 11'b0;
        end
        3'b101: begin // J-type
            /*
            imm[20]    <= instr[31];
            imm[19:12] <= instr[19:12];
            imm[11]    <= instr[20];
            imm[10:1]  <= instr[30:21];
            */
            if(instr[31]) begin
                imm[31:0] <= {11'b11111111111, instr[31], instr[19:12], instr[20], instr[30:21], 1'b0};
            end
            else begin
                imm[31:0] <= {11'b00000000000, instr[31], instr[19:12], instr[20], instr[30:21], 1'b0};
            end
        end
    endcase
end

endmodule