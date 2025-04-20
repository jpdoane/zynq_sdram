`timescale 1ns/1ps

module sdram_io
(
    // internal io w/ core
    input          clk,
    input          sdram_core_cke,
    input          sdram_core_cs,
    input          sdram_core_ras,
    input          sdram_core_cas,
    input          sdram_core_we,
    input [  1:0]  sdram_core_dqm,
    input [ 12:0]  sdram_core_addr,
    input [  1:0]  sdram_core_ba,
    input [ 15:0]  sdram_core_data_output,
    input          sdram_core_data_out_en,
    output  [ 15:0] sdram_core_data_input,


    // external io w/ part
    output          clk_sdram,
    output          sdram_cke,
    output          sdram_cs_n,
    output          sdram_ras_n,
    output          sdram_cas_n,
    output          sdram_we_n,
    output          sdram_ldqm,
    output          sdram_udqm,
    output [ 12:0]  sdram_a,
    output [  1:0]  sdram_bs,
    inout [15:0]    sdram_dq
);

  ODDR2 
  #(
      .DDR_ALIGNMENT("NONE"),
      .INIT(1'b0),
      .SRTYPE("SYNC")
  )
  u_clock_delay
  (
      .Q(clk_sdram),
      .C0(clk),
      .C1(~clk),
      .CE(1'b1),
      .R(1'b0),
      .S(1'b0),
      .D0(1'b0),
      .D1(1'b1)
  );

  assign sdram_cke = sdram_core_cke;
  assign sdram_cs_n = sdram_core_cs;
  assign sdram_ras_n = sdram_core_ras;
  assign sdram_cas_n = sdram_core_cas;
  assign sdram_we_n = sdram_core_we;
  assign sdram_udqm = sdram_core_dqm[1];
  assign sdram_ldqm = sdram_core_dqm[0];
  assign sdram_a = sdram_core_addr;
  assign sdram_bs = sdram_core_ba;


  genvar i;
  for (i=0; i < 16; i = i + 1) 
  begin
    IOBUF 
    #(
      .DRIVE(12),
      .IOSTANDARD("LVTTL"),
      .SLEW("FAST")
    )
    u_data_buf
    (
      .O(sdram_core_data_input[i]),
      .IO(sdram_dq[i]),
      .I(sdram_core_data_output[i]),
      .T(~sdram_core_data_out_en)
    );
  end


endmodule
