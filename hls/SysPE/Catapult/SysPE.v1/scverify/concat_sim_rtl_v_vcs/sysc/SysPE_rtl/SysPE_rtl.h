// SystemC wrapper header for DKI connect HDL model import
// This file must be compiled with other SystemC files

#ifndef SysPE_rtl_h_
#define SysPE_rtl_h_

#include "systemc.h"
#include <string.h>
#include "cosim/bf/hdl_connect_v.h"
#include "cosim/bf/VcsDesign.h"
#include "cosim/bf/snps_hdl_param.h"

extern "C" unsigned int* MSysPE_rtl_1(unsigned int*, char*);
extern "C" std::string BF_get_hdl_name(SC_CORE sc_object *);


struct SysPE_rtl : sc_module {
	VcsModel    *vcsModel;
	VcsInstance *vcsInstance;

	//Input ports
	sc_in<bool>  clk;
	sc_in<sc_logic>  rst;
	sc_in<sc_logic>  weight_in_val;
	sc_in<sc_lv<8> >  weight_in_msg;
	sc_in<sc_logic>  act_in_val;
	sc_in<sc_lv<8> >  act_in_msg;
	sc_in<sc_logic>  accum_in_val;
	sc_in<sc_lv<32> >  accum_in_msg;
	sc_in<sc_logic>  act_out_rdy;
	sc_in<sc_logic>  accum_out_rdy;
	sc_in<sc_logic>  weight_out_rdy;

	//Output ports
	sc_out<sc_logic>  weight_in_rdy;
	sc_out<sc_logic>  act_in_rdy;
	sc_out<sc_logic>  accum_in_rdy;
	sc_out<sc_logic>  act_out_val;
	sc_out<sc_lv<8> >  act_out_msg;
	sc_out<sc_logic>  accum_out_val;
	sc_out<sc_lv<32> >  accum_out_msg;
	sc_out<sc_logic>  weight_out_val;
	sc_out<sc_lv<8> >  weight_out_msg;

	sc_signal<bool,SC_UNCHECKED_WRITERS> *sig_clk;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_rst;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_val;
	sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS > *sig_weight_in_msg;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_act_in_val;
	sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS > *sig_act_in_msg;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_in_val;
	sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS > *sig_accum_in_msg;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_act_out_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_out_rdy;

	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_in_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_act_in_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_in_rdy;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_act_out_val;
	sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS > *sig_act_out_msg;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_accum_out_val;
	sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS > *sig_accum_out_msg;
	sc_signal<sc_logic,SC_UNCHECKED_WRITERS> *sig_weight_out_val;
	sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS > *sig_weight_out_msg;

	// Parameters

