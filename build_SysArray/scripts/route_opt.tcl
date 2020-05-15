#####################################################################################
# Detail route optimization of the ${rm_core_top}.
#####################################################################################


set rm_task     route_opt
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

# -----------------------------------------------------------------------------------
# Define link libraries; add Designware to path
# -----------------------------------------------------------------------------------

set link_library [concat * $rm_mintypmax_libs ]

set synthetic_library dw_foundation.sldb
set link_library [concat ${link_library} ${synthetic_library} ]

# Standard cells in the target library(s) will appear in the synth'd netlist
set target_library ${rm_target_library}

# The search path contains all the directory paths to the library files in the link-path
set search_path    ${rm_search_path}

# -----------------------------------------------------------------------------------
# Copy & Read the Design from the Floorplanning Step
# -----------------------------------------------------------------------------------

set mw_reference_library ${rm_mw_reflib}

open_mw_lib ${rm_core_top}

copy_mw_cel  -from 4_clockopt \
             -to   5_routeopt

open_mw_cel        5_routeopt

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
set compile_instance_name_prefix icc_routeopt
set compile_delete_unloaded_sequential_cells false
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
set psyn_onroute_disable_netlength_drc TRUE

## Disable fanout opto during route_opt. Max fanout has to be taken care of earlier in the flow.
set_app_var psyn_onroute_disable_fanout_drc true

# By default, the tool will set a critical range of 50% of the WNS, per pathgroup.
# If you want to change this behavior, please use the command below
# set_critical_range <your number> [current_design]
set_critical_range [expr ${rm_critical_range} * ${rm_clock_period} ] ${rm_core_top}

# Density Driven Area Recovery during route_opt
set physopt_density_area_recovery true

# Set Area Critical Range
# Typical value: 3-4 percent of critical clock period
set physopt_area_critical_range [expr ${rm_clock_period} * 0.3]

# Set Power Critical Range
# Typical value: 3-4 percent of critical clock period
set physopt_power_critical_range [expr ${rm_clock_period} * 0.04]

# Turning on CRPR has a BIG effect on reducing the number of hold violations
set timing_remove_clock_reconvergence_pessimism true

report_preferred_routing_direction

report_tlu_plus_files

## Report percentages from standard cell libs
set_attribute [get_libs ${rm_rvt_lib}] default_threshold_voltage_group RVt -type string

# -----------------------------------------------------------------------------------
# Read in list of dont_use cells
# -----------------------------------------------------------------------------------

foreach dont_use ${rm_dont_use_list} {
  set_dont_use [get_lib_cells */${dont_use} ]
}

# -----------------------------------------------------------------------------------
# Enable the use of tie cells
# -----------------------------------------------------------------------------------
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
# Route options
# -----------------------------------------------------------------------------------

report_route_opt_strategy
report_si_options

set_route_options -groute_timing_driven true \
                  -track_assign_timing_driven true \
                  -same_net_notch check_and_fix

# Report route settings
report_route_opt_strategy
report_si_options

# Recommended for a QoR-targeted flow (2008.09)

set_delay_calculation -postroute arnoldi -routed_clock arnoldi -arnoldi_effort high
#------------------------------------------------------------------------------------
# Enable the use of Z-Route
#------------------------------------------------------------------------------------

set_route_mode_options -zroute true
set_route_options -same_net_notch check_and_fix
#Following is not supported
#translate_zrt_parameters -direction to_zrt
set_route_zrt_common_options -connect_within_pins {{M1 via_standard_cell_pins}}
set_route_zrt_common_options -rotate_default_vias false
#Adding zrt option for routing double-width clock directly from the pin
set_route_zrt_detail_options -pin_taper_mode pin_width

#Added ZRT common options for not routing in M8 and above
#set_ignored_layers -max_routing_layer ${rm_max_layer_name} -min_routing_layer M2
set_route_zrt_common_options -global_max_layer_mode hard 
set_route_zrt_common_options -global_min_layer_mode allow_pin_connection 
#set_route_zrt_common_options -min_layer_mode hard 

set_route_opt_strategy -fix_hold_mode all -search_repair_loops 20 -eco_route_search_repair_loops 10 

# -----------------------------------------------------------------------------------
# Detail Route and Post-Route Optimizations
# -----------------------------------------------------------------------------------

#check_physical_design –stage pre_route_opt -display 
set routeopt_verbose true
set_fix_hold [all_clocks]
route_opt -initial_route_only

save_mw_cel -as 5_routeopt

# -----------------------------------------------------------------------------------
# Connect Power & Ground ports
# -----------------------------------------------------------------------------------
derive_pg_connection -power_pin {VDD} -power_net {VDD} -ground_pin {VSS} -ground_net {VSS}
derive_pg_connection -reconnect -all

# -----------------------------------------------------------------------------------
# Finishing
# -----------------------------------------------------------------------------------

insert_stdcell_filler -respect_keepout -cell_without_metal $rm_fill_cells

# -----------------------------------------------------------------------------------
# Save the Design
# -----------------------------------------------------------------------------------

#change_names -rules verilog -hierarchy

#verify_lvs -max_error 200
save_mw_cel -as 5_routeopt

copy_mw_cel -from 5_routeopt -to   ${rm_core_top}

# -----------------------------------------------------------------------------------
# Report on the Design
# -----------------------------------------------------------------------------------
report_power > ../reports/layout/${rm_core_top}-route_opt.power
report_area > ../reports/layout/${rm_core_top}-route_opt.area

date
exit
