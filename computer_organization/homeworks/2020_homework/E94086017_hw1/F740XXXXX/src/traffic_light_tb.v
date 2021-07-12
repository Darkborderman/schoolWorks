`timescale 1ns/10ps

`define ANSTXT "ans.txt"
`define TOTAL_CYCLES 8192
`define CYCLE 10

module traffic_light_tb;

reg        sysclk;
reg        rst;
reg        pass;
wire       R, 
           G, 
           Y;
 
reg  [ 2:0] ans [8191:0];
wire [ 2:0] out;
 
reg  [15:0] count;
reg         start;
reg         fin;

integer error;

// DUV
traffic_light ul(
    .clk  ( sysclk ),
    .rst  ( rst    ),
    .pass ( pass   ),
    .R	  ( R      ),
    .G	  ( G      ),
    .Y	  ( Y      )
);

always #(`CYCLE / 2) sysclk = ~sysclk;

// Wave
initial begin
    //`ifdef FSDB
    $fsdbDumpfile("triffic_light.fsdb");
    $fsdbDumpvars;
    $fsdbDumpMDA;
    //`endif
end

// Initialization
initial begin
    sysclk = 1'b0;
    pass   = 1'b0;
    error  = 32'b0;
    start  = 1'b0;
    count  = 16'b0;
end

// Reset signal
initial begin
    rst    = 1'b0;
    #1      rst = 1'b1;
    #`CYCLE rst = 1'b0;
end

initial begin
    #(`CYCLE * 1792) 
    @(negedge sysclk)
        pass = 1'b1;
    #(`CYCLE)
        pass = 1'b0;
    #(`CYCLE * 512) 
    @(negedge sysclk)
        pass = 1'b1;
    #(`CYCLE)
        pass = 1'b0;
end

initial begin
    $readmemb(`ANSTXT, ans);
    fin = 0;
    #(`TOTAL_CYCLES * `CYCLE);
    fin = 1;
    #1;
    $finish;
end

always @(posedge sysclk) begin
    if(rst) start <= 1'b1;
    else    start <= start;
end

assign out = ans[count];

always @(posedge sysclk) begin
    if(rst) begin
        count <= 16'b0;
    end
    else begin
        count <= count + 16'b1;
    end
end

always @(negedge sysclk) begin
    if(start & ~fin) begin
        if (out[2] !== R || 
            out[1] !== G ||
            out[0] !== Y) begin
            $write("Error at %0dth cycle:\n", count);
            $write("Real answer: R = %d ,G = %d ,Y = %d\n", out[2], out[1], out[0]);
            $write("Your answer: R = %d ,G = %d ,Y = %d\n", R, G, Y);
            error = error + 1;
        end
    end
end


always @(posedge fin) begin
    if(error) begin
        $display("\n");
        $display("====================================================================================");
        $display("-------------- (/`n`)/ ~#  There was %2d errors in your code !! ---------------------",error); 
        $display("--------- The simulation has finished with some error, Please check it !!! ---------"); 
        $display("====================================================================================");
        $display("\n");
    end
    else begin
        $display("\n");
        $display("        ****************************               ");
        $display("        **                        **       /|__/|  ");
        $display("        **  Congratulations !!    **      / O,O  | ");
        $display("        **                        **    /_____   | ");
        $display("        **  Simulation PASS!!     **   /^ ^ ^ \\  |");
        $display("        **                        **  |^ ^ ^ ^ |w| ");
        $display("        *************** ************   \\m___m__|_|");
        $display("\n");
    end
end

endmodule
