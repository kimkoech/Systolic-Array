#############################################
# Path Group Settings for SM3
#############################################
set inputs [remove_from_collection [all_inputs] ${rm_clock_ports}]

group_path -name Inputs -from $inputs
group_path -name Outputs -to [all_outputs]
group_path -name Feedthrough  -from $inputs -to [all_outputs]

# paths between regs / memories
set all_regs [all_registers]

if {$rm_task == "synthesis"} {
  set regs [remove_from_collection [all_registers] [get_cells -filter "is_sequential==true && clock_gating_integrated_cell =~ *latch* && is_memory_cell != true" -hier]]
} else {
  set regs [filter_collection [all_registers] "is_integrated_clock_gating_cell != true && is_memory_cell != true"]
}

#set memories [filter_collection $all_regs "is_memory_cell == true"]
#set memories [get_cell uMEM*/u_*/u_*]

# path groups
group_path -name FromSYSARRAYregs -from $regs
group_path -name ToSYSARRAYregs   -to   $regs

#group_path -name FromSYSARRAYmems -from $memories
#group_path -name ToSYSARRAYmems   -to   $memories

###########################################################
# Set path group options for Innovus
###########################################################
if {($rm_task != "sta") && ($rm_task != "ptpx") && ($rm_task != "synthesis")} {
  setPathGroupOptions FromSYSARRAYregs -effortLevel high
  setPathGroupOptions ToSYSARRAYregs -effortLevel high
}
