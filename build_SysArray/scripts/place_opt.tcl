#####################################################################################
# Placement optimization of the ${rm_core_top}. 
#####################################################################################

set rm_task     place_opt
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
# Define link libraries, target libraries, search path
# -----------------------------------------------------------------------------------

# Set up the link_library - lists all the db's that contain cells in the netlist
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

copy_mw_cel -from 2_floorplan \
            -to   3_placeopt

open_mw_cel       3_placeopt

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
set compile_instance_name_prefix icc_placeopt
set timing_enable_multiple_clocks_per_reg true
set case_analysis_with_logic_constants true
set_fix_multiple_port_nets -all -buffer_constants
set_auto_disable_drc_nets -scan false
set enable_recovery_removal_arcs true
set placer_disable_auto_bound_for_gated_clock false
set timing_use_enhanced_capacitance_modeling true
#set timing_aocvm_enable_analysis true
if ${rm_fp_clustering} {
set placer_max_cell_density_threshold $rm_cell_density
}

# Set Ideal Network so place_opt handles data/clock mixing with high fanout
# Remove before clock_opt cts
set_ideal_network    [all_fanout -flat -clock_tree ]
remove_ideal_network [get_ports $rm_poreset_pin]
#${rm_scan_enable}]

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
}

# -----------------------------------------------------------------------------------
# Set constraints on min/max layers
# -----------------------------------------------------------------------------------

remove_routing_rules width_and_spacing_rules

set_auto_disable_drc_nets -constant false

# -----------------------------------------------------------------------------------
# PLACEMENT OPTIMIZATION
# -----------------------------------------------------------------------------------

place_opt -effort high -area_recovery -optimize_dft -power -area

# -----------------------------------------------------------------------------------
# Connect Power & Ground ports
# -----------------------------------------------------------------------------------

derive_pg_connection -power_net {VDD} -ground_net {VSS}
derive_pg_connection -reconnect
verify_pg_nets
# -----------------------------------------------------------------------------------
# Save the Design
# -----------------------------------------------------------------------------------

save_mw_cel -as 3_placeopt


close_mw_lib ${rm_core_top}
date
exit
