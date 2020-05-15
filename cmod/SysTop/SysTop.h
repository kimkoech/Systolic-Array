/*
 *  VLSI Systolic Array Top Module
 *   
 *   
 */

#ifndef __SYSTOP_H__
#define __SYSTOP_H__

#include <systemc.h>
#include <nvhls_int.h>
#include <nvhls_connections.h>

#include "../SysPE/SysPE.h"
#include "../SysArray/SysArray.h"
#include "InputSetup.h"
#include "string"


SC_MODULE(SysTop)
{
  public:
  sc_in_clk     clk;
  sc_in<bool>   rst;

  // Array Size 
  const static int N = SysArray::N;

  // I/O 
  Connections::In<InputSetup::WriteReq>   write_req;
  Connections::In<InputSetup::StartType>  start; // Push input #col M as start signal
  Connections::In<SysPE::InputType>       weight_in_vec[N];
  Connections::Out<SysPE::AccumType>      accum_out_vec[N];

  // Interconnect
  Connections::Combinational<SysPE::InputType>  act_in_vec[N];


  SysArray   sa_inst; 
  InputSetup is_inst;
  
  SC_HAS_PROCESS(SysTop);
  SysTop(sc_module_name name_) : sc_module(name_),
    sa_inst("sa_inst"),
    is_inst("is_inst")
  {
    sa_inst.clk(clk);
    sa_inst.rst(rst);
    for (int i=0; i < N; i++) {
      sa_inst.weight_in_vec[i](weight_in_vec[i]);
      sa_inst.accum_out_vec[i](accum_out_vec[i]);
      sa_inst.act_in_vec[i](act_in_vec[i]);

      is_inst.act_in_vec[i](act_in_vec[i]);
    }

    is_inst.clk(clk);
    is_inst.rst(rst);
    is_inst.start(start);
    is_inst.write_req(write_req);
  }
};


#endif

