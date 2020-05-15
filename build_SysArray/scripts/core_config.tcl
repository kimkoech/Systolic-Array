#####################################################################################
# Design configuration script 
#####################################################################################
if {${rm_task} == "synthesis"} {
   suppress_message CMD-041
}

# -----------------------------------------------------------------------------------
# Define top-level design name
# -----------------------------------------------------------------------------------

set rm_core_top     SysArray_rtl 

# -----------------------------------------------------------------------------------
# Define DFT Port Names
# -----------------------------------------------------------------------------------

set rm_scan_enable    [list  ] ;# Name of scan shift enable port
set rm_dft_const      [list  ] ;# Name of test control port

# -----------------------------------------------------------------------------------
# Clock and Reset Definitions
# -----------------------------------------------------------------------------------

#set rm_clock_ports    [list CLKIN]
#set rm_ext_clock_ports  [list CLKIN]
#set rm_poreset_pin    [list nCPUPORESET[1] nCPUPORESET[0] nCORERESET[1] nCORERESET[0] nL2RESET] 
#set rm_virtual_clocks [list VCLK]

set rm_clock_ports    [list clk]
set rm_ext_clock_ports  [list clk]
set rm_poreset_pin    [list rst] 
set rm_virtual_clocks [list VCLK]

# -----------------------------------------------------------------------------------
# Host options
# -----------------------------------------------------------------------------------
set host_numcores 8