	SC_HAS_PROCESS(SysPE_rtl);
	SysPE_rtl(sc_module_name modelName): sc_module(modelName)
	{
		sig_clk = new sc_signal<bool,SC_UNCHECKED_WRITERS>("sig_clk");
		sig_rst = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_rst");
		sig_weight_in_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_val");
		sig_weight_in_msg = new sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS >("sig_weight_in_msg");
		sig_act_in_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_act_in_val");
		sig_act_in_msg = new sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS >("sig_act_in_msg");
		sig_accum_in_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_in_val");
		sig_accum_in_msg = new sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS >("sig_accum_in_msg");
		sig_act_out_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_act_out_rdy");
		sig_accum_out_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_rdy");
		sig_weight_out_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_out_rdy");

		sig_weight_in_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_in_rdy");
		sig_act_in_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_act_in_rdy");
		sig_accum_in_rdy = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_in_rdy");
		sig_act_out_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_act_out_val");
		sig_act_out_msg = new sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS >("sig_act_out_msg");
		sig_accum_out_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_accum_out_val");
		sig_accum_out_msg = new sc_signal<sc_lv<32>,SC_UNCHECKED_WRITERS >("sig_accum_out_msg");
		sig_weight_out_val = new sc_signal<sc_logic,SC_UNCHECKED_WRITERS>("sig_weight_out_val");
		sig_weight_out_msg = new sc_signal<sc_lv<8>,SC_UNCHECKED_WRITERS >("sig_weight_out_msg");

		HDL_MODULE("SysPE_rtl", name(), basename());
		SC_METHOD(SysPE_rtl_clk_action); sensitive << clk; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_rst_action); sensitive << rst; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_weight_in_val_action); sensitive << weight_in_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_weight_in_msg_action); sensitive << weight_in_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_act_in_val_action); sensitive << act_in_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_act_in_msg_action); sensitive << act_in_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_accum_in_val_action); sensitive << accum_in_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_accum_in_msg_action); sensitive << accum_in_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_act_out_rdy_action); sensitive << act_out_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_accum_out_rdy_action); sensitive << accum_out_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_weight_out_rdy_action); sensitive << weight_out_rdy; snps_sysc_mark_last_create_process_as_internal();

		SC_METHOD(SysPE_rtl_weight_in_rdy_action); sensitive << *sig_weight_in_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_act_in_rdy_action); sensitive << *sig_act_in_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_accum_in_rdy_action); sensitive << *sig_accum_in_rdy; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_act_out_val_action); sensitive << *sig_act_out_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_act_out_msg_action); sensitive << *sig_act_out_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_accum_out_val_action); sensitive << *sig_accum_out_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_accum_out_msg_action); sensitive << *sig_accum_out_msg; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_weight_out_val_action); sensitive << *sig_weight_out_val; snps_sysc_mark_last_create_process_as_internal();
		SC_METHOD(SysPE_rtl_weight_out_msg_action); sensitive << *sig_weight_out_msg; snps_sysc_mark_last_create_process_as_internal();

		std::string clk_string = name();
		clk_string += "_R_clk";
		alterString(clk_string, basename());
		hdl_connect_v(*sig_clk, clk_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string rst_string = name();
		rst_string += "_R_rst";
		alterString(rst_string, basename());
		hdl_connect_v(*sig_rst, rst_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_val_string = name();
		weight_in_val_string += "_R_weight_in_val";
		alterString(weight_in_val_string, basename());
		hdl_connect_v(*sig_weight_in_val, weight_in_val_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_msg_string = name();
		weight_in_msg_string += "_R_weight_in_msg";
		alterString(weight_in_msg_string, basename());
		hdl_connect_v(*sig_weight_in_msg, weight_in_msg_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string act_in_val_string = name();
		act_in_val_string += "_R_act_in_val";
		alterString(act_in_val_string, basename());
		hdl_connect_v(*sig_act_in_val, act_in_val_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string act_in_msg_string = name();
		act_in_msg_string += "_R_act_in_msg";
		alterString(act_in_msg_string, basename());
		hdl_connect_v(*sig_act_in_msg, act_in_msg_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string accum_in_val_string = name();
		accum_in_val_string += "_R_accum_in_val";
		alterString(accum_in_val_string, basename());
		hdl_connect_v(*sig_accum_in_val, accum_in_val_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string accum_in_msg_string = name();
		accum_in_msg_string += "_R_accum_in_msg";
		alterString(accum_in_msg_string, basename());
		hdl_connect_v(*sig_accum_in_msg, accum_in_msg_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string act_out_rdy_string = name();
		act_out_rdy_string += "_R_act_out_rdy";
		alterString(act_out_rdy_string, basename());
		hdl_connect_v(*sig_act_out_rdy, act_out_rdy_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string accum_out_rdy_string = name();
		accum_out_rdy_string += "_R_accum_out_rdy";
		alterString(accum_out_rdy_string, basename());
		hdl_connect_v(*sig_accum_out_rdy, accum_out_rdy_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_out_rdy_string = name();
		weight_out_rdy_string += "_R_weight_out_rdy";
		alterString(weight_out_rdy_string, basename());
		hdl_connect_v(*sig_weight_out_rdy, weight_out_rdy_string.c_str(), HDL_OUTPUT, HDL_vcs);

		std::string weight_in_rdy_string = name();
		alterString(weight_in_rdy_string, basename());
		weight_in_rdy_string += ".weight_in_rdy";
		hdl_connect_v(*sig_weight_in_rdy, weight_in_rdy_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string act_in_rdy_string = name();
		alterString(act_in_rdy_string, basename());
		act_in_rdy_string += ".act_in_rdy";
		hdl_connect_v(*sig_act_in_rdy, act_in_rdy_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_in_rdy_string = name();
		alterString(accum_in_rdy_string, basename());
		accum_in_rdy_string += ".accum_in_rdy";
		hdl_connect_v(*sig_accum_in_rdy, accum_in_rdy_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string act_out_val_string = name();
		alterString(act_out_val_string, basename());
		act_out_val_string += ".act_out_val";
		hdl_connect_v(*sig_act_out_val, act_out_val_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string act_out_msg_string = name();
		alterString(act_out_msg_string, basename());
		act_out_msg_string += ".act_out_msg";
		hdl_connect_v(*sig_act_out_msg, act_out_msg_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_val_string = name();
		alterString(accum_out_val_string, basename());
		accum_out_val_string += ".accum_out_val";
		hdl_connect_v(*sig_accum_out_val, accum_out_val_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string accum_out_msg_string = name();
		alterString(accum_out_msg_string, basename());
		accum_out_msg_string += ".accum_out_msg";
		hdl_connect_v(*sig_accum_out_msg, accum_out_msg_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string weight_out_val_string = name();
		alterString(weight_out_val_string, basename());
		weight_out_val_string += ".weight_out_val";
		hdl_connect_v(*sig_weight_out_val, weight_out_val_string.c_str(), HDL_INPUT, HDL_vcs);

		std::string weight_out_msg_string = name();
		alterString(weight_out_msg_string, basename());
		weight_out_msg_string += ".weight_out_msg";
		hdl_connect_v(*sig_weight_out_msg, weight_out_msg_string.c_str(), HDL_INPUT, HDL_vcs);

		vcsModel = VcsDesign::getDesignInstance()->addModel("SysPE_rtl");
		vcsInstance = vcsModel->addInstance(name());
		vcsInstance->setScObj(this);
		vcsInstance->setNames("SysPE_rtl", name(), basename());
		vcsInstance->addPort("clk",  VcsPort::INPUT_PORT, 1, 0, "bool", VcsPort::BC_C);
		vcsInstance->addPort("rst",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_val",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_msg",  VcsPort::INPUT_PORT, 8, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("act_in_val",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("act_in_msg",  VcsPort::INPUT_PORT, 8, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("accum_in_val",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_in_msg",  VcsPort::INPUT_PORT, 32, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("act_out_rdy",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_rdy",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_out_rdy",  VcsPort::INPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_in_rdy",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("act_in_rdy",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_in_rdy",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("act_out_val",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("act_out_msg",  VcsPort::OUTPUT_PORT, 8, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_val",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("accum_out_msg",  VcsPort::OUTPUT_PORT, 32, 0, "sc_lv", VcsPort::BC_C);
		vcsInstance->addPort("weight_out_val",  VcsPort::OUTPUT_PORT, 1, 0, "sc_logic", VcsPort::BC_C);
		vcsInstance->addPort("weight_out_msg",  VcsPort::OUTPUT_PORT, 8, 0, "sc_lv", VcsPort::BC_C);
	};

	void SysPE_rtl_clk_action()
	{ sig_clk->write(clk.read());
	}
	void SysPE_rtl_rst_action()
	{ sig_rst->write(rst.read());
	}
	void SysPE_rtl_weight_in_val_action()
	{ sig_weight_in_val->write(weight_in_val.read());
	}
	void SysPE_rtl_weight_in_msg_action()
	{ sig_weight_in_msg->write(weight_in_msg.read());
	}
	void SysPE_rtl_act_in_val_action()
	{ sig_act_in_val->write(act_in_val.read());
	}
	void SysPE_rtl_act_in_msg_action()
	{ sig_act_in_msg->write(act_in_msg.read());
	}
	void SysPE_rtl_accum_in_val_action()
	{ sig_accum_in_val->write(accum_in_val.read());
	}
	void SysPE_rtl_accum_in_msg_action()
	{ sig_accum_in_msg->write(accum_in_msg.read());
	}
	void SysPE_rtl_act_out_rdy_action()
	{ sig_act_out_rdy->write(act_out_rdy.read());
	}
	void SysPE_rtl_accum_out_rdy_action()
	{ sig_accum_out_rdy->write(accum_out_rdy.read());
	}
	void SysPE_rtl_weight_out_rdy_action()
	{ sig_weight_out_rdy->write(weight_out_rdy.read());
	}

	void SysPE_rtl_weight_in_rdy_action()
	{ weight_in_rdy.write((*sig_weight_in_rdy).read());
	}
	void SysPE_rtl_act_in_rdy_action()
	{ act_in_rdy.write((*sig_act_in_rdy).read());
	}
	void SysPE_rtl_accum_in_rdy_action()
	{ accum_in_rdy.write((*sig_accum_in_rdy).read());
	}
	void SysPE_rtl_act_out_val_action()
	{ act_out_val.write((*sig_act_out_val).read());
	}
	void SysPE_rtl_act_out_msg_action()
	{ act_out_msg.write((*sig_act_out_msg).read());
	}
	void SysPE_rtl_accum_out_val_action()
	{ accum_out_val.write((*sig_accum_out_val).read());
	}
	void SysPE_rtl_accum_out_msg_action()
	{ accum_out_msg.write((*sig_accum_out_msg).read());
	}
	void SysPE_rtl_weight_out_val_action()
	{ weight_out_val.write((*sig_weight_out_val).read());
	}
	void SysPE_rtl_weight_out_msg_action()
	{ weight_out_msg.write((*sig_weight_out_msg).read());
	}

	const char *kind() const { return "dki_module_verilog"; }
};


#endif
