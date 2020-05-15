ACTIVE = @

-include /home/billyk/cs148/hls/lab3/SysPE/Catapult/SysPE.v1/scverify/concat_sim_rtl_v_vcs/sysc/subMakefile

BUILD_SYSC::
-include /home/billyk/cs148/hls/lab3/SysPE/Catapult/SysPE.v1/scverify/concat_sim_rtl_v_vcs/sysc/info.sysc.make.t

-include /home/billyk/cs148/hls/lab3/SysPE/Catapult/SysPE.v1/scverify/concat_sim_rtl_v_vcs/sysc/info.sysc.make.shared

-include /home/billyk/cs148/hls/lab3/SysPE/Catapult/SysPE.v1/scverify/concat_sim_rtl_v_vcs/sysc/modellist

-include /home/billyk/cs148/hls/lab3/SysPE/Catapult/SysPE.v1/scverify/concat_sim_rtl_v_vcs/sysc/stublist

#FORCE TARGET
FORCE:
SYSC_FILES += $(addprefix /home/billyk/cs148/hls/lab3/SysPE/Catapult/SysPE.v1/scverify/concat_sim_rtl_v_vcs/sysc/,$(MODELS))

SYSC_STUBS += $(addprefix /home/billyk/cs148/hls/lab3/SysPE/Catapult/SysPE.v1/scverify/concat_sim_rtl_v_vcs/sysc/,$(STUBLIB))
SYSC_STUB_LIB = $(addprefix /home/billyk/cs148/hls/lab3/SysPE/Catapult/SysPE.v1/scverify/concat_sim_rtl_v_vcs/sysc/,$(STUBLIB))

SYSC_OBJS := $(SYSC_OBJS) $(addsuffix .o,$(SYSC_FILES)) $(SYSC_STUBS)
/home/billyk/cs148/hls/lab3/SysPE/Catapult/SysPE.v1/scverify/concat_sim_rtl_v_vcs/sysc/sysc_globals.o:	/home/billyk/cs148/hls/lab3/SysPE/Catapult/SysPE.v1/scverify/concat_sim_rtl_v_vcs/sysc/sysc_globals.cpp
	@g++ -o $@ -c $^  -m64 -fPIC  -g   -pipe -O -I/cad/tools/synopsys/vcs-mx/L-2016.06-SP1-1/include  
$(SYSC_STUB_LIB):
	$(MAKE) -C /home/billyk/cs148/hls/lab3/SysPE/Catapult/SysPE.v1/scverify/concat_sim_rtl_v_vcs/sysc -f Makefile_shared stubs

/home/billyk/cs148/hls/lab3/SysPE/Catapult/SysPE.v1/scverify/concat_sim_rtl_v_vcs/sysc/systemc_stub.o:	/home/billyk/cs148/hls/lab3/SysPE/Catapult/SysPE.v1/scverify/concat_sim_rtl_v_vcs/sysc/systemc_stub.c
	@$(VCS_CC)  -o $@ -c $^  -m64 -fPIC  -g 
