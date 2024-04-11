transcript on
if ![file isdirectory vhdl_libs] {
	file mkdir vhdl_libs
}

vlib vhdl_libs/altera
vmap altera ./vhdl_libs/altera
vcom -93 -work altera {c:/altera/90sp2/quartus/eda/sim_lib/altera_syn_attributes.vhd}
vcom -93 -work altera {c:/altera/90sp2/quartus/eda/sim_lib/altera_primitives_components.vhd}
vcom -93 -work altera {c:/altera/90sp2/quartus/eda/sim_lib/altera_primitives.vhd}

vlib vhdl_libs/lpm
vmap lpm ./vhdl_libs/lpm
vcom -93 -work lpm {c:/altera/90sp2/quartus/eda/sim_lib/220pack.vhd}
vcom -93 -work lpm {c:/altera/90sp2/quartus/eda/sim_lib/220model.vhd}

vlib vhdl_libs/sgate
vmap sgate ./vhdl_libs/sgate
vcom -93 -work sgate {c:/altera/90sp2/quartus/eda/sim_lib/sgate_pack.vhd}
vcom -93 -work sgate {c:/altera/90sp2/quartus/eda/sim_lib/sgate.vhd}

vlib vhdl_libs/altera_mf
vmap altera_mf ./vhdl_libs/altera_mf
vcom -93 -work altera_mf {c:/altera/90sp2/quartus/eda/sim_lib/altera_mf_components.vhd}
vcom -93 -work altera_mf {c:/altera/90sp2/quartus/eda/sim_lib/altera_mf.vhd}

vlib vhdl_libs/flex10ke
vmap flex10ke ./vhdl_libs/flex10ke
vcom -93 -work flex10ke {c:/altera/90sp2/quartus/eda/sim_lib/flex10ke_atoms.vhd}
vcom -93 -work flex10ke {c:/altera/90sp2/quartus/eda/sim_lib/flex10ke_components.vhd}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {c:/projekt N8031100A/N8031101/ogr/mux_generic2.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031110/s274_library/elementary/utility.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031110/s274_library/genop/local_types_pkg.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031110/fifo/fifo.vhd}
vcom -93 -work work {c:/projekt N8031100A/job/s274/lib/ieee_proposed/fixed_float_types_c.vhdl}
vcom -93 -work work {c:/projekt N8031100A/job/s274/lib/ieee_proposed/fixed_pkg_c.vhdl}
vcom -93 -work work {c:/projekt N8031100A/job/s274/source/reverse_cordic/revers_cordic.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031101/cordic/cordic.vhd}
vcom -93 -work work {c:/projekt N8031100A/job/s274/lib/s274_library/elementary/s274types_pkg.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031101/ogr/ogr.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031101/D7/D7_ogr.vhd}

