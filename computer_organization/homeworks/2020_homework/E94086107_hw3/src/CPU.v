// Please include verilog file if you write module in other file
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

/* Add your design */

integer index;
reg signed [31:0] x [31:0];
reg [31:0] PC;
reg [6:0] opcode, funct7;
reg [4:0] rs1, rs2, rd;
reg signed [11:0] iimm, simm;
reg [12:0] bimm;
reg [2:0] funct3;
reg [31:0] uimm, jimm;
reg [63:0] tmp;
reg flag;


//parameter2
parameter READ   = 3'd0;
parameter DECODE = 3'd1;
parameter NEXT   = 3'd2;
parameter HALF   = 3'd3;
parameter LOAD   = 3'd4;

reg [3:0] state;

parameter R  = 4'd0;
parameter I0 = 4'd1;
parameter I1 = 4'd2;
parameter I2 = 4'd3;
parameter S  = 4'd4;
parameter B  = 4'd5;
parameter U0 = 4'd6; 
parameter U1 = 4'd7;
parameter J  = 4'd8;
parameter NO = 4'd9;

reg [4:0] optype;

//state
always@(posedge clk)begin
    if(rst)begin
        state <= READ;
        flag <= 0;
        tmp <= 0;
    end
    else begin 
        case(state)
            READ:begin
                if(flag == 0)begin
                    flag <= 1;
                    state <= state;
                end
                else begin
                    state <= DECODE;
                    flag <= 0;
                end
            end 
            DECODE:begin
                case(optype)
                    R:  state <= NEXT;
                    I0: state <= HALF;
                    I1: state <= HALF;
                    I2: state <= HALF;
                    S:  state <= HALF;
                    B:  state <= HALF;
                    U0: state <= HALF;
                    U1: state <= HALF; 
                    J:  state <= HALF;
                    default: state <= state;
                endcase
            end
            HALF: begin
                case(optype)
                    I0: state <= LOAD;
                    I1: state <= NEXT;
                    I2: state <= NEXT;
                    S:  state <= NEXT;
                    B:  state <= NEXT;
                    U0: state <= NEXT;
                    U1: state <= NEXT;
                    J:  state <= NEXT;
                    default: state <= state;
                endcase
            end
            LOAD: state <= READ;
            NEXT: state <= READ;
            default: state <= state; 
        endcase
    end
end

//opcode
always@(posedge clk)begin
    if(rst)begin
        opcode <= 0;
    end
    else begin
        case(state)
            READ: opcode <= instr_out[6:0];
            default: opcode <= opcode;
        endcase
    end
end

//optype
always@(posedge clk)begin
    if(rst)begin
        optype <= NO;
    end
    else begin
        case(state)
        READ:begin
            case(instr_out[6:0])
                7'b0110011: optype <= R;
                7'b0000011: optype <= I0;
                7'b0010011: optype <= I1;
                7'b1100111: optype <= I2;
                7'b0100011: optype <= S;
                7'b1100011: optype <= B;
                7'b0010111: optype <= U0;
                7'b0110111: optype <= U1;
                7'b1101111: optype <= J;
                default: optype <= NO;
            endcase
        end
        DECODE: optype <= optype;
        HALF:   optype <= optype;
        LOAD:   optype <= NO;
        NEXT:   optype <= NO;
        default: optype<= NO;
        endcase
    end
end 

//instr_read
always@(posedge clk)begin
    instr_read <= 1;
end

//data_read
always@(posedge clk)begin
    if(rst)begin
        data_read <= 0;
    end
    else begin
        case(optype)
            I0: data_read <= 1;
            default: data_read <= 0;
        endcase
    end
end

//instr_addr
always@(posedge clk)begin
    if(rst)begin
        instr_addr <= 0;
    end
    else begin
        case(state)
            READ:   instr_addr <= instr_addr;
            DECODE: instr_addr <= instr_addr;
            HALF:   instr_addr <= instr_addr;
            LOAD:   instr_addr <= PC;
            NEXT:   instr_addr <= PC;
            default: instr_addr <= instr_addr;
        endcase
    end
end

//data_addr
always@(posedge clk)begin
    if(rst)begin
        data_addr <= 0;
    end
    else begin
        case(state)
        DECODE:begin
            case(optype)
            I0: data_addr <= x[rs1] + iimm;
            S: data_addr <= x[rs1] + simm;
            default: data_addr <= data_addr;
            endcase
        end
        LOAD: data_addr <= 0;
        NEXT: data_addr <= 0;
        default: data_addr <= data_addr;
        endcase
    end
