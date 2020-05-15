CU_MOD_OBJS =  \
objs/At9Kv_d.o objs/hJ0PG_d.o objs/mF1iW_d.o objs/s1hrd_d.o objs/RuFWa_d.o  \
objs/IhF1j_d.o objs/edmvU_d.o objs/dyE6Q_d.o objs/S4YDe_d.o objs/ivVCS_d.o  \
objs/rWsbc_d.o objs/Ig70K_d.o objs/tTGbr_d.o amcQwB.o objs/amcQw_d.o  \
objs/cZwCV_d.o objs/ymfnw_d.o objs/LpIbR_d.o objs/SkH4j_d.o objs/hY86z_d.o  \


CU_MOD_C_OBJS =  \


$(CU_MOD_C_OBJS): %.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<
CU_UDP_OBJS = \


CU_LVL_OBJS = \
SIM_l.o 

CU_OBJS = $(CU_MOD_OBJS) $(CU_MOD_C_OBJS) $(CU_UDP_OBJS) $(CU_LVL_OBJS)

