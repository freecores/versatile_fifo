dual_port_ram:
	vppreproc +define+TYPE+"sc_sw" --simple versatile_fifo_dual_port_ram.v > versatile_fifo_dual_port_ram_sc_sw.v
	vppreproc +define+TYPE+"sc_dw" +define+DW --simple versatile_fifo_dual_port_ram.v > versatile_fifo_dual_port_ram_sc_dw.v
	vppreproc +define+TYPE+"dc_sw" +define+DC --simple versatile_fifo_dual_port_ram.v > versatile_fifo_dual_port_ram_dc_sw.v
	vppreproc +define+TYPE+"dc_dw" +define+DC +define+DW --simple versatile_fifo_dual_port_ram.v > versatile_fifo_dual_port_ram_dc_dw.v

svn_export_versatile_counter:
	svn export http://opencores.org/ocsvn/versatile_counter/versatile_counter/trunk/rtl/verilog/CSV.class.php
	svn export http://opencores.org/ocsvn/versatile_counter/versatile_counter/trunk/rtl/verilog/versatile_counter_generator.php

export: svn_export_versatile_counter

gray_counter:
	excel2csv gray_counter.xls -S ,
	./versatile_counter_generator.php gray_counter.csv > gray_counter.v

sd:
	excel2csv sd_counter.xls -S ,
	./versatile_counter_generator.php sd_counter.csv > sd_counter.v

all: dual_port_ram export gray_counter gray_counter sd
