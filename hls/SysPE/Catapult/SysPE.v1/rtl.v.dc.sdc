# written for flow package DesignCompiler 
set sdc_version 1.7 

set_operating_conditions tt_1p0v_25c
set_load 0.003010 [all_outputs]
## driver/slew constraints on inputs
set data_inputs [list weight_in_val {weight_in_msg[*]} act_in_val {act_in_msg[*]} accum_in_val {accum_in_msg[*]} act_out_rdy accum_out_rdy weight_out_rdy]
set_driving_cell -no_design_rule -library scadv10_cln65gp_rvt_tt_1p0v_25c -lib_cell BUFHX0P7MA10TR -pin Y $data_inputs
set_units -time ns
# time_factor: 1.0

create_clock -name clk -period 2.0 -waveform { 0.0 1.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name clk -period 2.0 -waveform { 0.0 1.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 2.0
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_val}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_msg[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {act_in_val}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {act_in_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {act_in_msg[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_in_val}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_in_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_in_msg[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {act_out_val}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {act_out_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {act_out_msg[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_val}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_msg[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_out_val}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_out_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_out_msg[*]}]