end

//data_write
always@(posedge clk)begin
    if(rst)begin
        data_write <= 0;
    end
    else begin
        case(optype)
        S:begin
            case(funct3)
            3'b010: data_write <= 4'b1111;
            3'b000:begin
                case(simm[1:0])
                2'b00: data_write <= 4'b0001;
                2'b01: data_write <= 4'b0010;
                2'b10: data_write <= 4'b0100;
                2'b11: data_write <= 4'b1000;
                default: data_write <= 4'b1000;
                endcase
            end 
            3'b001:begin
                case(simm[1:0])
                2'b00: data_write <= 4'b0011;
                2'b10: data_write <= 4'b1100;
                default: data_write <= 4'b1100;
                endcase
            end 
            default: data_write <= 4'b1111;
            endcase
        end
        default: data_write <= 0;
        endcase
    end
end

//data_in
always@(posedge clk)begin
    if(rst)begin
        data_in <= 0;
    end
    else begin   
        case(optype)
        S:begin
            case(funct3)
            3'b010: data_in <= x[rs2];
            3'b000:begin
                case(simm[1:0])
                2'b00: data_in[7:0] <= x[rs2][7:0];
                2'b01: data_in[15:8] <= x[rs2][7:0];
                2'b10: data_in[23:16] <= x[rs2][7:0];
                2'b11: data_in[31:24] <= x[rs2][7:0];
                default: data_in[31:24] <= x[rs2][7:0];
                endcase
            end
            3'b001:begin
                case(simm[1:0])
                2'b00: data_in[15:0] <= x[rs2][15:0];
                2'b10: data_in[31:16] <= x[rs2][15:0];
                default: data_in[31:16] <= x[rs2][15:0];
                endcase
            end
            default: data_in[rs2] <= x[rs2];
            endcase 
        end
        default: data_in <= 0;
        endcase
    end
end

//funct7
always@(posedge clk)begin
    if(rst)begin
        funct7 <= 0;
    end
    else begin
        case(state)
        READ: funct7 <= instr_out[31:25];
        default: funct7 <= funct7;
        endcase
    end    
end

//rs2
always@(posedge clk)begin
    if (rst)begin
        rs2 <= 0;
    end
    else begin
        case(state)
        READ: rs2 <= instr_out[24:20];
        default: rs2 <= rs2;
        endcase
    end
end

//rs1
always@(posedge clk)begin
    if(rst)begin
        rs1 <= 0;
    end
    else begin
        case(state)
        READ: rs1 <= instr_out[19:15];
        default: rs1 <= rs1;
        endcase
    end
end

//funct3
always@(posedge clk)begin
    if(rst)begin
        funct3 <= 0;
    end
    else begin
        case(state)
        READ: funct3 <= instr_out[14:12];
        default: funct3 <= funct3;
        endcase
    end
end

//rd
always@(posedge clk)begin
    if(rst)begin
        rd <= 0;
    end
    else begin
        case(state)
        READ: rd <= instr_out[11:7];
        default: rd <= rd;
        endcase
    end
end

//iimm
always@(posedge clk)begin
    if(rst)begin
        iimm <= 0;
    end
    else begin
        case(state)
        READ:begin
            if(flag)begin
                iimm <= instr_out[31:20];
            end
            else begin
                iimm <= iimm;
            end
        end 
        NEXT: iimm <= 0;
        default: iimm <= iimm;
        endcase
    end
end

//simm
always@(posedge clk)begin
    if(rst)begin
        simm <= 0;
    end
    else begin
        case(state)
        READ:begin
            if(flag)begin
                simm[11:5] <= instr_out[31:25];
                simm[4:0]  <= instr_out[11:7];
            end
            else begin
                simm <= simm;
            end
        end
        NEXT: simm <= 0; 
        default: simm <= simm; 
        endcase
    end
end

