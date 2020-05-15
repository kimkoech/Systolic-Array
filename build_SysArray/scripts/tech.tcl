#####################################################################################
# Technology Setup file
#####################################################################################


# -----------------------------------------------------------------------------------
# Set Host Options
# -----------------------------------------------------------------------------------

set rm_multi_core 1

# -----------------------------------------------------------------------------------
# Path to libraries
# -----------------------------------------------------------------------------------

#if {[info exists sh_launch_dir] == 1} {
#  set sh_launch_dir "."
#}

set rm_saed32_lib_dirs                "/cad/kits/synopsys/SAED32_EDK/lib"
set rm_saed32_kit_dirs                "/cad/kits/synopsys/SAED32_EDK/tech"


# -----------------------------------------------------------------------------------
# Technology File Locations
# -----------------------------------------------------------------------------------
set rm_max_tluplus_file        ${rm_saed32_kit_dirs}/star_rcxt/saed32nm_1p9m_Cmax.tluplus
set rm_typ_tluplus_file        ${rm_saed32_kit_dirs}/star_rcxt/saed32nm_1p9m_nominal.tluplus
set rm_min_tluplus_file        ${rm_saed32_kit_dirs}/star_rcxt/saed32nm_1p9m_Cmin.tluplus
set rm_tf2itf_map_file         /cad/kits/synopsys/SAED32_EDK/tech/milkyway/saed32nm_tf_itf_tluplus.map
set rm_tech_file               /cad/kits/synopsys/SAED32_EDK/tech/milkyway/saed32nm_1p9m_mw.tf

# -----------------------------------------------------------------------------------
# Technology Specific Parameters
# -----------------------------------------------------------------------------------
set rm_load_value              10                           ;# Capacitive load placed on all outputs
set rm_driving_cell            NBUFFX16_RVT                 ;# The driving cell for all inputs
set rm_driving_pin             Y                            ;# The output pin of the driving cell

set rm_clock_driving_cell      NBUFFX16_RVT                 ;# The driving cell for clock ports
set rm_clock_driving_pin       Y                            ;# The output pin of the clock driving cell
set rm_period_jitter           0.2                         ;# Cycle jitter (rise-to-rise) +/- N ns
                                                            ;# of the whole cycle
set rm_dcd_jitter              0.5                         ;# Duty cycle distortion as a percentage of the whole
                                                            ;# cycle - +/- N%. Affects the falling edge
                                                            ;# of the clock
set rm_setup_margin            0.25                         ;# in ns. Setup margin
set rm_hold_margin             0.5                         ;# in ns. Hold margin
set rm_ocv_derate_factor       0.5                         ;# %. 0.10 = 10%, 0.05 = 5%
set rm_clock_uncertainty       0.10                         ;# in ns. Pre-CTS clock skew estimate
set rm_pre_cts_clock_uncertainty       0.1                  ;# in ps. Pre-CTS clock skew estimate
set rm_post_cts_clock_uncertainty       0.075                  ;# in ps. Pre-CTS clock skew estimate
# TODO review all timing margins

set rm_critical_range          0.10                         ;# Critical range. % of the rm_clock_period

#set rm_icg_name       {integrated:CKBD16BWD} ;# Name of ICG cell
set rm_icg_name        {integrated};
set rm_max_fanout              1000                           ;# Maximum fanout threshold
set rm_cts_max_fanout          1000                            ;# Maximum fanout threshold


set rm_max_transition          0.500
set rm_max_clock_transition    0.500

# TODO update clock latency figures below
set rm_fclk_latency           0.40                         ;# Predicted clock insertion delay
set rm_hclk_latency           0.80                         ;# Predicted clock insertion delay
set rm_clock_latency          0.80
set rm_icg_latency             0.07                          ;# Latency for integrated clock gating cell

# Operating conditions to use for min-max settings in compile
set rm_max_operating_condition saed32rvt_ss0p75vn40c
set rm_min_operating_condition saed32rvt_ff0p95v125c
set rm_typ_operating_condition saed32rvt_tt0p85v25c

