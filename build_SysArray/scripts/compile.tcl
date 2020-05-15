#####################################################################################
# Compile script for the ${rm_core_top}
#####################################################################################

set rm_task     synthesis
sh hostname
date

set start_time [clock seconds]

# -----------------------------------------------------------------------------------
# Setup the Configuration
# -----------------------------------------------------------------------------------

source -echo -verbose ../scripts/core_config.tcl

# -----------------------------------------------------------------------------------
# Setup the Target Technology
# -----------------------------------------------------------------------------------

source -echo -verbose ../scripts/tech.tcl

# -----------------------------------------------------------------------------------
# Define link libraries; add Designware to path
# -----------------------------------------------------------------------------------

set link_library [list * ]

set link_library [concat * $rm_mintypmax_libs ]
set synthetic_library dw_foundation.sldb
set link_library [concat ${link_library} ${synthetic_library} ]

# Standard cells in the target library(s) will appear in the synth'd netlist
set target_library ${rm_target_library}

# The search path contains all the directory paths to the library files in the link-path
set search_path    ${rm_search_path}

foreach {min_lib typ_lib max_lib} $rm_mintypmax_libs {
  set_min_library $typ_lib -min_version $min_lib
}


# -----------------------------------------------------------------------------------
# Set host options
# -----------------------------------------------------------------------------------

if ${rm_multi_core} {
set_host_options -max_core ${host_numcores}
}

# -----------------------------------------------------------------------------------
# Create MW Database
# -----------------------------------------------------------------------------------
set ignore_tf_error true
extend_mw_layers

set mw_reference_library ${rm_mw_reflib}
set mw_design_library "${rm_core_top}"

create_mw_lib -technology ${rm_tech_file} \
              -mw_reference_library $mw_reference_library \
              $mw_design_library

open_mw_lib   $mw_design_library

# Check consistency of logical vs. physical libraries
check_library 

set_tlu_plus_files -max_tluplus $rm_max_tluplus_file -min_tluplus $rm_min_tluplus_file -tech2itf_map $rm_tf2itf_map_file
#set_tlu_plus_files -max_tluplus $rm_typ_tluplus_file -min_tluplus $rm_min_tluplus_file

check_tlu_plus_files


# -----------------------------------------------------------------------------------
# Read in list of dont_use cells
# -----------------------------------------------------------------------------------

foreach dont_use ${rm_dont_use_list} {
  set_dont_use [get_lib_cells */${dont_use} ]
}

#------------------------------------------------------------------------------------
# Setup for Verification / Equivalence Checking
#------------------------------------------------------------------------------------

set synlib_dwgen_fmlink_active true
set_svf ../data/${rm_core_top}.svf

#------------------------------------------------------------------------------------
# Read In The Verilog RTL Design
#------------------------------------------------------------------------------------

## Local directory for intermediate files 
define_design_lib work -path ../elab

# Don't optimize constants for Formality and ID registers.
set compile_seqmap_propagate_constants false

set hdlin_check_no_latch true

analyze -format sverilog -vcs "
  -f ../scripts/rtl_src/SysArray.vc 
  "

elaborate -architecture verilog ${rm_core_top}

set_register_merging [all_registers] FALSE
set_boundary_optimization [get_designs] false


# -----------------------------------------------------------------------------------
# Link and Check the Design
# -----------------------------------------------------------------------------------

current_design ${rm_core_top}

get_designs -hier > ../reports/compile/${rm_core_top}.pre_unique

set unique_prefix [ string range ${rm_core_top} 0 0 ]
set uniquify_naming_style ${unique_prefix}%s_%d
echo uniquifying all designs with prefix: $unique_prefix
uniquify -force

get_designs -hier > ../reports/compile/${rm_core_top}.post_unique

link
link_physical_library

set status_link [link]

if {$status_link == 1 } {
echo "No unresolved"
} else {
echo "Design contains unresolved instances"
exit
}

check_design >  ../reports/compile/${rm_core_top}-compile.check

# -----------------------------------------------------------------------------------
# Write out verilog after linking 
# -----------------------------------------------------------------------------------

change_names -hier -rules verilog
write -f verilog -hierarchy -o ../data/${rm_core_top}-link.v
#Set this variable to enable level-shifter insertion on clocks 
set auto_insert_level_shifters_on_clocks all

