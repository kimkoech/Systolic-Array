#####################################################################################
# Setup script for ICC-DP
#####################################################################################

set rm_task     floorplan
sh hostname
date

gui_set_current_task -name {All}

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

# Set up the link_library - lists all the db's that contain cells in the netlist
set link_library [concat * $rm_mintypmax_libs ]

set synthetic_library dw_foundation.sldb
set link_library [concat ${link_library} ${synthetic_library} ]

# Standard cells in the target library(s) will appear in the synth'd netlist
set target_library ${rm_target_library}

# The search path contains all the directory paths to the library files in the link-path
set search_path    ${rm_search_path}

# -----------------------------------------------------------------------------------
# Copy & Read the Design from the Compile Step
# -----------------------------------------------------------------------------------

open_mw_lib ${rm_core_top}
 
# -----------------------------------------------------------------------------------
# Set host options
# -----------------------------------------------------------------------------------

if ${rm_multi_core} {
set_host_options -max_core ${host_numcores}
}
 
read_ddc ../data/${rm_core_top}-compile.ddc
link
#check_library

save_mw_cel -as 2_floorplan

# -----------------------------------------------
# Read floorplan files
# -----------------------------------------------

#Assuming floorplan scripts already exist
#read_io_constraints ../floorplan/pins.tcl
read_floorplan ../scripts/floorplan.tcl

create_floorplan  -control_type boundary \
                      -left_io2core      ${rm_core_offset} \
                      -bottom_io2core    ${rm_core_offset} \
                      -right_io2core     ${rm_core_offset} \
                      -top_io2core       ${rm_core_offset} \
          			 -keep_macro_place \
                      -start_first_row

save_mw_cel -as 2_floorplan_pre_place

# -----------------------------------------------------------------------------------
# Connect PG first before loading floorplan file or create_floorplan
# -----------------------------------------------------------------------------------

#derive_pg_connection -power_net VDD -power_pin VDD -ground_net VSS -ground_pin VSS 

#set_dont_touch_placement [all_macro_cells]

derive_pg_connection -power_net VDD -power_pin VDD -create_port top
derive_pg_connection -ground_net VSS -ground_pin VSS -create_port top
set_preferred_routing_direction -layers {M1 M3 M5 M7 M9 MRDL} -direction vertical
set_preferred_routing_direction -layers {M2 M4 M6 M8 MRDL} -direction horizontal

set_keepout_margin -all_macros -outer {2 2 2 2} -type hard


# -----------------------------------------------------------------------------------
# Quick placement and pin optimization
# -----------------------------------------------------------------------------------

#Optimize_pins causes pin clustering and makes a mess of routing. In any case, we will
#have a pins.tcl file. Without optimize_pins, all pins are uniformly distributed around 
#the periphery. Dont get any detail_route violations and LVS clean design out of the box.
#create_fp_placement -optimize_pins. Try preventing pin stacking and forcing pins on 
#top and right. Left side is 1, top 2 and so on.

set all_ports [get_ports *]

set_fp_pin_constraints -no_stacking all \
                       -keep_buses_together on \
                       -use_physical_constraints on \
                       -allowed_layers  { M3 M4 M5 } \
        		       -pin_spacing 10 \
                       -block_level -exclude_side "1"



create_fp_placement -optimize_pins
#create_fp_placement
set_hierarchy_color -cycle_color

derive_pg_connection -reconnect -all
#derive_pg_connection -power_net {VDD} -ground_net {VSS}

save_mw_cel -as 2_floorplan_pre_pns

set_preroute_drc_strategy -min_layer M2 -max_layer MRDL
set_power_plan_strategy core_m3 -nets {VDD VSS} -core -template ../scripts/power_rail.tpl:m3_mesh(0.5) -extension {stop: design_boundary}
set_power_plan_strategy core -nets {VDD VSS} -core -template ../scripts/power_rail.tpl:m89_mesh(2.0,2.0) -extension {stop: design_boundary}

compile_power_plan

