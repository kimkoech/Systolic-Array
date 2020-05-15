#####################################################################################
# Innovus Initialization script for the ${rm_core_top}
#####################################################################################
set init_verilog "../data/${rm_core_top}-compile.v"
set init_lef_file "${rm_lef_reflib}"
set init_mmmc_file "../scripts/viewDefinitions.tcl"
set init_top_cell "${rm_core_top}"
set init_design_uniquify {1}
set init_gnd_net {VSS}
set init_pwr_net {VDD}

setLibraryUnit -cap 1pf \
               -time 1ns

init_design
