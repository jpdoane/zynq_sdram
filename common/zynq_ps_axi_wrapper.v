//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Fri Apr 18 22:33:32 2025
//Host        : rivendell running 64-bit Ubuntu 24.04.2 LTS
//Command     : generate_target zynq_ps_axi_wrapper.bd
//Design      : zynq_ps_axi_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module zynq_ps_axi_wrapper
   (ACLK_in,
    ARST,
    ARSTN,
    CLK1,
    CLK2,
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    M00_AXI_0_araddr,
    M00_AXI_0_arburst,
    M00_AXI_0_arcache,
    M00_AXI_0_arlen,
    M00_AXI_0_arlock,
    M00_AXI_0_arprot,
    M00_AXI_0_arqos,
    M00_AXI_0_arready,
    M00_AXI_0_arsize,
    M00_AXI_0_arvalid,
    M00_AXI_0_awaddr,
    M00_AXI_0_awburst,
    M00_AXI_0_awcache,
    M00_AXI_0_awlen,
    M00_AXI_0_awlock,
    M00_AXI_0_awprot,
    M00_AXI_0_awqos,
    M00_AXI_0_awready,
    M00_AXI_0_awsize,
    M00_AXI_0_awvalid,
    M00_AXI_0_bready,
    M00_AXI_0_bresp,
    M00_AXI_0_bvalid,
    M00_AXI_0_rdata,
    M00_AXI_0_rlast,
    M00_AXI_0_rready,
    M00_AXI_0_rresp,
    M00_AXI_0_rvalid,
    M00_AXI_0_wdata,
    M00_AXI_0_wlast,
    M00_AXI_0_wready,
    M00_AXI_0_wstrb,
    M00_AXI_0_wvalid,
    M01_AXI_0_araddr,
    M01_AXI_0_arburst,
    M01_AXI_0_arcache,
    M01_AXI_0_arlen,
    M01_AXI_0_arlock,
    M01_AXI_0_arprot,
    M01_AXI_0_arqos,
    M01_AXI_0_arready,
    M01_AXI_0_arsize,
    M01_AXI_0_arvalid,
    M01_AXI_0_awaddr,
    M01_AXI_0_awburst,
    M01_AXI_0_awcache,
    M01_AXI_0_awlen,
    M01_AXI_0_awlock,
    M01_AXI_0_awprot,
    M01_AXI_0_awqos,
    M01_AXI_0_awready,
    M01_AXI_0_awsize,
    M01_AXI_0_awvalid,
    M01_AXI_0_bready,
    M01_AXI_0_bresp,
    M01_AXI_0_bvalid,
    M01_AXI_0_rdata,
    M01_AXI_0_rlast,
    M01_AXI_0_rready,
    M01_AXI_0_rresp,
    M01_AXI_0_rvalid,
    M01_AXI_0_wdata,
    M01_AXI_0_wlast,
    M01_AXI_0_wready,
    M01_AXI_0_wstrb,
    M01_AXI_0_wvalid);
  input ACLK_in;
  output [0:0]ARST;
  output [0:0]ARSTN;
  output CLK1;
  output CLK2;
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output [31:0]M00_AXI_0_araddr;
  output [1:0]M00_AXI_0_arburst;
  output [3:0]M00_AXI_0_arcache;
  output [7:0]M00_AXI_0_arlen;
  output [0:0]M00_AXI_0_arlock;
  output [2:0]M00_AXI_0_arprot;
  output [3:0]M00_AXI_0_arqos;
  input M00_AXI_0_arready;
  output [2:0]M00_AXI_0_arsize;
  output M00_AXI_0_arvalid;
  output [31:0]M00_AXI_0_awaddr;
  output [1:0]M00_AXI_0_awburst;
  output [3:0]M00_AXI_0_awcache;
  output [7:0]M00_AXI_0_awlen;
  output [0:0]M00_AXI_0_awlock;
  output [2:0]M00_AXI_0_awprot;
  output [3:0]M00_AXI_0_awqos;
  input M00_AXI_0_awready;
  output [2:0]M00_AXI_0_awsize;
  output M00_AXI_0_awvalid;
  output M00_AXI_0_bready;
  input [1:0]M00_AXI_0_bresp;
  input M00_AXI_0_bvalid;
  input [31:0]M00_AXI_0_rdata;
  input M00_AXI_0_rlast;
  output M00_AXI_0_rready;
  input [1:0]M00_AXI_0_rresp;
  input M00_AXI_0_rvalid;
  output [31:0]M00_AXI_0_wdata;
  output M00_AXI_0_wlast;
  input M00_AXI_0_wready;
  output [3:0]M00_AXI_0_wstrb;
  output M00_AXI_0_wvalid;
  output [31:0]M01_AXI_0_araddr;
  output [1:0]M01_AXI_0_arburst;
  output [3:0]M01_AXI_0_arcache;
  output [7:0]M01_AXI_0_arlen;
  output [0:0]M01_AXI_0_arlock;
  output [2:0]M01_AXI_0_arprot;
  output [3:0]M01_AXI_0_arqos;
  input M01_AXI_0_arready;
  output [2:0]M01_AXI_0_arsize;
  output M01_AXI_0_arvalid;
  output [31:0]M01_AXI_0_awaddr;
  output [1:0]M01_AXI_0_awburst;
  output [3:0]M01_AXI_0_awcache;
  output [7:0]M01_AXI_0_awlen;
  output [0:0]M01_AXI_0_awlock;
  output [2:0]M01_AXI_0_awprot;
  output [3:0]M01_AXI_0_awqos;
  input M01_AXI_0_awready;
  output [2:0]M01_AXI_0_awsize;
  output M01_AXI_0_awvalid;
  output M01_AXI_0_bready;
  input [1:0]M01_AXI_0_bresp;
  input M01_AXI_0_bvalid;
  input [31:0]M01_AXI_0_rdata;
  input M01_AXI_0_rlast;
  output M01_AXI_0_rready;
  input [1:0]M01_AXI_0_rresp;
  input M01_AXI_0_rvalid;
  output [31:0]M01_AXI_0_wdata;
  output M01_AXI_0_wlast;
  input M01_AXI_0_wready;
  output [3:0]M01_AXI_0_wstrb;
  output M01_AXI_0_wvalid;

  wire ACLK_in;
  wire [0:0]ARST;
  wire [0:0]ARSTN;
  wire CLK1;
  wire CLK2;
  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [31:0]M00_AXI_0_araddr;
  wire [1:0]M00_AXI_0_arburst;
  wire [3:0]M00_AXI_0_arcache;
  wire [7:0]M00_AXI_0_arlen;
  wire [0:0]M00_AXI_0_arlock;
  wire [2:0]M00_AXI_0_arprot;
  wire [3:0]M00_AXI_0_arqos;
  wire M00_AXI_0_arready;
  wire [2:0]M00_AXI_0_arsize;
  wire M00_AXI_0_arvalid;
  wire [31:0]M00_AXI_0_awaddr;
  wire [1:0]M00_AXI_0_awburst;
  wire [3:0]M00_AXI_0_awcache;
  wire [7:0]M00_AXI_0_awlen;
  wire [0:0]M00_AXI_0_awlock;
  wire [2:0]M00_AXI_0_awprot;
  wire [3:0]M00_AXI_0_awqos;
  wire M00_AXI_0_awready;
  wire [2:0]M00_AXI_0_awsize;
  wire M00_AXI_0_awvalid;
  wire M00_AXI_0_bready;
  wire [1:0]M00_AXI_0_bresp;
  wire M00_AXI_0_bvalid;
  wire [31:0]M00_AXI_0_rdata;
  wire M00_AXI_0_rlast;
  wire M00_AXI_0_rready;
  wire [1:0]M00_AXI_0_rresp;
  wire M00_AXI_0_rvalid;
  wire [31:0]M00_AXI_0_wdata;
  wire M00_AXI_0_wlast;
  wire M00_AXI_0_wready;
  wire [3:0]M00_AXI_0_wstrb;
  wire M00_AXI_0_wvalid;
  wire [31:0]M01_AXI_0_araddr;
  wire [1:0]M01_AXI_0_arburst;
  wire [3:0]M01_AXI_0_arcache;
  wire [7:0]M01_AXI_0_arlen;
  wire [0:0]M01_AXI_0_arlock;
  wire [2:0]M01_AXI_0_arprot;
  wire [3:0]M01_AXI_0_arqos;
  wire M01_AXI_0_arready;
  wire [2:0]M01_AXI_0_arsize;
  wire M01_AXI_0_arvalid;
  wire [31:0]M01_AXI_0_awaddr;
  wire [1:0]M01_AXI_0_awburst;
  wire [3:0]M01_AXI_0_awcache;
  wire [7:0]M01_AXI_0_awlen;
  wire [0:0]M01_AXI_0_awlock;
  wire [2:0]M01_AXI_0_awprot;
  wire [3:0]M01_AXI_0_awqos;
  wire M01_AXI_0_awready;
  wire [2:0]M01_AXI_0_awsize;
  wire M01_AXI_0_awvalid;
  wire M01_AXI_0_bready;
  wire [1:0]M01_AXI_0_bresp;
  wire M01_AXI_0_bvalid;
  wire [31:0]M01_AXI_0_rdata;
  wire M01_AXI_0_rlast;
  wire M01_AXI_0_rready;
  wire [1:0]M01_AXI_0_rresp;
  wire M01_AXI_0_rvalid;
  wire [31:0]M01_AXI_0_wdata;
  wire M01_AXI_0_wlast;
  wire M01_AXI_0_wready;
  wire [3:0]M01_AXI_0_wstrb;
  wire M01_AXI_0_wvalid;

  zynq_ps_axi zynq_ps_axi_i
       (.ACLK_in(ACLK_in),
        .ARST(ARST),
        .ARSTN(ARSTN),
        .CLK1(CLK1),
        .CLK2(CLK2),
        .DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .M00_AXI_0_araddr(M00_AXI_0_araddr),
        .M00_AXI_0_arburst(M00_AXI_0_arburst),
        .M00_AXI_0_arcache(M00_AXI_0_arcache),
        .M00_AXI_0_arlen(M00_AXI_0_arlen),
        .M00_AXI_0_arlock(M00_AXI_0_arlock),
        .M00_AXI_0_arprot(M00_AXI_0_arprot),
        .M00_AXI_0_arqos(M00_AXI_0_arqos),
        .M00_AXI_0_arready(M00_AXI_0_arready),
        .M00_AXI_0_arsize(M00_AXI_0_arsize),
        .M00_AXI_0_arvalid(M00_AXI_0_arvalid),
        .M00_AXI_0_awaddr(M00_AXI_0_awaddr),
        .M00_AXI_0_awburst(M00_AXI_0_awburst),
        .M00_AXI_0_awcache(M00_AXI_0_awcache),
        .M00_AXI_0_awlen(M00_AXI_0_awlen),
        .M00_AXI_0_awlock(M00_AXI_0_awlock),
        .M00_AXI_0_awprot(M00_AXI_0_awprot),
        .M00_AXI_0_awqos(M00_AXI_0_awqos),
        .M00_AXI_0_awready(M00_AXI_0_awready),
        .M00_AXI_0_awsize(M00_AXI_0_awsize),
        .M00_AXI_0_awvalid(M00_AXI_0_awvalid),
        .M00_AXI_0_bready(M00_AXI_0_bready),
        .M00_AXI_0_bresp(M00_AXI_0_bresp),
        .M00_AXI_0_bvalid(M00_AXI_0_bvalid),
        .M00_AXI_0_rdata(M00_AXI_0_rdata),
        .M00_AXI_0_rlast(M00_AXI_0_rlast),
        .M00_AXI_0_rready(M00_AXI_0_rready),
        .M00_AXI_0_rresp(M00_AXI_0_rresp),
        .M00_AXI_0_rvalid(M00_AXI_0_rvalid),
        .M00_AXI_0_wdata(M00_AXI_0_wdata),
        .M00_AXI_0_wlast(M00_AXI_0_wlast),
        .M00_AXI_0_wready(M00_AXI_0_wready),
        .M00_AXI_0_wstrb(M00_AXI_0_wstrb),
        .M00_AXI_0_wvalid(M00_AXI_0_wvalid),
        .M01_AXI_0_araddr(M01_AXI_0_araddr),
        .M01_AXI_0_arburst(M01_AXI_0_arburst),
        .M01_AXI_0_arcache(M01_AXI_0_arcache),
        .M01_AXI_0_arlen(M01_AXI_0_arlen),
        .M01_AXI_0_arlock(M01_AXI_0_arlock),
        .M01_AXI_0_arprot(M01_AXI_0_arprot),
        .M01_AXI_0_arqos(M01_AXI_0_arqos),
        .M01_AXI_0_arready(M01_AXI_0_arready),
        .M01_AXI_0_arsize(M01_AXI_0_arsize),
        .M01_AXI_0_arvalid(M01_AXI_0_arvalid),
        .M01_AXI_0_awaddr(M01_AXI_0_awaddr),
        .M01_AXI_0_awburst(M01_AXI_0_awburst),
        .M01_AXI_0_awcache(M01_AXI_0_awcache),
        .M01_AXI_0_awlen(M01_AXI_0_awlen),
        .M01_AXI_0_awlock(M01_AXI_0_awlock),
        .M01_AXI_0_awprot(M01_AXI_0_awprot),
        .M01_AXI_0_awqos(M01_AXI_0_awqos),
        .M01_AXI_0_awready(M01_AXI_0_awready),
        .M01_AXI_0_awsize(M01_AXI_0_awsize),
        .M01_AXI_0_awvalid(M01_AXI_0_awvalid),
        .M01_AXI_0_bready(M01_AXI_0_bready),
        .M01_AXI_0_bresp(M01_AXI_0_bresp),
        .M01_AXI_0_bvalid(M01_AXI_0_bvalid),
        .M01_AXI_0_rdata(M01_AXI_0_rdata),
        .M01_AXI_0_rlast(M01_AXI_0_rlast),
        .M01_AXI_0_rready(M01_AXI_0_rready),
        .M01_AXI_0_rresp(M01_AXI_0_rresp),
        .M01_AXI_0_rvalid(M01_AXI_0_rvalid),
        .M01_AXI_0_wdata(M01_AXI_0_wdata),
        .M01_AXI_0_wlast(M01_AXI_0_wlast),
        .M01_AXI_0_wready(M01_AXI_0_wready),
        .M01_AXI_0_wstrb(M01_AXI_0_wstrb),
        .M01_AXI_0_wvalid(M01_AXI_0_wvalid));
endmodule
