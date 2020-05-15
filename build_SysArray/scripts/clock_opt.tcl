#####################################################################################
# Clock tree optimization of the ${rm_core_top}.
#####################################################################################

set rm_task     clock_opt
sh hostname
date

# -----------------------------------------------------------------------------------
# Setup the Configuration
# -----------------------------------------------------------------------------------

source -echo -verbose ../scripts/core_config.tcl

# -----------------------------------------------------------------------------------
# Setup the Target Technology
# -----------------------------------------------------------------------------------

source -echo -verbose ../scripts/tech.tcl

#------------------------------------------------------------------------------------
# Define link libraries, target libraries, search path
#------------------------------------------------------------------------------------

# Set up the link_library - lists all the db's that contain cells in the netlist
set link_library [concat * $rm_mintypmax_libs ]

set synthetic_library dw_foundation.sldb
set link_library [concat ${link_library} ${synthetic_library} ]

# Standard cells in the target library(s) will appear in the synth'd netlist
set target_library ${rm_target_library}

# The search path contains all the directory paths to the library files in the link-path
set search_path    ${rm_search_path}



# -----------------------------------------------------------------------------------
# Copy & Read the Design from the Placement Step
# -----------------------------------------------------------------------------------

set mw_reference_library ${rm_mw_reflib}

open_mw_lib ${rm_core_top}

copy_mw_cel -from 3_placeopt \
            -to   4_clockopt

open_mw_cel      4_clockopt

# -----------------------------------------------------------------------------------
# Set host options
# -----------------------------------------------------------------------------------

if ${rm_multi_core} {
set_host_options -max_core 4
}

# -----------------------------------------------------------------------------------
# Setup the timing parameters
# -----------------------------------------------------------------------------------

# General Optimization
set compile_instance_name_prefix icc_clockopt
set timing_enable_multiple_clocks_per_reg true
set case_analysis_with_logic_constants true
set_fix_multiple_port_nets -all -buffer_constants
set_auto_disable_drc_nets -scan false
set enable_recovery_removal_arcs true
set placer_disable_auto_bound_for_gated_clock false
set timing_use_enhanced_capacitance_modeling true
set timing_aocvm_enable_analysis true
if ${rm_fp_clustering} {
set placer_max_cell_density_threshold $rm_cell_density
}

# By default, the tool will set a critical range of 50% of the WNS, per pathgroup.
# If you want to change this behavior, please use the command below
# set_critical_range <your number> [current_design]
set_critical_range [expr ${rm_critical_range} * ${rm_clock_period} ] ${rm_core_top}

# Set Area Critical Range
# Typical value: 10 percent of critical clock period
set physopt_area_critical_range [expr ${rm_clock_period} * 0.30]

# Set Power Critical Range
# Typical value: 9 percent of critical clock period
set physopt_power_critical_range [expr ${rm_clock_period} * 0.09]

## Specify options for Power optimization
#set_power_options -leakage false \
#                  -dynamic true \
#                  -low_power_placement false \
#                  -leakage_effort low \
#                  -dynamic_effort low

set_attribute [get_libs ${rm_rvt_lib}] default_threshold_voltage_group RVt -type string
# -----------------------------------------------------------------------------------
# Read in list of dont_use cells
# -----------------------------------------------------------------------------------

foreach dont_use ${rm_dont_use_list} {
  set_dont_use [get_lib_cells */${dont_use} ]
}

#------------------------------------------------------------------------------------
# Enable the use of Z-Route
#------------------------------------------------------------------------------------

set_route_mode_options -zroute true
set_route_options -same_net_notch check_and_fix
#Following command is obsolete: Still leaving it in in case used with 2009 version of icc_shell
#translate_zrt_parameters -direction to_zrt
set_route_zrt_common_options -connect_within_pins {{M1 via_standard_cell_pins}}

#By default zroute does not honour routing blockages!!!
set_route_zrt_common_options -read_user_metal_blockage_layer true

#------------------------------------------------------------------------------------
# Enable the use of tie cells
#------------------------------------------------------------------------------------

foreach tie_cell ${rm_tie_hi_lo_list} {
# Ensure tie cells can be used by the flow
  set _cell [get_lib_cell ${tie_cell}]
  remove_attribute ${_cell} dont_touch
  remove_attribute ${_cell} dont_use
# Ensure that one cell is placed per tie-off
  set _pin [get_lib_pins ${tie_cell}/Y* ]
  set_attribute ${_pin} max_capacitance 2 -type float
  set_attribute ${_pin} max_fanout 10 -type float
}

# -----------------------------------------------------------------------------------
# Report constraints on min/max layers
# -----------------------------------------------------------------------------------

report_routing_rule width_and_spacing_rules

# -----------------------------------------------------------------------------------
# Set clock tree options
# -----------------------------------------------------------------------------------
#No effort medium option in set_clock_tree_options
#set_clock_tree_options -effort medium 
set_clock_tree_options \
                       -max_transition ${rm_max_clock_transition} \
                       -routing_rule width_and_spacing_rules \
                       -use_default_routing_for_sinks 1 \
		       -max_fanout ${rm_cts_max_fanout} \
                       -layer_list "M3 M4 M5"

set_clock_tree_references -references ${rm_clock_cell}
set_clock_tree_references -references ${rm_clock_size_cell} -sizing_only
set_clock_tree_references -references ${rm_clock_delay_cell} -delay_insertion_only

# -----------------------------------------------------------------------------------
# Perform CTS
# -----------------------------------------------------------------------------------

# Remove any remaining ideal networks
remove_ideal_network -all
set_delay_calculation -postroute arnoldi -routed_clock arnoldi -arnoldi_effort hybrid

clock_opt -only_cts -no_clock_route -update_clock_latency

# Remove pessimism due to cells that are common to clock and data paths
set timing_remove_clock_reconvergence_pessimism true

# Post CTS Timing Optimization - including scan re-order
clock_opt -only_psyn -no_clock_route -power -fix_hold_all_clocks -area

# -----------------------------------------------------------------------------------
# Save the design before clock routing
# -----------------------------------------------------------------------------------

save_mw_cel -as 4_clockopt

# -----------------------------------------------------------------------------------
# Verify PG nets 
# -----------------------------------------------------------------------------------
derive_pg_connection -power_net {VDD} -ground_net {VSS}
verify_pg_nets

# -----------------------------------------------------------------------------------
#       Clock Routing
# -----------------------------------------------------------------------------------

##Route Clocks using the previous ICGR global route
route_zrt_group -all_clock_nets -reuse_existing_global_route true

# -----------------------------------------------------------------------------------
# Save the Design
# -----------------------------------------------------------------------------------

save_mw_cel -as 4_clockopt

# -----------------------------------------------------------------------------------
# Report on the Design
# -----------------------------------------------------------------------------------

report_constraints -all > ../reports/layout/${rm_core_top}-clockopt.constraint
report_timing -max_paths 100 -derate -cap -tran -input -net -delay max > ../reports/layout/${rm_core_top}-clockopt.max_timing
report_timing -max_paths 100 -derate -cap -tran -input -net -delay min > ../reports/layout/${rm_core_top}-clockopt.min_timing

close_mw_lib ${rm_core_top}
date
exit
