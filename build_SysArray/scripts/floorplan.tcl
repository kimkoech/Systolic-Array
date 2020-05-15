###################################################################

# Created by write_floorplan on Wed May  1 10:19:44 2013

###################################################################
#undo_config -disable

set rm_core_width 500
set rm_core_height 500
set zero 0.000
#create_die_area -coordinate {0 0 $rm_core_width $rm_core_height}

create_die_area -coordinate [list [list ${zero} ${zero}] [list $rm_core_width $rm_core_height]]

#Borrowing DB code to turn of errors in compile
if {$rm_task != "synthesis"} {
set oldSnapState [set_object_snap_type -enabled false]
}

if {$rm_task != "synthesis"} {
set_object_snap_type -enabled $oldSnapState
}
#undo_config -enable
