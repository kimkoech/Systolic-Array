// SystemC wrapper header for DKI connect HDL model import
// This file must be compiled with other SystemC files

#ifndef SysTop_rtl_h_
#define SysTop_rtl_h_

#include "systemc.h"
#include <string.h>
#include "cosim/bf/hdl_connect_v.h"
#include "cosim/bf/VcsDesign.h"
#include "cosim/bf/snps_hdl_param.h"

extern "C" unsigned int* MSysTop_rtl_1(unsigned int*, char*);
extern "C" std::string BF_get_hdl_name(SC_CORE sc_object *);


struct SysTop_rtl : sc_module {
	VcsModel    *vcsModel;
	VcsInstance *vcsInstance;

	//Input ports
	sc_in<bool>  clk;
	sc_in<sc_logic>  rst;
	sc_in<sc_logic>  write_req_val;
	sc_in<sc_lv<69> >  write_req_msg;
	sc_in<sc_logic>  start_val;
	sc_in<sc_lv<6> >  start_msg;
	sc_in<sc_logic>  weight_in_vec_0_val;
	sc_in<sc_logic>  weight_in_vec_1_val;
	sc_in<sc_logic>  weight_in_vec_2_val;
	sc_in<sc_logic>  weight_in_vec_3_val;
	sc_in<sc_logic>  weight_in_vec_4_val;
	sc_in<sc_logic>  weight_in_vec_5_val;
	sc_in<sc_logic>  weight_in_vec_6_val;
	sc_in<sc_logic>  weight_in_vec_7_val;
	sc_in<sc_lv<8> >  weight_in_vec_0_msg;
	sc_in<sc_lv<8> >  weight_in_vec_1_msg;
	sc_in<sc_lv<8> >  weight_in_vec_2_msg;
	sc_in<sc_lv<8> >  weight_in_vec_3_msg;
	sc_in<sc_lv<8> >  weight_in_vec_4_msg;
	sc_in<sc_lv<8> >  weight_in_vec_5_msg;
	sc_in<sc_lv<8> >  weight_in_vec_6_msg;
	sc_in<sc_lv<8> >  weight_in_vec_7_msg;
	sc_in<sc_logic>  accum_out_vec_0_rdy;
	sc_in<sc_logic>  accum_out_vec_1_rdy;
	sc_in<sc_logic>  accum_out_vec_2_rdy;
	sc_in<sc_logic>  accum_out_vec_3_rdy;
	sc_in<sc_logic>  accum_out_vec_4_rdy;
	sc_in<sc_logic>  accum_out_vec_5_rdy;
	sc_in<sc_logic>  accum_out_vec_6_rdy;
	sc_in<sc_logic>  accum_out_vec_7_rdy;

	//Output ports
	sc_out<sc_logic>  write_req_rdy;
	sc_out<sc_logic>  start_rdy;
	sc_out<sc_logic>  weight_in_vec_0_rdy;
	sc_out<sc_logic>  weight_in_vec_1_rdy;
	sc_out<sc_logic>  weight_in_vec_2_rdy;
	sc_out<sc_logic>  weight_in_vec_3_rdy;
	sc_out<sc_logic>  weight_in_vec_4_rdy;
	sc_out<sc_logic>  weight_in_vec_5_rdy;
	sc_out<sc_logic>  weight_in_vec_6_rdy;
	sc_out<sc_logic>  weight_in_vec_7_rdy;
	sc_out<sc_logic>  accum_out_vec_0_val;
	sc_out<sc_logic>  accum_out_vec_1_val;
	sc_out<sc_logic>  accum_out_vec_2_val;
	sc_out<sc_logic>  accum_out_vec_3_val;
	sc_out<sc_logic>  accum_out_vec_4_val;
	sc_out<sc_logic>  accum_out_vec_5_val;
	sc_out<sc_logic>  accum_out_vec_6_val;
	sc_out<sc_logic>  accum_out_vec_7_val;
	sc_out<sc_lv<32> >  accum_out_vec_0_msg;
	sc_out<sc_lv<32> >  accum_out_vec_1_msg;
	sc_out<sc_lv<32> >  accum_out_vec_2_msg;
	sc_out<sc_lv<32> >  accum_out_vec_3_msg;
	sc_out<sc_lv<32> >  accum_out_vec_4_msg;
	sc_out<sc_lv<32> >  accum_out_vec_5_msg;
	sc_out<sc_lv<32> >  accum_out_vec_6_msg;
	sc_out<sc_lv<32> >  accum_out_vec_7_msg;

