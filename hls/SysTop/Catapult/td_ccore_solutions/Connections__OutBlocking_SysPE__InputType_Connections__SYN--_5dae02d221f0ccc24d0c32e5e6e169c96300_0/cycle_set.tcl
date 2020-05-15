
# Loop constraints
directive set /Connections::OutBlocking<SysPE::InputType,Connections::SYN_PORT>::PushNB/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /Connections::OutBlocking<SysPE::InputType,Connections::SYN_PORT>::PushNB/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 0}}

# IO operation constraints
directive set /Connections::OutBlocking<SysPE::InputType,Connections::SYN_PORT>::PushNB/core/core:rlp/main/m:io_read(m:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /Connections::OutBlocking<SysPE::InputType,Connections::SYN_PORT>::PushNB/core/core:rlp/main/io_read(ccs_ccore_start:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /Connections::OutBlocking<SysPE::InputType,Connections::SYN_PORT>::PushNB/core/core:rlp/main/this.val.write:asn(this.val) CSTEPS_FROM {{.. == 1}}
directive set /Connections::OutBlocking<SysPE::InputType,Connections::SYN_PORT>::PushNB/core/core:rlp/main/this.msg.write:asn(this.msg) CSTEPS_FROM {{.. == 1}}
directive set /Connections::OutBlocking<SysPE::InputType,Connections::SYN_PORT>::PushNB/core/core:rlp/main/this.val.write#1:asn(this.val) CSTEPS_FROM {{.. == 2}}
directive set /Connections::OutBlocking<SysPE::InputType,Connections::SYN_PORT>::PushNB/core/core:rlp/main/this.msg.write#1:asn(this.msg) CSTEPS_FROM {{.. == 2}}
directive set /Connections::OutBlocking<SysPE::InputType,Connections::SYN_PORT>::PushNB/core/core:rlp/main/asn CSTEPS_FROM {{.. == 2}}
directive set /Connections::OutBlocking<SysPE::InputType,Connections::SYN_PORT>::PushNB/core/core:rlp/main/io_write(return:rsc.@) CSTEPS_FROM {{.. == 2}}

# Sync operation constraints

# Real operation constraints

# Probe constraints