#Set this variable to enable level-shifter insertion on ideal nets
set mv_insert_level_shifters_on_ideal_nets all

#Identify pre-existing clock-gates in the design.
set power_cg_auto_identify true

#Verbose report of level-shifter insertion
set mv_insert_level_shifter_verbose true

# -----------------------------------------------------------------------------------
# Define the Design Environment
# -----------------------------------------------------------------------------------

#Create all MCMM scenarios, with individual clocks
#source -echo -verbose ../scripts/mcmm.tcl
source -echo -verbose  ../scripts/path_groups_sysarray.tcl
source -echo -verbose  ../scripts/constraints_sysarray.tcl

set_max_fanout ${rm_max_fanout} ${rm_core_top}
set_max_area 0


set_dont_touch_network [all_clocks]

set inputs [remove_from_collection [all_inputs] ${rm_clock_ports}]
set_driving_cell -library ${rm_rvt_lib} \
                 -lib_cell ${rm_driving_cell} \
                 -pin ${rm_driving_pin} \
                 -input_transition_rise ${rm_max_transition} \
                 -input_transition_fall ${rm_max_transition} \
                 ${inputs}

#Driving cells visible in clock block currently
set_driving_cell -library ${rm_rvt_lib} \
                 -lib_cell ${rm_clock_driving_cell} \
                 -pin ${rm_clock_driving_pin} \
                 -input_transition_rise ${rm_max_clock_transition} \
                 -input_transition_fall ${rm_max_clock_transition} \
                 [get_ports ${rm_clock_ports}]

#Set Vt attributes on libs for report/constraint
#set_attribute [get_libs ${rm_rvt_lib}] default_threshold_voltage_group RVt -type string

#------------------------------------------------------------------------------------
# Setup Clock Gating Style
#------------------------------------------------------------------------------------

set_clock_gating_style -sequential_cell latch \
                 -positive_edge_logic $rm_icg_name \
                 -control_point before \
                 -control_signal scan_enable

# Register latency
set_clock_gate_latency -clock [all_clocks] -stage 1 -fanout_latency [list 1-inf [expr $rm_clock_latency - $rm_icg_latency]]
set_clock_gate_latency -clock [all_clocks] -stage 2 -fanout_latency [list 1-inf 0]


# -----------------------------------------------------------------------------------
# Identify High Fanout Nets
# -----------------------------------------------------------------------------------

set_ideal_network [get_ports $rm_poreset_pin]

# -----------------------------------------------------------------------------------
# Setup the Compile Options
# -----------------------------------------------------------------------------------

set_fix_multiple_port_nets -all -buffer_constants 
#set_fix_hold HCLK

set_critical_range [expr ${rm_critical_range} * ${rm_clock_period} ] ${rm_core_top}
set enable_recovery_removal_arcs true
set case_analysis_with_logic_constants true
set timing_use_enhanced_capacitance_modeling true
#Get rid of placement clustering
if { $rm_fp_clustering } {
set placer_max_cell_density_threshold $rm_cell_density
}

# -----------------------------------------------------------------------------------
# Read floorplan and physical constraints
# -----------------------------------------------------------------------------------

set_utilization  $rm_core_utilization
set_aspect_ratio $rm_aspect_ratio

# -----------------------------------------------------------------------------------
# Isolating all inputs 
# -----------------------------------------------------------------------------------

set_isolate_ports -type buffer -force [all_inputs] 

# -----------------------------------------------------------------------------------
# Compile the ${rm_core_top} Using Design Compiler. No scan
# -----------------------------------------------------------------------------------

compile_ultra -gate_clock -no_autoungroup
change_names -rules verilog -hier

#source ../scripts/tsmc_rule_apply_new.tcl
# -----------------------------------------------------------------------------------
# Check for unconstrained registers 
# -----------------------------------------------------------------------------------

check_timing > ../reports/compile/${rm_core_top}-compile.check_timing

# -----------------------------------------------------------------------------------
# Multi-voltage checks 
# -----------------------------------------------------------------------------------
#Useful to check mv design violations in the log file
check_mv_design -verbose > ../reports/compile/${rm_core_top}-compile.mv.violations 

