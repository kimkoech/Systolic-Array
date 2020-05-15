/*
 * VLSI Systolic Array Module to include N*N of SysPEs
 *
 */

#ifndef __SYSARRAY_H__
#define __SYSARRAY_H__

#include <systemc.h>
#include <nvhls_int.h>
#include <nvhls_connections.h>

#include "../SysPE/SysPE.h"
#include "string"

SC_MODULE(SysArray)
{
  public:
  sc_in_clk     clk;
  sc_in<bool>   rst;
  
  // Array Size 
  const static int N = 8;

   
  SysPE* pe_array[N][N];

  // I/O
  // FIXME: another weight input module to reduce input channels
  Connections::In<SysPE::InputType>   weight_in_vec[N];
  Connections::In<SysPE::InputType>   act_in_vec[N];
  Connections::Out<SysPE::AccumType>  accum_out_vec[N];

  // Interconnection Channels 
  Connections::Combinational<SysPE::InputType> weight_inter[N][N];
  Connections::Combinational<SysPE::InputType> act_inter[N][N]; 
  Connections::Combinational<SysPE::AccumType> accum_inter[N][N];

  SC_HAS_PROCESS(SysArray);
  SysArray(sc_module_name name_) : sc_module(name_) {
    for (int i = 0; i < N; i++) {    // rows
      for (int j = 0; j < N; j++) {  // cols
        pe_array[i][j] = new SysPE(sc_gen_unique_name("pe"));
        pe_array[i][j]->clk(clk);
        pe_array[i][j]->rst(rst);
        
        // Weight Connections
        if (i == 0) {    // from Array weight (row 0)
          pe_array[i][j]->weight_in(weight_in_vec[j]);
          pe_array[i][j]->weight_out(weight_inter[i][j]);
        }
        else {           // from Array weight (row 1, 2, N-1)
          pe_array[i][j]->weight_in(weight_inter[i-1][j]);
          pe_array[i][j]->weight_out(weight_inter[i][j]);
        }
        // Act Connections
        if (j == 0) {  // from Array input (col 0)
          pe_array[i][j]->act_in(act_in_vec[i]);
          pe_array[i][j]->act_out(act_inter[i][j]);
        }
        else {         // from Array input (col 1, 2...)
          pe_array[i][j]->act_in(act_inter[i][j-1]);
          pe_array[i][j]->act_out(act_inter[i][j]);
        }
        // Accum Connections
        if (i != N-1) {  // from Array Accum (row 0, 1, N-2)
          pe_array[i][j]->accum_in(accum_inter[i][j]);
          pe_array[i][j]->accum_out(accum_inter[i+1][j]);
        }
        else {           // from Array Accum (row N-1)
          pe_array[i][j]->accum_in(accum_inter[i][j]);
          pe_array[i][j]->accum_out(accum_out_vec[j]);
        }
      }  
    }
 
    SC_THREAD (WeightOutRun);
    sensitive << clk.pos();
    NVHLS_NEG_RESET_SIGNAL_IS(rst);
    
    SC_THREAD (ActOutRun);
    sensitive << clk.pos();
    NVHLS_NEG_RESET_SIGNAL_IS(rst);
    
    SC_THREAD (AccumInRun);
    sensitive << clk.pos();
    NVHLS_NEG_RESET_SIGNAL_IS(rst);
  }
   
  // Receive act_out from col N-1 (PopNB, every cycle)
  // use ResetRead to indicate the output port of channel
  void WeightOutRun() {
    #pragma hls_unroll yes
    for (int j = 0; j < N; j++) {
       weight_inter[N-1][j].ResetRead();
    }
    
    #pragma hls_pipeline_init_interval 1
    while(1) {
      #pragma hls_unroll yes
      for (int j = 0; j < N; j++) {
        SysPE::InputType weight_tmp; 
        weight_inter[N-1][j].PopNB(weight_tmp);
      }
      wait();
    }
  }
  // Receive act_out from col N-1 (PopNB, every cycle)
  // use ResetRead to indicate the output port of channel
  void ActOutRun() {
    #pragma hls_unroll yes
    for (int i = 0; i < N; i++) {
       act_inter[i][N-1].ResetRead();
    }
    
    #pragma hls_pipeline_init_interval 1
    while(1) {
      #pragma hls_unroll yes
      for (int i = 0; i < N; i++) {
        SysPE::InputType act_tmp; 
        act_inter[i][N-1].PopNB(act_tmp);
      }
      wait();
    }
  }

  // Send 0 to accum_in of row 0 (PushNB, every cycle)
  // use ResetWrite to indicate the input port of channel
  void AccumInRun() {
    #pragma hls_unroll yes
    for (int j = 0; j < N; j++) {
       accum_inter[0][j].ResetWrite();
    }

    #pragma hls_pipeline_init_interval 1
    while(1) {
      #pragma hls_unroll yes
      for (int j = 0; j < N; j++) {
        accum_inter[0][j].PushNB(0);
      }
      wait();
    }
  }
  
};

#endif

