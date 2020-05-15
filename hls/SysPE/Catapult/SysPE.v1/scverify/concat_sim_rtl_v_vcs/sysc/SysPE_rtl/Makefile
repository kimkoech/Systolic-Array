SYSC_MODULE = SysPE_rtl
V = @
CXX = g++
CXXFLAGS =  -DVCSSYSTEMC=1  -MMD -m64 -fPIC
INCLUDES = \
	-I/cad/tools/synopsys/vcs-mx/L-2016.06-SP1-1/include/systemc231 \
	-I/cad/tools/synopsys/vcs-mx/L-2016.06-SP1-1/include/systemc231 \
	-I$(VCS_HOME)/include \
	-I$(VCS_HOME)/lib \
	-I/home/billyk/cs148/hls/lab3/SysPE/Catapult/SysPE.v1

OBJS = SysPE_rtl.o
all:	$(OBJS)
SysPE_rtl.o:	SysPE_rtl.cpp
	$(V) $(CXX) -c $< -o $@ $(INCLUDES) $(CXXFLAGS)

-include SysPE_rtl.d

