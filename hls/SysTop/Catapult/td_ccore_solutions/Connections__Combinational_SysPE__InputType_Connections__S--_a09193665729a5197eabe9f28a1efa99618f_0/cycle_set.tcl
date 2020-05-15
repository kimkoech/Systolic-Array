
# Loop constraints
directive set /Connections::Combinational<SysPE::InputType,Connections::SYN_PORT>::PopNB/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /Connections::Combinational<SysPE::InputType,Connections::SYN_PORT>::PopNB/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 0}}

# IO operation constraints
directive set /Connections::Combinational<SysPE::InputType,Connections::SYN_PORT>::PopNB/core/core:rlp/main/io_read(ccs_ccore_start:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<SysPE::InputType,Connections::SYN_PORT>::PopNB/core/core:rlp/main/this.PopNB#1:asn(this.rdy) CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<SysPE::InputType,Connections::SYN_PORT>::PopNB/core/core:rlp/main/this.PopNB#1:asn(this.rdy)#1 CSTEPS_FROM {{.. == 2}}
directive set /Connections::Combinational<SysPE::InputType,Connections::SYN_PORT>::PopNB/core/core:rlp/main/to_ac<8>:r:asn CSTEPS_FROM {{.. == 2}}
directive set /Connections::Combinational<SysPE::InputType,Connections::SYN_PORT>::PopNB/core/core:rlp/main/to_ac<8>:r:io_write(data:rsc.@) CSTEPS_FROM {{.. == 2}}
directive set /Connections::Combinational<SysPE::InputType,Connections::SYN_PORT>::PopNB/core/core:rlp/main/asn CSTEPS_FROM {{.. == 2}}
directive set /Connections::Combinational<SysPE::InputType,Connections::SYN_PORT>::PopNB/core/core:rlp/main/io_write(return:rsc.@) CSTEPS_FROM {{.. == 2}}

# Sync operation constraints

# Real operation constraints

# Probe constraints
