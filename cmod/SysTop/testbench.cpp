/*
 * SysTop testbench for Harvard cs148/248 only
 *  
 */

#include "SysTop.h"
#include <systemc.h>
#include <mc_scverify.h>
#include <nvhls_int.h>

#include <vector>

#define NVHLS_VERIFY_BLOCKS (SysTop)
#include <nvhls_verify.h>
using namespace::std;

#include <testbench/nvhls_rand.h>

// W/I/O dimensions
const static int N = SysArray::N;
const static int M = 3*N;
vector<int>   Count(N, 0);

int ERROR = 0;

template<typename T>
vector<vector<T>> GetMat(int rows, int cols) {
  vector<vector<T>> mat(rows, vector<T>(cols)); 
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      mat[i][j] = nvhls::get_rand<T::width>();
    }
  }
  return mat;
}

template<typename T>
void PrintMat(vector<vector<T>> mat) {
  int rows = (int) mat.size();
  int cols = (int) mat[0].size();
  for (int i = 0; i < rows; i++) {
    cout << "\t";
    for (int j = 0; j < cols; j++) {
      cout << mat[i][j] << "\t";
    }
    cout << endl;
  }
  cout << endl;
}

template<typename T, typename U>
vector<vector<U>> MatMul(vector<vector<T>> mat_A, vector<vector<T>> mat_B) {
  // mat_A _N*_M
  // mat_B _M*_P
  // mat_C _N*_P
  int _N = (int) mat_A.size();
  int _M = (int) mat_A[0].size();
  int _P = (int) mat_B[0].size();
  
  assert(_M == (int) mat_B.size());
  vector<vector<U>> mat_C(_N, vector<U>(_P, 0)); 

  for (int i = 0; i < _N; i++) {
    for (int j = 0; j < _P; j++) {
      mat_C[i][j] = 0;
      for (int k = 0; k < _M; k++) {
        mat_C[i][j] += mat_A[i][k]*mat_B[k][j];
      }
    }
  }
  return mat_C;
}

SC_MODULE (Source) {
  Connections::Out<SysPE::InputType> weight_in_vec[N];
  Connections::Out<InputSetup::WriteReq> write_req;
  Connections::Out<InputSetup::StartType> start;
  sc_in <bool> clk;
  sc_in <bool> rst;

  vector<vector<SysPE::InputType>> W_mat, I_mat;  

  SC_CTOR(Source) {
    SC_THREAD(Run);
    sensitive << clk.pos();
    async_reset_signal_is(rst, false);
  }

  void Run() {
    for (int i = 0; i < N; i++) {
      weight_in_vec[i].Reset();
    }
    write_req.Reset();
    start.Reset();

    // Wait for initial reset
    wait(100.0, SC_NS);
    wait();
    // Write Weight to PE,  e.g. for 4*4 weight 
    // (same as transposed)
    // w00 w10 w20 w30
    // w01 w11 w21 w31
    // w02 w12 w22 w32
    // w03 w13 w23 w33  <- push this first (col N-1)
    
    cout << sc_time_stamp() << " " << name() << ": Start Loading Weight Matrix" << endl;
    for (int j = N-1; j >= 0; j--) {
      for (int i = 0; i < N; i++) {
        weight_in_vec[i].Push(W_mat[i][j]);
      }
    } 
    cout << sc_time_stamp() << " " << name() << ": Finish Loading Weight Matrix" << endl;
    wait();
    // Store Activation to InputSetup SRAM
    // E.g.  4*6 input
    // (col)\(row)
    // Index\Bank    0   1   2   3
    //     0       a00 a10 a20 a30
    //     1       a01 a11 a21 a31
    //     2       a02 a12 a22 a32
    //     3       a03 a13 a23 a33
    //     4       a04 a14 a24 a34
    //     5       a05 a15 a25 a35
    cout << sc_time_stamp() << " " << name() << ": Start Sending Input Matrix" << endl;
    
    InputSetup::WriteReq write_req_tmp;
    for (int i = 0; i < M; i++) {   // each bank index 
      write_req_tmp.index = i;
      for (int j = 0; j < N; j++) { // each bank
        write_req_tmp.data[j] = I_mat[j][i];
      }
      write_req.Push(write_req_tmp);
    }
    cout << sc_time_stamp() << " " << name() << ": Finish Sending Input Matrix" << endl;
    wait();
    cout << sc_time_stamp() << " " << name() << ": Start Computation" << endl;
    InputSetup::StartType start_tmp = M;
    start.Push(start_tmp);
    wait();
  }
};