//bimm
always@(posedge clk)begin
    if(rst)begin
        bimm <= 0;
    end
    else begin
        case(state)
        READ: bimm <= 0;
        DECODE:begin
            case(optype)
            B:begin
                bimm[12]   <= instr_out[31]   ;
                bimm[10:5] <= instr_out[30:25];
                bimm[4:1]  <= instr_out[11:8] ;
                bimm[11]   <= instr_out[7]    ;
            end
            default: bimm <= bimm;
            endcase
        end
        default: bimm <= bimm;
        endcase
    end
end

//uimm
always@(posedge clk)begin
    if(rst)begin
        uimm <= 0;
    end
    else begin
        case(state)
        READ: uimm <= 0;
        DECODE:begin
            case(optype)
            U0: uimm[31:12] <= instr_out[31:12];
            U1: uimm[31:12] <= instr_out[31:12];
            default: uimm <= 0;
            endcase
        end
        default: uimm <= uimm;
        endcase
    end
end

//jimm
always@(posedge clk)begin
    if(rst)begin
        jimm <= 0;
    end
    else begin
        case(state)
        READ: jimm <= 0;
        DECODE:begin
            case(optype)
            J:begin
                jimm[20]    <= instr_out[31]   ;
                jimm[10:1]  <= instr_out[30:21];
                jimm[11]    <= instr_out[20]   ;
                jimm[19:12] <= instr_out[19:12];
            end
            default: jimm <= jimm;
            endcase
        end
        default: jimm <= jimm;
        endcase
    end
end

//rs
always@(posedge clk)begin
    if(rst) begin
        for(index = 0; index < 32; index = index + 1)
            x[index] <= 0;
    end
    else begin
        case(state)
        DECODE:begin
            case(optype)
            R:begin
                case(funct7)
                7'b0000000:begin
                    case(funct3)
                    3'b000: x[rd] <= x[rs1] + x[rs2]; //add
                    3'b001: x[rd] <= $unsigned(x[rs1]) << x[rs2][4:0]; //sll
                    3'b010:begin //slt
                        if ($signed(x[rs1]) < $signed(x[rs2]))begin
                            x[rd] <= 1;
                        end
                        else begin
                            x[rd] <= 0;
                        end
                    end
                    3'b011:begin //sltu
                        if ( $unsigned(x[rs1]) < $unsigned(x[rs2]))begin
                            x[rd] <= 1;
                        end
                        else begin
                            x[rd] <= 0;
                        end
                    end
                    3'b100: x[rd] <= x[rs1] ^ x[rs2]; //xor
                    3'b101: x[rd] <= $unsigned(x[rs1]) >> $unsigned(x[rs2][4:0]); //srl
                    3'b110: x[rd] <= x[rs1] | x[rs2]; //or
                    3'b111: x[rd] <= x[rs1] & x[rs2]; //and
                    default: x[0] <= 0;
                    endcase
                end
                7'b0100000:begin
                    case(funct3)
                    3'b000: x[rd] <= x[rs1] - x[rs2]; //sub
                    3'b101: x[rd] <= $signed(x[rs1]) >>> $unsigned(x[rs2][4:0]); //sra
                    default: x[0] <= 0;
                    endcase
                end
                7'b0000001:begin
                    case(funct3)
                    3'b000:begin //mul
                        x[rd] <= tmp[31:0];
                    end
                    3'b001:begin //mulh
                        x[rd] <= tmp[63:32];
                    end
                    3'b011:begin //mulhu
                        x[rd] <= tmp[63:32];
                    end
                    default: x[0] <= 0;
                    endcase
                end
                endcase
            end
            default: x[0] <= 0;
            endcase
            x[0] <= 0;
        end
        HALF:begin
            case(optype)
            I1:begin
                case(funct3)
                    3'b000: x[rd] <= $signed(x[rs1]) + $signed(iimm); //addi
                    3'b001: x[rd] <= $unsigned(x[rs1]) << iimm[4:0]; //slli
                    3'b010:begin //slti
                        if($signed(x[rs1]) < $signed(iimm))begin
                            x[rd] <= 1;
                        end
                        else begin
                            x[rd] <= 0;
                        end
                    end
                    3'b011:begin //sltiu//兩者為負的時候要注意，iimm要extend讓他位數一樣
                        if( $unsigned(x[rs1]) <  $unsigned({ {20{iimm[11]}} , iimm }) )begin
                            x[rd] <= 1;
                        end
                        else begin
                            x[rd] <= 0;
                        end
                    end
                    3'b100: x[rd] <= x[rs1] ^ iimm; //xori
                    3'b101: begin 
                        if (iimm[10] == 0)begin //srli
                            x[rd] <= x[rs1] >> iimm[4:0]; 
                        end
                        else begin //srai
                            x[rd] <= x[rs1] >>> iimm[4:0];
                        end
                    end
                    3'b110: x[rd] <= x[rs1] | iimm; //ori
                    3'b111: x[rd] <= x[rs1] & iimm; //andi
                    default: x[0] <= 0;
                endcase
            end 
            I2:begin
                case(funct3)
                3'b000: x[rd] <= PC + 4; //jalr
                default x[0] <= 0;
                endcase
            end
            U0: x[rd] <= PC + uimm; //auipc
            U1: x[rd] <= uimm; //lui
            J:  x[rd] <= PC + 4; //jal
            default: x[0] <= 0;
            endcase
            x[0] <= 0;
        end
        LOAD:begin
            case(funct3)
            3'b000: x[rd] <= $signed(data_out[7:0]); //lb
            3'b001: x[rd] <= $signed(data_out[15:0]); //lh
            3'b100: x[rd] <= data_out[7:0];//lbu
            3'b101: x[rd] <= data_out[15:0];//lhu
            default: x[rd] <= data_out;//lw
            endcase
            x[0] <= 0;
        end 
        NEXT: x[0] <= 0;
        default: x[0] <= 0;
        endcase
    end