set rm_process_corner          cworst              ;# Process corner to use for STA and extraction
                                                   ;# rcbest || cworst || typical || cbest || rcworst
                                                   ;# It is suggested that Users run STA at multiple
                                                   ;# corners
#set rm_process_corner_power    typical             ;# Process corner to use for PTPX power analysis
set rm_process_corner_power    cbest             ;# Process corner to use for PTPX power analysis

set rm_etm_derate_data_hold         0.7

set rm_pp_activity 0.5

# placement density control
set rm_cell_density 0.9

# -----------------------------------------------------------------------------------
# Floorplan Control Setup
# -----------------------------------------------------------------------------------

set rm_core_utilization  "0.70"
set rm_aspect_ratio      "1.00"

set rm_core_offset       "2.0"
set rm_fp_exists         1                 ;# Set this to 0 if no floorplanning scripts exist 
set rm_fp_clustering     1                 ;# Set this variable to 1 to enable local clustering of cells
					                       ;# Usually clustering is the default option. But, for small designs, taking it out
                                           ;# is better for routing

# -----------------------------------------------------------------------------------
# Pointer to DW version for Formality, and pt2tmax script for test pattern generation
# -----------------------------------------------------------------------------------

set rm_hdlin_dwroot /cad/tools/synopsys/syn/M-2016.12-SP2

# -----------------------------------------------------------------------------------
# Technology Library Setup
# -----------------------------------------------------------------------------------

##  Path to Standard Cell libraries
set rm_rvt_reflib           "${rm_saed32_lib_dirs}/stdcell_rvt"
#TODO fix this
#TODO map to the proper milkyway 
#TODO need to update these 
  
# The search path for the Milkyway library
set rm_mw_reflib [list ${rm_rvt_reflib}/milkyway/saed32nm_rvt_1p9m \
]

# Used to generate search_path - contains the directory paths to libraries that do
# not have a directory component
set rm_search_path [concat  ${search_path} . \
                            ${rm_rvt_reflib}/db_ccs \
]   

## Logical names of libraries
## SVT, 0.9v (RVT == SVT)

#ssg_cworst_max_0p81v_0c"
#ffg_ctypical_max_0p99v_125c"
#tt_ctypical_max_0p90v_25c"
## RVT
set rm_slow_rvt_lib_name          "saed32rvt_ss0p75vn40c"
set rm_fast_rvt_lib_name          "saed32rvt_ff0p95v125c"
set rm_typ_rvt_lib_name           "saed32rvt_tt0p85v25c"

## IO Cells, Core=0.9V IO=1.8V
#TODO update these -- MISSING LIBS FOR IO

## These logical library variables are used for reference in setting dont_use cells
## and reporting Vt library percentages.
set rm_rvt_lib "${rm_typ_rvt_lib_name}.db:${rm_typ_rvt_lib_name}"

# Target libraries for Multi-Vt synthesis and optimisation. Contains the standard
# cell libraries

set rm_target_library [list \
     ${rm_fast_rvt_lib_name}.db ${rm_typ_rvt_lib_name}.db ${rm_slow_rvt_lib_name}.db \
] 

# -----------------------------------------------------------------------------------
# Min/Typ/Max library triplets for synthesis, optmization and analysis
# -----------------------------------------------------------------------------------
# The rm_mintypmax_libs variable contains 'triplets' of library files used to create
# link paths, etc. in the implementation and analysis scripts. Each triplet is made
# up of the fast, typical and slow (in that order) db's for a particular library of
# cell(s). No specific ordering of library groups is required other than that they
# are in the above order within the group. For example:

set rm_mintypmax_libs [list \
     ${rm_fast_rvt_lib_name}.db ${rm_typ_rvt_lib_name}.db ${rm_slow_rvt_lib_name}.db \
]

# -----------------------------------------------------------------------------------
# AOCV Library Setup
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
# Milkyway Specific Settings
# -----------------------------------------------------------------------------------
# Variables required to keep power info.
# Otherwise Power/Gnd get treated as signal nets.
set mw_logic1_net               "VDD"
set mw_logic0_net               "VSS"

set mw_power_net                "VDD"
set mw_ground_net               "VSS"

