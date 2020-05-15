// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    10.4b/841621 Production Release
//  HLS Date:       Thu Oct 24 17:20:07 PDT 2019
// 
//  Generated by:   billyk@cad.eecs.harvard.edu
//  Generated date: Sun May  3 14:21:31 2020
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    Connections_OutBlocking_SysPE_AccumType_Connections_SYN_PORT_Push_core
// ------------------------------------------------------------------


module Connections_OutBlocking_SysPE_AccumType_Connections_SYN_PORT_Push_core (
  this_val, this_rdy, this_msg, m_rsc_dat, ccs_ccore_start_rsc_dat, ccs_ccore_done_sync_vld,
      ccs_MIO_clk, ccs_MIO_arst
);
  output this_val;
  reg this_val;
  input this_rdy;
  output [31:0] this_msg;
  reg [31:0] this_msg;
  input [31:0] m_rsc_dat;
  input ccs_ccore_start_rsc_dat;
  output ccs_ccore_done_sync_vld;
  input ccs_MIO_clk;
  input ccs_MIO_arst;


  // Interconnect Declarations
  wire [31:0] m_rsci_idat;
  wire ccs_ccore_start_rsci_idat;
  wire and_dcpl;
  reg io_read_ccs_ccore_start_rsc_sft_lpi_1_dfm_1;
  wire or_3_cse;
  wire this_val_mx0c1;


  // Interconnect Declarations for Component Instantiations 
  wire [0:0] nl_ccs_ccore_done_synci_ivld;
  assign nl_ccs_ccore_done_synci_ivld = io_read_ccs_ccore_start_rsc_sft_lpi_1_dfm_1
      & this_rdy;
  ccs_in_v1 #(.rscid(32'sd8),
  .width(32'sd32)) m_rsci (
      .dat(m_rsc_dat),
      .idat(m_rsci_idat)
    );
  ccs_in_v1 #(.rscid(32'sd213),
  .width(32'sd1)) ccs_ccore_start_rsci (
      .dat(ccs_ccore_start_rsc_dat),
      .idat(ccs_ccore_start_rsci_idat)
    );
  ccs_sync_out_vld_v1 #(.rscid(32'sd217)) ccs_ccore_done_synci (
      .vld(ccs_ccore_done_sync_vld),
      .ivld(nl_ccs_ccore_done_synci_ivld[0:0])
    );
  assign or_3_cse = ccs_ccore_start_rsci_idat | and_dcpl;
  assign and_dcpl = io_read_ccs_ccore_start_rsc_sft_lpi_1_dfm_1 & (~ this_rdy);
  assign this_val_mx0c1 = io_read_ccs_ccore_start_rsc_sft_lpi_1_dfm_1 & this_rdy
      & (~ ccs_ccore_start_rsci_idat);
  always @(posedge ccs_MIO_clk or negedge ccs_MIO_arst) begin
    if ( ~ ccs_MIO_arst ) begin
      this_val <= 1'b0;
    end
    else if ( or_3_cse | this_val_mx0c1 ) begin
      this_val <= ~ this_val_mx0c1;
    end
  end
  always @(posedge ccs_MIO_clk or negedge ccs_MIO_arst) begin
    if ( ~ ccs_MIO_arst ) begin
      this_msg <= 32'b00000000000000000000000000000000;
    end
    else if ( ~(and_dcpl | (~ ccs_ccore_start_rsci_idat)) ) begin
      this_msg <= m_rsci_idat;
    end
  end
  always @(posedge ccs_MIO_clk or negedge ccs_MIO_arst) begin
    if ( ~ ccs_MIO_arst ) begin
      io_read_ccs_ccore_start_rsc_sft_lpi_1_dfm_1 <= 1'b0;
    end
    else begin
      io_read_ccs_ccore_start_rsc_sft_lpi_1_dfm_1 <= or_3_cse;
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    Connections_OutBlocking_SysPE_AccumType_Connections_SYN_PORT_Push
// ------------------------------------------------------------------


module Connections_OutBlocking_SysPE_AccumType_Connections_SYN_PORT_Push (
  this_val, this_rdy, this_msg, m_rsc_dat, ccs_ccore_start_rsc_dat, ccs_ccore_done_sync_vld,
      ccs_MIO_clk, ccs_MIO_arst
);
  output this_val;
  input this_rdy;
  output [31:0] this_msg;
  input [31:0] m_rsc_dat;
  input ccs_ccore_start_rsc_dat;
  output ccs_ccore_done_sync_vld;
  input ccs_MIO_clk;
  input ccs_MIO_arst;



  // Interconnect Declarations for Component Instantiations 
  Connections_OutBlocking_SysPE_AccumType_Connections_SYN_PORT_Push_core Connections_OutBlocking_SysPE_AccumType_Connections_SYN_PORT_Push_core_inst
      (
      .this_val(this_val),
      .this_rdy(this_rdy),
      .this_msg(this_msg),
      .m_rsc_dat(m_rsc_dat),
      .ccs_ccore_start_rsc_dat(ccs_ccore_start_rsc_dat),
      .ccs_ccore_done_sync_vld(ccs_ccore_done_sync_vld),
      .ccs_MIO_clk(ccs_MIO_clk),
      .ccs_MIO_arst(ccs_MIO_arst)
    );
endmodule