end

//tmp
always@(posedge clk)begin
    if(rst)begin
        tmp <= 0;
    end
    else begin
        case(state)
        READ:begin
            case(instr_out[6:0])
            7'b0110011:begin
                case(instr_out[14:12])
                3'b000: tmp <= x[instr_out[19:15]] * x[instr_out[24:20]];
                3'b001: tmp <= x[instr_out[19:15]] * x[instr_out[24:20]];
                3'b011: tmp <= $unsigned(x[instr_out[19:15]]) * $unsigned(x[instr_out[24:20]]);
                default: tmp <= 0;
                endcase
            end
            default: tmp <= 0;
            endcase
        end
        NEXT: tmp <= 0;
        default: tmp <= tmp;
        endcase
    end
end

//PC
always@(posedge clk)begin
    if(rst)begin
        PC <= 0;
    end
    else begin
        case(state)
        READ: PC <= instr_addr;
        DECODE:begin
            case(optype)
            R: PC <= PC + 4;
            default: PC <= PC;
            endcase
        end
        HALF:begin
            case(optype)
                I0: PC <= PC + 4;
                I1: PC <= PC + 4;
                I2:begin
                    PC <= x[rs1] + iimm;
                    PC[0] <= 0;
                end
                S:  PC <= PC + 4;
                B:begin
                    case(funct3)
                        3'b000:begin //beq
                            if (x[rs1] == x[rs2])begin
                                PC <= PC + bimm;
                            end
                            else begin
                                PC <= PC + 4;
                            end
                        end
                        3'b001:begin //bne
                            if (x[rs1] != x[rs2])begin
                                PC <= PC + bimm;
                            end
                            else begin
                                PC <= PC + 4;
                            end
                        end
                        3'b100:begin //blt
                            if (x[rs1] < x[rs2])begin
                                PC <= PC + bimm;
                            end
                            else begin
                                PC <= PC + 4;
                            end
                        end
                        3'b101:begin //bge
                            if (x[rs1] >= x[rs2])begin
                                PC <= PC + bimm;
                            end
                            else begin
                                PC <= PC + 4;
                            end
                        end
                        3'b110:begin //bltu
                            if ($unsigned(x[rs1]) < $unsigned(x[rs2]))begin
                                PC <= PC + bimm;
                            end
                            else begin
                                PC <= PC + 4;
                            end
                        end
                        3'b111:begin //bgeu
                            if ($unsigned(x[rs1]) >= $unsigned(x[rs2]))begin
                                PC <= PC + bimm;
                            end
                            else begin
                                PC <= PC + 4;
                            end
                        end
                        default: PC <= PC;
                    endcase
                end
                U0: PC <= PC + 4;
                U1: PC <= PC + 4;
                J:  PC <= PC + jimm;
                default: PC <= PC;
            endcase
        end
        LOAD: PC <= PC;
        NEXT: PC <= PC;
        default: PC <= PC;
        endcase
    end
end

endmodule