SC_MODULE (Sink) {
  Connections::In<SysPE::AccumType> accum_out_vec[N];
  sc_in <bool> clk;
  sc_in <bool> rst;

  vector<vector<SysPE::AccumType>> O_mat;  

  SC_CTOR(Sink) {
    SC_THREAD(Run);
    sensitive << clk.pos();
    async_reset_signal_is(rst, false);
  }

  void Run() {
    for (int i = 0; i < N; i++) {
      accum_out_vec[i].Reset();
    }
    vector<bool>  is_out(N, 0);

    while (1) {
      vector<SysPE::AccumType> out_vec(N, 0);  
      for (int i = 0; i < N; i++) {
        SysPE::AccumType _out;
        is_out[i] = accum_out_vec[i].PopNB(_out);
        if (is_out[i]) {
          out_vec[i] = _out;
          
          SysPE::AccumType _out_ref = O_mat[i][Count[i]]; 
          if (_out != _out_ref){
            ERROR += 1;
            cout << "output incorrect" << endl;
          }
          Count[i] += 1;
        }
      }
      bool is_out_or = 0;
      for (int i = 0; i < N; i++) is_out_or |= is_out[i];
      if (is_out_or) {
        cout << sc_time_stamp() << " " << name() << " accum_out_vec: ";
        cout << "\t";
        for (int i = 0; i < N; i++) {
          if (is_out[i] == 1)
            cout << out_vec[i] << "\t";
          else 
            cout << "-\t";
        }
        cout << endl;
      }
      wait();
    }
  }
};

SC_MODULE (testbench) {
  sc_clock clk;
  sc_signal<bool> rst;

  Connections::Combinational<SysPE::InputType> weight_in_vec[N];
  Connections::Combinational<SysPE::AccumType> accum_out_vec[N];
  Connections::Combinational<InputSetup::WriteReq> write_req;
  Connections::Combinational<InputSetup::StartType> start;

  NVHLS_DESIGN(SysTop) top;
  Source src;
  Sink sink;

  SC_HAS_PROCESS(testbench);
  testbench(sc_module_name name)
  : sc_module(name),
    clk("clk", 1, SC_NS, 0.5,0,SC_NS,true),
    rst("rst"),
    top("top"),
    src("src"),
    sink("sink")
  {
    top.clk(clk);
    top.rst(rst);
    src.clk(clk);
    src.rst(rst);
    sink.clk(clk);
    sink.rst(rst);

    top.start(start);
    src.start(start);

    top.write_req(write_req);
    src.write_req(write_req);

    for (int i=0; i < N; i++) {
      top.weight_in_vec[i](weight_in_vec[i]);
      top.accum_out_vec[i](accum_out_vec[i]);
      
      src.weight_in_vec[i](weight_in_vec[i]);
      sink.accum_out_vec[i](accum_out_vec[i]);
    }

    SC_THREAD(Run);
  }

  void Run() {
    rst = 1;
    wait(10.5, SC_NS);
    rst = 0;
    cout << "@" << sc_time_stamp() << " Asserting Reset " << endl ;
    wait(1, SC_NS);
    cout << "@" << sc_time_stamp() << " Deasserting Reset " << endl ;
    rst = 1;
    
    wait(1000,SC_NS);
    cout << "@" << sc_time_stamp() << " Stop " << endl ;



    cout << "Check Output Count" << endl;
    for (int i = 0; i < N; i++) {
      if (Count[i] != M)  {
        ERROR += 1; 
        cout << "Count incorrect" << endl;
      }
    }
    
    if (ERROR == 0) cout << "Implementation Correct :)" << endl;
    else  cout << "Implementation Incorrect (:" << endl;

    sc_stop();
  }
};



int sc_main(int argc, char *argv[])
{
  nvhls::set_random_seed();

  // Weight N*N 
  // Input N*M
  // Output N*M
  
  vector<vector<SysPE::InputType>> W_mat = GetMat<SysPE::InputType>(N, N); 
  vector<vector<SysPE::InputType>> I_mat = GetMat<SysPE::InputType>(N, M);  
  vector<vector<SysPE::AccumType>> O_mat;
  O_mat = MatMul<SysPE::InputType, SysPE::AccumType>(W_mat, I_mat); 

  cout << "Weight Matrix " << endl; 
  PrintMat(W_mat);
  cout << "Input Matrix " << endl; 
  PrintMat(I_mat);
  cout << "Reference Output Matrix " << endl; 
  PrintMat(O_mat);

  testbench my_testbench("my_testbench");
  
  my_testbench.src.W_mat = W_mat;
  my_testbench.src.I_mat = I_mat;
  my_testbench.sink.O_mat = O_mat;

  sc_start();
  cout << "CMODEL PASS" << endl;
  return 0;
};

