`timescale 1ns/1ps

module zynq_sdram
(
    //GPIO
    input [1:0] SW,
    input [3:0] btn,
    output [3:0] LED,

    // sdram pins
    inout logic [15:0] sdram_dq,
    output logic [12:0] sdram_a,
    output logic [1:0] sdram_bs,
    output logic clk_sdram,
    output logic sdram_cke,
    output logic sdram_we_n,
    output logic sdram_cas_n,
    output logic sdram_ras_n,
    output logic sdram_cs_n,
    output logic sdram_ldqm,
    output logic sdram_udqm,

    // DDR and other IO
    inout [14:0]DDR_addr,
    inout [2:0]DDR_ba,
    inout DDR_cas_n,
    inout DDR_ck_n,
    inout DDR_ck_p,
    inout DDR_cke,
    inout DDR_cs_n,
    inout [3:0]DDR_dm,
    inout [31:0]DDR_dq,
    inout [3:0]DDR_dqs_n,
    inout [3:0]DDR_dqs_p,
    inout DDR_odt,
    inout DDR_ras_n,
    inout DDR_reset_n,
    inout DDR_we_n,
    inout FIXED_IO_ddr_vrn,
    inout FIXED_IO_ddr_vrp,
    inout [53:0]FIXED_IO_mio,
    inout FIXED_IO_ps_clk,
    inout FIXED_IO_ps_porb,
    inout FIXED_IO_ps_srstb
);

  assign LED[0] = SW[0];
  assign LED[1] = 1;

  wire ACLK;
  wire ARST;
  wire ARSTN;

  wire [31:0]AXI_SDRAM_araddr;
  wire [1:0]AXI_SDRAM_arburst;
  wire [3:0]AXI_SDRAM_arcache;
  wire [7:0]AXI_SDRAM_arlen;
  wire [0:0]AXI_SDRAM_arlock;
  wire [2:0]AXI_SDRAM_arprot;
  wire [3:0]AXI_SDRAM_arqos;
  wire AXI_SDRAM_arready;
  wire [2:0]AXI_SDRAM_arsize;
  wire AXI_SDRAM_arvalid;
  wire [31:0]AXI_SDRAM_awaddr;
  wire [1:0]AXI_SDRAM_awburst;
  wire [3:0]AXI_SDRAM_awcache;
  wire [7:0]AXI_SDRAM_awlen;
  wire [0:0]AXI_SDRAM_awlock;
  wire [2:0]AXI_SDRAM_awprot;
  wire [3:0]AXI_SDRAM_awqos;
  wire AXI_SDRAM_awready;
  wire [2:0]AXI_SDRAM_awsize;
  wire AXI_SDRAM_awvalid;
  wire AXI_SDRAM_bready;
  wire [1:0]AXI_SDRAM_bresp;
  wire AXI_SDRAM_bvalid;
  wire [31:0]AXI_SDRAM_rdata;
  wire AXI_SDRAM_rlast;
  wire AXI_SDRAM_rready;
  wire [1:0]AXI_SDRAM_rresp;
  wire AXI_SDRAM_rvalid;
  wire [31:0]AXI_SDRAM_wdata;
  wire AXI_SDRAM_wlast;
  wire AXI_SDRAM_wready;
  wire [3:0]AXI_SDRAM_wstrb;
  wire AXI_SDRAM_wvalid;
  // wire [31:0]M01_AXI_0_araddr;
  // wire [1:0]M01_AXI_0_arburst;
  // wire [3:0]M01_AXI_0_arcache;
  // wire [7:0]M01_AXI_0_arlen;
  // wire [0:0]M01_AXI_0_arlock;
  // wire [2:0]M01_AXI_0_arprot;
  // wire [3:0]M01_AXI_0_arqos;
  // wire M01_AXI_0_arready;
  // wire [2:0]M01_AXI_0_arsize;
  // wire M01_AXI_0_arvalid;
  // wire [31:0]M01_AXI_0_awaddr;
  // wire [1:0]M01_AXI_0_awburst;
  // wire [3:0]M01_AXI_0_awcache;
  // wire [7:0]M01_AXI_0_awlen;
  // wire [0:0]M01_AXI_0_awlock;
  // wire [2:0]M01_AXI_0_awprot;
  // wire [3:0]M01_AXI_0_awqos;
  // wire M01_AXI_0_awready;
  // wire [2:0]M01_AXI_0_awsize;
  // wire M01_AXI_0_awvalid;
  // wire M01_AXI_0_bready;
  // wire [1:0]M01_AXI_0_bresp;
  // wire M01_AXI_0_bvalid;
  // wire [31:0]M01_AXI_0_rdata;
  // wire M01_AXI_0_rlast;
  // wire M01_AXI_0_rready;
  // wire [1:0]M01_AXI_0_rresp;
  // wire M01_AXI_0_rvalid;
  // wire [31:0]M01_AXI_0_wdata;
  // wire M01_AXI_0_wlast;
  // wire M01_AXI_0_wready;
  // wire [3:0]M01_AXI_0_wstrb;
  // wire M01_AXI_0_wvalid;


  wire          sdram_core_cke;
  wire          sdram_core_cs;
  wire          sdram_core_ras;
  wire          sdram_core_cas;
  wire          sdram_core_we;
  wire [  1:0]  sdram_core_dqm;
  wire [ 12:0]  sdram_core_addr;
  wire [  1:0]  sdram_core_ba;
  wire [ 15:0]  sdram_core_data_output;
  wire          sdram_core_data_out_en;
  wire  [ 15:0] sdram_core_data_input;

  zynq_ps_axi
  u_zynq
  (
  .ACLK_in              (ACLK),
  .ARST                 (ARST),
  .ARSTN                (ARSTN),
//   .CLK1                 (ACLK),
  .CLK2                 (ACLK),
  .DDR_addr             (DDR_addr),
  .DDR_ba               (DDR_ba),
  .DDR_cas_n            (DDR_cas_n),
  .DDR_ck_n             (DDR_ck_n),
  .DDR_ck_p             (DDR_ck_p),
  .DDR_cke              (DDR_cke),
  .DDR_cs_n             (DDR_cs_n),
  .DDR_dm               (DDR_dm),
  .DDR_dq               (DDR_dq),
  .DDR_dqs_n            (DDR_dqs_n),
  .DDR_dqs_p            (DDR_dqs_p),
  .DDR_odt              (DDR_odt),
  .DDR_ras_n            (DDR_ras_n),
  .DDR_reset_n          (DDR_reset_n),
  .DDR_we_n             (DDR_we_n),
  .FIXED_IO_ddr_vrn     (FIXED_IO_ddr_vrn),
  .FIXED_IO_ddr_vrp     (FIXED_IO_ddr_vrp),
  .FIXED_IO_mio         (FIXED_IO_mio),
  .FIXED_IO_ps_clk      (FIXED_IO_ps_clk),
  .FIXED_IO_ps_porb     (FIXED_IO_ps_porb),
  .FIXED_IO_ps_srstb    (FIXED_IO_ps_srstb),
  .M00_AXI_0_araddr     (AXI_SDRAM_araddr),
  .M00_AXI_0_arburst    (AXI_SDRAM_arburst),
  .M00_AXI_0_arcache    (AXI_SDRAM_arcache),
  .M00_AXI_0_arlen      (AXI_SDRAM_arlen),
  .M00_AXI_0_arlock     (AXI_SDRAM_arlock),
  .M00_AXI_0_arprot     (AXI_SDRAM_arprot),
  .M00_AXI_0_arqos      (AXI_SDRAM_arqos),
  .M00_AXI_0_arready    (AXI_SDRAM_arready),
  .M00_AXI_0_arsize     (AXI_SDRAM_arsize),
  .M00_AXI_0_arvalid    (AXI_SDRAM_arvalid),
  .M00_AXI_0_awaddr     (AXI_SDRAM_awaddr),
  .M00_AXI_0_awburst    (AXI_SDRAM_awburst),
  .M00_AXI_0_awcache    (AXI_SDRAM_awcache),
  .M00_AXI_0_awlen      (AXI_SDRAM_awlen),
  .M00_AXI_0_awlock     (AXI_SDRAM_awlock),
  .M00_AXI_0_awprot     (AXI_SDRAM_awprot),
  .M00_AXI_0_awqos      (AXI_SDRAM_awqos),
  .M00_AXI_0_awready    (AXI_SDRAM_awready),
  .M00_AXI_0_awsize     (AXI_SDRAM_awsize),
  .M00_AXI_0_awvalid    (AXI_SDRAM_awvalid),
  .M00_AXI_0_bready     (AXI_SDRAM_bready),
  .M00_AXI_0_bresp      (AXI_SDRAM_bresp),
  .M00_AXI_0_bvalid     (AXI_SDRAM_bvalid),
  .M00_AXI_0_rdata      (AXI_SDRAM_rdata),
  .M00_AXI_0_rlast      (AXI_SDRAM_rlast),
  .M00_AXI_0_rready     (AXI_SDRAM_rready),
  .M00_AXI_0_rresp      (AXI_SDRAM_rresp),
  .M00_AXI_0_rvalid     (AXI_SDRAM_rvalid),
  .M00_AXI_0_wdata      (AXI_SDRAM_wdata),
  .M00_AXI_0_wlast      (AXI_SDRAM_wlast),
  .M00_AXI_0_wready     (AXI_SDRAM_wready),
  .M00_AXI_0_wstrb      (AXI_SDRAM_wstrb),
  .M00_AXI_0_wvalid     (AXI_SDRAM_wvalid)
  // .M01_AXI_0_araddr     (M01_AXI_0_araddr),
  // .M01_AXI_0_arburst    (M01_AXI_0_arburst),
  // .M01_AXI_0_arcache    (M01_AXI_0_arcache),
  // .M01_AXI_0_arlen      (M01_AXI_0_arlen),
  // .M01_AXI_0_arlock     (M01_AXI_0_arlock),
  // .M01_AXI_0_arprot     (M01_AXI_0_arprot),
  // .M01_AXI_0_arqos      (M01_AXI_0_arqos),
  // .M01_AXI_0_arready    (M01_AXI_0_arready),
  // .M01_AXI_0_arsize     (M01_AXI_0_arsize),
  // .M01_AXI_0_arvalid    (M01_AXI_0_arvalid),
  // .M01_AXI_0_awaddr     (M01_AXI_0_awaddr),
  // .M01_AXI_0_awburst    (M01_AXI_0_awburst),
  // .M01_AXI_0_awcache    (M01_AXI_0_awcache),
  // .M01_AXI_0_awlen      (M01_AXI_0_awlen),
  // .M01_AXI_0_awlock     (M01_AXI_0_awlock),
  // .M01_AXI_0_awprot     (M01_AXI_0_awprot),
  // .M01_AXI_0_awqos      (M01_AXI_0_awqos),
  // .M01_AXI_0_awready    (M01_AXI_0_awready),
  // .M01_AXI_0_awsize     (M01_AXI_0_awsize),
  // .M01_AXI_0_awvalid    (M01_AXI_0_awvalid),
  // .M01_AXI_0_bready     (M01_AXI_0_bready),
  // .M01_AXI_0_bresp      (M01_AXI_0_bresp),
  // .M01_AXI_0_bvalid     (M01_AXI_0_bvalid),
  // .M01_AXI_0_rdata      (M01_AXI_0_rdata),
  // .M01_AXI_0_rlast      (M01_AXI_0_rlast),
  // .M01_AXI_0_rready     (M01_AXI_0_rready),
  // .M01_AXI_0_rresp      (M01_AXI_0_rresp),
  // .M01_AXI_0_rvalid     (M01_AXI_0_rvalid),
  // .M01_AXI_0_wdata      (M01_AXI_0_wdata),
  // .M01_AXI_0_wlast      (M01_AXI_0_wlast),
  // .M01_AXI_0_wready     (M01_AXI_0_wready),
  // .M01_AXI_0_wstrb      (M01_AXI_0_wstrb),
  // .M01_AXI_0_wvalid     (M01_AXI_0_wvalid)
  );


sdram_axi
u_sdram_axi
(
     .ACLK              (ACLK),
    .ARSTN              (ARSTN),
    .S00_AXI_awvalid    (AXI_SDRAM_awvalid),
    .S00_AXI_awaddr     (AXI_SDRAM_awaddr),
    .S00_AXI_awlen      (AXI_SDRAM_awlen),
    .S00_AXI_awburst    (AXI_SDRAM_awburst),
    .S00_AXI_wvalid     (AXI_SDRAM_wvalid),
    .S00_AXI_wdata      (AXI_SDRAM_wdata),
    .S00_AXI_wstrb      (AXI_SDRAM_wstrb),
    .S00_AXI_wlast      (AXI_SDRAM_wlast),
    .S00_AXI_bready     (AXI_SDRAM_bready),
    .S00_AXI_arvalid    (AXI_SDRAM_arvalid),
    .S00_AXI_araddr     (AXI_SDRAM_araddr),
    .S00_AXI_arlen      (AXI_SDRAM_arlen),
    .S00_AXI_arburst    (AXI_SDRAM_arburst),
    .S00_AXI_rready     (AXI_SDRAM_rready),
    .sdram_data_input   (sdram_core_data_input),
    .S00_AXI_awready    (AXI_SDRAM_awready),
    .S00_AXI_wready     (AXI_SDRAM_wready),
    .S00_AXI_bvalid     (AXI_SDRAM_bvalid),
    .S00_AXI_bresp      (AXI_SDRAM_bresp),
    .S00_AXI_arready    (AXI_SDRAM_arready),
    .S00_AXI_rvalid     (AXI_SDRAM_rvalid),
    .S00_AXI_rdata      (AXI_SDRAM_rdata),
    .S00_AXI_rresp      (AXI_SDRAM_rresp),
    .S00_AXI_rlast      (AXI_SDRAM_rlast),
    .sdram_cke          (sdram_core_cke),
    .sdram_cs           (sdram_core_cs),
    .sdram_ras          (sdram_core_ras),
    .sdram_cas          (sdram_core_cas),
    .sdram_we           (sdram_core_we),
    .sdram_dqm          (sdram_core_dqm),
    .sdram_addr         (sdram_core_addr),
    .sdram_ba           (sdram_core_ba),
    .sdram_data_output  (sdram_core_data_output),
    .sdram_data_out_en  (sdram_core_data_out_en)
);


sdram_io
u_sdram_io
(
    .clk                     (ACLK),
    .sdram_core_cke          (sdram_core_cke),
    .sdram_core_cs           (sdram_core_cs),
    .sdram_core_ras          (sdram_core_ras),
    .sdram_core_cas          (sdram_core_cas),
    .sdram_core_we           (sdram_core_we),
    .sdram_core_dqm          (sdram_core_dqm),
    .sdram_core_addr         (sdram_core_addr),
    .sdram_core_ba           (sdram_core_ba),
    .sdram_core_data_output  (sdram_core_data_output),
    .sdram_core_data_out_en  (sdram_core_data_out_en),
    .sdram_core_data_input   (sdram_core_data_input),
    .clk_sdram               (clk_sdram),
    .sdram_cke               (sdram_cke),
    .sdram_cs_n              (sdram_cs_n),
    .sdram_ras_n             (sdram_ras_n),
    .sdram_cas_n             (sdram_cas_n),
    .sdram_we_n              (sdram_we_n),
    .sdram_ldqm              (sdram_ldqm),
    .sdram_udqm              (sdram_udqm),
    .sdram_a                 (sdram_a),
    .sdram_bs                (sdram_bs),
    .sdram_dq                (sdram_dq)
);

endmodule
