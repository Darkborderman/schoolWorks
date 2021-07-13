`timescale 1ns/10ps
`define CYCLE 10.0 // Cycle time
`define MAX 150000 // Max cycle number
`define mem_word(addr) \
  {TOP.i_DM.Memory_byte3[addr], \
   TOP.i_DM.Memory_byte2[addr], \
   TOP.i_DM.Memory_byte1[addr], \
   TOP.i_DM.Memory_byte0[addr]}
`define reg_word(addr) TOP.i_CPU.i_RF.Reg_Data[addr]
`define SIM_END 'h3fff
`define SIM_END_CODE -32'd1
`define TEST_START 'h2000

module top_tb;

reg        clk;
reg        rst;
reg [31:0] GOLDEN [0:65535];
integer gf,
        i,
        num,
        err;
reg [31:0] counter;

always #(`CYCLE/2) clk = ~clk;

top TOP(
  .clk(clk),
  .rst(rst)
);

initial begin
    clk = 0; rst = 1;
    #(`CYCLE) rst = 0;
    $readmemh("./main0.hex", TOP.i_IM.Memory_byte0);
    $readmemh("./main0.hex", TOP.i_DM.Memory_byte0); 
    $readmemh("./main1.hex", TOP.i_IM.Memory_byte1);
    $readmemh("./main1.hex", TOP.i_DM.Memory_byte1); 
    $readmemh("./main2.hex", TOP.i_IM.Memory_byte2);
    $readmemh("./main2.hex", TOP.i_DM.Memory_byte2); 
    $readmemh("./main3.hex", TOP.i_IM.Memory_byte3);
    $readmemh("./main3.hex", TOP.i_DM.Memory_byte3); 

    num = 0;
    gf = $fopen("./golden.hex", "r");
    while (!$feof(gf))
    begin
      $fscanf(gf, "%h\n", GOLDEN[num]);
      num = num + 1;
    end
    $fclose(gf);
  
    err = 0;
    repeat(`MAX) @(negedge clk)
        if (`mem_word(`SIM_END) === `SIM_END_CODE) begin
            $display("\nDone\n");
            for (i = 0; i < num; i = i + 1) begin
                if (`mem_word(`TEST_START + i) !== GOLDEN[i]) begin
                    $display("DM[%4d] = %h, expect = %h", i, `mem_word(`TEST_START + i), GOLDEN[i]);
                    err = err + 1;
                end
                else begin
                    $display("DM[%4d] = %h, pass", i, `mem_word(`TEST_START + i));
                end
            end
            result(err);
            $finish;
        end

    @(negedge clk)
    for (i = 0; i < num; i = i + 1) begin
        if (`mem_word(`TEST_START+i) !== GOLDEN[i]) begin
            $display("DM[%4d] = %h, expect = %h", i, `mem_word(`TEST_START + i), GOLDEN[i]);
            err = err + 1;
        end
        else begin
            $display("DM[%4d] = %h, pass", i, `mem_word(`TEST_START + i));
        end
    end
    $display("SIM_END(%5d) = %h, expect = %h", `SIM_END, `mem_word(`SIM_END), `SIM_END_CODE);
    result(err);
    $finish;
end

initial begin
    #(`MAX*`CYCLE)
    $display("Simulation Failed");
    $finish;
end

always@(posedge clk or posedge rst) begin
    if(rst)
        counter <= 32'b0;
    else 
        counter <= 32'b1 + counter;
end

`ifdef SYN
initial $sdf_annotate("top_syn.sdf", TOP);
`endif

initial
begin
  `ifdef FSDB
  $fsdbDumpfile("top.fsdb");
  $fsdbDumpvars(0, TOP);
  `elsif FSDB_ALL
  $fsdbDumpfile("top.fsdb");
  $fsdbDumpvars("+struct", "+mda", TOP);
  `endif
end

task result;
    input integer err;
    begin
        if (err === 0) begin
            $display("\n");
            $display("\n");
            $display("        ****************************               ");
            $display("        **                        **       |\__||  ");
            $display("        **  Congratulations !!    **      / O.O  | ");
            $display("        **                        **    /_____   | ");
            $display("        **  Simulation PASS!!     **   /^ ^ ^ \\  |");
            $display("        **                        **  |^ ^ ^ ^ |w| ");
            $display("        ****************************   \\m___m__|_|");
            $display("\n");
        end
        else begin
            $display("\n");
            $display("\n");
            $display("        ****************************               ");
            $display("        **                        **       |\__||  ");
            $display("        **  OOPS!!                **      / X,X  | ");
            $display("        **                        **    /_____   | ");
            $display("        **  Simulation Failed!!   **   /^ ^ ^ \\  |");
            $display("        **                        **  |^ ^ ^ ^ |w| ");
            $display("        ****************************   \\m___m__|_|");
            $display("         Totally has %d errors                     ", err); 
            $display("\n");
        end
        $display("total cycle:%d",counter);
    end
endtask

endmodule
