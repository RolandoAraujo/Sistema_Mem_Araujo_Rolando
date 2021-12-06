module RAM_TB;

parameter MEMORY_DEPTH = 32;
parameter DATA_WIDTH = 32;
reg clk_tb = 0;
reg we_tb =0;
reg [(MEMORY_DEPTH-1):0] Addr_i_tb;
reg [(DATA_WIDTH-1):0] data_tb;
wire [(DATA_WIDTH-1):0] Instruction_o_tb;

  
single_port_ram
#
(
	.ADDR_WIDTH(MEMORY_DEPTH),
	.DATA_WIDTH(DATA_WIDTH)
)
DUV
(
	.addr(Addr_i_tb),
	.q(Instruction_o_tb),
	.data(data_tb),
	.we(we_tb),
	.clk(clk_tb)
	
);
/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/


//RAM testing
initial begin
#0 we_tb = 1;
#0 Addr_i_tb = 0;
#10 Addr_i_tb = 2;
#20 Addr_i_tb = 3;
#30 Addr_i_tb = 4;
#40 Addr_i_tb = 5;
#50 Addr_i_tb = 6;
end

initial begin

#0 data_tb = 32'h55555555;
#10 data_tb = 32'hABCDEF;
#20 data_tb = 32'h17283946;
#30 data_tb = 32'h30303030;
#40 data_tb = 32'h1234ABCD;
#50 data_tb = 32'hFFFFFFFF;
end 


endmodule
