module versatile_fifo_dual_port_ram_sc_dw
  (
   d_a,
   q_a,
   adr_a, 
   we_a,
   q_b,
   adr_b,
   d_b, 
   we_b,
   clk
   );
   parameter DATA_WIDTH = 8;
   parameter ADDR_WIDTH = 9;
   input [(DATA_WIDTH-1):0]      d_a;
   input [(ADDR_WIDTH-1):0] 	 adr_a;
   input [(ADDR_WIDTH-1):0] 	 adr_b;
   input 			 we_a;
   output [(DATA_WIDTH-1):0] 	 q_b;
   input [(DATA_WIDTH-1):0] 	 d_b;
   output reg [(DATA_WIDTH-1):0] q_a;
   input 			 we_b;
   input 			 clk;   
   reg [(DATA_WIDTH-1):0] 	 q_b;   
   reg [DATA_WIDTH-1:0] ram [2**ADDR_WIDTH-1:0] ;
   always @ (posedge clk)
     begin 
	if (we_a)
	  begin
	     ram[adr_a] <= d_a;
	     q_a <= d_a;
	  end
	else
	  q_a <= ram[adr_a];
     end 
   always @ (posedge clk)
     begin 
	if (we_b)
	  begin
	     ram[adr_b] <= d_b;
	     q_b <= d_b;
	  end
	else
	  q_b <= ram[adr_b];
     end
endmodule 
