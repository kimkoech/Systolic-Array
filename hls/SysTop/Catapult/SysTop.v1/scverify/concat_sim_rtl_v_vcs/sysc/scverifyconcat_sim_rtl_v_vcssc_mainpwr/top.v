// Created during runtime of your simulation.

(*vcs_systemc_2,vcs_systemc_skel*) module \my_testbench.top$ ;

  // Instance type = Verilog
  reg \ccs_rtl_R_clk ;
  reg \ccs_rtl_R_rst ;
  reg \ccs_rtl_R_write_req_val ;
  reg [68:0] \ccs_rtl_R_write_req_msg ;
  reg \ccs_rtl_R_start_val ;
  reg [5:0] \ccs_rtl_R_start_msg ;
  reg \ccs_rtl_R_weight_in_vec_0_val ;
  reg \ccs_rtl_R_weight_in_vec_1_val ;
  reg \ccs_rtl_R_weight_in_vec_2_val ;
  reg \ccs_rtl_R_weight_in_vec_3_val ;
  reg \ccs_rtl_R_weight_in_vec_4_val ;
  reg \ccs_rtl_R_weight_in_vec_5_val ;
  reg \ccs_rtl_R_weight_in_vec_6_val ;
  reg \ccs_rtl_R_weight_in_vec_7_val ;
  reg [7:0] \ccs_rtl_R_weight_in_vec_0_msg ;
  reg [7:0] \ccs_rtl_R_weight_in_vec_1_msg ;
  reg [7:0] \ccs_rtl_R_weight_in_vec_2_msg ;
  reg [7:0] \ccs_rtl_R_weight_in_vec_3_msg ;
  reg [7:0] \ccs_rtl_R_weight_in_vec_4_msg ;
  reg [7:0] \ccs_rtl_R_weight_in_vec_5_msg ;
  reg [7:0] \ccs_rtl_R_weight_in_vec_6_msg ;
  reg [7:0] \ccs_rtl_R_weight_in_vec_7_msg ;
  reg \ccs_rtl_R_accum_out_vec_0_rdy ;
  reg \ccs_rtl_R_accum_out_vec_1_rdy ;
  reg \ccs_rtl_R_accum_out_vec_2_rdy ;
  reg \ccs_rtl_R_accum_out_vec_3_rdy ;
  reg \ccs_rtl_R_accum_out_vec_4_rdy ;
  reg \ccs_rtl_R_accum_out_vec_5_rdy ;
  reg \ccs_rtl_R_accum_out_vec_6_rdy ;
  reg \ccs_rtl_R_accum_out_vec_7_rdy ;

  SysTop_rtl  ccs_rtl (
     .clk(\ccs_rtl_R_clk ),
     .rst(\ccs_rtl_R_rst ),
     .write_req_val(\ccs_rtl_R_write_req_val ),
     .write_req_msg(\ccs_rtl_R_write_req_msg ),
     .start_val(\ccs_rtl_R_start_val ),
     .start_msg(\ccs_rtl_R_start_msg ),
     .weight_in_vec_0_val(\ccs_rtl_R_weight_in_vec_0_val ),
     .weight_in_vec_1_val(\ccs_rtl_R_weight_in_vec_1_val ),
     .weight_in_vec_2_val(\ccs_rtl_R_weight_in_vec_2_val ),
     .weight_in_vec_3_val(\ccs_rtl_R_weight_in_vec_3_val ),
     .weight_in_vec_4_val(\ccs_rtl_R_weight_in_vec_4_val ),
     .weight_in_vec_5_val(\ccs_rtl_R_weight_in_vec_5_val ),
     .weight_in_vec_6_val(\ccs_rtl_R_weight_in_vec_6_val ),
     .weight_in_vec_7_val(\ccs_rtl_R_weight_in_vec_7_val ),
     .weight_in_vec_0_msg(\ccs_rtl_R_weight_in_vec_0_msg ),
     .weight_in_vec_1_msg(\ccs_rtl_R_weight_in_vec_1_msg ),
     .weight_in_vec_2_msg(\ccs_rtl_R_weight_in_vec_2_msg ),
     .weight_in_vec_3_msg(\ccs_rtl_R_weight_in_vec_3_msg ),
     .weight_in_vec_4_msg(\ccs_rtl_R_weight_in_vec_4_msg ),
     .weight_in_vec_5_msg(\ccs_rtl_R_weight_in_vec_5_msg ),
     .weight_in_vec_6_msg(\ccs_rtl_R_weight_in_vec_6_msg ),
     .weight_in_vec_7_msg(\ccs_rtl_R_weight_in_vec_7_msg ),
     .accum_out_vec_0_rdy(\ccs_rtl_R_accum_out_vec_0_rdy ),
     .accum_out_vec_1_rdy(\ccs_rtl_R_accum_out_vec_1_rdy ),
     .accum_out_vec_2_rdy(\ccs_rtl_R_accum_out_vec_2_rdy ),
     .accum_out_vec_3_rdy(\ccs_rtl_R_accum_out_vec_3_rdy ),
     .accum_out_vec_4_rdy(\ccs_rtl_R_accum_out_vec_4_rdy ),
     .accum_out_vec_5_rdy(\ccs_rtl_R_accum_out_vec_5_rdy ),
     .accum_out_vec_6_rdy(\ccs_rtl_R_accum_out_vec_6_rdy ),
     .accum_out_vec_7_rdy(\ccs_rtl_R_accum_out_vec_7_rdy )
  );

endmodule

// TOP-MODULE sYsTeMcToP
(*vcs_systemc_2,vcs_systemc_skel*) module sYsTeMcToP;

  \my_testbench.top$  \my_testbench.top ();

endmodule

