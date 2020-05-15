
# Loop constraints
directive set /Connections::InBlocking<InputSetup::StartType,Connections::SYN_PORT>::Pop/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /Connections::InBlocking<InputSetup::StartType,Connections::SYN_PORT>::Pop/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 0}}

# IO operation constraints
directive set /Connections::InBlocking<InputSetup::StartType,Connections::SYN_PORT>::Pop/core/core:rlp/main/io_read(ccs_ccore_start:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /Connections::InBlocking<InputSetup::StartType,Connections::SYN_PORT>::Pop/core/core:rlp/main/this.rdy.write:asn(this.rdy) CSTEPS_FROM {{.. == 1}}
directive set /Connections::InBlocking<InputSetup::StartType,Connections::SYN_PORT>::Pop/core/core:rlp/main/this.Pop#1:do:asn CSTEPS_FROM {{.. == 2}}
directive set /Connections::InBlocking<InputSetup::StartType,Connections::SYN_PORT>::Pop/core/core:rlp/main/this.rdy.write#1:asn(this.rdy) CSTEPS_FROM {{.. == 2}}
directive set /Connections::InBlocking<InputSetup::StartType,Connections::SYN_PORT>::Pop/core/core:rlp/main/to_ac<6>:r:asn CSTEPS_FROM {{.. == 2}}
directive set /Connections::InBlocking<InputSetup::StartType,Connections::SYN_PORT>::Pop/core/core:rlp/main/to_ac<6>:r:io_write(return:rsc.@) CSTEPS_FROM {{.. == 2}}

# Sync operation constraints

# Real operation constraints
directive set /Connections::InBlocking<InputSetup::StartType,Connections::SYN_PORT>::Pop/core/core:rlp/main/this.Pop#1:do:mux#1 CSTEPS_FROM {{.. == 1}}

# Probe constraints