insert_stdcell_filler \
-cell_without_metal "SHFILL128_RVT SHFILL64_RVT SHFILL3_RVT SHFILL2_RVT SHFILL1_RVT" \
-connect_to_power {VDD} \
-connect_to_ground {VSS}

set_preroute_drc_strategy \
-min_layer M2 \
-max_layer M5

preroute_standard_cells -connect horizontal \
-nets {VDD VSS} \
-port_filter_mode off \
-route_pins_on_layer M1 \
-cell_master_filter_mode off \
-cell_instance_filter_mode off \
-voltage_area_filter_mode off

# verify connectivity of power/ground nets
verify_pg_nets

# get rid of filler cells
remove_stdcell_filler -stdcell

verify_pg_nets

#set ring_width 4
#set offset 4
#set hm M5
#set vm M6
#create_rectangular_rings  -nets  {VDD VSS}  -left_segment_layer $vm -left_segment_width $ring_width -extend_ll -extend_lh -right_segment_layer $vm -right_segment_width $ring_width -extend_rl -extend_rh -bottom_segment_layer $hm -bottom_segment_width $ring_width -extend_bl -extend_bh -top_segment_layer $hm -top_segment_width $ring_width -extend_tl -extend_th  -left_offset $offset -right_offset $offset -bottom_offset $offset -top_offset $offset -offsets absolute

#set_fp_rail_constraints -add_layer  -layer M6 -direction vertical -max_pitch 30.4 -min_pitch 0.304 -max_width 6.08 -min_width 3.04 -spacing minimum
#set_fp_rail_constraints -add_layer  -layer M5 -direction horizontal -max_pitch 30.4 -min_pitch 0.304 -max_width 6.08 -min_width 3.04 -spacing minimum
#set_fp_rail_constraints -set_global   -no_routing_over_hard_macros -no_routing_over_soft_macros

#create_power_straps -nets {VDD VSS} -direction vertical -layer M6 -width 2 -num_placement_strap 174 -increment_x_or_y 15 -extend_for_multiple_connections -extension_gap 1000
#create_power_straps -nets {VDD VSS} -direction horizontal -layer M5 -width 2 -num_placement_strap 174 -increment_x_or_y 15 -extend_for_multiple_connections -extension_gap 1000
#
#preroute_standard_cells    -skip_macro_pins    -mode    rail    -nets    {VDD    VSS}    -do_not_route_over_macros

# -----------------------------------------------------------------------------------
# Preroute Standard Cells
# -----------------------------------------------------------------------------------
#derive_pg_connection -reconnect -all


# ----------------------------------------------------------------------------------------------------------------------
# Verify PG
# ----------------------------------------------------------------------------------------------------------------------

#verify_pg_nets 
#verify_pg_nets > ../reports/layout/${rm_core_top}-dp.verify-pg
#verify_pg_nets -std_cell_pin_connection ignore -macro_pin_connection all > ../reports/layout/rram-dp.verify-pg
# -----------------------------------------------------------------------------------
# QOR & design reports
# -----------------------------------------------------------------------------------

#report_design -physical > ../reports/layout/${rm_core_top}-dp.summary

# -----------------------------------------------------------------------------------
# Floorplan replay scripts
# -----------------------------------------------------------------------------------
# Dump replay files that can be used if floorplan gets modified.

write_floorplan -placement { hard_macro } \
                -no_route_guide \
                ../reports/layout/${rm_core_top}-dp_dump.floorplan

write_route -output ../reports/layout/${rm_core_top}-dp_dump.power_route

write_io_constraints -pin_only \
                     -constraint_type side_location \
                     ../reports/layout/${rm_core_top}-dp_dump.pins

write_physical_constraints -port_side \
                           -output ../reports/layout/${rm_core_top}-dp_dump.physcons

# -----------------------------------------------------------------------------------
# Save design and exit
# -----------------------------------------------------------------------------------

set save_mw_cel_lib_setup true
save_mw_cel -as 2_floorplan

close_mw_lib ${rm_core_top}

date
exit

