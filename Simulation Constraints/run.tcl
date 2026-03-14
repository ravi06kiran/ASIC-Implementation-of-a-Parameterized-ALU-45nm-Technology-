set_db init_lib_search_path /home/install/FOUNDRY/digital/90nm/dig/lib/

set_db library slow.lib

read_hdl {./counter.v}

elaborate

read_sdc ./constraints_input.sdc

set_db syn_generic_effort medium

set_db syn_map_effort medium

set_db syn_opt_effort medium

syn_generic
syn_map
syn_opt

write_hdl > counter_netlist.v
write_sdc > counter_output.sdc

report timing > counter_timing.rpt
report power > counter_power.rpt
report area > counter_cell.rpt
report gates > counter_gates.rpt

gui_show
