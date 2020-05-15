#############################################
# CM0_SYS Constraints
#############################################

# HCLK
create_clock -period ${rm_clock_period} -name HCLK [get_ports $rm_clock_ports] 

# VCLK
create_clock -period ${rm_clock_period} -name VCLK 

set_clock_groups -asynchronous -group HCLK 

#############################################
# Clock Constraints 
#############################################
# Clock Constraints
if {($rm_task == "sta") || ($rm_task == "ptpx")} {
  set_clock_uncertainty -setup [expr ${rm_post_cts_clock_uncertainty} + ${rm_setup_margin} + ${rm_period_jitter}] [all_clocks]
  set_clock_uncertainty -hold  [expr ${rm_hold_margin}]  [all_clocks]
  set_propagated_clock [all_clocks]
  set_clock_latency $VCLK_clock_latency [get_clocks {VCLK} ]

} elseif {($rm_task == "synthesis") || ($rm_task == "design_planning") || ($rm_task == "place_opt")} {
  set_clock_uncertainty -setup [expr ${rm_pre_cts_clock_uncertainty} + ${rm_setup_margin} + ${rm_period_jitter}] [get_clocks HCLK]
  set_clock_uncertainty -hold [expr ${rm_hold_margin}] [get_clocks HCLK]

  set_clock_uncertainty -setup [expr ${rm_pre_cts_clock_uncertainty} + ${rm_setup_margin} + ${rm_period_jitter}] [get_clocks VCLK]
  set_clock_uncertainty -hold [expr ${rm_hold_margin}] [get_clocks VCLK]

}

#set_clock_uncertainty -setup 0.2 [get_clocks HCLK]
set_input_transition 0.5 [all_inputs]
#################################################################
# Top-level constraints
##################################################################
for {set i 0} {$i < 100} {incr i 5} {
  set rm_cycle[format "%#02d" $i ] [expr 0.01 * ${i} * ${rm_clock_period}]
}

set inputs [remove_from_collection [all_inputs] ${rm_clock_ports}]
set outputs [all_outputs]

if {($rm_task != "sta") && ($rm_task != "ptpx")} {
set_driving_cell -lib_cell $rm_driving_cell \
                 -pin $rm_driving_pin \
                 -input_transition_rise ${rm_max_transition} \
                 -input_transition_fall ${rm_max_transition} \
                 $inputs

set_driving_cell -lib_cell $rm_clock_driving_cell \
                 -pin $rm_driving_pin \
                -input_transition_rise ${rm_max_clock_transition} \
                -input_transition_fall ${rm_max_clock_transition} \
                $rm_clock_ports
}


set_input_delay 2.0 -min -clock HCLK $inputs

set_load ${rm_load_value} ${outputs}
set_max_fanout ${rm_max_fanout} ${rm_core_top}

set_max_transition ${rm_max_transition} $rm_core_top
set_max_transition ${rm_max_clock_transition} -clock_path HCLK

