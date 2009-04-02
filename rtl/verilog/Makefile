dual_port_ram:
	vppp +define+TYPE+"sc_sw" --simple versatile_fifo_dual_port_ram.v > versatile_fifo_dual_port_ram_sc_sw.v
	vppp +define+TYPE+"sc_dw" +define+DW --simple versatile_fifo_dual_port_ram.v > versatile_fifo_dual_port_ram_sc_dw.v
	vppp +define+TYPE+"dc_sw" +define+DC --simple versatile_fifo_dual_port_ram.v > versatile_fifo_dual_port_ram_dc_sw.v
	vppp +define+TYPE+"dc_dw" +define+DC +define+DW --simple versatile_fifo_dual_port_ram.v > versatile_fifo_dual_port_ram_dc_dw.v

svn_export_versatile_counter:
	svn export http://opencores.org/ocsvn/versatile_counter/versatile_counter/trunk/rtl/verilog/copyright.v
	svn export http://opencores.org/ocsvn/versatile_counter/versatile_counter/trunk/rtl/verilog/lfsr_polynom.v
	svn export http://opencores.org/ocsvn/versatile_counter/versatile_counter/trunk/rtl/verilog/versatile_counter.v

export: svn_export_versatile_counter

gray_counter:
	cp gray_counter_defines.v versatile_counter_defines.v
	vpp versatile_counter.v > tmp1.v
	vppp --simple tmp1.v | cat copyright.v - > gray_counter.v

