#####################################
#              TOOLS                #
#####################################
MODULE   = . /usr/share/Modules/init/sh; module load licenses/synopsys 
#DC        = tools/design-compiler/M-2016.12-SP2
DC       = tools/design-compiler/M-2016.12-SP2
ICC      = tools/ic-compiler/K-2015.06-SP5
LC       = tools/library-compiler/M-2016.12-SP2
STAR     = tools/starxtract/M-2016.12-SP2
PT       = tools/primetime/M-2016.12-SP2
FM        = tools/formality/J-2014.09-SP5
VCS	      = tools/vcs-mx/J-2014.12-SP1-1

#####################################
#              SETUP                #
#####################################
TOP	   = 	   SysArray_rtl
TYPE       =       macro
RUNDIR     =       $(PWD)
LOGS       =       $(RUNDIR)/logs
TAPEOUT    =       $(RUNDIR)/tapeout_gds
SCRIPTS    =       $(RUNDIR)/scripts
DATE       =       "`date '+%m_%d_%H_%M'`"
MODEL      =       $(RUNDIR)/models
#####################################
#              FRONT                #
#####################################
tell_date: 
	echo $(DATE)

compile: dirs
	cd work; $(MODULE) $(DC); time dc_shell-xg-t -topographical_mode -64bit -f $(SCRIPTS)/compile.tcl \
	| tee $(LOGS)/compile.log

design_planning:
	cd work; $(MODULE) $(ICC) $(LC); time icc_shell -64bit -gui -f $(SCRIPTS)/design_planning.tcl \
	| tee $(LOGS)/design_planning.log

#####################################
#              BACK                 #
#####################################
place_opt:
	cd work; $(MODULE) $(ICC); time icc_shell -64bit -f $(SCRIPTS)/place_opt.tcl | tee $(LOGS)/place_opt.log

clock_opt:
	cd work; $(MODULE) $(ICC); time icc_shell -64bit -f $(SCRIPTS)/clock_opt.tcl | tee $(LOGS)/clock_opt.log

route_opt:
	cd work; $(MODULE) $(ICC); time icc_shell -64bit -f $(SCRIPTS)/route_opt.tcl | tee $(LOGS)/route_opt.log

ICC:
	cd work; $(MODULE) $(ICC) $(LC); time icc_shell -64bit -gui -f $(SCRIPTS)/icc_gui.tcl | tee ../logs/inter/icc_interact.log.$(DATE)

#####################################
#         CREATE DIRECTORIES        #
#####################################
dirs:
	#@mkdir -p mw_temp_dir/
	@mkdir -p work/
	@mkdir -p logs/
	@mkdir -p data/
	@mkdir -p reports/compile/
	@mkdir -p reports/layout/
	@mkdir -p reports/dft/
	@mkdir -p reports/lec/
	@mkdir -p reports/sta/
	@mkdir -p reports/dmsa/
	@mkdir -p reports/power
	@mkdir -p reports/conformal/
	@mkdir -p tapeout_gds
	@mkdir -p models/cdl
	@mkdir -p models/db
	@mkdir -p models/floorplan
	@mkdir -p models/gds
	@mkdir -p models/lef
	@mkdir -p models/lib
	@mkdir -p models/milkyway/9m_2xa1xd3xe2z_utrdl
	@mkdir -p models/parasitic
	@mkdir -p models/sdc
	@mkdir -p models/sdf
	@mkdir -p models/verilog
clean:
	@echo "Cleaning Implementation Directory ....."
	@/bin/rm -rf work/.[a-zA-Z]*
	@/bin/rm -rf elab 
	@/bin/rm -rf work*
	@/bin/rm -rf data
	@/bin/rm -rf models
	@/bin/rm -rf reports
	@/bin/rm -rf $(LOGS)
	@/bin/rm -rf tapeout_gds
