
# Loop constraints
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::req_t,Connections::SYN_PORT>::PushNB/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::req_t,Connections::SYN_PORT>::PushNB/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 0}}

# IO operation constraints
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::req_t,Connections::SYN_PORT>::PushNB/core/core:rlp/main/m.addr:io_read(m.addr:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::req_t,Connections::SYN_PORT>::PushNB/core/core:rlp/main/m.valids:io_read(m.valids:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::req_t,Connections::SYN_PORT>::PushNB/core/core:rlp/main/io_read(ccs_ccore_start:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::req_t,Connections::SYN_PORT>::PushNB/core/core:rlp/main/this.PushNB#1:asn(this.val) CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::req_t,Connections::SYN_PORT>::PushNB/core/core:rlp/main/marshaller.AddField<sc_dt::sc_uint<1>,1>:if:asn CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::req_t,Connections::SYN_PORT>::PushNB/core/core:rlp/main/this.PushNB#1:asn(this.val)#1 CSTEPS_FROM {{.. == 2}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::req_t,Connections::SYN_PORT>::PushNB/core/core:rlp/main/asn CSTEPS_FROM {{.. == 2}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::req_t,Connections::SYN_PORT>::PushNB/core/core:rlp/main/io_write(return:rsc.@) CSTEPS_FROM {{.. == 2}}

# Sync operation constraints

# Real operation constraints

# Probe constraints
