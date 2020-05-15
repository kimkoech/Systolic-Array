
# Loop constraints
directive set /SysArray/SysPE/PERun/PERun:rlp CSTEPS_FROM {{. == 1}}
directive set /SysArray/SysPE/PERun/PERun:rlp/while CSTEPS_FROM {{. == 3} {.. == 1}}

# IO operation constraints

# Sync operation constraints

# Real operation constraints
directive set /SysArray/SysPE/PERun/PERun:rlp/while/weight_in.PopNB() CSTEPS_FROM {{.. == 1}}
directive set /SysArray/SysPE/PERun/PERun:rlp/while/while:mux CSTEPS_FROM {{.. == 2}}
directive set /SysArray/SysPE/PERun/PERun:rlp/while/while:mux#1 CSTEPS_FROM {{.. == 2}}
directive set /SysArray/SysPE/PERun/PERun:rlp/while/act_in.PopNB() CSTEPS_FROM {{.. == 1}}
directive set /SysArray/SysPE/PERun/PERun:rlp/while/while:mux#3 CSTEPS_FROM {{.. == 2}}
directive set /SysArray/SysPE/PERun/PERun:rlp/while/accum_in.PopNB() CSTEPS_FROM {{.. == 1}}
directive set /SysArray/SysPE/PERun/PERun:rlp/while/while:mux#5 CSTEPS_FROM {{.. == 2}}
directive set /SysArray/SysPE/PERun/PERun:rlp/while/act_out.Push() CSTEPS_FROM {{.. == 2}}
directive set /SysArray/SysPE/PERun/PERun:rlp/while/while:if#3:accum_out_reg:mul CSTEPS_FROM {{.. == 2}}
directive set /SysArray/SysPE/PERun/PERun:rlp/while/while:if#3:accum_out_reg:acc CSTEPS_FROM {{.. == 2}}
directive set /SysArray/SysPE/PERun/PERun:rlp/while/accum_out.Push() CSTEPS_FROM {{.. == 2}}
directive set /SysArray/SysPE/PERun/PERun:rlp/while/weight_out.Push() CSTEPS_FROM {{.. == 2}}

# Probe constraints

# Loop constraints
directive set /SysArray/WeightOutRun/WeightOutRun:rlp CSTEPS_FROM {{. == 1}}
directive set /SysArray/WeightOutRun/WeightOutRun:rlp/while CSTEPS_FROM {{. == 2} {.. == 1}}

# IO operation constraints

# Sync operation constraints

# Real operation constraints
directive set /SysArray/WeightOutRun/WeightOutRun:rlp/while/while:for-1:weight_inter.PopNB()#56 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/WeightOutRun/WeightOutRun:rlp/while/while:for-2:weight_inter.PopNB()#57 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/WeightOutRun/WeightOutRun:rlp/while/while:for-3:weight_inter.PopNB()#58 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/WeightOutRun/WeightOutRun:rlp/while/while:for-4:weight_inter.PopNB()#59 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/WeightOutRun/WeightOutRun:rlp/while/while:for-5:weight_inter.PopNB()#60 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/WeightOutRun/WeightOutRun:rlp/while/while:for-6:weight_inter.PopNB()#61 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/WeightOutRun/WeightOutRun:rlp/while/while:for-7:weight_inter.PopNB()#62 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/WeightOutRun/WeightOutRun:rlp/while/while:for-8:weight_inter.PopNB()#63 CSTEPS_FROM {{.. == 1}}

# Probe constraints

# Loop constraints
directive set /SysArray/ActOutRun/ActOutRun:rlp CSTEPS_FROM {{. == 1}}
directive set /SysArray/ActOutRun/ActOutRun:rlp/while CSTEPS_FROM {{. == 2} {.. == 1}}

# IO operation constraints

# Sync operation constraints

# Real operation constraints
directive set /SysArray/ActOutRun/ActOutRun:rlp/while/while:for-1:act_inter.PopNB()#7 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/ActOutRun/ActOutRun:rlp/while/while:for-2:act_inter.PopNB()#15 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/ActOutRun/ActOutRun:rlp/while/while:for-3:act_inter.PopNB()#23 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/ActOutRun/ActOutRun:rlp/while/while:for-4:act_inter.PopNB()#31 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/ActOutRun/ActOutRun:rlp/while/while:for-5:act_inter.PopNB()#39 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/ActOutRun/ActOutRun:rlp/while/while:for-6:act_inter.PopNB()#47 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/ActOutRun/ActOutRun:rlp/while/while:for-7:act_inter.PopNB()#55 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/ActOutRun/ActOutRun:rlp/while/while:for-8:act_inter.PopNB()#63 CSTEPS_FROM {{.. == 1}}

# Probe constraints

# Loop constraints
directive set /SysArray/AccumInRun/AccumInRun:rlp CSTEPS_FROM {{. == 1}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/while CSTEPS_FROM {{. == 2} {.. == 1}}

# IO operation constraints

# Sync operation constraints

# Real operation constraints
directive set /SysArray/AccumInRun/AccumInRun:rlp/while/while:for-1:accum_inter.PushNB() CSTEPS_FROM {{.. == 1}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/while/while:for-2:accum_inter.PushNB()#1 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/while/while:for-3:accum_inter.PushNB()#2 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/while/while:for-4:accum_inter.PushNB()#3 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/while/while:for-5:accum_inter.PushNB()#4 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/while/while:for-6:accum_inter.PushNB()#5 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/while/while:for-7:accum_inter.PushNB()#6 CSTEPS_FROM {{.. == 1}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/while/while:for-8:accum_inter.PushNB()#7 CSTEPS_FROM {{.. == 1}}

# Probe constraints
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\" CSTEPS_FROM {{.. == 0}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\"#ctrl#prb CSTEPS_FROM {{.. == 0}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\"#1 CSTEPS_FROM {{.. == 0}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\"#ctrl#prb#1 CSTEPS_FROM {{.. == 0}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\"#2 CSTEPS_FROM {{.. == 0}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\"#ctrl#prb#2 CSTEPS_FROM {{.. == 0}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\"#3 CSTEPS_FROM {{.. == 0}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\"#ctrl#prb#3 CSTEPS_FROM {{.. == 0}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\"#4 CSTEPS_FROM {{.. == 0}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\"#ctrl#prb#4 CSTEPS_FROM {{.. == 0}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\"#5 CSTEPS_FROM {{.. == 0}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\"#ctrl#prb#5 CSTEPS_FROM {{.. == 0}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\"#6 CSTEPS_FROM {{.. == 0}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\"#ctrl#prb#6 CSTEPS_FROM {{.. == 0}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\"#7 CSTEPS_FROM {{.. == 0}}
directive set /SysArray/AccumInRun/AccumInRun:rlp/SysArray:AccumInRun:connections.h:ln3314:assert:0_and_\"Unreachablevirtualfunctioninabstractclassnot_\"#ctrl#prb#7 CSTEPS_FROM {{.. == 0}}
