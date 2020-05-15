
# Loop constraints
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::rsp_t,Connections::SYN_PORT>::Push/core/core:rlp CSTEPS_FROM {{. == 0}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::rsp_t,Connections::SYN_PORT>::Push/core/core:rlp/main CSTEPS_FROM {{. == 3} {.. == 0}}

# IO operation constraints
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::rsp_t,Connections::SYN_PORT>::Push/core/core:rlp/main/m.data:io_read(m.data:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::rsp_t,Connections::SYN_PORT>::Push/core/core:rlp/main/m.valids:io_read(m.valids:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::rsp_t,Connections::SYN_PORT>::Push/core/core:rlp/main/io_read(ccs_ccore_start:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::rsp_t,Connections::SYN_PORT>::Push/core/core:rlp/main/this.Push#1:do:asn(this.val) CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::rsp_t,Connections::SYN_PORT>::Push/core/core:rlp/main/marshaller.AddField<bool,1>:if:asn CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::rsp_t,Connections::SYN_PORT>::Push/core/core:rlp/main/this.Push#1:do:asn CSTEPS_FROM {{.. == 2}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::rsp_t,Connections::SYN_PORT>::Push/core/core:rlp/main/this.Push#1:asn(this.val) CSTEPS_FROM {{.. == 2}}

# Sync operation constraints

# Real operation constraints
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::rsp_t,Connections::SYN_PORT>::Push/core/core:rlp/main/this.Push#1:do:mux CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::rsp_t,Connections::SYN_PORT>::Push/core/core:rlp/main/this.Push#1:do:mux#1 CSTEPS_FROM {{.. == 1}}
directive set /Connections::Combinational<ArbitratedScratchpad<InputSetup::InputType,256U,8U,8U,0U>::rsp_t,Connections::SYN_PORT>::Push/core/core:rlp/main/this.Push#1:do:mux#3 CSTEPS_FROM {{.. == 1}}

# Probe constraints
