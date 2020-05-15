// Created during runtime of your simulation.

(*vcs_systemc_2,vcs_systemc_skel*) module \my_testbench.PE$ ;

  // Instance type = Verilog
  reg \ccs_rtl_R_clk ;
  reg \ccs_rtl_R_rst ;
  reg \ccs_rtl_R_weight_in_val ;
  reg [7:0] \ccs_rtl_R_weight_in_msg ;
  reg \ccs_rtl_R_act_in_val ;
  reg [7:0] \ccs_rtl_R_act_in_msg ;
  reg \ccs_rtl_R_accum_in_val ;
  reg [31:0] \ccs_rtl_R_accum_in_msg ;
  reg \ccs_rtl_R_act_out_rdy ;
  reg \ccs_rtl_R_accum_out_rdy ;
  reg \ccs_rtl_R_weight_out_rdy ;

  SysPE_rtl  ccs_rtl (
     .clk(\ccs_rtl_R_clk ),
     .rst(\ccs_rtl_R_rst ),
     .weight_in_val(\ccs_rtl_R_weight_in_val ),
     .weight_in_msg(\ccs_rtl_R_weight_in_msg ),
     .act_in_val(\ccs_rtl_R_act_in_val ),
     .act_in_msg(\ccs_rtl_R_act_in_msg ),
     .accum_in_val(\ccs_rtl_R_accum_in_val ),
     .accum_in_msg(\ccs_rtl_R_accum_in_msg ),
     .act_out_rdy(\ccs_rtl_R_act_out_rdy ),
     .accum_out_rdy(\ccs_rtl_R_accum_out_rdy ),
     .weight_out_rdy(\ccs_rtl_R_weight_out_rdy )
  );

endmodule

// TOP-MODULE sYsTeMcToP
(*vcs_systemc_2,vcs_systemc_skel*) module sYsTeMcToP;

  \my_testbench.PE$  \my_testbench.PE ();

endmodule

