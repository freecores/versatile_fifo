module vfifo_dual_port_ram_sc_sw
  (
   d_a,
   adr_a, 
   we_a,
   q_b,
   adr_b,
   clk
   );
   parameter DATA_WIDTH = 32;
   parameter ADDR_WIDTH = 8;
   input [(DATA_WIDTH-1):0]      d_a;
   input [(ADDR_WIDTH-1):0] 	 adr_a;
   input [(ADDR_WIDTH-1):0] 	 adr_b;
   input 			 we_a;
   output [(DATA_WIDTH-1):0] 	 q_b;
   input 			 clk;   
   reg [(ADDR_WIDTH-1):0] 	 adr_b_reg;
   reg [DATA_WIDTH-1:0] ram [(1<<ADDR_WIDTH)-1:0] ;
   always @ (posedge clk)
   if (we_a)
     ram[adr_a] <= d_a;
   always @ (posedge clk)
   adr_b_reg <= adr_b;   
   assign q_b = ram[adr_b_reg];
endmodule 
