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

set link_path [list *]
set link_path [concat * $rm_mintypmax_libs ]

set target_library ${rm_target_library}

set search_path    ${rm_search_path}

# -----------------------------------------------------------------------------------
# Copy & Read the Design from the Floorplanning Step
# -----------------------------------------------------------------------------------

set mw_reference_library ${rm_mw_reflib}

#open_mw_lib ${rm_core_top}

