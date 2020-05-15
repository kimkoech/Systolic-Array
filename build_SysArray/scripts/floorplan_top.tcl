###################################################################
# Placement parameters for CORTEXA53
###################################################################
set finfet_grid 0.048
set ram_abut_spc [expr 40 * $finfet_grid]

set rm_core_offset_x [expr $finfet_grid * 20]
set rm_core_offset_y [expr $finfet_grid * 20]

# Metal strap parameters
set M5_strap_width 1.68
set M6_strap_width 1.76
set M7_strap_width 2.0
set M8_strap_width 10.8
set M9_strap_width 10.8

set M5_strap_spacing 0.48
set M6_strap_spacing 0.48
set M7_strap_spacing 0.48
set M8_strap_spacing 1.35
set M9_strap_spacing 1.35

set M5_strap_pitch [expr $M5_strap_width + $M5_strap_spacing]
set M6_strap_pitch [expr $M6_strap_width + $M6_strap_spacing]
set M7_strap_pitch [expr $M7_strap_width + $M7_strap_spacing]
set M8_strap_pitch [expr $M8_strap_width + $M8_strap_spacing]
set M9_strap_pitch [expr $M9_strap_width + $M9_strap_spacing]

set pclampc_height 21.984
set pclampc_width 99.024

set macro_halo_spc [expr 40 * $finfet_grid]
