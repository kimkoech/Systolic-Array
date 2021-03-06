# written for flow package DesignCompiler 
set sdc_version 1.7 

set_operating_conditions tt_1p0v_25c
set_load 0.003010 [all_outputs]
## driver/slew constraints on inputs
set data_inputs [list write_req_val {write_req_msg[*]} start_val {start_msg[*]} weight_in_vec_0_val weight_in_vec_1_val weight_in_vec_2_val weight_in_vec_3_val weight_in_vec_4_val weight_in_vec_5_val weight_in_vec_6_val weight_in_vec_7_val {weight_in_vec_0_msg[*]} {weight_in_vec_1_msg[*]} {weight_in_vec_2_msg[*]} {weight_in_vec_3_msg[*]} {weight_in_vec_4_msg[*]} {weight_in_vec_5_msg[*]} {weight_in_vec_6_msg[*]} {weight_in_vec_7_msg[*]} accum_out_vec_0_rdy accum_out_vec_1_rdy accum_out_vec_2_rdy accum_out_vec_3_rdy accum_out_vec_4_rdy accum_out_vec_5_rdy accum_out_vec_6_rdy accum_out_vec_7_rdy]
set_driving_cell -no_design_rule -library scadv10_cln65gp_rvt_tt_1p0v_25c -lib_cell BUFHX0P7MA10TR -pin Y $data_inputs
set_units -time ns
# time_factor: 1.0

create_clock -name clk -period 2.0 -waveform { 0.0 1.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name clk -period 2.0 -waveform { 0.0 1.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 2.0
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {write_req_val}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {write_req_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {write_req_msg[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {start_val}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {start_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {start_msg[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_0_val}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_1_val}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_2_val}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_3_val}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_4_val}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_5_val}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_6_val}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_7_val}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_0_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_1_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_2_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_3_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_4_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_5_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_6_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_7_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_0_msg[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_1_msg[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_2_msg[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_3_msg[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_4_msg[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_5_msg[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_6_msg[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {weight_in_vec_7_msg[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_0_val}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_1_val}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_2_val}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_3_val}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_4_val}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_5_val}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_6_val}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_7_val}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_0_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_1_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_2_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_3_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_4_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_5_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_6_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_7_rdy}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_0_msg[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_1_msg[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_2_msg[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_3_msg[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_4_msg[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_5_msg[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_6_msg[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {accum_out_vec_7_msg[*]}]