	sc_signal<bool,SC_UNCHECKED_WRITERS> *sig_clk;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_rst;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_write_req_val;
	sc_signal<sc_lv<69>,SC_UNCHECKED_WRITERS > *sig_write_req_msg;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_start_val;
	sc_signal<sc_lv<6>,SC_UNCHECKED_WRITERS > *sig_start_msg;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_0_val;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_1_val;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_2_val;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_3_val;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_4_val;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_5_val;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_6_val;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_7_val;
	sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS > *sig_weight_in_vec_0_msg;
	sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS > *sig_weight_in_vec_1_msg;
	sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS > *sig_weight_in_vec_2_msg;
	sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS > *sig_weight_in_vec_3_msg;
	sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS > *sig_weight_in_vec_4_msg;
	sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS > *sig_weight_in_vec_5_msg;
	sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS > *sig_weight_in_vec_6_msg;
	sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS > *sig_weight_in_vec_7_msg;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_0_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_1_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_2_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_3_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_4_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_5_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_6_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_7_rdy;

	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_write_req_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_start_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_0_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_1_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_2_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_3_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_4_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_5_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_6_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_vec_7_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_0_val;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_1_val;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_2_val;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_3_val;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_4_val;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_5_val;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_6_val;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_vec_7_val;
	sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS > *sig_accum_out_vec_0_msg;
	sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS > *sig_accum_out_vec_1_msg;
	sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS > *sig_accum_out_vec_2_msg;
	sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS > *sig_accum_out_vec_3_msg;
	sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS > *sig_accum_out_vec_4_msg;
	sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS > *sig_accum_out_vec_5_msg;
	sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS > *sig_accum_out_vec_6_msg;
	sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS > *sig_accum_out_vec_7_msg;

	// Parameters

