// Cache

module Cache ( 
			   clk,
			   rst,
			   //to core
			   stall,
			   cache_addr,
			   en_R,
			   en_W,
			   cache_in,
			   cache_out,			   
			   //to mem
			   mem_addr,
			   mem_en_R,
			   mem_en_W,
			   mem_out,
			   mem_in
			   );
	
	parameter addr_size	 = 16;
	parameter tag_size	 = 11;
	parameter index_size = 5;
	parameter data_size	 = 32;
	
	input clk, rst;
	
	//to core
	output stall;
	input [addr_size-1:0] cache_addr;
	input en_R;
	input en_W;	
	input [data_size-1:0] cache_in;
	output [data_size-1:0] cache_out;
	
	//to mem
	output [addr_size-1:0] mem_addr;
	output mem_en_R;
	output mem_en_W;
	output [data_size-1:0] mem_in;
	input [data_size-1:0] mem_out;
	
	wire [tag_size-1:0] tag_addr;
	wire [index_size-1:0] index_addr;
	
	// Cache Control
	wire Valid_enable;
	wire Tag_enable;
	wire Data_enable;
	wire sel_mem_core;		// 0 data from mem, 1 data from core
	
	// hit miss detect circuit
	wire equal;
	wire hit;
	
	// Cache valid
	wire Valid_out;
	
	// Cache tag
	wire [tag_size-1:0] Tag_out;
	
	// Cache_data
	wire [data_size-1:0] Data_in;
	
	// Wire connect
	/*-----------------------------------------------------------*/
	assign mem_addr		 = cache_addr;
	assign tag_addr		 = cache_addr[addr_size-1:index_size]; // [15:5]
	assign index_addr	 = cache_addr[index_size-1:0]; // [4:0]	
	assign mem_in		 = cache_in;
	
	/*-----------------------------------------------------------*/
	
	// Cache Control
	Cache_Control Cache_Control1 ( 
	.clk(clk),
	.rst(rst),
	// input
	.en_R(en_R),
	.en_W(en_W),
	.hit(hit),
	// output
	.Read_mem(mem_en_R),
	.Write_mem(mem_en_W),
	.Valid_enable(Valid_enable),
	.Tag_enable(Tag_enable),
	.Data_enable(Data_enable),
	.sel_mem_core(sel_mem_core),
	.stall(stall)
	);
	
	// hit miss detect circuit
	assign equal = (tag_addr==Tag_out);
	assign hit = (Valid_out&&equal);
	
	// Cache valid
	Cache_valid Cache_valid1 ( 
	.clk(clk),
	.rst(rst),
	.Valid_Address(index_addr),
	.Valid_enable(Valid_enable),
	.Valid_in(1'b1),
	.Valid_out(Valid_out)
	);
	
	// Cache tag
	Cache_tag Cache_tag1 ( 
	.clk(clk),
	.rst(rst),
	.Tag_Address(index_addr),
	.Tag_enable(Tag_enable),
	.Tag_in(tag_addr),
	.Tag_out(Tag_out)
	);
	
	// Cache_data - Data_in Mux
	assign Data_in = sel_mem_core ? 
					 cache_in : mem_out;
	
	Cache_data Cache_data1 ( 
	.clk(clk),
	.rst(rst),
	.Data_Address(index_addr),
	.Data_enable(Data_enable),
	.Data_in(Data_in),
	.Data_out(cache_out)
	);
				   
endmodule






















