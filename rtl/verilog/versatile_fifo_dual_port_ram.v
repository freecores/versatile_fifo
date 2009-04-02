// true dual port RAM, sync
module versatile_fifo_dual_port_ram_dc_2w
  (
   // A side
   d_a,
`ifdef DW   
   q_a,
`endif
   adr_a, 
   we_a,
`ifdef DC
   clk_a,
`endif
   // B side
   q_b 
   adr_b,
`ifdef DW 
   d_b, 
   we_b,
`endif
`ifdef DC
   clk_b
`else
   clk
`endif
   );
   
   parameter DATA_WIDTH = 8;
   parameter ADDR_WIDTH = 9;
   
   input [(DATA_WIDTH-1):0]      data_a;
   input [(ADDR_WIDTH-1):0] 	 addr_a;
   input [(ADDR_WIDTH-1):0] 	 addr_b;
   input 			 we_a;
   output reg [(DATA_WIDTH-1):0] q_b;
`ifdef DW
   input [(DATA_WIDTH-1):0] 	 data_b;
   output reg [(DATA_WIDTH-1):0] q_a;
   input 			 we_b;
`endif
`ifdef DC
   input 			 clk_a, clk_b;
`else
   input 			 clk;   
`endif
   
   // Declare the RAM variable
   reg [DATA_WIDTH-1:0] ram [2**ADDR_WIDTH-1:0] /*synthesis syn_ramstyle = "no_rw_check"*/;

`ifdef DC   
   always @ (posedge clk_a)
`else
   always @ (posedge clk)
`endif
`ifdef DW
     begin // Port A
	if (we_a)
	  begin
	     ram[addr_a] <= data_a;
	     q_a <= data_a;
	  end
	else
	  q_a <= ram[addr_a];
     end 
`else
   if (we_a)
     ram[addr_a] <= data_a;
`endif
	
`ifdef DC   
   always @ (posedge clk_a)
`else
   always @ (posedge clk)
`endif
`ifdef DW
     begin // Port b
	if (we_b)
	  begin
	     ram[addr_b] <= data_b;
	     q_b <= data_b;
	  end
	else
	  q_b <= ram[addr_b];
     end
`else // !`ifdef DW
   q_b <= ram[addr_b];
`endif // !`ifdef DW
   
endmodule // true_dual_port_ram_sync
