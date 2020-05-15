# written for flow package DesignCompiler 
set sdc_version 1.7 

set_operating_conditions tt_1p0v_25c
set_load 0.003010 [all_outputs]
## driver/slew constraints on inputs
set data_inputs [list {m_valids_rsc_dat[*]} {m_data_rsc_dat[*]} ccs_ccore_start_rsc_dat this_rdy]
set_driving_cell -no_design_rule -library scadv10_cln65gp_rvt_tt_1p0v_25c -lib_cell BUFHX0P7MA10TR -pin Y $data_inputs
set_units -time ns
# time_factor: 1.0

create_clock -name ccs_MIO_clk -period 2.0 -waveform { 0.0 1.0 } [get_ports {ccs_MIO_clk}]
set_clock_uncertainty 0.0 [get_clocks {ccs_MIO_clk}]

create_clock -name virtual_io_clk -period 2.0
## IO TIMING CONSTRAINTS
set_output_delay -clock [get_clocks {ccs_MIO_clk}] 0.0 [get_ports {this_val}]
set_input_delay -clock [get_clocks {ccs_MIO_clk}] 0.0 [get_ports {this_rdy}]
set_output_delay -clock [get_clocks {ccs_MIO_clk}] 0.0 [get_ports {this_msg[*]}]
set_input_delay -clock [get_clocks {ccs_MIO_clk}] 0.0 [get_ports {m_valids_rsc_dat[*]}]
set_input_delay -clock [get_clocks {ccs_MIO_clk}] 0.0 [get_ports {m_data_rsc_dat[*]}]
set_input_delay -clock [get_clocks {ccs_MIO_clk}] 0.0 [get_ports {ccs_ccore_start_rsc_dat}]
set_max_delay 2.0 -from [all_inputs] -to [all_outputs]
set_output_delay -clock [get_clocks {ccs_MIO_clk}] 0.0 [get_ports {ccs_ccore_done_sync_vld}]