	SC_HAS_PROCESS(SysTop_rtl);
	SysTop_rtl(sc_module_name modelName): sc_module(modelName)
	{
		sig_clk = new sc_signal<bool,SC_UNCHECKED_WRITERS>("sig_clk");
		sig_rst = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_rst");
		sig_write_req_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_write_req_val");
		sig_write_req_msg = new sc_signal<sc_lv<69>,SC_UNCHECKED_WRITERS >("sig_write_req_msg");
		sig_start_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_start_val");
		sig_start_msg = new sc_signal<sc_lv<6>,SC_UNCHECKED_WRITERS >("sig_start_msg");
		sig_weight_in_vec_0_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_0_val");
		sig_weight_in_vec_1_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_1_val");
		sig_weight_in_vec_2_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_2_val");
		sig_weight_in_vec_3_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_3_val");
		sig_weight_in_vec_4_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_4_val");
		sig_weight_in_vec_5_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_5_val");
		sig_weight_in_vec_6_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_6_val");
		sig_weight_in_vec_7_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_7_val");
		sig_weight_in_vec_0_msg = new sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS >("sig_weight_in_vec_0_msg");
		sig_weight_in_vec_1_msg = new sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS >("sig_weight_in_vec_1_msg");
		sig_weight_in_vec_2_msg = new sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS >("sig_weight_in_vec_2_msg");
		sig_weight_in_vec_3_msg = new sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS >("sig_weight_in_vec_3_msg");
		sig_weight_in_vec_4_msg = new sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS >("sig_weight_in_vec_4_msg");
		sig_weight_in_vec_5_msg = new sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS >("sig_weight_in_vec_5_msg");
		sig_weight_in_vec_6_msg = new sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS >("sig_weight_in_vec_6_msg");
		sig_weight_in_vec_7_msg = new sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS >("sig_weight_in_vec_7_msg");
		sig_accum_out_vec_0_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_0_rdy");
		sig_accum_out_vec_1_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_1_rdy");
		sig_accum_out_vec_2_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_2_rdy");
		sig_accum_out_vec_3_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_3_rdy");
		sig_accum_out_vec_4_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_4_rdy");
		sig_accum_out_vec_5_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_5_rdy");
		sig_accum_out_vec_6_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_6_rdy");
		sig_accum_out_vec_7_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_7_rdy");

		sig_write_req_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_write_req_rdy");
		sig_start_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_start_rdy");
		sig_weight_in_vec_0_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_0_rdy");
		sig_weight_in_vec_1_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_1_rdy");
		sig_weight_in_vec_2_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_2_rdy");
		sig_weight_in_vec_3_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_3_rdy");
		sig_weight_in_vec_4_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_4_rdy");
		sig_weight_in_vec_5_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_5_rdy");
		sig_weight_in_vec_6_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_6_rdy");
		sig_weight_in_vec_7_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_vec_7_rdy");
		sig_accum_out_vec_0_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_0_val");
		sig_accum_out_vec_1_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_1_val");
		sig_accum_out_vec_2_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_2_val");
		sig_accum_out_vec_3_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_3_val");
		sig_accum_out_vec_4_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_4_val");
		sig_accum_out_vec_5_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_5_val");
		sig_accum_out_vec_6_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_6_val");
		sig_accum_out_vec_7_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_vec_7_val");
		sig_accum_out_vec_0_msg = new sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS >("sig_accum_out_vec_0_msg");
		sig_accum_out_vec_1_msg = new sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS >("sig_accum_out_vec_1_msg");
		sig_accum_out_vec_2_msg = new sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS >("sig_accum_out_vec_2_msg");
		sig_accum_out_vec_3_msg = new sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS >("sig_accum_out_vec_3_msg");
		sig_accum_out_vec_4_msg = new sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS >("sig_accum_out_vec_4_msg");
		sig_accum_out_vec_5_msg = new sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS >("sig_accum_out_vec_5_msg");
		sig_accum_out_vec_6_msg = new sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS >("sig_accum_out_vec_6_msg");
		sig_accum_out_vec_7_msg = new sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS >("sig_accum_out_vec_7_msg");

		HDL_MODULE("SysTop_rtl", name(), basename());
		SC_METHOD(SysTop_rtl_clk_action); sensitive << clk; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_rst_action); sensitive << rst; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_write_req_val_action); sensitive << write_req_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_write_req_msg_action); sensitive << write_req_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_start_val_action); sensitive << start_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_start_msg_action); sensitive << start_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_0_val_action); sensitive << weight_in_vec_0_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_1_val_action); sensitive << weight_in_vec_1_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_2_val_action); sensitive << weight_in_vec_2_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_3_val_action); sensitive << weight_in_vec_3_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_4_val_action); sensitive << weight_in_vec_4_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_5_val_action); sensitive << weight_in_vec_5_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_6_val_action); sensitive << weight_in_vec_6_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_7_val_action); sensitive << weight_in_vec_7_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_0_msg_action); sensitive << weight_in_vec_0_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_1_msg_action); sensitive << weight_in_vec_1_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_2_msg_action); sensitive << weight_in_vec_2_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_3_msg_action); sensitive << weight_in_vec_3_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_4_msg_action); sensitive << weight_in_vec_4_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_5_msg_action); sensitive << weight_in_vec_5_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_6_msg_action); sensitive << weight_in_vec_6_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_7_msg_action); sensitive << weight_in_vec_7_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_0_rdy_action); sensitive << accum_out_vec_0_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_1_rdy_action); sensitive << accum_out_vec_1_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_2_rdy_action); sensitive << accum_out_vec_2_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_3_rdy_action); sensitive << accum_out_vec_3_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_4_rdy_action); sensitive << accum_out_vec_4_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_5_rdy_action); sensitive << accum_out_vec_5_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_6_rdy_action); sensitive << accum_out_vec_6_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_7_rdy_action); sensitive << accum_out_vec_7_rdy; snps_sysc_mark_last_create_process_as_internal();

		SC_METHOD(SysTop_rtl_write_req_rdy_action); sensitive << *sig_write_req_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_start_rdy_action); sensitive << *sig_start_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_0_rdy_action); sensitive << *sig_weight_in_vec_0_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_1_rdy_action); sensitive << *sig_weight_in_vec_1_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_2_rdy_action); sensitive << *sig_weight_in_vec_2_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_3_rdy_action); sensitive << *sig_weight_in_vec_3_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_4_rdy_action); sensitive << *sig_weight_in_vec_4_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_5_rdy_action); sensitive << *sig_weight_in_vec_5_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_6_rdy_action); sensitive << *sig_weight_in_vec_6_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_weight_in_vec_7_rdy_action); sensitive << *sig_weight_in_vec_7_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_0_val_action); sensitive << *sig_accum_out_vec_0_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_1_val_action); sensitive << *sig_accum_out_vec_1_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_2_val_action); sensitive << *sig_accum_out_vec_2_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_3_val_action); sensitive << *sig_accum_out_vec_3_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_4_val_action); sensitive << *sig_accum_out_vec_4_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_5_val_action); sensitive << *sig_accum_out_vec_5_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_6_val_action); sensitive << *sig_accum_out_vec_6_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_7_val_action); sensitive << *sig_accum_out_vec_7_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_0_msg_action); sensitive << *sig_accum_out_vec_0_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_1_msg_action); sensitive << *sig_accum_out_vec_1_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_2_msg_action); sensitive << *sig_accum_out_vec_2_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_3_msg_action); sensitive << *sig_accum_out_vec_3_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_4_msg_action); sensitive << *sig_accum_out_vec_4_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_5_msg_action); sensitive << *sig_accum_out_vec_5_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_6_msg_action); sensitive << *sig_accum_out_vec_6_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysTop_rtl_accum_out_vec_7_msg_action); sensitive << *sig_accum_out_vec_7_msg; snps_sysc_mark_last_create_process_as_internal();

		std::string clk_string = name();
		clk_string += "_R_clk";
		alterString(clk_string, basename());
		hdl_connect_v(*sig_clk, clk_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string rst_string = name();
		rst_string += "_R_rst";
		alterString(rst_string, basename());
		hdl_connect_v(*sig_rst, rst_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string write_req_val_string = name();
		write_req_val_string += "_R_write_req_val";
		alterString(write_req_val_string, basename());
		hdl_connect_v(*sig_write_req_val, write_req_val_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string write_req_msg_string = name();
		write_req_msg_string += "_R_write_req_msg";
		alterString(write_req_msg_string, basename());
		hdl_connect_v(*sig_write_req_msg, write_req_msg_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string start_val_string = name();
		start_val_string += "_R_start_val";
		alterString(start_val_string, basename());
		hdl_connect_v(*sig_start_val, start_val_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string start_msg_string = name();
		start_msg_string += "_R_start_msg";
		alterString(start_msg_string, basename());
		hdl_connect_v(*sig_start_msg, start_msg_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_0_val_string = name();
		weight_in_vec_0_val_string += "_R_weight_in_vec_0_val";
		alterString(weight_in_vec_0_val_string, basename());
		hdl_connect_v(*sig_weight_in_vec_0_val, weight_in_vec_0_val_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_1_val_string = name();
		weight_in_vec_1_val_string += "_R_weight_in_vec_1_val";
		alterString(weight_in_vec_1_val_string, basename());
		hdl_connect_v(*sig_weight_in_vec_1_val, weight_in_vec_1_val_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_2_val_string = name();
		weight_in_vec_2_val_string += "_R_weight_in_vec_2_val";
		alterString(weight_in_vec_2_val_string, basename());
		hdl_connect_v(*sig_weight_in_vec_2_val, weight_in_vec_2_val_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_3_val_string = name();
		weight_in_vec_3_val_string += "_R_weight_in_vec_3_val";
		alterString(weight_in_vec_3_val_string, basename());
		hdl_connect_v(*sig_weight_in_vec_3_val, weight_in_vec_3_val_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_4_val_string = name();
		weight_in_vec_4_val_string += "_R_weight_in_vec_4_val";
		alterString(weight_in_vec_4_val_string, basename());
		hdl_connect_v(*sig_weight_in_vec_4_val, weight_in_vec_4_val_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_5_val_string = name();
		weight_in_vec_5_val_string += "_R_weight_in_vec_5_val";
		alterString(weight_in_vec_5_val_string, basename());
		hdl_connect_v(*sig_weight_in_vec_5_val, weight_in_vec_5_val_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_6_val_string = name();
		weight_in_vec_6_val_string += "_R_weight_in_vec_6_val";
		alterString(weight_in_vec_6_val_string, basename());
		hdl_connect_v(*sig_weight_in_vec_6_val, weight_in_vec_6_val_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_7_val_string = name();
		weight_in_vec_7_val_string += "_R_weight_in_vec_7_val";
		alterString(weight_in_vec_7_val_string, basename());
		hdl_connect_v(*sig_weight_in_vec_7_val, weight_in_vec_7_val_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_0_msg_string = name();
		weight_in_vec_0_msg_string += "_R_weight_in_vec_0_msg";
		alterString(weight_in_vec_0_msg_string, basename());
		hdl_connect_v(*sig_weight_in_vec_0_msg, weight_in_vec_0_msg_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_1_msg_string = name();
		weight_in_vec_1_msg_string += "_R_weight_in_vec_1_msg";
		alterString(weight_in_vec_1_msg_string, basename());
		hdl_connect_v(*sig_weight_in_vec_1_msg, weight_in_vec_1_msg_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_2_msg_string = name();
		weight_in_vec_2_msg_string += "_R_weight_in_vec_2_msg";
		alterString(weight_in_vec_2_msg_string, basename());
		hdl_connect_v(*sig_weight_in_vec_2_msg, weight_in_vec_2_msg_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_3_msg_string = name();
		weight_in_vec_3_msg_string += "_R_weight_in_vec_3_msg";
		alterString(weight_in_vec_3_msg_string, basename());
		hdl_connect_v(*sig_weight_in_vec_3_msg, weight_in_vec_3_msg_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_4_msg_string = name();
		weight_in_vec_4_msg_string += "_R_weight_in_vec_4_msg";
		alterString(weight_in_vec_4_msg_string, basename());
		hdl_connect_v(*sig_weight_in_vec_4_msg, weight_in_vec_4_msg_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_5_msg_string = name();
		weight_in_vec_5_msg_string += "_R_weight_in_vec_5_msg";
		alterString(weight_in_vec_5_msg_string, basename());
		hdl_connect_v(*sig_weight_in_vec_5_msg, weight_in_vec_5_msg_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_6_msg_string = name();
		weight_in_vec_6_msg_string += "_R_weight_in_vec_6_msg";
		alterString(weight_in_vec_6_msg_string, basename());
		hdl_connect_v(*sig_weight_in_vec_6_msg, weight_in_vec_6_msg_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_vec_7_msg_string = name();
		weight_in_vec_7_msg_string += "_R_weight_in_vec_7_msg";
		alterString(weight_in_vec_7_msg_string, basename());
		hdl_connect_v(*sig_weight_in_vec_7_msg, weight_in_vec_7_msg_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string accum_out_vec_0_rdy_string = name();
		accum_out_vec_0_rdy_string += "_R_accum_out_vec_0_rdy";
		alterString(accum_out_vec_0_rdy_string, basename());
		hdl_connect_v(*sig_accum_out_vec_0_rdy, accum_out_vec_0_rdy_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string accum_out_vec_1_rdy_string = name();
		accum_out_vec_1_rdy_string += "_R_accum_out_vec_1_rdy";
		alterString(accum_out_vec_1_rdy_string, basename());
		hdl_connect_v(*sig_accum_out_vec_1_rdy, accum_out_vec_1_rdy_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string accum_out_vec_2_rdy_string = name();
		accum_out_vec_2_rdy_string += "_R_accum_out_vec_2_rdy";
		alterString(accum_out_vec_2_rdy_string, basename());
		hdl_connect_v(*sig_accum_out_vec_2_rdy, accum_out_vec_2_rdy_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string accum_out_vec_3_rdy_string = name();
		accum_out_vec_3_rdy_string += "_R_accum_out_vec_3_rdy";
		alterString(accum_out_vec_3_rdy_string, basename());
		hdl_connect_v(*sig_accum_out_vec_3_rdy, accum_out_vec_3_rdy_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string accum_out_vec_4_rdy_string = name();
		accum_out_vec_4_rdy_string += "_R_accum_out_vec_4_rdy";
		alterString(accum_out_vec_4_rdy_string, basename());
		hdl_connect_v(*sig_accum_out_vec_4_rdy, accum_out_vec_4_rdy_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string accum_out_vec_5_rdy_string = name();
		accum_out_vec_5_rdy_string += "_R_accum_out_vec_5_rdy";
		alterString(accum_out_vec_5_rdy_string, basename());
		hdl_connect_v(*sig_accum_out_vec_5_rdy, accum_out_vec_5_rdy_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string accum_out_vec_6_rdy_string = name();
		accum_out_vec_6_rdy_string += "_R_accum_out_vec_6_rdy";
		alterString(accum_out_vec_6_rdy_string, basename());
		hdl_connect_v(*sig_accum_out_vec_6_rdy, accum_out_vec_6_rdy_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string accum_out_vec_7_rdy_string = name();
		accum_out_vec_7_rdy_string += "_R_accum_out_vec_7_rdy";
		alterString(accum_out_vec_7_rdy_string, basename());
		hdl_connect_v(*sig_accum_out_vec_7_rdy, accum_out_vec_7_rdy_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string write_req_rdy_string = name();
		alterString(write_req_rdy_string, basename());
		write_req_rdy_string += ".write_req_rdy";
		hdl_connect_v(*sig_write_req_rdy, write_req_rdy_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string start_rdy_string = name();
		alterString(start_rdy_string, basename());
		start_rdy_string += ".start_rdy";
		hdl_connect_v(*sig_start_rdy, start_rdy_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string weight_in_vec_0_rdy_string = name();
		alterString(weight_in_vec_0_rdy_string, basename());
		weight_in_vec_0_rdy_string += ".weight_in_vec_0_rdy";
		hdl_connect_v(*sig_weight_in_vec_0_rdy, weight_in_vec_0_rdy_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string weight_in_vec_1_rdy_string = name();
		alterString(weight_in_vec_1_rdy_string, basename());
		weight_in_vec_1_rdy_string += ".weight_in_vec_1_rdy";
		hdl_connect_v(*sig_weight_in_vec_1_rdy, weight_in_vec_1_rdy_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string weight_in_vec_2_rdy_string = name();
		alterString(weight_in_vec_2_rdy_string, basename());
		weight_in_vec_2_rdy_string += ".weight_in_vec_2_rdy";
		hdl_connect_v(*sig_weight_in_vec_2_rdy, weight_in_vec_2_rdy_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string weight_in_vec_3_rdy_string = name();
		alterString(weight_in_vec_3_rdy_string, basename());
		weight_in_vec_3_rdy_string += ".weight_in_vec_3_rdy";
		hdl_connect_v(*sig_weight_in_vec_3_rdy, weight_in_vec_3_rdy_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string weight_in_vec_4_rdy_string = name();
		alterString(weight_in_vec_4_rdy_string, basename());
		weight_in_vec_4_rdy_string += ".weight_in_vec_4_rdy";
		hdl_connect_v(*sig_weight_in_vec_4_rdy, weight_in_vec_4_rdy_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string weight_in_vec_5_rdy_string = name();
		alterString(weight_in_vec_5_rdy_string, basename());
		weight_in_vec_5_rdy_string += ".weight_in_vec_5_rdy";
		hdl_connect_v(*sig_weight_in_vec_5_rdy, weight_in_vec_5_rdy_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string weight_in_vec_6_rdy_string = name();
		alterString(weight_in_vec_6_rdy_string, basename());
		weight_in_vec_6_rdy_string += ".weight_in_vec_6_rdy";
		hdl_connect_v(*sig_weight_in_vec_6_rdy, weight_in_vec_6_rdy_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string weight_in_vec_7_rdy_string = name();
		alterString(weight_in_vec_7_rdy_string, basename());
		weight_in_vec_7_rdy_string += ".weight_in_vec_7_rdy";
		hdl_connect_v(*sig_weight_in_vec_7_rdy, weight_in_vec_7_rdy_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_0_val_string = name();
		alterString(accum_out_vec_0_val_string, basename());
		accum_out_vec_0_val_string += ".accum_out_vec_0_val";
		hdl_connect_v(*sig_accum_out_vec_0_val, accum_out_vec_0_val_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_1_val_string = name();
		alterString(accum_out_vec_1_val_string, basename());
		accum_out_vec_1_val_string += ".accum_out_vec_1_val";
		hdl_connect_v(*sig_accum_out_vec_1_val, accum_out_vec_1_val_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_2_val_string = name();
		alterString(accum_out_vec_2_val_string, basename());
		accum_out_vec_2_val_string += ".accum_out_vec_2_val";
		hdl_connect_v(*sig_accum_out_vec_2_val, accum_out_vec_2_val_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_3_val_string = name();
		alterString(accum_out_vec_3_val_string, basename());
		accum_out_vec_3_val_string += ".accum_out_vec_3_val";
		hdl_connect_v(*sig_accum_out_vec_3_val, accum_out_vec_3_val_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_4_val_string = name();
		alterString(accum_out_vec_4_val_string, basename());
		accum_out_vec_4_val_string += ".accum_out_vec_4_val";
		hdl_connect_v(*sig_accum_out_vec_4_val, accum_out_vec_4_val_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_5_val_string = name();
		alterString(accum_out_vec_5_val_string, basename());
		accum_out_vec_5_val_string += ".accum_out_vec_5_val";
		hdl_connect_v(*sig_accum_out_vec_5_val, accum_out_vec_5_val_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_6_val_string = name();
		alterString(accum_out_vec_6_val_string, basename());
		accum_out_vec_6_val_string += ".accum_out_vec_6_val";
		hdl_connect_v(*sig_accum_out_vec_6_val, accum_out_vec_6_val_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_7_val_string = name();
		alterString(accum_out_vec_7_val_string, basename());
		accum_out_vec_7_val_string += ".accum_out_vec_7_val";
		hdl_connect_v(*sig_accum_out_vec_7_val, accum_out_vec_7_val_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_0_msg_string = name();
		alterString(accum_out_vec_0_msg_string, basename());
		accum_out_vec_0_msg_string += ".accum_out_vec_0_msg";
		hdl_connect_v(*sig_accum_out_vec_0_msg, accum_out_vec_0_msg_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_1_msg_string = name();
		alterString(accum_out_vec_1_msg_string, basename());
		accum_out_vec_1_msg_string += ".accum_out_vec_1_msg";
		hdl_connect_v(*sig_accum_out_vec_1_msg, accum_out_vec_1_msg_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_2_msg_string = name();
		alterString(accum_out_vec_2_msg_string, basename());
		accum_out_vec_2_msg_string += ".accum_out_vec_2_msg";
		hdl_connect_v(*sig_accum_out_vec_2_msg, accum_out_vec_2_msg_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_3_msg_string = name();
		alterString(accum_out_vec_3_msg_string, basename());
		accum_out_vec_3_msg_string += ".accum_out_vec_3_msg";
		hdl_connect_v(*sig_accum_out_vec_3_msg, accum_out_vec_3_msg_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_4_msg_string = name();
		alterString(accum_out_vec_4_msg_string, basename());
		accum_out_vec_4_msg_string += ".accum_out_vec_4_msg";
		hdl_connect_v(*sig_accum_out_vec_4_msg, accum_out_vec_4_msg_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_5_msg_string = name();
		alterString(accum_out_vec_5_msg_string, basename());
		accum_out_vec_5_msg_string += ".accum_out_vec_5_msg";
		hdl_connect_v(*sig_accum_out_vec_5_msg, accum_out_vec_5_msg_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_6_msg_string = name();
		alterString(accum_out_vec_6_msg_string, basename());
		accum_out_vec_6_msg_string += ".accum_out_vec_6_msg";
		hdl_connect_v(*sig_accum_out_vec_6_msg, accum_out_vec_6_msg_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_vec_7_msg_string = name();
		alterString(accum_out_vec_7_msg_string, basename());
		accum_out_vec_7_msg_string += ".accum_out_vec_7_msg";
		hdl_connect_v(*sig_accum_out_vec_7_msg, accum_out_vec_7_msg_string.c_str(), HDL_INPUT, HDL_vcs);

		vcsModel = VcsDesign::getDesignInstance()->addModel("SysTop_rtl");
		vcsInstance = vcsModel->addInstance(name());
		vcsInstance->setScObj(this);
		vcsInstance->setNames("SysTop_rtl", name(), basename());
		vcsInstance->addPort("clk",  VcsPort::INPUT_PORT, 1, 0, "bool", VcsPort::BC_C);
		vcsInstance->addPort("rst",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("write_req_val",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("write_req_msg",  VcsPort::INPUT_PORT, 69, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("start_val",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("start_msg",  VcsPort::INPUT_PORT, 6, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_0_val",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_1_val",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_2_val",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_3_val",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_4_val",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_5_val",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_6_val",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_7_val",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_0_msg",  VcsPort::INPUT_PORT, 8, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_1_msg",  VcsPort::INPUT_PORT, 8, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_2_msg",  VcsPort::INPUT_PORT, 8, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_3_msg",  VcsPort::INPUT_PORT, 8, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_4_msg",  VcsPort::INPUT_PORT, 8, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_5_msg",  VcsPort::INPUT_PORT, 8, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_6_msg",  VcsPort::INPUT_PORT, 8, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_7_msg",  VcsPort::INPUT_PORT, 8, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_0_rdy",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_1_rdy",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_2_rdy",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_3_rdy",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_4_rdy",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_5_rdy",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_6_rdy",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_7_rdy",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("write_req_rdy",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("start_rdy",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_0_rdy",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_1_rdy",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_2_rdy",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_3_rdy",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_4_rdy",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_5_rdy",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_6_rdy",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_vec_7_rdy",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_0_val",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_1_val",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_2_val",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_3_val",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_4_val",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_5_val",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_6_val",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_7_val",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_0_msg",  VcsPort::OUTPUT_PORT, 32, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_1_msg",  VcsPort::OUTPUT_PORT, 32, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_2_msg",  VcsPort::OUTPUT_PORT, 32, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_3_msg",  VcsPort::OUTPUT_PORT, 32, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_4_msg",  VcsPort::OUTPUT_PORT, 32, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_5_msg",  VcsPort::OUTPUT_PORT, 32, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_6_msg",  VcsPort::OUTPUT_PORT, 32, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_vec_7_msg",  VcsPort::OUTPUT_PORT, 32, 0, "sc_lv", VcsPort::BC_C);
	};

	void SysTop_rtl_clk_action()
	{ sig_clk->write(clk.read());
	}
	void SysTop_rtl_rst_action()
	{ sig_rst->write(rst.read());
	}
	void SysTop_rtl_write_req_val_action()
	{ sig_write_req_val->write(write_req_val.read());
	}
	void SysTop_rtl_write_req_msg_action()
	{ sig_write_req_msg->write(write_req_msg.read());
	}
	void SysTop_rtl_start_val_action()
	{ sig_start_val->write(start_val.read());
	}
	void SysTop_rtl_start_msg_action()
	{ sig_start_msg->write(start_msg.read());
	}
	void SysTop_rtl_weight_in_vec_0_val_action()
	{ sig_weight_in_vec_0_val->write(weight_in_vec_0_val.read());
	}
	void SysTop_rtl_weight_in_vec_1_val_action()
	{ sig_weight_in_vec_1_val->write(weight_in_vec_1_val.read());
	}
	void SysTop_rtl_weight_in_vec_2_val_action()
	{ sig_weight_in_vec_2_val->write(weight_in_vec_2_val.read());
	}
	void SysTop_rtl_weight_in_vec_3_val_action()
	{ sig_weight_in_vec_3_val->write(weight_in_vec_3_val.read());
	}
	void SysTop_rtl_weight_in_vec_4_val_action()
	{ sig_weight_in_vec_4_val->write(weight_in_vec_4_val.read());
	}
	void SysTop_rtl_weight_in_vec_5_val_action()
	{ sig_weight_in_vec_5_val->write(weight_in_vec_5_val.read());
	}
	void SysTop_rtl_weight_in_vec_6_val_action()
	{ sig_weight_in_vec_6_val->write(weight_in_vec_6_val.read());
	}
	void SysTop_rtl_weight_in_vec_7_val_action()
	{ sig_weight_in_vec_7_val->write(weight_in_vec_7_val.read());
	}
	void SysTop_rtl_weight_in_vec_0_msg_action()
	{ sig_weight_in_vec_0_msg->write(weight_in_vec_0_msg.read());
	}
	void SysTop_rtl_weight_in_vec_1_msg_action()
	{ sig_weight_in_vec_1_msg->write(weight_in_vec_1_msg.read());
	}
	void SysTop_rtl_weight_in_vec_2_msg_action()
	{ sig_weight_in_vec_2_msg->write(weight_in_vec_2_msg.read());
	}
	void SysTop_rtl_weight_in_vec_3_msg_action()
	{ sig_weight_in_vec_3_msg->write(weight_in_vec_3_msg.read());
	}
	void SysTop_rtl_weight_in_vec_4_msg_action()
	{ sig_weight_in_vec_4_msg->write(weight_in_vec_4_msg.read());
	}
	void SysTop_rtl_weight_in_vec_5_msg_action()
	{ sig_weight_in_vec_5_msg->write(weight_in_vec_5_msg.read());
	}
	void SysTop_rtl_weight_in_vec_6_msg_action()
	{ sig_weight_in_vec_6_msg->write(weight_in_vec_6_msg.read());
	}
	void SysTop_rtl_weight_in_vec_7_msg_action()
	{ sig_weight_in_vec_7_msg->write(weight_in_vec_7_msg.read());
	}
	void SysTop_rtl_accum_out_vec_0_rdy_action()
	{ sig_accum_out_vec_0_rdy->write(accum_out_vec_0_rdy.read());
	}
	void SysTop_rtl_accum_out_vec_1_rdy_action()
	{ sig_accum_out_vec_1_rdy->write(accum_out_vec_1_rdy.read());
	}
	void SysTop_rtl_accum_out_vec_2_rdy_action()
	{ sig_accum_out_vec_2_rdy->write(accum_out_vec_2_rdy.read());
	}
	void SysTop_rtl_accum_out_vec_3_rdy_action()
	{ sig_accum_out_vec_3_rdy->write(accum_out_vec_3_rdy.read());
	}
	void SysTop_rtl_accum_out_vec_4_rdy_action()
	{ sig_accum_out_vec_4_rdy->write(accum_out_vec_4_rdy.read());
	}
	void SysTop_rtl_accum_out_vec_5_rdy_action()
	{ sig_accum_out_vec_5_rdy->write(accum_out_vec_5_rdy.read());
	}
	void SysTop_rtl_accum_out_vec_6_rdy_action()
	{ sig_accum_out_vec_6_rdy->write(accum_out_vec_6_rdy.read());
	}
	void SysTop_rtl_accum_out_vec_7_rdy_action()
	{ sig_accum_out_vec_7_rdy->write(accum_out_vec_7_rdy.read());
	}

	void SysTop_rtl_write_req_rdy_action()
	{ write_req_rdy.write((*sig_write_req_rdy).read());
	}
	void SysTop_rtl_start_rdy_action()
	{ start_rdy.write((*sig_start_rdy).read());
	}
	void SysTop_rtl_weight_in_vec_0_rdy_action()
	{ weight_in_vec_0_rdy.write((*sig_weight_in_vec_0_rdy).read());
	}
	void SysTop_rtl_weight_in_vec_1_rdy_action()
	{ weight_in_vec_1_rdy.write((*sig_weight_in_vec_1_rdy).read());
	}
	void SysTop_rtl_weight_in_vec_2_rdy_action()
	{ weight_in_vec_2_rdy.write((*sig_weight_in_vec_2_rdy).read());
	}
	void SysTop_rtl_weight_in_vec_3_rdy_action()
	{ weight_in_vec_3_rdy.write((*sig_weight_in_vec_3_rdy).read());
	}
	void SysTop_rtl_weight_in_vec_4_rdy_action()
	{ weight_in_vec_4_rdy.write((*sig_weight_in_vec_4_rdy).read());
	}
	void SysTop_rtl_weight_in_vec_5_rdy_action()
	{ weight_in_vec_5_rdy.write((*sig_weight_in_vec_5_rdy).read());
	}
	void SysTop_rtl_weight_in_vec_6_rdy_action()
	{ weight_in_vec_6_rdy.write((*sig_weight_in_vec_6_rdy).read());
	}
	void SysTop_rtl_weight_in_vec_7_rdy_action()
	{ weight_in_vec_7_rdy.write((*sig_weight_in_vec_7_rdy).read());
	}
	void SysTop_rtl_accum_out_vec_0_val_action()
	{ accum_out_vec_0_val.write((*sig_accum_out_vec_0_val).read());
	}
	void SysTop_rtl_accum_out_vec_1_val_action()
	{ accum_out_vec_1_val.write((*sig_accum_out_vec_1_val).read());
	}
	void SysTop_rtl_accum_out_vec_2_val_action()
	{ accum_out_vec_2_val.write((*sig_accum_out_vec_2_val).read());
	}
	void SysTop_rtl_accum_out_vec_3_val_action()
	{ accum_out_vec_3_val.write((*sig_accum_out_vec_3_val).read());
	}
	void SysTop_rtl_accum_out_vec_4_val_action()
	{ accum_out_vec_4_val.write((*sig_accum_out_vec_4_val).read());
	}
	void SysTop_rtl_accum_out_vec_5_val_action()
	{ accum_out_vec_5_val.write((*sig_accum_out_vec_5_val).read());
	}
	void SysTop_rtl_accum_out_vec_6_val_action()
	{ accum_out_vec_6_val.write((*sig_accum_out_vec_6_val).read());
	}
	void SysTop_rtl_accum_out_vec_7_val_action()
	{ accum_out_vec_7_val.write((*sig_accum_out_vec_7_val).read());
	}
	void SysTop_rtl_accum_out_vec_0_msg_action()
	{ accum_out_vec_0_msg.write((*sig_accum_out_vec_0_msg).read());
	}
	void SysTop_rtl_accum_out_vec_1_msg_action()
	{ accum_out_vec_1_msg.write((*sig_accum_out_vec_1_msg).read());
	}
	void SysTop_rtl_accum_out_vec_2_msg_action()
	{ accum_out_vec_2_msg.write((*sig_accum_out_vec_2_msg).read());
	}
	void SysTop_rtl_accum_out_vec_3_msg_action()
	{ accum_out_vec_3_msg.write((*sig_accum_out_vec_3_msg).read());
	}
	void SysTop_rtl_accum_out_vec_4_msg_action()
	{ accum_out_vec_4_msg.write((*sig_accum_out_vec_4_msg).read());
	}
	void SysTop_rtl_accum_out_vec_5_msg_action()
	{ accum_out_vec_5_msg.write((*sig_accum_out_vec_5_msg).read());
	}
	void SysTop_rtl_accum_out_vec_6_msg_action()
	{ accum_out_vec_6_msg.write((*sig_accum_out_vec_6_msg).read());
	}
	void SysTop_rtl_accum_out_vec_7_msg_action()
	{ accum_out_vec_7_msg.write((*sig_accum_out_vec_7_msg).read());
	}

	const char *kind() const { return "dki_module_verilog"; }
};


#endif
