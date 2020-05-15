
# Loop constraints
directive set /SysPE/PERun/PERun:rlp CSTEPS_FROM {{. == 1}}
directive set /SysPE/PERun/PERun:rlp/while CSTEPS_FROM {{. == 4} {.. == 1}}

# IO operation constraints

# Sync operation constraints

# Real operation constraints
directive set /SysPE/PERun/PERun:rlp/while/weight_in.PopNB() CSTEPS_FROM {{.. == 1}}
directive set /SysPE/PERun/PERun:rlp/while/weight_out.PushNB() CSTEPS_FROM {{.. == 2}}
directive set /SysPE/PERun/PERun:rlp/while/while:mux#1 CSTEPS_FROM {{.. == 2}}
directive set /SysPE/PERun/PERun:rlp/while/act_in.PopNB() CSTEPS_FROM {{.. == 2}}
directive set /SysPE/PERun/PERun:rlp/while/while:mux#3 CSTEPS_FROM {{.. == 3}}
directive set /SysPE/PERun/PERun:rlp/while/accum_in.PopNB() CSTEPS_FROM {{.. == 2}}
directive set /SysPE/PERun/PERun:rlp/while/while:mux#5 CSTEPS_FROM {{.. == 3}}
directive set /SysPE/PERun/PERun:rlp/while/act_out.Push() CSTEPS_FROM {{.. == 3}}
directive set /SysPE/PERun/PERun:rlp/while/while:if#3:accum_out_reg:mul CSTEPS_FROM {{.. == 3}}
directive set /SysPE/PERun/PERun:rlp/while/while:if#3:accum_out_reg:acc CSTEPS_FROM {{.. == 3}}
directive set /SysPE/PERun/PERun:rlp/while/accum_out.Push() CSTEPS_FROM {{.. == 3}}

# Probe constraints
