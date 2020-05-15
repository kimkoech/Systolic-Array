
# Loop constraints
directive set /Connections::Combinational<SysPE::AccumType,Connections::SYN_PORT>::PushNB/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /Connections::Combinational<SysPE::AccumType,Connections::SYN_PORT>::PushNB/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 0}}

# IO operation constraints
directive set /Connections::Combinational<SysPE::AccumType,Connections::SYN_PORT>::PushNB/core/core:rlp/main/io_read(ccs_ccore_start:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<SysPE::AccumType,Connections::SYN_PORT>::PushNB/core/core:rlp/main/this.PushNB#1:asn(this.val) CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<SysPE::AccumType,Connections::SYN_PORT>::PushNB/core/core:rlp/main/this.write_msg:asn(this.msg) CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<SysPE::AccumType,Connections::SYN_PORT>::PushNB/core/core:rlp/main/this.PushNB#1:asn(this.val)#1 CSTEPS_FROM {{.. == 2}}
directive set /Connections::Combinational<SysPE::AccumType,Connections::SYN_PORT>::PushNB/core/core:rlp/main/asn CSTEPS_FROM {{.. == 2}}
directive set /Connections::Combinational<SysPE::AccumType,Connections::SYN_PORT>::PushNB/core/core:rlp/main/io_write(return:rsc.@) CSTEPS_FROM {{.. == 2}}

# Sync operation constraints

# Real operation constraints

# Probe constraints
