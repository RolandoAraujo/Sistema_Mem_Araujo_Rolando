/******************************************************************
* Description
*	This is the verifaction environment ofr testeting the register file.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	12/06/2015
******************************************************************/



module ROM_TB;

parameter MEMORY_DEPTH = 32;
parameter DATA_WIDTH = 32;
reg clk_tb = 0;
reg [(DATA_WIDTH-1):0] Address_i_tb;
wire [(DATA_WIDTH-1):0] Instruction_o_tb;

  
Program_Memory
#
(
	.MEMORY_DEPTH(MEMORY_DEPTH),
	.DATA_WIDTH(DATA_WIDTH)
)
DUV
(
	.Address_i(Address_i_tb),
	.Instruction_o(Instruction_o_tb)
);
/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/



initial begin

	#0 Address_i_tb = 0;
	#10 Address_i_tb = 1;
	#20 Address_i_tb = 2;
	#30 Address_i_tb = 3;
	#40 Address_i_tb = 4;
	#50 Address_i_tb = 5;
	#60 Address_i_tb = 6;
	#70 Address_i_tb = 7;
	#80 Address_i_tb = 8;

end

/*********************************************************/

endmodule
