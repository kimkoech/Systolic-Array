SYSC_MODULE = SysTop_rtl
V = @
CXX = g++
CXXFLAGS =  -DVCSSYSTEMC=1  -MMD -m64 -fPIC
INCLUDES = \
	-I/cad/tools/synopsys/vcs-mx/L-2016.06-SP1-1/include/systemc231 \
	-I/cad/tools/synopsys/vcs-mx/L-2016.06-SP1-1/include/systemc231 \
	-I$(VCS_HOME)/include \
	-I$(VCS_HOME)/lib \
	-I/home/billyk/cs148/hls/lab3/SysTop/Catapult/SysTop.v1

OBJS = SysTop_rtl.o
all:	$(OBJS)
SysTop_rtl.o:	SysTop_rtl.cpp
	$(V) $(CXX) -c $< -o $@ $(INCLUDES) $(CXXFLAGS)

-include SysTop_rtl.d

