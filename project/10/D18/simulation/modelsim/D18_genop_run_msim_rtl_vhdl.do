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

vcom -93 -work work {c:/projekt N8031100A/N8031110/s274_library/elementary/utility.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031110/gen_op_f/fifo.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031110/gen_op_f/rom.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031110/gen_op_f/ieee_proposed/fixed_float_types_c.vhdl}
vcom -93 -work work {c:/projekt N8031100A/N8031110/s274_library/genop/local_types_pkg.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031110/gen_op_f/ieee_proposed/fixed_pkg_c.vhdl}
vcom -93 -work work {c:/projekt N8031100A/N8031110/gen_op_f/angle_calc.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031110/gen_op_f/sfixed_mult.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031110/gen_op_f/st2.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031110/s274_library/elementary/s274types_pkg.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031110/s274_library/composite/revers_cordic_fix.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031110/gen_op_f/dec _ves.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031110/gen_op_f/dec_pts.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031110/gen_op_f/gen_op_f.vhd}
vcom -93 -work work {c:/projekt N8031100A/N8031110/D18/D18_genop.vhd}

do c:/projekt N8031100A/N8031110/D18/simulation/modelsim/second_circuit_run_msim_rtl_vhdl.do