# -----------------------------------------------------------------------------------
# Report on the Design
# -----------------------------------------------------------------------------------
report_resources
report_units
report_clocks
report_clock_gating -verbose 
report_threshold_voltage_group   > ../reports/compile/${rm_core_top}-compile.Vt_groups
report_hierarchy                 > ../reports/compile/${rm_core_top}-compile.hier
report_compile_options           > ../reports/compile/${rm_core_top}-compile.options
report_area                      > ../reports/compile/${rm_core_top}-compile.area
report_area -hierarchy           > ../reports/compile/${rm_core_top}-compile.hier_area
report_power -analysis_effort high > ../reports/compile/${rm_core_top}-compile.power
report_qor                       > ../reports/compile/${rm_core_top}-compile.qor
report_net_fanout -threshold ${rm_max_fanout} \
                                 > ../reports/compile/${rm_core_top}-compile.fanout
report_port -verbose             > ../reports/compile/${rm_core_top}-compile.ports
report_constraint -all -nos \
                                 > ../reports/compile/${rm_core_top}-compile.constraint
report_timing -nets -trans -inp -nos -max_paths 200 \
                                 > ../reports/compile/${rm_core_top}-compile.max_timing
report_timing -delay min -nets -trans -inp -nos -max_paths 200 \
                                 > ../reports/compile/${rm_core_top}-compile.min_timing

## Check for relative placements
#check_rp_groups -all -verbose *   > ../reports/compile/${rm_core_top}-dp.rp_groups
#get_rp_groups *                   >> ../reports/compile/${rm_core_top}-dp.rp_groups


# Check for infeasible paths
report_timing -attributes        > ../reports/compile/${rm_core_top}-compile.infeasible
#create_qor_snapshot
#query_qor_snapshot -infeasible_paths


# Check for ungated flops in netlist
report_clock_gating -verbose -ungated -nosplit \
                                 > ../reports/compile/${rm_core_top}-compile.ungated_ff	 

# Check for Dont Touch nets
report_dont_touch                > ../reports/compile/${rm_core_top}-compile.dont_touch

# Report disabled timing arcs in the design
report_disable_timing -nosplit \
                                 > ../reports/compile/${rm_core_top}-compile.disable_timing
# Report case analysis in the design
report_case_analysis -all -nosplit \
                                 > ../reports/compile/${rm_core_top}-compile.set_case

analyze_datapath                 > ../reports/compile/${rm_core_top}-compile.dp_synth
report_resources -hier           >> ../reports/compile/${rm_core_top}-compile.dp_synth


# TODO fix this!!!!  Currently doesn't find any HCLK to FCLK paths
# Check for CDC paths in netlist
#source -verbose ../scripts/cdc_report.tcl > ../reports/compile/${rm_core_top}-compile.cdc_paths

# -----------------------------------------------------------------------------------
# Save the Design
# -----------------------------------------------------------------------------------

set verilogout_higher_designs_first true
set verilogout_no_tri true

# Remove ideal net definitions before saving design
remove_ideal_network [get_ports $rm_poreset_pin]

# DDC file can be read back into Design Compiler for synthesis debug/exploration
write -format ddc -hierarchy -output ../data/${rm_core_top}-compile.ddc

# Write SDC file to check constraints are properly read
write_sdc ../data/${rm_core_top}-compile.sdc

# Write out netlists
write -f verilog -hierarchy -o ../data/${rm_core_top}-compile.v
write -pg -f verilog -hierarchy -o ../data/${rm_core_top}-compile-pg.v

# Write SDF file
write_sdf ../data/${rm_core_top}-compile.sdf

## Save UPF file for IC compiler
#save_upf ../data/[string tolower $rm_core_top]_prime.upf 

## Write the relative placement constraints for ICC
#write_rp_groups -all -output ../data/${rm_core_top}-rp_groups.tcl

#####################################################################################
set stop_time [clock seconds]
set elapsedTime [clock format [expr $stop_time - $start_time] -format %H:%M:%S -gmt true]
puts "=============================================="
puts "         Completed step : $rm_task"
puts "        Elapsed runtime : $rm_task: $elapsedTime"
puts "=============================================="
#####################################################################################

close_mw_lib

date
quit
