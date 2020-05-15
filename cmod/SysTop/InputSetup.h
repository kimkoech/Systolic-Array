/*
 * VLSI InputSetup module to include input SRAM and Data Setup 
 *   Step 3: implement ReadReqRun to generate a sequence of address/valids
 */

#ifndef __INPUTSETUP_H__
#define __INPUTSETUP_H__

#include <systemc.h>
#include <nvhls_int.h>
#include <nvhls_connections.h>
#include <nvhls_vector.h>

#include <ArbitratedScratchpad.h>
#include <ArbitratedScratchpad/ArbitratedScratchpadTypes.h>

#include "../SysPE/SysPE.h"
#include "../SysArray/SysArray.h"
#include "string"

SC_MODULE(InputSetup)
{
 public: 
  sc_in_clk     clk;
  sc_in<bool>   rst;

  typedef SysPE::InputType InputType;  
  static const int N = SysArray::N;     // # banks = N
  static const int Entries = N*4;       // # of entries per bank
  static const int Capacity = N*Entries;
  typedef ArbitratedScratchpad<InputType, Capacity, N, N, 0> MemType;

  static const int IndexBits = nvhls::nbits<Entries-1>::val;
  typedef NVUINTW(IndexBits) IndexType;
  typedef NVUINTW(IndexBits+1) StartType;
  typedef typename nvhls::nv_scvector <InputType, N> VectorType;
  
  // Customized data type for Input Write Request 
  class WriteReq: public nvhls_message{
   public:
    VectorType data;
    IndexType index;  
    static const unsigned int width = IndexType::width + VectorType::width;

    template <unsigned int Size>
    void Marshall(Marshaller<Size>& m) {
      m& data;
      m& index;
    }
  };
  
  MemType mem_inst;

  // I/O 
  Connections::In<WriteReq>    write_req;
  Connections::In<StartType>   start; // Push input #col M as start signal
  Connections::Out<InputType>  act_in_vec[N];

  // Interconnect
  // We use Request/Respons datatypes req_t, rsp_t defined in ArbitratedScratchpad
  // req_t:
  //   * type (0: LOAD, 1: STORE), 
  //   * vailds[N], 
  //   * addr[N], 
  //   * data[N]
  // rsp_t: 
  //   * valids[N], 
  //   * data[N]
  // See cli_req_t, cli_rsp_t in following for details
  //   ~/cs148/matchlib/cmod/include/ArbitratedScratchpad/ArbitratedScratchpadTypes.h
  Connections::Combinational<MemType::req_t> req_inter;  
  Connections::Combinational<MemType::rsp_t> rsp_inter; 

  SC_HAS_PROCESS(InputSetup);
  InputSetup(sc_module_name name_) : sc_module(name_) {
    SC_THREAD (MemoryRun);
    sensitive << clk.pos();
    NVHLS_NEG_RESET_SIGNAL_IS(rst); 

    SC_THREAD (ReadReqRun);
    sensitive << clk.pos();
    NVHLS_NEG_RESET_SIGNAL_IS(rst); 
    
    SC_THREAD (ReadRspRun);
    sensitive << clk.pos();
    NVHLS_NEG_RESET_SIGNAL_IS(rst);
  }

  // Handels memory R/W
  void MemoryRun() {
    write_req.Reset();
    req_inter.ResetRead();
    rsp_inter.ResetWrite();

    #pragma hls_pipeline_init_interval 1
    while(1) {
      WriteReq write_req_reg;
      MemType::req_t req_reg;
      MemType::rsp_t rsp_reg;

      bool input_ready[N];   // we neglect this features
      bool is_read = 0, is_write = 0;
     
      if (req_inter.PopNB(req_reg)) {
        is_read = 1;
      }
      else if (write_req.PopNB(write_req_reg)) {
        is_write = 1;
        req_reg.type.val = CLITYPE_T::STORE;
        #pragma hls_unroll yes
        for (int i = 0; i < N; i++) {
          req_reg.valids[i] = true;
          req_reg.addr[i] = write_req_reg.index*N + i;
          req_reg.data[i] = write_req_reg.data[i];
        }
      }

      if (is_read || is_write) {
        mem_inst.load_store(req_reg, rsp_reg, input_ready);
      }
      if (is_read) {
        rsp_inter.Push(rsp_reg);
      }
      wait();
    }
  }
  
  // The main process that generate read req that matches
  //   systolic array data setup
  void ReadReqRun() {
    start.Reset();
    req_inter.ResetWrite();   

    while(1) {
      StartType M;
      M = start.Pop();
      MemType::req_t req_reg;              // Request Message 
      req_reg.type.val = CLITYPE_T::LOAD;  // Set to load mode for read request

      // With given N, M, we want to generate and push a sequence of read requests
      //   i.e. addr/valids that matches Systolic array data pattern
      // 
      // For example (N=4), first read request should be reading only the 
      // entry 0 of first bank. Thus,
      // First Read Req: 
      //   req_reg.valids = [1, 0, 0, 0]
      //   req_reg.addr   = [0, 0, 0, 0]
      //  
      // Second Read Req:
      //   req_reg.valids = [1, 1, 0, 0]
      //   req_reg.addr   = [4, 1, 0, 0] = [1*4, 0*4+1, 0, 0]
      // 
      // Note that addr = N*bank_addr + bank_index
      
      // Implement your code here!!!
      #pragma hls_pipeline_init_interval 1
      if(M) { // wait for start signal
        int T = M + N - 1;

        // for each time step
        for(int t = 0; t< T; t++){

          
          if(t<N){ // first case : entering cascade
            #pragma hls_unroll yes
            // for each bank id
            for(int i = 0; i < N; i++){
          
              // cascade pattern, not that i<t in the diagram
              if(i<=t){
                //addr = N * bank_addr + bank_id
                req_reg.addr[i] = N*(t-i) + i;
                //flip valid bit
                req_reg.valids[i] = 1;
              }else{
                //should be empty and not valid
                req_reg.addr[i] = 0;
                req_reg.valids[i] = 0;
              }

            }

          }
          
          else if (t>=M){ // second case: leaving cascade
            #pragma hls_unroll yes
            // for each bank id
            for(int i = 0; i < N; i++){
          
              // cascade pattern, note that bank_id > t-M
              if(i>t-M){
                //addr = N * bank_addr + bank_id
                req_reg.addr[i] = N*(t-i) + i;
                //flip valid bit
                req_reg.valids[i] = 1;
              }else{
                //should be empty and not valid
                req_reg.addr[i] = 0;
                req_reg.valids[i] = 0;
              }

            }

          }
          
          else{ // last case: middle part
            #pragma hls_unroll yes
            // for each bank id
            for(int i = 0; i < N; i++){
                //addr = N * bank_addr + bank_id
                req_reg.addr[i] = N*(t-i) + i;
                //flip valid bit
                req_reg.valids[i] = 1;
            }


          }
          req_inter.PushNB(req_reg);
          wait();

        }
      }


      wait();
    }
  }





  // Push data read from SRAM to SysArray
  //   only push banks with valid rsp
  void ReadRspRun() {
    #pragma hls_unroll yes
    for (int i = 0; i < N; i++) {
      act_in_vec[i].Reset();
    }
   
    rsp_inter.ResetRead();

    #pragma hls_pipeline_init_interval 1
    while(1) {
      MemType::rsp_t rsp_reg; 
      if (rsp_inter.PopNB(rsp_reg)) {
        #pragma hls_unroll yes
        for (int i = 0; i < N; i++) {
          if (rsp_reg.valids[i] == true)
            act_in_vec[i].Push(rsp_reg.data[i]);
        }
      }
      wait();
    }
  }
};

#endif