set mw_power_port               "VDD.*"
set mw_ground_port              "VSS.*"

# -----------------------------------------------------------------------------------
# Routing rules
# -----------------------------------------------------------------------------------

# This is the name of the maximum layer the router is allowed to use
#TODO check these
set rm_max_layer_name       M5
set rm_clock_max_layer_name       M6

# Set this multiplier to the desired width and spacing of the clock-tree routing
set rm_clock_routing_width_multiplier   2
set rm_clock_routing_spacing_multiplier 2

# -----------------------------------------------------------------------------------
# Cell Specific Setup
# -----------------------------------------------------------------------------------
# This section contains lists of cells which are used, or excluded, by specific parts
# of the implementation flow

# Cells used to provide logic-1 and logic-0. Variable used in ICC flow steps
set rm_tie_hi_lo_list [list ${rm_rvt_lib}/TIEH_RVT \
                            ${rm_rvt_lib}/TIEL_RVT ]

set rm_fill_cells   [list SHFILL128_RVT SHFILL1_RVT SHFILL2_RVT SHFILL3_RVT SHFILL64_RVT]
 
# Output pin on above cells
set rm_tie_cell_pin     [list "Y"]

#SDFFYRPQ2D_X1M_A9PP140TS_C35 is being used as a sync flop 
#Scan is banned. Level Down shifters are banned as well.
#Banning 0pX cells as well
#Banning HVT devices until leakage recovery
set rm_dont_use_list [list TNBUFFX32_RVT ]

# Dont use list for leakage recovery stage
#set rm_focal_dont_use_list [list DLY* SDFF* *SDFFY* *0P* ]


# CTS only uses one Vt for better path matching across a die. These lists are
# referenced only during clock_opt

#Dont want to include 0P5 cells in clock-tree. Getting rid of INV_X0P5
set rm_clock_cell { IBUFFX2_RVT  IBUFFX4_RVT  IBUFFX8_RVT  IBUFFX16_RVT  IBUFFX32_RVT NBUFFX2_RVT NBUFFX4_RVT NBUFFX8_RVT NBUFFX16_RVT NBUFFX32_RVT}
set rm_buffer_cell { NBUFFX2_RVT NBUFFX4_RVT NBUFFX8_RVT NBUFFX16_RVT NBUFFX32_RVT}
set rm_clock_icg_cell {CGLPPSX2_RVT CGLPPSX4_RVT CGLPPSX8_RVT CGLPPSX16_RVT CGLNPSX2_RVT CGLNPSX4_RVT CGLNPSX8_RVT CGLNPSX16_RVT CGLPPRX2_RVT CGLPPRX8_RVT CGLNPRX2_RVT CGLNPRX8_RVT}

set rm_clock_size_cell  [list $rm_clock_cell]


# If delay cells are needed they are referenced from this list
set rm_logic_delay_cell [list DELLN1X2_RVT DELLN2X2_RVT DELLN3X2_RVT]

set rm_clock_delay_cell $rm_logic_delay_cell

set rm_svt_rand_fill_cap_cells  [list $rm_fill_cells]

## Tap cell to be used in design planning

## Bond pad physical cell
#set rm_bond_pad "PAD60GU"
#TODO is this the right one?
#set rm_fc_bump "PAD85APB_LF_BU"

## Parameters used for pad filler cell insertion
#set rm_io_fill_cell [list PFILLER10080 PFILLER01008 PFILLER00048 PFILLER00001]

## List of physical only cells to be excluded from the LVS netlist
set lvs_exclude_cells [list $rm_fill_cells]

set hold_fixing_cells [list $rm_buffer_cell $rm_logic_delay_cell]

# -----------------------------------------------------------------------------------
# Tool reporting defaults
# -----------------------------------------------------------------------------------
# Increase the precision of timing reports to 3 significant digits
# Note: *decreases* precision of area reports to 3 from 6 significant digits
set report_default_significant_digits 3


# -----------------------------------------------------------------------------------
# SM2 Design Specific Parameters
# -----------------------------------------------------------------------------------
set rm_clock_period 6

# end
