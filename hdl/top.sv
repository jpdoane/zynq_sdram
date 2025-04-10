`timescale 1ns/1ps

module zynq_sdram
(
    input CLK_125MHZ,

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
    output logic sdram_udqm  
);

  assign LED = btn;

  wire FCLK0;
  wire FRST0;
  wire axi_clk = FCLK0;
  wire axi_rst = FRST0;
  wire [31:0]M_AXI_GP0_araddr;
  wire [1:0]M_AXI_GP0_arburst;
  wire [3:0]M_AXI_GP0_arcache;
  wire [11:0]M_AXI_GP0_arid;
  wire [3:0]M_AXI_GP0_arlen;
  wire [1:0]M_AXI_GP0_arlock;
  wire [2:0]M_AXI_GP0_arprot;
  wire [3:0]M_AXI_GP0_arqos;
  wire M_AXI_GP0_arready;
  wire [2:0]M_AXI_GP0_arsize;
  wire M_AXI_GP0_arvalid;
  wire [31:0]M_AXI_GP0_awaddr;
  wire [1:0]M_AXI_GP0_awburst;
  wire [3:0]M_AXI_GP0_awcache;
  wire [11:0]M_AXI_GP0_awid;
  wire [3:0]M_AXI_GP0_awlen;
  wire [1:0]M_AXI_GP0_awlock;
  wire [2:0]M_AXI_GP0_awprot;
  wire [3:0]M_AXI_GP0_awqos;
  wire M_AXI_GP0_awready;
  wire [2:0]M_AXI_GP0_awsize;
  wire M_AXI_GP0_awvalid;
  wire [11:0]M_AXI_GP0_bid;
  wire M_AXI_GP0_bready;
  wire [1:0]M_AXI_GP0_bresp;
  wire M_AXI_GP0_bvalid;
  wire [31:0]M_AXI_GP0_rdata;
  wire [11:0]M_AXI_GP0_rid;
  wire M_AXI_GP0_rlast;
  wire M_AXI_GP0_rready;
  wire [1:0]M_AXI_GP0_rresp;
  wire M_AXI_GP0_rvalid;
  wire [31:0]M_AXI_GP0_wdata;
  wire [11:0]M_AXI_GP0_wid;
  wire M_AXI_GP0_wlast;
  wire M_AXI_GP0_wready;
  wire [3:0]M_AXI_GP0_wstrb;
  wire M_AXI_GP0_wvalid;
  wire [1:0]USBIND_0_port_indctl;
  wire USBIND_0_vbus_pwrfault;
  wire USBIND_0_vbus_pwrselect;

  zynqps zynqps_i
       (.FCLK0(FCLK0),
        .FRST0(FRST0),
        .M_AXI_GP0_ACLK(axi_clk),
        .M_AXI_GP0_araddr(M_AXI_GP0_araddr),
        .M_AXI_GP0_arburst(M_AXI_GP0_arburst),
        .M_AXI_GP0_arcache(M_AXI_GP0_arcache),
        .M_AXI_GP0_arid(M_AXI_GP0_arid),
        .M_AXI_GP0_arlen(M_AXI_GP0_arlen),
        .M_AXI_GP0_arlock(M_AXI_GP0_arlock),
        .M_AXI_GP0_arprot(M_AXI_GP0_arprot),
        .M_AXI_GP0_arqos(M_AXI_GP0_arqos),
        .M_AXI_GP0_arready(M_AXI_GP0_arready),
        .M_AXI_GP0_arsize(M_AXI_GP0_arsize),
        .M_AXI_GP0_arvalid(M_AXI_GP0_arvalid),
        .M_AXI_GP0_awaddr(M_AXI_GP0_awaddr),
        .M_AXI_GP0_awburst(M_AXI_GP0_awburst),
        .M_AXI_GP0_awcache(M_AXI_GP0_awcache),
        .M_AXI_GP0_awid(M_AXI_GP0_awid),
        .M_AXI_GP0_awlen(M_AXI_GP0_awlen),
        .M_AXI_GP0_awlock(M_AXI_GP0_awlock),
        .M_AXI_GP0_awprot(M_AXI_GP0_awprot),
        .M_AXI_GP0_awqos(M_AXI_GP0_awqos),
        .M_AXI_GP0_awready(M_AXI_GP0_awready),
        .M_AXI_GP0_awsize(M_AXI_GP0_awsize),
        .M_AXI_GP0_awvalid(M_AXI_GP0_awvalid),
        .M_AXI_GP0_bid(M_AXI_GP0_bid),
        .M_AXI_GP0_bready(M_AXI_GP0_bready),
        .M_AXI_GP0_bresp(M_AXI_GP0_bresp),
        .M_AXI_GP0_bvalid(M_AXI_GP0_bvalid),
        .M_AXI_GP0_rdata(M_AXI_GP0_rdata),
        .M_AXI_GP0_rid(M_AXI_GP0_rid),
        .M_AXI_GP0_rlast(M_AXI_GP0_rlast),
        .M_AXI_GP0_rready(M_AXI_GP0_rready),
        .M_AXI_GP0_rresp(M_AXI_GP0_rresp),
        .M_AXI_GP0_rvalid(M_AXI_GP0_rvalid),
        .M_AXI_GP0_wdata(M_AXI_GP0_wdata),
        .M_AXI_GP0_wid(M_AXI_GP0_wid),
        .M_AXI_GP0_wlast(M_AXI_GP0_wlast),
        .M_AXI_GP0_wready(M_AXI_GP0_wready),
        .M_AXI_GP0_wstrb(M_AXI_GP0_wstrb),
        .M_AXI_GP0_wvalid(M_AXI_GP0_wvalid),
        .USBIND_0_port_indctl(USBIND_0_port_indctl),
        .USBIND_0_vbus_pwrfault(USBIND_0_vbus_pwrfault),
        .USBIND_0_vbus_pwrselect(USBIND_0_vbus_pwrselect));



wire [ 15:0]        sdram_data_in_w;
wire [ 15:0]        sdram_data_out_w;
wire                sdram_data_out_en_w;
wire [1:0]          sdram_dqm;

assign {sdram_udqm, sdram_ldqm} = sdram_dqm;

sdram_axi
u_sdram
(
     .clk_i(axi_clk)
    ,.rst_i(axi_rst)

    // AXI port
    ,.inport_awvalid_i( M_AXI_GP0_awvalid    )
    ,.inport_awaddr_i(  M_AXI_GP0_awaddr )
    ,.inport_awid_i(    M_AXI_GP0_awid   )
    ,.inport_awlen_i(   M_AXI_GP0_awlen  )
    ,.inport_awburst_i( M_AXI_GP0_awburst    )
    ,.inport_wvalid_i(  M_AXI_GP0_wvalid )
    ,.inport_wdata_i(   M_AXI_GP0_wdata  )
    ,.inport_wstrb_i(   M_AXI_GP0_wstrb  )
    ,.inport_wlast_i(   M_AXI_GP0_wlast  )
    ,.inport_bready_i(  M_AXI_GP0_bready )
    ,.inport_arvalid_i( M_AXI_GP0_arvalid    )
    ,.inport_araddr_i(  M_AXI_GP0_araddr )
    ,.inport_arid_i(    M_AXI_GP0_arid   )
    ,.inport_arlen_i(   M_AXI_GP0_arlen  )
    ,.inport_arburst_i( M_AXI_GP0_arburst    )
    ,.inport_rready_i(  M_AXI_GP0_rready )
    ,.inport_awready_o( M_AXI_GP0_awready    )
    ,.inport_wready_o(  M_AXI_GP0_wready )
    ,.inport_bvalid_o(  M_AXI_GP0_bvalid )
    ,.inport_bresp_o(   M_AXI_GP0_bresp  )
    ,.inport_bid_o(     M_AXI_GP0_bid    )
    ,.inport_arready_o( M_AXI_GP0_arready    )
    ,.inport_rvalid_o(  M_AXI_GP0_rvalid )
    ,.inport_rdata_o(   M_AXI_GP0_rdata  )
    ,.inport_rresp_o(   M_AXI_GP0_rresp  )
    ,.inport_rid_o(     M_AXI_GP0_rid    )
    ,.inport_rlast_o(   M_AXI_GP0_rlast  )

    // SDRAM Interface
    ,.sdram_clk_o()
    ,.sdram_cke_o(sdram_cke)
    ,.sdram_cs_o(sdram_cs_n)
    ,.sdram_ras_o(sdram_ras_n)
    ,.sdram_cas_o(sdram_cas_n)
    ,.sdram_we_o(sdram_we_n)
    ,.sdram_dqm_o(sdram_dqm)
    ,.sdram_addr_o(sdram_a)
    ,.sdram_ba_o(sdram_bs)
    ,.sdram_data_input_i(sdram_data_in_w)
    ,.sdram_data_output_o(sdram_data_out_w)
    ,.sdram_data_out_en_o(sdram_data_out_en_w)
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
    .C0(axi_clk),
    .C1(~axi_clk),
    .CE(1'b1),
    .R(1'b0),
    .S(1'b0),
    .D0(1'b0),
    .D1(1'b1)
);

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
    .O(sdram_data_in_w[i]),
    .IO(sdram_dq[i]),
    .I(sdram_data_out_w[i]),
    .T(~sdram_data_out_en_w)
  );
end


endmodule
