//-----------------------------------------------------------------------------
// system.v
//-----------------------------------------------------------------------------

module system
  (
    zio,
    rzq,
    mcbx_dram_we_n,
    mcbx_dram_udqs_n,
    mcbx_dram_udqs,
    mcbx_dram_udm,
    mcbx_dram_ras_n,
    mcbx_dram_odt,
    mcbx_dram_ldm,
    mcbx_dram_dqs_n,
    mcbx_dram_dqs,
    mcbx_dram_dq,
    mcbx_dram_clk_n,
    mcbx_dram_clk,
    mcbx_dram_cke,
    mcbx_dram_cas_n,
    mcbx_dram_ba,
    mcbx_dram_addr,
    RS232_Uart_1_sout,
    RS232_Uart_1_sin,
    RESET,
    Push_Buttons_5Bits_TRI_I,
    LEDs_8Bits_TRI_O,
    GCLK,
    Ethernet_Lite_TX_EN,
    Ethernet_Lite_TX_CLK,
    Ethernet_Lite_TXD,
    Ethernet_Lite_RX_ER,
    Ethernet_Lite_RX_DV,
    Ethernet_Lite_RX_CLK,
    Ethernet_Lite_RXD,
    Ethernet_Lite_PHY_RST_N,
    Ethernet_Lite_MDIO,
    Ethernet_Lite_MDC,
    Ethernet_Lite_CRS,
    Ethernet_Lite_COL,
    DIP_Switches_8Bits_TRI_I,
    TMDS_TX_CLK_P,
    TMDS_TX_CLK_N,
    TMDS_TX_2_P,
    TMDS_TX_2_N,
    TMDS_TX_1_P,
    TMDS_TX_1_N,
    TMDS_TX_0_P,
    TMDS_TX_0_N,
    axi_hdmi_0_TMDS_RX_SDA_pin,
    CAMA_SDA,
    CAMA_PCLK_I,
    CAMA_D_I,
    CAMA_SCL,
    CAMA_FV_I,
    CAMA_MCLK_O,
    CAMA_RST_O,
    CAMA_PWDN_O,
    CAMX_VDDEN_O,
    CAMA_LV_I,
    chipscope_ila_0_TRIG0_pin,
    pmodjstk_top_0_MISO_pin,
    pmodjstk_top_0_MOSI_pin,
    pmodjstk_top_0_SS_pin,
    pmodjstk_top_0_SCLK_pin
  );
  inout zio;
  inout rzq;
  output mcbx_dram_we_n;
  inout mcbx_dram_udqs_n;
  inout mcbx_dram_udqs;
  output mcbx_dram_udm;
  output mcbx_dram_ras_n;
  output mcbx_dram_odt;
  output mcbx_dram_ldm;
  inout mcbx_dram_dqs_n;
  inout mcbx_dram_dqs;
  inout [15:0] mcbx_dram_dq;
  output mcbx_dram_clk_n;
  output mcbx_dram_clk;
  output mcbx_dram_cke;
  output mcbx_dram_cas_n;
  output [2:0] mcbx_dram_ba;
  output [12:0] mcbx_dram_addr;
  output RS232_Uart_1_sout;
  input RS232_Uart_1_sin;
  input RESET;
  input [0:4] Push_Buttons_5Bits_TRI_I;
  output [7:0] LEDs_8Bits_TRI_O;
  input GCLK;
  output Ethernet_Lite_TX_EN;
  (* BUFFER_TYPE = "IBUF" *)
  input Ethernet_Lite_TX_CLK;
  output [3:0] Ethernet_Lite_TXD;
  input Ethernet_Lite_RX_ER;
  input Ethernet_Lite_RX_DV;
  (* BUFFER_TYPE = "IBUF" *)
  input Ethernet_Lite_RX_CLK;
  input [3:0] Ethernet_Lite_RXD;
  output Ethernet_Lite_PHY_RST_N;
  inout Ethernet_Lite_MDIO;
  output Ethernet_Lite_MDC;
  input Ethernet_Lite_CRS;
  input Ethernet_Lite_COL;
  input [7:0] DIP_Switches_8Bits_TRI_I;
  output TMDS_TX_CLK_P;
  output TMDS_TX_CLK_N;
  output TMDS_TX_2_P;
  output TMDS_TX_2_N;
  output TMDS_TX_1_P;
  output TMDS_TX_1_N;
  output TMDS_TX_0_P;
  output TMDS_TX_0_N;
  inout axi_hdmi_0_TMDS_RX_SDA_pin;
  inout CAMA_SDA;
  input CAMA_PCLK_I;
  input [7:0] CAMA_D_I;
  inout CAMA_SCL;
  input CAMA_FV_I;
  output CAMA_MCLK_O;
  output CAMA_RST_O;
  output CAMA_PWDN_O;
  output CAMX_VDDEN_O;
  input CAMA_LV_I;
  input chipscope_ila_0_TRIG0_pin;
  input pmodjstk_top_0_MISO_pin;
  output pmodjstk_top_0_MOSI_pin;
  output pmodjstk_top_0_SS_pin;
  output pmodjstk_top_0_SCLK_pin;

  // Internal signals

  wire CAMA_SCL_I;
  wire CAMA_SCL_O;
  wire CAMA_SCL_T;
  wire CAMA_SDA_I;
  wire CAMA_SDA_O;
  wire CAMA_SDA_T;
  wire [0:0] Ethernet_Lite_IP2INTC_Irpt;
  wire Ethernet_Lite_MDIO_I;
  wire Ethernet_Lite_MDIO_O;
  wire Ethernet_Lite_MDIO_T;
  wire Ext_BRK;
  wire Ext_NM_BRK;
  wire [31:0] axi4_0_M_ARADDR;
  wire [1:0] axi4_0_M_ARBURST;
  wire [3:0] axi4_0_M_ARCACHE;
  wire [0:0] axi4_0_M_ARESETN;
  wire [1:0] axi4_0_M_ARID;
  wire [7:0] axi4_0_M_ARLEN;
  wire [1:0] axi4_0_M_ARLOCK;
  wire [2:0] axi4_0_M_ARPROT;
  wire [3:0] axi4_0_M_ARQOS;
  wire [0:0] axi4_0_M_ARREADY;
  wire [2:0] axi4_0_M_ARSIZE;
  wire [0:0] axi4_0_M_ARVALID;
  wire [31:0] axi4_0_M_AWADDR;
  wire [1:0] axi4_0_M_AWBURST;
  wire [3:0] axi4_0_M_AWCACHE;
  wire [1:0] axi4_0_M_AWID;
  wire [7:0] axi4_0_M_AWLEN;
  wire [1:0] axi4_0_M_AWLOCK;
  wire [2:0] axi4_0_M_AWPROT;
  wire [3:0] axi4_0_M_AWQOS;
  wire [0:0] axi4_0_M_AWREADY;
  wire [2:0] axi4_0_M_AWSIZE;
  wire [0:0] axi4_0_M_AWVALID;
  wire [1:0] axi4_0_M_BID;
  wire [0:0] axi4_0_M_BREADY;
  wire [1:0] axi4_0_M_BRESP;
  wire [0:0] axi4_0_M_BVALID;
  wire [31:0] axi4_0_M_RDATA;
  wire [1:0] axi4_0_M_RID;
  wire [0:0] axi4_0_M_RLAST;
  wire [0:0] axi4_0_M_RREADY;
  wire [1:0] axi4_0_M_RRESP;
  wire [0:0] axi4_0_M_RVALID;
  wire [31:0] axi4_0_M_WDATA;
  wire [0:0] axi4_0_M_WLAST;
  wire [0:0] axi4_0_M_WREADY;
  wire [3:0] axi4_0_M_WSTRB;
  wire [0:0] axi4_0_M_WVALID;
  wire [127:0] axi4_0_S_ARADDR;
  wire [7:0] axi4_0_S_ARBURST;
  wire [15:0] axi4_0_S_ARCACHE;
  wire [7:0] axi4_0_S_ARID;
  wire [31:0] axi4_0_S_ARLEN;
  wire [7:0] axi4_0_S_ARLOCK;
  wire [11:0] axi4_0_S_ARPROT;
  wire [15:0] axi4_0_S_ARQOS;
  wire [3:0] axi4_0_S_ARREADY;
  wire [11:0] axi4_0_S_ARSIZE;
  wire [19:0] axi4_0_S_ARUSER;
  wire [3:0] axi4_0_S_ARVALID;
  wire [127:0] axi4_0_S_AWADDR;
  wire [7:0] axi4_0_S_AWBURST;
  wire [15:0] axi4_0_S_AWCACHE;
  wire [7:0] axi4_0_S_AWID;
  wire [31:0] axi4_0_S_AWLEN;
  wire [7:0] axi4_0_S_AWLOCK;
  wire [11:0] axi4_0_S_AWPROT;
  wire [15:0] axi4_0_S_AWQOS;
  wire [3:0] axi4_0_S_AWREADY;
  wire [11:0] axi4_0_S_AWSIZE;
  wire [19:0] axi4_0_S_AWUSER;
  wire [3:0] axi4_0_S_AWVALID;
  wire [7:0] axi4_0_S_BID;
  wire [3:0] axi4_0_S_BREADY;
  wire [7:0] axi4_0_S_BRESP;
  wire [3:0] axi4_0_S_BUSER;
  wire [3:0] axi4_0_S_BVALID;
  wire [127:0] axi4_0_S_RDATA;
  wire [7:0] axi4_0_S_RID;
  wire [3:0] axi4_0_S_RLAST;
  wire [3:0] axi4_0_S_RREADY;
  wire [7:0] axi4_0_S_RRESP;
  wire [3:0] axi4_0_S_RUSER;
  wire [3:0] axi4_0_S_RVALID;
  wire [127:0] axi4_0_S_WDATA;
  wire [3:0] axi4_0_S_WLAST;
  wire [3:0] axi4_0_S_WREADY;
  wire [15:0] axi4_0_S_WSTRB;
  wire [3:0] axi4_0_S_WUSER;
  wire [3:0] axi4_0_S_WVALID;
  wire [351:0] axi4lite_0_M_ARADDR;
  wire [21:0] axi4lite_0_M_ARBURST;
  wire [43:0] axi4lite_0_M_ARCACHE;
  wire [10:0] axi4lite_0_M_ARESETN;
  wire [10:0] axi4lite_0_M_ARID;
  wire [87:0] axi4lite_0_M_ARLEN;
  wire [10:0] axi4lite_0_M_ARREADY;
  wire [32:0] axi4lite_0_M_ARSIZE;
  wire [10:0] axi4lite_0_M_ARVALID;
  wire [351:0] axi4lite_0_M_AWADDR;
  wire [21:0] axi4lite_0_M_AWBURST;
  wire [43:0] axi4lite_0_M_AWCACHE;
  wire [10:0] axi4lite_0_M_AWID;
  wire [87:0] axi4lite_0_M_AWLEN;
  wire [10:0] axi4lite_0_M_AWREADY;
  wire [32:0] axi4lite_0_M_AWSIZE;
  wire [10:0] axi4lite_0_M_AWVALID;
  wire [10:0] axi4lite_0_M_BID;
  wire [10:0] axi4lite_0_M_BREADY;
  wire [21:0] axi4lite_0_M_BRESP;
  wire [10:0] axi4lite_0_M_BVALID;
  wire [351:0] axi4lite_0_M_RDATA;
  wire [10:0] axi4lite_0_M_RID;
  wire [10:0] axi4lite_0_M_RLAST;
  wire [10:0] axi4lite_0_M_RREADY;
  wire [21:0] axi4lite_0_M_RRESP;
  wire [10:0] axi4lite_0_M_RVALID;
  wire [351:0] axi4lite_0_M_WDATA;
  wire [10:0] axi4lite_0_M_WLAST;
  wire [10:0] axi4lite_0_M_WREADY;
  wire [43:0] axi4lite_0_M_WSTRB;
  wire [10:0] axi4lite_0_M_WVALID;
  wire [31:0] axi4lite_0_S_ARADDR;
  wire [1:0] axi4lite_0_S_ARBURST;
  wire [3:0] axi4lite_0_S_ARCACHE;
  wire [0:0] axi4lite_0_S_ARID;
  wire [7:0] axi4lite_0_S_ARLEN;
  wire [1:0] axi4lite_0_S_ARLOCK;
  wire [2:0] axi4lite_0_S_ARPROT;
  wire [3:0] axi4lite_0_S_ARQOS;
  wire [0:0] axi4lite_0_S_ARREADY;
  wire [2:0] axi4lite_0_S_ARSIZE;
  wire [0:0] axi4lite_0_S_ARVALID;
  wire [31:0] axi4lite_0_S_AWADDR;
  wire [1:0] axi4lite_0_S_AWBURST;
  wire [3:0] axi4lite_0_S_AWCACHE;
  wire [0:0] axi4lite_0_S_AWID;
  wire [7:0] axi4lite_0_S_AWLEN;
  wire [1:0] axi4lite_0_S_AWLOCK;
  wire [2:0] axi4lite_0_S_AWPROT;
  wire [3:0] axi4lite_0_S_AWQOS;
  wire [0:0] axi4lite_0_S_AWREADY;
  wire [2:0] axi4lite_0_S_AWSIZE;
  wire [0:0] axi4lite_0_S_AWVALID;
  wire [0:0] axi4lite_0_S_BID;
  wire [0:0] axi4lite_0_S_BREADY;
  wire [1:0] axi4lite_0_S_BRESP;
  wire [0:0] axi4lite_0_S_BVALID;
  wire [31:0] axi4lite_0_S_RDATA;
  wire [0:0] axi4lite_0_S_RID;
  wire [0:0] axi4lite_0_S_RLAST;
  wire [0:0] axi4lite_0_S_RREADY;
  wire [1:0] axi4lite_0_S_RRESP;
  wire [0:0] axi4lite_0_S_RVALID;
  wire [31:0] axi4lite_0_S_WDATA;
  wire [0:0] axi4lite_0_S_WLAST;
  wire [0:0] axi4lite_0_S_WREADY;
  wire [3:0] axi4lite_0_S_WSTRB;
  wire [0:0] axi4lite_0_S_WVALID;
  wire axi_hdmi_0_TMDS_RX_SDA_I;
  wire axi_hdmi_0_TMDS_RX_SDA_O;
  wire axi_hdmi_0_TMDS_RX_SDA_T;
  wire axi_hdmi_0_TMDS_TX_0_N;
  wire axi_hdmi_0_TMDS_TX_0_P;
  wire axi_hdmi_0_TMDS_TX_1_N;
  wire axi_hdmi_0_TMDS_TX_1_P;
  wire axi_hdmi_0_TMDS_TX_2_N;
  wire axi_hdmi_0_TMDS_TX_2_P;
  wire axi_hdmi_0_TMDS_TX_CLK_N;
  wire axi_hdmi_0_TMDS_TX_CLK_P;
  wire axi_vdma_0_M_AXIS_MM2S_ACLK;
  wire [31:0] axi_vdma_0_M_AXIS_MM2S_TDATA;
  wire [3:0] axi_vdma_0_M_AXIS_MM2S_TKEEP;
  wire axi_vdma_0_M_AXIS_MM2S_TLAST;
  wire axi_vdma_0_M_AXIS_MM2S_TREADY;
  wire axi_vdma_0_M_AXIS_MM2S_TVALID;
  wire axi_vdma_0_mm2s_buffer_almost_empty;
  wire axi_vdma_0_mm2s_fsync_out;
  wire axi_vdma_0_s2mm_fsync_out;
  wire bscan_capture;
  wire bscan_drck1;
  wire bscan_reset;
  wire bscan_sel1;
  wire bscan_shift;
  wire bscan_tdi;
  wire bscan_tdo1;
  wire bscan_update;
  wire [7:0] camera_stream_0_DEBUG;
  wire [7:0] camera_stream_0_D_I;
  wire camera_stream_0_FV_I;
  wire camera_stream_0_LV_I;
  wire camera_stream_0_MCLK_O;
  wire [31:0] camera_stream_0_M_AXIS_TDATA;
  wire camera_stream_0_M_AXIS_TLAST;
  wire camera_stream_0_M_AXIS_TREADY;
  wire camera_stream_0_M_AXIS_TVALID;
  wire camera_stream_0_PWDN_O;
  wire camera_stream_0_RST_O;
  wire camera_stream_0_VDDEN_O;
  wire [35:0] chipscope_icon_0_control0;
  wire [0:0] clk_100_0000MHzPLL0;
  wire clk_600_0000MHz180PLL0_nobuf;
  wire clk_600_0000MHzPLL0_nobuf;
  wire clock_generator_0_CLKOUT3;
  wire clock_generator_0_CLKOUT4;
  wire [0:31] microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Addr;
  wire microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Clk;
  wire [0:31] microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Din;
  wire [0:31] microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Dout;
  wire microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_EN;
  wire microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Rst;
  wire [0:3] microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_WEN;
  wire microblaze_0_debug_Dbg_Capture;
  wire microblaze_0_debug_Dbg_Clk;
  wire [0:7] microblaze_0_debug_Dbg_Reg_En;
  wire microblaze_0_debug_Dbg_Shift;
  wire microblaze_0_debug_Dbg_TDI;
  wire microblaze_0_debug_Dbg_TDO;
  wire microblaze_0_debug_Dbg_Update;
  wire microblaze_0_debug_Debug_Rst;
  wire [0:31] microblaze_0_dlmb_LMB_ABus;
  wire microblaze_0_dlmb_LMB_AddrStrobe;
  wire [0:3] microblaze_0_dlmb_LMB_BE;
  wire microblaze_0_dlmb_LMB_CE;
  wire [0:31] microblaze_0_dlmb_LMB_ReadDBus;
  wire microblaze_0_dlmb_LMB_ReadStrobe;
  wire microblaze_0_dlmb_LMB_Ready;
  wire microblaze_0_dlmb_LMB_Rst;
  wire microblaze_0_dlmb_LMB_UE;
  wire microblaze_0_dlmb_LMB_Wait;
  wire [0:31] microblaze_0_dlmb_LMB_WriteDBus;
  wire microblaze_0_dlmb_LMB_WriteStrobe;
  wire [0:31] microblaze_0_dlmb_M_ABus;
  wire microblaze_0_dlmb_M_AddrStrobe;
  wire [0:3] microblaze_0_dlmb_M_BE;
  wire [0:31] microblaze_0_dlmb_M_DBus;
  wire microblaze_0_dlmb_M_ReadStrobe;
  wire microblaze_0_dlmb_M_WriteStrobe;
  wire [0:0] microblaze_0_dlmb_Sl_CE;
  wire [0:31] microblaze_0_dlmb_Sl_DBus;
  wire [0:0] microblaze_0_dlmb_Sl_Ready;
  wire [0:0] microblaze_0_dlmb_Sl_UE;
  wire [0:0] microblaze_0_dlmb_Sl_Wait;
  wire [0:31] microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Addr;
  wire microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Clk;
  wire [0:31] microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Din;
  wire [0:31] microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Dout;
  wire microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_EN;
  wire microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Rst;
  wire [0:3] microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_WEN;
  wire [0:31] microblaze_0_ilmb_LMB_ABus;
  wire microblaze_0_ilmb_LMB_AddrStrobe;
  wire [0:3] microblaze_0_ilmb_LMB_BE;
  wire microblaze_0_ilmb_LMB_CE;
  wire [0:31] microblaze_0_ilmb_LMB_ReadDBus;
  wire microblaze_0_ilmb_LMB_ReadStrobe;
  wire microblaze_0_ilmb_LMB_Ready;
  wire microblaze_0_ilmb_LMB_Rst;
  wire microblaze_0_ilmb_LMB_UE;
  wire microblaze_0_ilmb_LMB_Wait;
  wire [0:31] microblaze_0_ilmb_LMB_WriteDBus;
  wire microblaze_0_ilmb_LMB_WriteStrobe;
  wire [0:31] microblaze_0_ilmb_M_ABus;
  wire microblaze_0_ilmb_M_AddrStrobe;
  wire microblaze_0_ilmb_M_ReadStrobe;
  wire [0:0] microblaze_0_ilmb_Sl_CE;
  wire [0:31] microblaze_0_ilmb_Sl_DBus;
  wire [0:0] microblaze_0_ilmb_Sl_Ready;
  wire [0:0] microblaze_0_ilmb_Sl_UE;
  wire [0:0] microblaze_0_ilmb_Sl_Wait;
  wire net_gnd0;
  wire [0:0] net_gnd1;
  wire [0:1] net_gnd2;
  wire [0:2] net_gnd3;
  wire [0:3] net_gnd4;
  wire [5:0] net_gnd6;
  wire [7:0] net_gnd8;
  wire [10:0] net_gnd11;
  wire [0:15] net_gnd16;
  wire [0:31] net_gnd32;
  wire [0:4095] net_gnd4096;
  wire net_vcc0;
  wire [3:0] net_vcc4;
  wire [10:0] pgassign1;
  wire [3:0] pgassign2;
  wire pmodjstk_top_0_MISO;
  wire pmodjstk_top_0_MOSI;
  wire pmodjstk_top_0_SCLK;
  wire pmodjstk_top_0_SS;
  wire [0:0] proc_sys_reset_0_BUS_STRUCT_RESET;
  wire proc_sys_reset_0_Dcm_locked;
  wire [0:0] proc_sys_reset_0_Interconnect_aresetn;
  wire proc_sys_reset_0_MB_Debug_Sys_Rst;
  wire proc_sys_reset_0_MB_Reset;
  wire [0:0] proc_sys_reset_0_Peripheral_Reset;
  wire [0:0] proc_sys_reset_0_Peripheral_aresetn;

  // Internal assignments

  assign TMDS_TX_CLK_P = axi_hdmi_0_TMDS_TX_CLK_P;
  assign TMDS_TX_CLK_N = axi_hdmi_0_TMDS_TX_CLK_N;
  assign TMDS_TX_2_P = axi_hdmi_0_TMDS_TX_2_P;
  assign TMDS_TX_2_N = axi_hdmi_0_TMDS_TX_2_N;
  assign TMDS_TX_1_P = axi_hdmi_0_TMDS_TX_1_P;
  assign TMDS_TX_1_N = axi_hdmi_0_TMDS_TX_1_N;
  assign TMDS_TX_0_P = axi_hdmi_0_TMDS_TX_0_P;
  assign TMDS_TX_0_N = axi_hdmi_0_TMDS_TX_0_N;
  assign camera_stream_0_D_I = CAMA_D_I;
  assign camera_stream_0_FV_I = CAMA_FV_I;
  assign CAMA_MCLK_O = camera_stream_0_MCLK_O;
  assign CAMA_RST_O = camera_stream_0_RST_O;
  assign CAMA_PWDN_O = camera_stream_0_PWDN_O;
  assign CAMX_VDDEN_O = camera_stream_0_VDDEN_O;
  assign camera_stream_0_LV_I = CAMA_LV_I;
  assign pmodjstk_top_0_MISO = pmodjstk_top_0_MISO_pin;
  assign pmodjstk_top_0_MOSI_pin = pmodjstk_top_0_MOSI;
  assign pmodjstk_top_0_SS_pin = pmodjstk_top_0_SS;
  assign pmodjstk_top_0_SCLK_pin = pmodjstk_top_0_SCLK;
  assign axi4_0_S_AWID[5:4] = 2'b00;
  assign axi4_0_S_AWID[7:6] = 2'b00;
  assign axi4_0_S_AWADDR[95:64] = 32'b00000000000000000000000000000000;
  assign axi4_0_S_AWLEN[23:16] = 8'b00000000;
  assign axi4_0_S_AWSIZE[8:6] = 3'b000;
  assign axi4_0_S_AWBURST[5:4] = 2'b00;
  assign axi4_0_S_AWLOCK[5:4] = 2'b00;
  assign axi4_0_S_AWLOCK[7:6] = 2'b00;
  assign axi4_0_S_AWCACHE[11:8] = 4'b0000;
  assign axi4_0_S_AWPROT[8:6] = 3'b000;
  assign axi4_0_S_AWQOS[11:8] = 4'b0000;
  assign axi4_0_S_AWQOS[15:12] = 4'b0000;
  assign axi4_0_S_AWVALID[2:2] = 1'b0;
  assign axi4_0_S_AWUSER[14:10] = 5'b00000;
  assign axi4_0_S_AWUSER[19:15] = 5'b00000;
  assign axi4_0_S_WDATA[95:64] = 32'b00000000000000000000000000000000;
  assign axi4_0_S_WSTRB[11:8] = 4'b0000;
  assign axi4_0_S_WLAST[2:2] = 1'b0;
  assign axi4_0_S_WVALID[2:2] = 1'b0;
  assign axi4_0_S_WUSER[2:2] = 1'b0;
  assign axi4_0_S_WUSER[3:3] = 1'b0;
  assign axi4_0_S_BREADY[2:2] = 1'b0;
  assign axi4_0_S_ARID[5:4] = 2'b00;
  assign axi4_0_S_ARID[7:6] = 2'b00;
  assign axi4_0_S_ARADDR[127:96] = 32'b00000000000000000000000000000000;
  assign axi4_0_S_ARLEN[31:24] = 8'b00000000;
  assign axi4_0_S_ARSIZE[11:9] = 3'b000;
  assign axi4_0_S_ARBURST[7:6] = 2'b00;
  assign axi4_0_S_ARLOCK[5:4] = 2'b00;
  assign axi4_0_S_ARLOCK[7:6] = 2'b00;
  assign axi4_0_S_ARCACHE[15:12] = 4'b0000;
  assign axi4_0_S_ARPROT[11:9] = 3'b000;
  assign axi4_0_S_ARQOS[11:8] = 4'b0000;
  assign axi4_0_S_ARQOS[15:12] = 4'b0000;
  assign axi4_0_S_ARVALID[3:3] = 1'b0;
  assign axi4_0_S_ARUSER[14:10] = 5'b00000;
  assign axi4_0_S_ARUSER[19:15] = 5'b00000;
  assign axi4_0_S_RREADY[3:3] = 1'b0;
  assign axi4lite_0_M_BID[0:0] = 1'b0;
  assign axi4lite_0_M_BID[1:1] = 1'b0;
  assign axi4lite_0_M_BID[2:2] = 1'b0;
  assign axi4lite_0_M_BID[3:3] = 1'b0;
  assign axi4lite_0_M_BID[5:5] = 1'b0;
  assign axi4lite_0_M_BID[6:6] = 1'b0;
  assign axi4lite_0_M_BID[7:7] = 1'b0;
  assign axi4lite_0_M_BID[8:8] = 1'b0;
  assign axi4lite_0_M_BID[9:9] = 1'b0;
  assign axi4lite_0_M_BID[10:10] = 1'b0;
  assign axi4lite_0_M_RID[0:0] = 1'b0;
  assign axi4lite_0_M_RID[1:1] = 1'b0;
  assign axi4lite_0_M_RID[2:2] = 1'b0;
  assign axi4lite_0_M_RID[3:3] = 1'b0;
  assign axi4lite_0_M_RID[5:5] = 1'b0;
  assign axi4lite_0_M_RID[6:6] = 1'b0;
  assign axi4lite_0_M_RID[7:7] = 1'b0;
  assign axi4lite_0_M_RID[8:8] = 1'b0;
  assign axi4lite_0_M_RID[9:9] = 1'b0;
  assign axi4lite_0_M_RID[10:10] = 1'b0;
  assign axi4lite_0_M_RLAST[0:0] = 1'b0;
  assign axi4lite_0_M_RLAST[1:1] = 1'b0;
  assign axi4lite_0_M_RLAST[2:2] = 1'b0;
  assign axi4lite_0_M_RLAST[3:3] = 1'b0;
  assign axi4lite_0_M_RLAST[5:5] = 1'b0;
  assign axi4lite_0_M_RLAST[6:6] = 1'b0;
  assign axi4lite_0_M_RLAST[7:7] = 1'b0;
  assign axi4lite_0_M_RLAST[8:8] = 1'b0;
  assign axi4lite_0_M_RLAST[9:9] = 1'b0;
  assign axi4lite_0_M_RLAST[10:10] = 1'b0;
  assign pgassign1[10:10] = clk_100_0000MHzPLL0[0:0];
  assign pgassign1[9:9] = clk_100_0000MHzPLL0[0:0];
  assign pgassign1[8:8] = clk_100_0000MHzPLL0[0:0];
  assign pgassign1[7:7] = clk_100_0000MHzPLL0[0:0];
  assign pgassign1[6:6] = clk_100_0000MHzPLL0[0:0];
  assign pgassign1[5:5] = clk_100_0000MHzPLL0[0:0];
  assign pgassign1[4:4] = clk_100_0000MHzPLL0[0:0];
  assign pgassign1[3:3] = clk_100_0000MHzPLL0[0:0];
  assign pgassign1[2:2] = clk_100_0000MHzPLL0[0:0];
  assign pgassign1[1:1] = clk_100_0000MHzPLL0[0:0];
  assign pgassign1[0:0] = clk_100_0000MHzPLL0[0:0];
  assign pgassign2[3:3] = clk_100_0000MHzPLL0[0:0];
  assign pgassign2[2:2] = clk_100_0000MHzPLL0[0:0];
  assign pgassign2[1:1] = clk_100_0000MHzPLL0[0:0];
  assign pgassign2[0:0] = clk_100_0000MHzPLL0[0:0];
  assign net_gnd0 = 1'b0;
  assign net_gnd1[0:0] = 1'b0;
  assign net_gnd11[10:0] = 11'b00000000000;
  assign net_gnd16[0:15] = 16'b0000000000000000;
  assign net_gnd2[0:1] = 2'b00;
  assign net_gnd3[0:2] = 3'b000;
  assign net_gnd32[0:31] = 32'b00000000000000000000000000000000;
  assign net_gnd4[0:3] = 4'b0000;
  assign net_gnd4096[0:4095] = 4096'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  assign net_gnd6[5:0] = 6'b000000;
  assign net_gnd8[7:0] = 8'b00000000;
  assign net_vcc0 = 1'b1;
  assign net_vcc4[3:0] = 4'b1111;

  (* BOX_TYPE = "user_black_box" *)
  proc_sys_reset_0_wrapper
    proc_sys_reset_0 (
      .Slowest_sync_clk ( clock_generator_0_CLKOUT3 ),
      .Ext_Reset_In ( RESET ),
      .Aux_Reset_In ( net_gnd0 ),
      .MB_Debug_Sys_Rst ( proc_sys_reset_0_MB_Debug_Sys_Rst ),
      .Core_Reset_Req_0 ( net_gnd0 ),
      .Chip_Reset_Req_0 ( net_gnd0 ),
      .System_Reset_Req_0 ( net_gnd0 ),
      .Core_Reset_Req_1 ( net_gnd0 ),
      .Chip_Reset_Req_1 ( net_gnd0 ),
      .System_Reset_Req_1 ( net_gnd0 ),
      .Dcm_locked ( proc_sys_reset_0_Dcm_locked ),
      .RstcPPCresetcore_0 (  ),
      .RstcPPCresetchip_0 (  ),
      .RstcPPCresetsys_0 (  ),
      .RstcPPCresetcore_1 (  ),
      .RstcPPCresetchip_1 (  ),
      .RstcPPCresetsys_1 (  ),
      .MB_Reset ( proc_sys_reset_0_MB_Reset ),
      .Bus_Struct_Reset ( proc_sys_reset_0_BUS_STRUCT_RESET[0:0] ),
      .Peripheral_Reset ( proc_sys_reset_0_Peripheral_Reset[0:0] ),
      .Interconnect_aresetn ( proc_sys_reset_0_Interconnect_aresetn[0:0] ),
      .Peripheral_aresetn ( proc_sys_reset_0_Peripheral_aresetn[0:0] )
    );

  (* BOX_TYPE = "user_black_box" *)
  microblaze_0_ilmb_wrapper
    microblaze_0_ilmb (
      .LMB_Clk ( clk_100_0000MHzPLL0[0] ),
      .SYS_Rst ( proc_sys_reset_0_BUS_STRUCT_RESET[0] ),
      .LMB_Rst ( microblaze_0_ilmb_LMB_Rst ),
      .M_ABus ( microblaze_0_ilmb_M_ABus ),
      .M_ReadStrobe ( microblaze_0_ilmb_M_ReadStrobe ),
      .M_WriteStrobe ( net_gnd0 ),
      .M_AddrStrobe ( microblaze_0_ilmb_M_AddrStrobe ),
      .M_DBus ( net_gnd32 ),
      .M_BE ( net_gnd4 ),
      .Sl_DBus ( microblaze_0_ilmb_Sl_DBus ),
      .Sl_Ready ( microblaze_0_ilmb_Sl_Ready[0:0] ),
      .Sl_Wait ( microblaze_0_ilmb_Sl_Wait[0:0] ),
      .Sl_UE ( microblaze_0_ilmb_Sl_UE[0:0] ),
      .Sl_CE ( microblaze_0_ilmb_Sl_CE[0:0] ),
      .LMB_ABus ( microblaze_0_ilmb_LMB_ABus ),
      .LMB_ReadStrobe ( microblaze_0_ilmb_LMB_ReadStrobe ),
      .LMB_WriteStrobe ( microblaze_0_ilmb_LMB_WriteStrobe ),
      .LMB_AddrStrobe ( microblaze_0_ilmb_LMB_AddrStrobe ),
      .LMB_ReadDBus ( microblaze_0_ilmb_LMB_ReadDBus ),
      .LMB_WriteDBus ( microblaze_0_ilmb_LMB_WriteDBus ),
      .LMB_Ready ( microblaze_0_ilmb_LMB_Ready ),
      .LMB_Wait ( microblaze_0_ilmb_LMB_Wait ),
      .LMB_UE ( microblaze_0_ilmb_LMB_UE ),
      .LMB_CE ( microblaze_0_ilmb_LMB_CE ),
      .LMB_BE ( microblaze_0_ilmb_LMB_BE )
    );

  (* BOX_TYPE = "user_black_box" *)
  microblaze_0_i_bram_ctrl_wrapper
    microblaze_0_i_bram_ctrl (
      .LMB_Clk ( clk_100_0000MHzPLL0[0] ),
      .LMB_Rst ( microblaze_0_ilmb_LMB_Rst ),
      .LMB_ABus ( microblaze_0_ilmb_LMB_ABus ),
      .LMB_WriteDBus ( microblaze_0_ilmb_LMB_WriteDBus ),
      .LMB_AddrStrobe ( microblaze_0_ilmb_LMB_AddrStrobe ),
      .LMB_ReadStrobe ( microblaze_0_ilmb_LMB_ReadStrobe ),
      .LMB_WriteStrobe ( microblaze_0_ilmb_LMB_WriteStrobe ),
      .LMB_BE ( microblaze_0_ilmb_LMB_BE ),
      .Sl_DBus ( microblaze_0_ilmb_Sl_DBus ),
      .Sl_Ready ( microblaze_0_ilmb_Sl_Ready[0] ),
      .Sl_Wait ( microblaze_0_ilmb_Sl_Wait[0] ),
      .Sl_UE ( microblaze_0_ilmb_Sl_UE[0] ),
      .Sl_CE ( microblaze_0_ilmb_Sl_CE[0] ),
      .BRAM_Rst_A ( microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Rst ),
      .BRAM_Clk_A ( microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Clk ),
      .BRAM_EN_A ( microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_EN ),
      .BRAM_WEN_A ( microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_WEN ),
      .BRAM_Addr_A ( microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Addr ),
      .BRAM_Din_A ( microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Din ),
      .BRAM_Dout_A ( microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Dout ),
      .Interrupt (  ),
      .SPLB_CTRL_PLB_ABus ( net_gnd32 ),
      .SPLB_CTRL_PLB_PAValid ( net_gnd0 ),
      .SPLB_CTRL_PLB_masterID ( net_gnd1[0:0] ),
      .SPLB_CTRL_PLB_RNW ( net_gnd0 ),
      .SPLB_CTRL_PLB_BE ( net_gnd4 ),
      .SPLB_CTRL_PLB_size ( net_gnd4 ),
      .SPLB_CTRL_PLB_type ( net_gnd3 ),
      .SPLB_CTRL_PLB_wrDBus ( net_gnd32 ),
      .SPLB_CTRL_Sl_addrAck (  ),
      .SPLB_CTRL_Sl_SSize (  ),
      .SPLB_CTRL_Sl_wait (  ),
      .SPLB_CTRL_Sl_rearbitrate (  ),
      .SPLB_CTRL_Sl_wrDAck (  ),
      .SPLB_CTRL_Sl_wrComp (  ),
      .SPLB_CTRL_Sl_rdDBus (  ),
      .SPLB_CTRL_Sl_rdDAck (  ),
      .SPLB_CTRL_Sl_rdComp (  ),
      .SPLB_CTRL_Sl_MBusy (  ),
      .SPLB_CTRL_Sl_MWrErr (  ),
      .SPLB_CTRL_Sl_MRdErr (  ),
      .SPLB_CTRL_PLB_UABus ( net_gnd32 ),
      .SPLB_CTRL_PLB_SAValid ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdPrim ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPrim ( net_gnd0 ),
      .SPLB_CTRL_PLB_abort ( net_gnd0 ),
      .SPLB_CTRL_PLB_busLock ( net_gnd0 ),
      .SPLB_CTRL_PLB_MSize ( net_gnd2 ),
      .SPLB_CTRL_PLB_lockErr ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrBurst ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdBurst ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPendReq ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdPendReq ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPendPri ( net_gnd2 ),
      .SPLB_CTRL_PLB_rdPendPri ( net_gnd2 ),
      .SPLB_CTRL_PLB_reqPri ( net_gnd2 ),
      .SPLB_CTRL_PLB_TAttribute ( net_gnd16 ),
      .SPLB_CTRL_Sl_wrBTerm (  ),
      .SPLB_CTRL_Sl_rdWdAddr (  ),
      .SPLB_CTRL_Sl_rdBTerm (  ),
      .SPLB_CTRL_Sl_MIRQ (  ),
      .S_AXI_CTRL_ACLK ( net_vcc0 ),
      .S_AXI_CTRL_ARESETN ( net_gnd0 ),
      .S_AXI_CTRL_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32[0:31] ),
      .S_AXI_CTRL_WSTRB ( net_gnd4[0:3] ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 )
    );

  (* BOX_TYPE = "user_black_box" *)
  microblaze_0_dlmb_wrapper
    microblaze_0_dlmb (
      .LMB_Clk ( clk_100_0000MHzPLL0[0] ),
      .SYS_Rst ( proc_sys_reset_0_BUS_STRUCT_RESET[0] ),
      .LMB_Rst ( microblaze_0_dlmb_LMB_Rst ),
      .M_ABus ( microblaze_0_dlmb_M_ABus ),
      .M_ReadStrobe ( microblaze_0_dlmb_M_ReadStrobe ),
      .M_WriteStrobe ( microblaze_0_dlmb_M_WriteStrobe ),
      .M_AddrStrobe ( microblaze_0_dlmb_M_AddrStrobe ),
      .M_DBus ( microblaze_0_dlmb_M_DBus ),
      .M_BE ( microblaze_0_dlmb_M_BE ),
      .Sl_DBus ( microblaze_0_dlmb_Sl_DBus ),
      .Sl_Ready ( microblaze_0_dlmb_Sl_Ready[0:0] ),
      .Sl_Wait ( microblaze_0_dlmb_Sl_Wait[0:0] ),
      .Sl_UE ( microblaze_0_dlmb_Sl_UE[0:0] ),
      .Sl_CE ( microblaze_0_dlmb_Sl_CE[0:0] ),
      .LMB_ABus ( microblaze_0_dlmb_LMB_ABus ),
      .LMB_ReadStrobe ( microblaze_0_dlmb_LMB_ReadStrobe ),
      .LMB_WriteStrobe ( microblaze_0_dlmb_LMB_WriteStrobe ),
      .LMB_AddrStrobe ( microblaze_0_dlmb_LMB_AddrStrobe ),
      .LMB_ReadDBus ( microblaze_0_dlmb_LMB_ReadDBus ),
      .LMB_WriteDBus ( microblaze_0_dlmb_LMB_WriteDBus ),
      .LMB_Ready ( microblaze_0_dlmb_LMB_Ready ),
      .LMB_Wait ( microblaze_0_dlmb_LMB_Wait ),
      .LMB_UE ( microblaze_0_dlmb_LMB_UE ),
      .LMB_CE ( microblaze_0_dlmb_LMB_CE ),
      .LMB_BE ( microblaze_0_dlmb_LMB_BE )
    );

  (* BOX_TYPE = "user_black_box" *)
  microblaze_0_d_bram_ctrl_wrapper
    microblaze_0_d_bram_ctrl (
      .LMB_Clk ( clk_100_0000MHzPLL0[0] ),
      .LMB_Rst ( microblaze_0_dlmb_LMB_Rst ),
      .LMB_ABus ( microblaze_0_dlmb_LMB_ABus ),
      .LMB_WriteDBus ( microblaze_0_dlmb_LMB_WriteDBus ),
      .LMB_AddrStrobe ( microblaze_0_dlmb_LMB_AddrStrobe ),
      .LMB_ReadStrobe ( microblaze_0_dlmb_LMB_ReadStrobe ),
      .LMB_WriteStrobe ( microblaze_0_dlmb_LMB_WriteStrobe ),
      .LMB_BE ( microblaze_0_dlmb_LMB_BE ),
      .Sl_DBus ( microblaze_0_dlmb_Sl_DBus ),
      .Sl_Ready ( microblaze_0_dlmb_Sl_Ready[0] ),
      .Sl_Wait ( microblaze_0_dlmb_Sl_Wait[0] ),
      .Sl_UE ( microblaze_0_dlmb_Sl_UE[0] ),
      .Sl_CE ( microblaze_0_dlmb_Sl_CE[0] ),
      .BRAM_Rst_A ( microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Rst ),
      .BRAM_Clk_A ( microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Clk ),
      .BRAM_EN_A ( microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_EN ),
      .BRAM_WEN_A ( microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_WEN ),
      .BRAM_Addr_A ( microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Addr ),
      .BRAM_Din_A ( microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Din ),
      .BRAM_Dout_A ( microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Dout ),
      .Interrupt (  ),
      .SPLB_CTRL_PLB_ABus ( net_gnd32 ),
      .SPLB_CTRL_PLB_PAValid ( net_gnd0 ),
      .SPLB_CTRL_PLB_masterID ( net_gnd1[0:0] ),
      .SPLB_CTRL_PLB_RNW ( net_gnd0 ),
      .SPLB_CTRL_PLB_BE ( net_gnd4 ),
      .SPLB_CTRL_PLB_size ( net_gnd4 ),
      .SPLB_CTRL_PLB_type ( net_gnd3 ),
      .SPLB_CTRL_PLB_wrDBus ( net_gnd32 ),
      .SPLB_CTRL_Sl_addrAck (  ),
      .SPLB_CTRL_Sl_SSize (  ),
      .SPLB_CTRL_Sl_wait (  ),
      .SPLB_CTRL_Sl_rearbitrate (  ),
      .SPLB_CTRL_Sl_wrDAck (  ),
      .SPLB_CTRL_Sl_wrComp (  ),
      .SPLB_CTRL_Sl_rdDBus (  ),
      .SPLB_CTRL_Sl_rdDAck (  ),
      .SPLB_CTRL_Sl_rdComp (  ),
      .SPLB_CTRL_Sl_MBusy (  ),
      .SPLB_CTRL_Sl_MWrErr (  ),
      .SPLB_CTRL_Sl_MRdErr (  ),
      .SPLB_CTRL_PLB_UABus ( net_gnd32 ),
      .SPLB_CTRL_PLB_SAValid ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdPrim ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPrim ( net_gnd0 ),
      .SPLB_CTRL_PLB_abort ( net_gnd0 ),
      .SPLB_CTRL_PLB_busLock ( net_gnd0 ),
      .SPLB_CTRL_PLB_MSize ( net_gnd2 ),
      .SPLB_CTRL_PLB_lockErr ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrBurst ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdBurst ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPendReq ( net_gnd0 ),
      .SPLB_CTRL_PLB_rdPendReq ( net_gnd0 ),
      .SPLB_CTRL_PLB_wrPendPri ( net_gnd2 ),
      .SPLB_CTRL_PLB_rdPendPri ( net_gnd2 ),
      .SPLB_CTRL_PLB_reqPri ( net_gnd2 ),
      .SPLB_CTRL_PLB_TAttribute ( net_gnd16 ),
      .SPLB_CTRL_Sl_wrBTerm (  ),
      .SPLB_CTRL_Sl_rdWdAddr (  ),
      .SPLB_CTRL_Sl_rdBTerm (  ),
      .SPLB_CTRL_Sl_MIRQ (  ),
      .S_AXI_CTRL_ACLK ( net_vcc0 ),
      .S_AXI_CTRL_ARESETN ( net_gnd0 ),
      .S_AXI_CTRL_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32[0:31] ),
      .S_AXI_CTRL_WSTRB ( net_gnd4[0:3] ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 )
    );

  (* BOX_TYPE = "user_black_box" *)
  microblaze_0_bram_block_wrapper
    microblaze_0_bram_block (
      .BRAM_Rst_A ( microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Rst ),
      .BRAM_Clk_A ( microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Clk ),
      .BRAM_EN_A ( microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_EN ),
      .BRAM_WEN_A ( microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_WEN ),
      .BRAM_Addr_A ( microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Addr ),
      .BRAM_Din_A ( microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Din ),
      .BRAM_Dout_A ( microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Dout ),
      .BRAM_Rst_B ( microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Rst ),
      .BRAM_Clk_B ( microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Clk ),
      .BRAM_EN_B ( microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_EN ),
      .BRAM_WEN_B ( microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_WEN ),
      .BRAM_Addr_B ( microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Addr ),
      .BRAM_Din_B ( microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Din ),
      .BRAM_Dout_B ( microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Dout )
    );

  (* BOX_TYPE = "user_black_box" *)
  microblaze_0_wrapper
    microblaze_0 (
      .CLK ( clk_100_0000MHzPLL0[0] ),
      .RESET ( microblaze_0_dlmb_LMB_Rst ),
      .MB_RESET ( proc_sys_reset_0_MB_Reset ),
      .INTERRUPT ( net_gnd0 ),
      .EXT_BRK ( Ext_BRK ),
      .EXT_NM_BRK ( Ext_NM_BRK ),
      .DBG_STOP ( net_gnd0 ),
      .MB_Halted (  ),
      .MB_Error (  ),
      .LOCKSTEP_MASTER_OUT (  ),
      .LOCKSTEP_SLAVE_IN ( net_gnd4096 ),
      .LOCKSTEP_OUT (  ),
      .INSTR ( microblaze_0_ilmb_LMB_ReadDBus ),
      .IREADY ( microblaze_0_ilmb_LMB_Ready ),
      .IWAIT ( microblaze_0_ilmb_LMB_Wait ),
      .ICE ( microblaze_0_ilmb_LMB_CE ),
      .IUE ( microblaze_0_ilmb_LMB_UE ),
      .INSTR_ADDR ( microblaze_0_ilmb_M_ABus ),
      .IFETCH ( microblaze_0_ilmb_M_ReadStrobe ),
      .I_AS ( microblaze_0_ilmb_M_AddrStrobe ),
      .IPLB_M_ABort (  ),
      .IPLB_M_ABus (  ),
      .IPLB_M_UABus (  ),
      .IPLB_M_BE (  ),
      .IPLB_M_busLock (  ),
      .IPLB_M_lockErr (  ),
      .IPLB_M_MSize (  ),
      .IPLB_M_priority (  ),
      .IPLB_M_rdBurst (  ),
      .IPLB_M_request (  ),
      .IPLB_M_RNW (  ),
      .IPLB_M_size (  ),
      .IPLB_M_TAttribute (  ),
      .IPLB_M_type (  ),
      .IPLB_M_wrBurst (  ),
      .IPLB_M_wrDBus (  ),
      .IPLB_MBusy ( net_gnd0 ),
      .IPLB_MRdErr ( net_gnd0 ),
      .IPLB_MWrErr ( net_gnd0 ),
      .IPLB_MIRQ ( net_gnd0 ),
      .IPLB_MWrBTerm ( net_gnd0 ),
      .IPLB_MWrDAck ( net_gnd0 ),
      .IPLB_MAddrAck ( net_gnd0 ),
      .IPLB_MRdBTerm ( net_gnd0 ),
      .IPLB_MRdDAck ( net_gnd0 ),
      .IPLB_MRdDBus ( net_gnd32 ),
      .IPLB_MRdWdAddr ( net_gnd4 ),
      .IPLB_MRearbitrate ( net_gnd0 ),
      .IPLB_MSSize ( net_gnd2 ),
      .IPLB_MTimeout ( net_gnd0 ),
      .DATA_READ ( microblaze_0_dlmb_LMB_ReadDBus ),
      .DREADY ( microblaze_0_dlmb_LMB_Ready ),
      .DWAIT ( microblaze_0_dlmb_LMB_Wait ),
      .DCE ( microblaze_0_dlmb_LMB_CE ),
      .DUE ( microblaze_0_dlmb_LMB_UE ),
      .DATA_WRITE ( microblaze_0_dlmb_M_DBus ),
      .DATA_ADDR ( microblaze_0_dlmb_M_ABus ),
      .D_AS ( microblaze_0_dlmb_M_AddrStrobe ),
      .READ_STROBE ( microblaze_0_dlmb_M_ReadStrobe ),
      .WRITE_STROBE ( microblaze_0_dlmb_M_WriteStrobe ),
      .BYTE_ENABLE ( microblaze_0_dlmb_M_BE ),
      .DPLB_M_ABort (  ),
      .DPLB_M_ABus (  ),
      .DPLB_M_UABus (  ),
      .DPLB_M_BE (  ),
      .DPLB_M_busLock (  ),
      .DPLB_M_lockErr (  ),
      .DPLB_M_MSize (  ),
      .DPLB_M_priority (  ),
      .DPLB_M_rdBurst (  ),
      .DPLB_M_request (  ),
      .DPLB_M_RNW (  ),
      .DPLB_M_size (  ),
      .DPLB_M_TAttribute (  ),
      .DPLB_M_type (  ),
      .DPLB_M_wrBurst (  ),
      .DPLB_M_wrDBus (  ),
      .DPLB_MBusy ( net_gnd0 ),
      .DPLB_MRdErr ( net_gnd0 ),
      .DPLB_MWrErr ( net_gnd0 ),
      .DPLB_MIRQ ( net_gnd0 ),
      .DPLB_MWrBTerm ( net_gnd0 ),
      .DPLB_MWrDAck ( net_gnd0 ),
      .DPLB_MAddrAck ( net_gnd0 ),
      .DPLB_MRdBTerm ( net_gnd0 ),
      .DPLB_MRdDAck ( net_gnd0 ),
      .DPLB_MRdDBus ( net_gnd32 ),
      .DPLB_MRdWdAddr ( net_gnd4 ),
      .DPLB_MRearbitrate ( net_gnd0 ),
      .DPLB_MSSize ( net_gnd2 ),
      .DPLB_MTimeout ( net_gnd0 ),
      .M_AXI_IP_AWID (  ),
      .M_AXI_IP_AWADDR (  ),
      .M_AXI_IP_AWLEN (  ),
      .M_AXI_IP_AWSIZE (  ),
      .M_AXI_IP_AWBURST (  ),
      .M_AXI_IP_AWLOCK (  ),
      .M_AXI_IP_AWCACHE (  ),
      .M_AXI_IP_AWPROT (  ),
      .M_AXI_IP_AWQOS (  ),
      .M_AXI_IP_AWVALID (  ),
      .M_AXI_IP_AWREADY ( net_gnd0 ),
      .M_AXI_IP_WDATA (  ),
      .M_AXI_IP_WSTRB (  ),
      .M_AXI_IP_WLAST (  ),
      .M_AXI_IP_WVALID (  ),
      .M_AXI_IP_WREADY ( net_gnd0 ),
      .M_AXI_IP_BID ( net_gnd1[0:0] ),
      .M_AXI_IP_BRESP ( net_gnd2[0:1] ),
      .M_AXI_IP_BVALID ( net_gnd0 ),
      .M_AXI_IP_BREADY (  ),
      .M_AXI_IP_ARID (  ),
      .M_AXI_IP_ARADDR (  ),
      .M_AXI_IP_ARLEN (  ),
      .M_AXI_IP_ARSIZE (  ),
      .M_AXI_IP_ARBURST (  ),
      .M_AXI_IP_ARLOCK (  ),
      .M_AXI_IP_ARCACHE (  ),
      .M_AXI_IP_ARPROT (  ),
      .M_AXI_IP_ARQOS (  ),
      .M_AXI_IP_ARVALID (  ),
      .M_AXI_IP_ARREADY ( net_gnd0 ),
      .M_AXI_IP_RID ( net_gnd1[0:0] ),
      .M_AXI_IP_RDATA ( net_gnd32[0:31] ),
      .M_AXI_IP_RRESP ( net_gnd2[0:1] ),
      .M_AXI_IP_RLAST ( net_gnd0 ),
      .M_AXI_IP_RVALID ( net_gnd0 ),
      .M_AXI_IP_RREADY (  ),
      .M_AXI_DP_AWID ( axi4lite_0_S_AWID[0:0] ),
      .M_AXI_DP_AWADDR ( axi4lite_0_S_AWADDR ),
      .M_AXI_DP_AWLEN ( axi4lite_0_S_AWLEN ),
      .M_AXI_DP_AWSIZE ( axi4lite_0_S_AWSIZE ),
      .M_AXI_DP_AWBURST ( axi4lite_0_S_AWBURST ),
      .M_AXI_DP_AWLOCK ( axi4lite_0_S_AWLOCK[0] ),
      .M_AXI_DP_AWCACHE ( axi4lite_0_S_AWCACHE ),
      .M_AXI_DP_AWPROT ( axi4lite_0_S_AWPROT ),
      .M_AXI_DP_AWQOS ( axi4lite_0_S_AWQOS ),
      .M_AXI_DP_AWVALID ( axi4lite_0_S_AWVALID[0] ),
      .M_AXI_DP_AWREADY ( axi4lite_0_S_AWREADY[0] ),
      .M_AXI_DP_WDATA ( axi4lite_0_S_WDATA ),
      .M_AXI_DP_WSTRB ( axi4lite_0_S_WSTRB ),
      .M_AXI_DP_WLAST ( axi4lite_0_S_WLAST[0] ),
      .M_AXI_DP_WVALID ( axi4lite_0_S_WVALID[0] ),
      .M_AXI_DP_WREADY ( axi4lite_0_S_WREADY[0] ),
      .M_AXI_DP_BID ( axi4lite_0_S_BID[0:0] ),
      .M_AXI_DP_BRESP ( axi4lite_0_S_BRESP ),
      .M_AXI_DP_BVALID ( axi4lite_0_S_BVALID[0] ),
      .M_AXI_DP_BREADY ( axi4lite_0_S_BREADY[0] ),
      .M_AXI_DP_ARID ( axi4lite_0_S_ARID[0:0] ),
      .M_AXI_DP_ARADDR ( axi4lite_0_S_ARADDR ),
      .M_AXI_DP_ARLEN ( axi4lite_0_S_ARLEN ),
      .M_AXI_DP_ARSIZE ( axi4lite_0_S_ARSIZE ),
      .M_AXI_DP_ARBURST ( axi4lite_0_S_ARBURST ),
      .M_AXI_DP_ARLOCK ( axi4lite_0_S_ARLOCK[0] ),
      .M_AXI_DP_ARCACHE ( axi4lite_0_S_ARCACHE ),
      .M_AXI_DP_ARPROT ( axi4lite_0_S_ARPROT ),
      .M_AXI_DP_ARQOS ( axi4lite_0_S_ARQOS ),
      .M_AXI_DP_ARVALID ( axi4lite_0_S_ARVALID[0] ),
      .M_AXI_DP_ARREADY ( axi4lite_0_S_ARREADY[0] ),
      .M_AXI_DP_RID ( axi4lite_0_S_RID[0:0] ),
      .M_AXI_DP_RDATA ( axi4lite_0_S_RDATA ),
      .M_AXI_DP_RRESP ( axi4lite_0_S_RRESP ),
      .M_AXI_DP_RLAST ( axi4lite_0_S_RLAST[0] ),
      .M_AXI_DP_RVALID ( axi4lite_0_S_RVALID[0] ),
      .M_AXI_DP_RREADY ( axi4lite_0_S_RREADY[0] ),
      .M_AXI_IC_AWID ( axi4_0_S_AWID[2:2] ),
      .M_AXI_IC_AWADDR ( axi4_0_S_AWADDR[63:32] ),
      .M_AXI_IC_AWLEN ( axi4_0_S_AWLEN[15:8] ),
      .M_AXI_IC_AWSIZE ( axi4_0_S_AWSIZE[5:3] ),
      .M_AXI_IC_AWBURST ( axi4_0_S_AWBURST[3:2] ),
      .M_AXI_IC_AWLOCK ( axi4_0_S_AWLOCK[2] ),
      .M_AXI_IC_AWCACHE ( axi4_0_S_AWCACHE[7:4] ),
      .M_AXI_IC_AWPROT ( axi4_0_S_AWPROT[5:3] ),
      .M_AXI_IC_AWQOS ( axi4_0_S_AWQOS[7:4] ),
      .M_AXI_IC_AWVALID ( axi4_0_S_AWVALID[1] ),
      .M_AXI_IC_AWREADY ( axi4_0_S_AWREADY[1] ),
      .M_AXI_IC_AWUSER ( axi4_0_S_AWUSER[9:5] ),
      .M_AXI_IC_WDATA ( axi4_0_S_WDATA[63:32] ),
      .M_AXI_IC_WSTRB ( axi4_0_S_WSTRB[7:4] ),
      .M_AXI_IC_WLAST ( axi4_0_S_WLAST[1] ),
      .M_AXI_IC_WVALID ( axi4_0_S_WVALID[1] ),
      .M_AXI_IC_WREADY ( axi4_0_S_WREADY[1] ),
      .M_AXI_IC_WUSER ( axi4_0_S_WUSER[1:1] ),
      .M_AXI_IC_BID ( axi4_0_S_BID[2:2] ),
      .M_AXI_IC_BRESP ( axi4_0_S_BRESP[3:2] ),
      .M_AXI_IC_BVALID ( axi4_0_S_BVALID[1] ),
      .M_AXI_IC_BREADY ( axi4_0_S_BREADY[1] ),
      .M_AXI_IC_BUSER ( axi4_0_S_BUSER[1:1] ),
      .M_AXI_IC_ARID ( axi4_0_S_ARID[2:2] ),
      .M_AXI_IC_ARADDR ( axi4_0_S_ARADDR[63:32] ),
      .M_AXI_IC_ARLEN ( axi4_0_S_ARLEN[15:8] ),
      .M_AXI_IC_ARSIZE ( axi4_0_S_ARSIZE[5:3] ),
      .M_AXI_IC_ARBURST ( axi4_0_S_ARBURST[3:2] ),
      .M_AXI_IC_ARLOCK ( axi4_0_S_ARLOCK[2] ),
      .M_AXI_IC_ARCACHE ( axi4_0_S_ARCACHE[7:4] ),
      .M_AXI_IC_ARPROT ( axi4_0_S_ARPROT[5:3] ),
      .M_AXI_IC_ARQOS ( axi4_0_S_ARQOS[7:4] ),
      .M_AXI_IC_ARVALID ( axi4_0_S_ARVALID[1] ),
      .M_AXI_IC_ARREADY ( axi4_0_S_ARREADY[1] ),
      .M_AXI_IC_ARUSER ( axi4_0_S_ARUSER[9:5] ),
      .M_AXI_IC_RID ( axi4_0_S_RID[2:2] ),
      .M_AXI_IC_RDATA ( axi4_0_S_RDATA[63:32] ),
      .M_AXI_IC_RRESP ( axi4_0_S_RRESP[3:2] ),
      .M_AXI_IC_RLAST ( axi4_0_S_RLAST[1] ),
      .M_AXI_IC_RVALID ( axi4_0_S_RVALID[1] ),
      .M_AXI_IC_RREADY ( axi4_0_S_RREADY[1] ),
      .M_AXI_IC_RUSER ( axi4_0_S_RUSER[1:1] ),
      .M_AXI_DC_AWID ( axi4_0_S_AWID[0:0] ),
      .M_AXI_DC_AWADDR ( axi4_0_S_AWADDR[31:0] ),
      .M_AXI_DC_AWLEN ( axi4_0_S_AWLEN[7:0] ),
      .M_AXI_DC_AWSIZE ( axi4_0_S_AWSIZE[2:0] ),
      .M_AXI_DC_AWBURST ( axi4_0_S_AWBURST[1:0] ),
      .M_AXI_DC_AWLOCK ( axi4_0_S_AWLOCK[0] ),
      .M_AXI_DC_AWCACHE ( axi4_0_S_AWCACHE[3:0] ),
      .M_AXI_DC_AWPROT ( axi4_0_S_AWPROT[2:0] ),
      .M_AXI_DC_AWQOS ( axi4_0_S_AWQOS[3:0] ),
      .M_AXI_DC_AWVALID ( axi4_0_S_AWVALID[0] ),
      .M_AXI_DC_AWREADY ( axi4_0_S_AWREADY[0] ),
      .M_AXI_DC_AWUSER ( axi4_0_S_AWUSER[4:0] ),
      .M_AXI_DC_WDATA ( axi4_0_S_WDATA[31:0] ),
      .M_AXI_DC_WSTRB ( axi4_0_S_WSTRB[3:0] ),
      .M_AXI_DC_WLAST ( axi4_0_S_WLAST[0] ),
      .M_AXI_DC_WVALID ( axi4_0_S_WVALID[0] ),
      .M_AXI_DC_WREADY ( axi4_0_S_WREADY[0] ),
      .M_AXI_DC_WUSER ( axi4_0_S_WUSER[0:0] ),
      .M_AXI_DC_BID ( axi4_0_S_BID[0:0] ),
      .M_AXI_DC_BRESP ( axi4_0_S_BRESP[1:0] ),
      .M_AXI_DC_BVALID ( axi4_0_S_BVALID[0] ),
      .M_AXI_DC_BREADY ( axi4_0_S_BREADY[0] ),
      .M_AXI_DC_BUSER ( axi4_0_S_BUSER[0:0] ),
      .M_AXI_DC_ARID ( axi4_0_S_ARID[0:0] ),
      .M_AXI_DC_ARADDR ( axi4_0_S_ARADDR[31:0] ),
      .M_AXI_DC_ARLEN ( axi4_0_S_ARLEN[7:0] ),
      .M_AXI_DC_ARSIZE ( axi4_0_S_ARSIZE[2:0] ),
      .M_AXI_DC_ARBURST ( axi4_0_S_ARBURST[1:0] ),
      .M_AXI_DC_ARLOCK ( axi4_0_S_ARLOCK[0] ),
      .M_AXI_DC_ARCACHE ( axi4_0_S_ARCACHE[3:0] ),
      .M_AXI_DC_ARPROT ( axi4_0_S_ARPROT[2:0] ),
      .M_AXI_DC_ARQOS ( axi4_0_S_ARQOS[3:0] ),
      .M_AXI_DC_ARVALID ( axi4_0_S_ARVALID[0] ),
      .M_AXI_DC_ARREADY ( axi4_0_S_ARREADY[0] ),
      .M_AXI_DC_ARUSER ( axi4_0_S_ARUSER[4:0] ),
      .M_AXI_DC_RID ( axi4_0_S_RID[0:0] ),
      .M_AXI_DC_RDATA ( axi4_0_S_RDATA[31:0] ),
      .M_AXI_DC_RRESP ( axi4_0_S_RRESP[1:0] ),
      .M_AXI_DC_RLAST ( axi4_0_S_RLAST[0] ),
      .M_AXI_DC_RVALID ( axi4_0_S_RVALID[0] ),
      .M_AXI_DC_RREADY ( axi4_0_S_RREADY[0] ),
      .M_AXI_DC_RUSER ( axi4_0_S_RUSER[0:0] ),
      .DBG_CLK ( microblaze_0_debug_Dbg_Clk ),
      .DBG_TDI ( microblaze_0_debug_Dbg_TDI ),
      .DBG_TDO ( microblaze_0_debug_Dbg_TDO ),
      .DBG_REG_EN ( microblaze_0_debug_Dbg_Reg_En ),
      .DBG_SHIFT ( microblaze_0_debug_Dbg_Shift ),
      .DBG_CAPTURE ( microblaze_0_debug_Dbg_Capture ),
      .DBG_UPDATE ( microblaze_0_debug_Dbg_Update ),
      .DEBUG_RST ( microblaze_0_debug_Debug_Rst ),
      .Trace_Instruction (  ),
      .Trace_Valid_Instr (  ),
      .Trace_PC (  ),
      .Trace_Reg_Write (  ),
      .Trace_Reg_Addr (  ),
      .Trace_MSR_Reg (  ),
      .Trace_PID_Reg (  ),
      .Trace_New_Reg_Value (  ),
      .Trace_Exception_Taken (  ),
      .Trace_Exception_Kind (  ),
      .Trace_Jump_Taken (  ),
      .Trace_Delay_Slot (  ),
      .Trace_Data_Address (  ),
      .Trace_Data_Access (  ),
      .Trace_Data_Read (  ),
      .Trace_Data_Write (  ),
      .Trace_Data_Write_Value (  ),
      .Trace_Data_Byte_Enable (  ),
      .Trace_DCache_Req (  ),
      .Trace_DCache_Hit (  ),
      .Trace_DCache_Rdy (  ),
      .Trace_DCache_Read (  ),
      .Trace_ICache_Req (  ),
      .Trace_ICache_Hit (  ),
      .Trace_ICache_Rdy (  ),
      .Trace_OF_PipeRun (  ),
      .Trace_EX_PipeRun (  ),
      .Trace_MEM_PipeRun (  ),
      .Trace_MB_Halted (  ),
      .Trace_Jump_Hit (  ),
      .FSL0_S_CLK (  ),
      .FSL0_S_READ (  ),
      .FSL0_S_DATA ( net_gnd32 ),
      .FSL0_S_CONTROL ( net_gnd0 ),
      .FSL0_S_EXISTS ( net_gnd0 ),
      .FSL0_M_CLK (  ),
      .FSL0_M_WRITE (  ),
      .FSL0_M_DATA (  ),
      .FSL0_M_CONTROL (  ),
      .FSL0_M_FULL ( net_gnd0 ),
      .FSL1_S_CLK (  ),
      .FSL1_S_READ (  ),
      .FSL1_S_DATA ( net_gnd32 ),
      .FSL1_S_CONTROL ( net_gnd0 ),
      .FSL1_S_EXISTS ( net_gnd0 ),
      .FSL1_M_CLK (  ),
      .FSL1_M_WRITE (  ),
      .FSL1_M_DATA (  ),
      .FSL1_M_CONTROL (  ),
      .FSL1_M_FULL ( net_gnd0 ),
      .FSL2_S_CLK (  ),
      .FSL2_S_READ (  ),
      .FSL2_S_DATA ( net_gnd32 ),
      .FSL2_S_CONTROL ( net_gnd0 ),
      .FSL2_S_EXISTS ( net_gnd0 ),
      .FSL2_M_CLK (  ),
      .FSL2_M_WRITE (  ),
      .FSL2_M_DATA (  ),
      .FSL2_M_CONTROL (  ),
      .FSL2_M_FULL ( net_gnd0 ),
      .FSL3_S_CLK (  ),
      .FSL3_S_READ (  ),
      .FSL3_S_DATA ( net_gnd32 ),
      .FSL3_S_CONTROL ( net_gnd0 ),
      .FSL3_S_EXISTS ( net_gnd0 ),
      .FSL3_M_CLK (  ),
      .FSL3_M_WRITE (  ),
      .FSL3_M_DATA (  ),
      .FSL3_M_CONTROL (  ),
      .FSL3_M_FULL ( net_gnd0 ),
      .FSL4_S_CLK (  ),
      .FSL4_S_READ (  ),
      .FSL4_S_DATA ( net_gnd32 ),
      .FSL4_S_CONTROL ( net_gnd0 ),
      .FSL4_S_EXISTS ( net_gnd0 ),
      .FSL4_M_CLK (  ),
      .FSL4_M_WRITE (  ),
      .FSL4_M_DATA (  ),
      .FSL4_M_CONTROL (  ),
      .FSL4_M_FULL ( net_gnd0 ),
      .FSL5_S_CLK (  ),
      .FSL5_S_READ (  ),
      .FSL5_S_DATA ( net_gnd32 ),
      .FSL5_S_CONTROL ( net_gnd0 ),
      .FSL5_S_EXISTS ( net_gnd0 ),
      .FSL5_M_CLK (  ),
      .FSL5_M_WRITE (  ),
      .FSL5_M_DATA (  ),
      .FSL5_M_CONTROL (  ),
      .FSL5_M_FULL ( net_gnd0 ),
      .FSL6_S_CLK (  ),
      .FSL6_S_READ (  ),
      .FSL6_S_DATA ( net_gnd32 ),
      .FSL6_S_CONTROL ( net_gnd0 ),
      .FSL6_S_EXISTS ( net_gnd0 ),
      .FSL6_M_CLK (  ),
      .FSL6_M_WRITE (  ),
      .FSL6_M_DATA (  ),
      .FSL6_M_CONTROL (  ),
      .FSL6_M_FULL ( net_gnd0 ),
      .FSL7_S_CLK (  ),
      .FSL7_S_READ (  ),
      .FSL7_S_DATA ( net_gnd32 ),
      .FSL7_S_CONTROL ( net_gnd0 ),
      .FSL7_S_EXISTS ( net_gnd0 ),
      .FSL7_M_CLK (  ),
      .FSL7_M_WRITE (  ),
      .FSL7_M_DATA (  ),
      .FSL7_M_CONTROL (  ),
      .FSL7_M_FULL ( net_gnd0 ),
      .FSL8_S_CLK (  ),
      .FSL8_S_READ (  ),
      .FSL8_S_DATA ( net_gnd32 ),
      .FSL8_S_CONTROL ( net_gnd0 ),
      .FSL8_S_EXISTS ( net_gnd0 ),
      .FSL8_M_CLK (  ),
      .FSL8_M_WRITE (  ),
      .FSL8_M_DATA (  ),
      .FSL8_M_CONTROL (  ),
      .FSL8_M_FULL ( net_gnd0 ),
      .FSL9_S_CLK (  ),
      .FSL9_S_READ (  ),
      .FSL9_S_DATA ( net_gnd32 ),
      .FSL9_S_CONTROL ( net_gnd0 ),
      .FSL9_S_EXISTS ( net_gnd0 ),
      .FSL9_M_CLK (  ),
      .FSL9_M_WRITE (  ),
      .FSL9_M_DATA (  ),
      .FSL9_M_CONTROL (  ),
      .FSL9_M_FULL ( net_gnd0 ),
      .FSL10_S_CLK (  ),
      .FSL10_S_READ (  ),
      .FSL10_S_DATA ( net_gnd32 ),
      .FSL10_S_CONTROL ( net_gnd0 ),
      .FSL10_S_EXISTS ( net_gnd0 ),
      .FSL10_M_CLK (  ),
      .FSL10_M_WRITE (  ),
      .FSL10_M_DATA (  ),
      .FSL10_M_CONTROL (  ),
      .FSL10_M_FULL ( net_gnd0 ),
      .FSL11_S_CLK (  ),
      .FSL11_S_READ (  ),
      .FSL11_S_DATA ( net_gnd32 ),
      .FSL11_S_CONTROL ( net_gnd0 ),
      .FSL11_S_EXISTS ( net_gnd0 ),
      .FSL11_M_CLK (  ),
      .FSL11_M_WRITE (  ),
      .FSL11_M_DATA (  ),
      .FSL11_M_CONTROL (  ),
      .FSL11_M_FULL ( net_gnd0 ),
      .FSL12_S_CLK (  ),
      .FSL12_S_READ (  ),
      .FSL12_S_DATA ( net_gnd32 ),
      .FSL12_S_CONTROL ( net_gnd0 ),
      .FSL12_S_EXISTS ( net_gnd0 ),
      .FSL12_M_CLK (  ),
      .FSL12_M_WRITE (  ),
      .FSL12_M_DATA (  ),
      .FSL12_M_CONTROL (  ),
      .FSL12_M_FULL ( net_gnd0 ),
      .FSL13_S_CLK (  ),
      .FSL13_S_READ (  ),
      .FSL13_S_DATA ( net_gnd32 ),
      .FSL13_S_CONTROL ( net_gnd0 ),
      .FSL13_S_EXISTS ( net_gnd0 ),
      .FSL13_M_CLK (  ),
      .FSL13_M_WRITE (  ),
      .FSL13_M_DATA (  ),
      .FSL13_M_CONTROL (  ),
      .FSL13_M_FULL ( net_gnd0 ),
      .FSL14_S_CLK (  ),
      .FSL14_S_READ (  ),
      .FSL14_S_DATA ( net_gnd32 ),
      .FSL14_S_CONTROL ( net_gnd0 ),
      .FSL14_S_EXISTS ( net_gnd0 ),
      .FSL14_M_CLK (  ),
      .FSL14_M_WRITE (  ),
      .FSL14_M_DATA (  ),
      .FSL14_M_CONTROL (  ),
      .FSL14_M_FULL ( net_gnd0 ),
      .FSL15_S_CLK (  ),
      .FSL15_S_READ (  ),
      .FSL15_S_DATA ( net_gnd32 ),
      .FSL15_S_CONTROL ( net_gnd0 ),
      .FSL15_S_EXISTS ( net_gnd0 ),
      .FSL15_M_CLK (  ),
      .FSL15_M_WRITE (  ),
      .FSL15_M_DATA (  ),
      .FSL15_M_CONTROL (  ),
      .FSL15_M_FULL ( net_gnd0 ),
      .M0_AXIS_TLAST (  ),
      .M0_AXIS_TDATA (  ),
      .M0_AXIS_TVALID (  ),
      .M0_AXIS_TREADY ( net_gnd0 ),
      .S0_AXIS_TLAST ( net_gnd0 ),
      .S0_AXIS_TDATA ( net_gnd32[0:31] ),
      .S0_AXIS_TVALID ( net_gnd0 ),
      .S0_AXIS_TREADY (  ),
      .M1_AXIS_TLAST (  ),
      .M1_AXIS_TDATA (  ),
      .M1_AXIS_TVALID (  ),
      .M1_AXIS_TREADY ( net_gnd0 ),
      .S1_AXIS_TLAST ( net_gnd0 ),
      .S1_AXIS_TDATA ( net_gnd32[0:31] ),
      .S1_AXIS_TVALID ( net_gnd0 ),
      .S1_AXIS_TREADY (  ),
      .M2_AXIS_TLAST (  ),
      .M2_AXIS_TDATA (  ),
      .M2_AXIS_TVALID (  ),
      .M2_AXIS_TREADY ( net_gnd0 ),
      .S2_AXIS_TLAST ( net_gnd0 ),
      .S2_AXIS_TDATA ( net_gnd32[0:31] ),
      .S2_AXIS_TVALID ( net_gnd0 ),
      .S2_AXIS_TREADY (  ),
      .M3_AXIS_TLAST (  ),
      .M3_AXIS_TDATA (  ),
      .M3_AXIS_TVALID (  ),
      .M3_AXIS_TREADY ( net_gnd0 ),
      .S3_AXIS_TLAST ( net_gnd0 ),
      .S3_AXIS_TDATA ( net_gnd32[0:31] ),
      .S3_AXIS_TVALID ( net_gnd0 ),
      .S3_AXIS_TREADY (  ),
      .M4_AXIS_TLAST (  ),
      .M4_AXIS_TDATA (  ),
      .M4_AXIS_TVALID (  ),
      .M4_AXIS_TREADY ( net_gnd0 ),
      .S4_AXIS_TLAST ( net_gnd0 ),
      .S4_AXIS_TDATA ( net_gnd32[0:31] ),
      .S4_AXIS_TVALID ( net_gnd0 ),
      .S4_AXIS_TREADY (  ),
      .M5_AXIS_TLAST (  ),
      .M5_AXIS_TDATA (  ),
      .M5_AXIS_TVALID (  ),
      .M5_AXIS_TREADY ( net_gnd0 ),
      .S5_AXIS_TLAST ( net_gnd0 ),
      .S5_AXIS_TDATA ( net_gnd32[0:31] ),
      .S5_AXIS_TVALID ( net_gnd0 ),
      .S5_AXIS_TREADY (  ),
      .M6_AXIS_TLAST (  ),
      .M6_AXIS_TDATA (  ),
      .M6_AXIS_TVALID (  ),
      .M6_AXIS_TREADY ( net_gnd0 ),
      .S6_AXIS_TLAST ( net_gnd0 ),
      .S6_AXIS_TDATA ( net_gnd32[0:31] ),
      .S6_AXIS_TVALID ( net_gnd0 ),
      .S6_AXIS_TREADY (  ),
      .M7_AXIS_TLAST (  ),
      .M7_AXIS_TDATA (  ),
      .M7_AXIS_TVALID (  ),
      .M7_AXIS_TREADY ( net_gnd0 ),
      .S7_AXIS_TLAST ( net_gnd0 ),
      .S7_AXIS_TDATA ( net_gnd32[0:31] ),
      .S7_AXIS_TVALID ( net_gnd0 ),
      .S7_AXIS_TREADY (  ),
      .M8_AXIS_TLAST (  ),
      .M8_AXIS_TDATA (  ),
      .M8_AXIS_TVALID (  ),
      .M8_AXIS_TREADY ( net_gnd0 ),
      .S8_AXIS_TLAST ( net_gnd0 ),
      .S8_AXIS_TDATA ( net_gnd32[0:31] ),
      .S8_AXIS_TVALID ( net_gnd0 ),
      .S8_AXIS_TREADY (  ),
      .M9_AXIS_TLAST (  ),
      .M9_AXIS_TDATA (  ),
      .M9_AXIS_TVALID (  ),
      .M9_AXIS_TREADY ( net_gnd0 ),
      .S9_AXIS_TLAST ( net_gnd0 ),
      .S9_AXIS_TDATA ( net_gnd32[0:31] ),
      .S9_AXIS_TVALID ( net_gnd0 ),
      .S9_AXIS_TREADY (  ),
      .M10_AXIS_TLAST (  ),
      .M10_AXIS_TDATA (  ),
      .M10_AXIS_TVALID (  ),
      .M10_AXIS_TREADY ( net_gnd0 ),
      .S10_AXIS_TLAST ( net_gnd0 ),
      .S10_AXIS_TDATA ( net_gnd32[0:31] ),
      .S10_AXIS_TVALID ( net_gnd0 ),
      .S10_AXIS_TREADY (  ),
      .M11_AXIS_TLAST (  ),
      .M11_AXIS_TDATA (  ),
      .M11_AXIS_TVALID (  ),
      .M11_AXIS_TREADY ( net_gnd0 ),
      .S11_AXIS_TLAST ( net_gnd0 ),
      .S11_AXIS_TDATA ( net_gnd32[0:31] ),
      .S11_AXIS_TVALID ( net_gnd0 ),
      .S11_AXIS_TREADY (  ),
      .M12_AXIS_TLAST (  ),
      .M12_AXIS_TDATA (  ),
      .M12_AXIS_TVALID (  ),
      .M12_AXIS_TREADY ( net_gnd0 ),
      .S12_AXIS_TLAST ( net_gnd0 ),
      .S12_AXIS_TDATA ( net_gnd32[0:31] ),
      .S12_AXIS_TVALID ( net_gnd0 ),
      .S12_AXIS_TREADY (  ),
      .M13_AXIS_TLAST (  ),
      .M13_AXIS_TDATA (  ),
      .M13_AXIS_TVALID (  ),
      .M13_AXIS_TREADY ( net_gnd0 ),
      .S13_AXIS_TLAST ( net_gnd0 ),
      .S13_AXIS_TDATA ( net_gnd32[0:31] ),
      .S13_AXIS_TVALID ( net_gnd0 ),
      .S13_AXIS_TREADY (  ),
      .M14_AXIS_TLAST (  ),
      .M14_AXIS_TDATA (  ),
      .M14_AXIS_TVALID (  ),
      .M14_AXIS_TREADY ( net_gnd0 ),
      .S14_AXIS_TLAST ( net_gnd0 ),
      .S14_AXIS_TDATA ( net_gnd32[0:31] ),
      .S14_AXIS_TVALID ( net_gnd0 ),
      .S14_AXIS_TREADY (  ),
      .M15_AXIS_TLAST (  ),
      .M15_AXIS_TDATA (  ),
      .M15_AXIS_TVALID (  ),
      .M15_AXIS_TREADY ( net_gnd0 ),
      .S15_AXIS_TLAST ( net_gnd0 ),
      .S15_AXIS_TDATA ( net_gnd32[0:31] ),
      .S15_AXIS_TVALID ( net_gnd0 ),
      .S15_AXIS_TREADY (  ),
      .ICACHE_FSL_IN_CLK (  ),
      .ICACHE_FSL_IN_READ (  ),
      .ICACHE_FSL_IN_DATA ( net_gnd32 ),
      .ICACHE_FSL_IN_CONTROL ( net_gnd0 ),
      .ICACHE_FSL_IN_EXISTS ( net_gnd0 ),
      .ICACHE_FSL_OUT_CLK (  ),
      .ICACHE_FSL_OUT_WRITE (  ),
      .ICACHE_FSL_OUT_DATA (  ),
      .ICACHE_FSL_OUT_CONTROL (  ),
      .ICACHE_FSL_OUT_FULL ( net_gnd0 ),
      .DCACHE_FSL_IN_CLK (  ),
      .DCACHE_FSL_IN_READ (  ),
      .DCACHE_FSL_IN_DATA ( net_gnd32 ),
      .DCACHE_FSL_IN_CONTROL ( net_gnd0 ),
      .DCACHE_FSL_IN_EXISTS ( net_gnd0 ),
      .DCACHE_FSL_OUT_CLK (  ),
      .DCACHE_FSL_OUT_WRITE (  ),
      .DCACHE_FSL_OUT_DATA (  ),
      .DCACHE_FSL_OUT_CONTROL (  ),
      .DCACHE_FSL_OUT_FULL ( net_gnd0 )
    );

  (* BOX_TYPE = "user_black_box" *)
  debug_module_wrapper
    debug_module (
      .Interrupt (  ),
      .Debug_SYS_Rst ( proc_sys_reset_0_MB_Debug_Sys_Rst ),
      .Ext_BRK ( Ext_BRK ),
      .Ext_NM_BRK ( Ext_NM_BRK ),
      .S_AXI_ACLK ( clk_100_0000MHzPLL0[0] ),
      .S_AXI_ARESETN ( axi4lite_0_M_ARESETN[0] ),
      .S_AXI_AWADDR ( axi4lite_0_M_AWADDR[31:0] ),
      .S_AXI_AWVALID ( axi4lite_0_M_AWVALID[0] ),
      .S_AXI_AWREADY ( axi4lite_0_M_AWREADY[0] ),
      .S_AXI_WDATA ( axi4lite_0_M_WDATA[31:0] ),
      .S_AXI_WSTRB ( axi4lite_0_M_WSTRB[3:0] ),
      .S_AXI_WVALID ( axi4lite_0_M_WVALID[0] ),
      .S_AXI_WREADY ( axi4lite_0_M_WREADY[0] ),
      .S_AXI_BRESP ( axi4lite_0_M_BRESP[1:0] ),
      .S_AXI_BVALID ( axi4lite_0_M_BVALID[0] ),
      .S_AXI_BREADY ( axi4lite_0_M_BREADY[0] ),
      .S_AXI_ARADDR ( axi4lite_0_M_ARADDR[31:0] ),
      .S_AXI_ARVALID ( axi4lite_0_M_ARVALID[0] ),
      .S_AXI_ARREADY ( axi4lite_0_M_ARREADY[0] ),
      .S_AXI_RDATA ( axi4lite_0_M_RDATA[31:0] ),
      .S_AXI_RRESP ( axi4lite_0_M_RRESP[1:0] ),
      .S_AXI_RVALID ( axi4lite_0_M_RVALID[0] ),
      .S_AXI_RREADY ( axi4lite_0_M_RREADY[0] ),
      .SPLB_Clk ( net_gnd0 ),
      .SPLB_Rst ( net_gnd0 ),
      .PLB_ABus ( net_gnd32 ),
      .PLB_UABus ( net_gnd32 ),
      .PLB_PAValid ( net_gnd0 ),
      .PLB_SAValid ( net_gnd0 ),
      .PLB_rdPrim ( net_gnd0 ),
      .PLB_wrPrim ( net_gnd0 ),
      .PLB_masterID ( net_gnd3 ),
      .PLB_abort ( net_gnd0 ),
      .PLB_busLock ( net_gnd0 ),
      .PLB_RNW ( net_gnd0 ),
      .PLB_BE ( net_gnd4 ),
      .PLB_MSize ( net_gnd2 ),
      .PLB_size ( net_gnd4 ),
      .PLB_type ( net_gnd3 ),
      .PLB_lockErr ( net_gnd0 ),
      .PLB_wrDBus ( net_gnd32 ),
      .PLB_wrBurst ( net_gnd0 ),
      .PLB_rdBurst ( net_gnd0 ),
      .PLB_wrPendReq ( net_gnd0 ),
      .PLB_rdPendReq ( net_gnd0 ),
      .PLB_wrPendPri ( net_gnd2 ),
      .PLB_rdPendPri ( net_gnd2 ),
      .PLB_reqPri ( net_gnd2 ),
      .PLB_TAttribute ( net_gnd16 ),
      .Sl_addrAck (  ),
      .Sl_SSize (  ),
      .Sl_wait (  ),
      .Sl_rearbitrate (  ),
      .Sl_wrDAck (  ),
      .Sl_wrComp (  ),
      .Sl_wrBTerm (  ),
      .Sl_rdDBus (  ),
      .Sl_rdWdAddr (  ),
      .Sl_rdDAck (  ),
      .Sl_rdComp (  ),
      .Sl_rdBTerm (  ),
      .Sl_MBusy (  ),
      .Sl_MWrErr (  ),
      .Sl_MRdErr (  ),
      .Sl_MIRQ (  ),
      .Dbg_Clk_0 ( microblaze_0_debug_Dbg_Clk ),
      .Dbg_TDI_0 ( microblaze_0_debug_Dbg_TDI ),
      .Dbg_TDO_0 ( microblaze_0_debug_Dbg_TDO ),
      .Dbg_Reg_En_0 ( microblaze_0_debug_Dbg_Reg_En ),
      .Dbg_Capture_0 ( microblaze_0_debug_Dbg_Capture ),
      .Dbg_Shift_0 ( microblaze_0_debug_Dbg_Shift ),
      .Dbg_Update_0 ( microblaze_0_debug_Dbg_Update ),
      .Dbg_Rst_0 ( microblaze_0_debug_Debug_Rst ),
      .Dbg_Clk_1 (  ),
      .Dbg_TDI_1 (  ),
      .Dbg_TDO_1 ( net_gnd0 ),
      .Dbg_Reg_En_1 (  ),
      .Dbg_Capture_1 (  ),
      .Dbg_Shift_1 (  ),
      .Dbg_Update_1 (  ),
      .Dbg_Rst_1 (  ),
      .Dbg_Clk_2 (  ),
      .Dbg_TDI_2 (  ),
      .Dbg_TDO_2 ( net_gnd0 ),
      .Dbg_Reg_En_2 (  ),
      .Dbg_Capture_2 (  ),
      .Dbg_Shift_2 (  ),
      .Dbg_Update_2 (  ),
      .Dbg_Rst_2 (  ),
      .Dbg_Clk_3 (  ),
      .Dbg_TDI_3 (  ),
      .Dbg_TDO_3 ( net_gnd0 ),
      .Dbg_Reg_En_3 (  ),
      .Dbg_Capture_3 (  ),
      .Dbg_Shift_3 (  ),
      .Dbg_Update_3 (  ),
      .Dbg_Rst_3 (  ),
      .Dbg_Clk_4 (  ),
      .Dbg_TDI_4 (  ),
      .Dbg_TDO_4 ( net_gnd0 ),
      .Dbg_Reg_En_4 (  ),
      .Dbg_Capture_4 (  ),
      .Dbg_Shift_4 (  ),
      .Dbg_Update_4 (  ),
      .Dbg_Rst_4 (  ),
      .Dbg_Clk_5 (  ),
      .Dbg_TDI_5 (  ),
      .Dbg_TDO_5 ( net_gnd0 ),
      .Dbg_Reg_En_5 (  ),
      .Dbg_Capture_5 (  ),
      .Dbg_Shift_5 (  ),
      .Dbg_Update_5 (  ),
      .Dbg_Rst_5 (  ),
      .Dbg_Clk_6 (  ),
      .Dbg_TDI_6 (  ),
      .Dbg_TDO_6 ( net_gnd0 ),
      .Dbg_Reg_En_6 (  ),
      .Dbg_Capture_6 (  ),
      .Dbg_Shift_6 (  ),
      .Dbg_Update_6 (  ),
      .Dbg_Rst_6 (  ),
      .Dbg_Clk_7 (  ),
      .Dbg_TDI_7 (  ),
      .Dbg_TDO_7 ( net_gnd0 ),
      .Dbg_Reg_En_7 (  ),
      .Dbg_Capture_7 (  ),
      .Dbg_Shift_7 (  ),
      .Dbg_Update_7 (  ),
      .Dbg_Rst_7 (  ),
      .bscan_tdi ( bscan_tdi ),
      .bscan_reset ( bscan_reset ),
      .bscan_shift ( bscan_shift ),
      .bscan_update ( bscan_update ),
      .bscan_capture ( bscan_capture ),
      .bscan_sel1 ( bscan_sel1 ),
      .bscan_drck1 ( bscan_drck1 ),
      .bscan_tdo1 ( bscan_tdo1 ),
      .Ext_JTAG_DRCK (  ),
      .Ext_JTAG_RESET (  ),
      .Ext_JTAG_SEL (  ),
      .Ext_JTAG_CAPTURE (  ),
      .Ext_JTAG_SHIFT (  ),
      .Ext_JTAG_UPDATE (  ),
      .Ext_JTAG_TDI (  ),
      .Ext_JTAG_TDO ( net_gnd0 )
    );

  (* BOX_TYPE = "user_black_box" *)
  clock_generator_0_wrapper
    clock_generator_0 (
      .CLKIN ( GCLK ),
      .CLKOUT0 ( clk_600_0000MHzPLL0_nobuf ),
      .CLKOUT1 ( clk_600_0000MHz180PLL0_nobuf ),
      .CLKOUT2 ( clk_100_0000MHzPLL0[0] ),
      .CLKOUT3 ( clock_generator_0_CLKOUT3 ),
      .CLKOUT4 ( clock_generator_0_CLKOUT4 ),
      .CLKOUT5 (  ),
      .CLKOUT6 (  ),
      .CLKOUT7 (  ),
      .CLKOUT8 (  ),
      .CLKOUT9 (  ),
      .CLKOUT10 (  ),
      .CLKOUT11 (  ),
      .CLKOUT12 (  ),
      .CLKOUT13 (  ),
      .CLKOUT14 (  ),
      .CLKOUT15 (  ),
      .CLKFBIN ( net_gnd0 ),
      .CLKFBOUT (  ),
      .PSCLK ( net_gnd0 ),
      .PSEN ( net_gnd0 ),
      .PSINCDEC ( net_gnd0 ),
      .PSDONE (  ),
      .RST ( RESET ),
      .LOCKED ( proc_sys_reset_0_Dcm_locked )
    );

  (* BOX_TYPE = "user_black_box" *)
  axi4lite_0_wrapper
    axi4lite_0 (
      .INTERCONNECT_ACLK ( clk_100_0000MHzPLL0[0] ),
      .INTERCONNECT_ARESETN ( proc_sys_reset_0_Interconnect_aresetn[0] ),
      .S_AXI_ARESET_OUT_N (  ),
      .M_AXI_ARESET_OUT_N ( axi4lite_0_M_ARESETN ),
      .IRQ (  ),
      .S_AXI_ACLK ( clk_100_0000MHzPLL0[0:0] ),
      .S_AXI_AWID ( axi4lite_0_S_AWID[0:0] ),
      .S_AXI_AWADDR ( axi4lite_0_S_AWADDR ),
      .S_AXI_AWLEN ( axi4lite_0_S_AWLEN ),
      .S_AXI_AWSIZE ( axi4lite_0_S_AWSIZE ),
      .S_AXI_AWBURST ( axi4lite_0_S_AWBURST ),
      .S_AXI_AWLOCK ( axi4lite_0_S_AWLOCK ),
      .S_AXI_AWCACHE ( axi4lite_0_S_AWCACHE ),
      .S_AXI_AWPROT ( axi4lite_0_S_AWPROT ),
      .S_AXI_AWQOS ( axi4lite_0_S_AWQOS ),
      .S_AXI_AWUSER ( net_gnd1[0:0] ),
      .S_AXI_AWVALID ( axi4lite_0_S_AWVALID[0:0] ),
      .S_AXI_AWREADY ( axi4lite_0_S_AWREADY[0:0] ),
      .S_AXI_WID ( net_gnd1[0:0] ),
      .S_AXI_WDATA ( axi4lite_0_S_WDATA ),
      .S_AXI_WSTRB ( axi4lite_0_S_WSTRB ),
      .S_AXI_WLAST ( axi4lite_0_S_WLAST[0:0] ),
      .S_AXI_WUSER ( net_gnd1[0:0] ),
      .S_AXI_WVALID ( axi4lite_0_S_WVALID[0:0] ),
      .S_AXI_WREADY ( axi4lite_0_S_WREADY[0:0] ),
      .S_AXI_BID ( axi4lite_0_S_BID[0:0] ),
      .S_AXI_BRESP ( axi4lite_0_S_BRESP ),
      .S_AXI_BUSER (  ),
      .S_AXI_BVALID ( axi4lite_0_S_BVALID[0:0] ),
      .S_AXI_BREADY ( axi4lite_0_S_BREADY[0:0] ),
      .S_AXI_ARID ( axi4lite_0_S_ARID[0:0] ),
      .S_AXI_ARADDR ( axi4lite_0_S_ARADDR ),
      .S_AXI_ARLEN ( axi4lite_0_S_ARLEN ),
      .S_AXI_ARSIZE ( axi4lite_0_S_ARSIZE ),
      .S_AXI_ARBURST ( axi4lite_0_S_ARBURST ),
      .S_AXI_ARLOCK ( axi4lite_0_S_ARLOCK ),
      .S_AXI_ARCACHE ( axi4lite_0_S_ARCACHE ),
      .S_AXI_ARPROT ( axi4lite_0_S_ARPROT ),
      .S_AXI_ARQOS ( axi4lite_0_S_ARQOS ),
      .S_AXI_ARUSER ( net_gnd1[0:0] ),
      .S_AXI_ARVALID ( axi4lite_0_S_ARVALID[0:0] ),
      .S_AXI_ARREADY ( axi4lite_0_S_ARREADY[0:0] ),
      .S_AXI_RID ( axi4lite_0_S_RID[0:0] ),
      .S_AXI_RDATA ( axi4lite_0_S_RDATA ),
      .S_AXI_RRESP ( axi4lite_0_S_RRESP ),
      .S_AXI_RLAST ( axi4lite_0_S_RLAST[0:0] ),
      .S_AXI_RUSER (  ),
      .S_AXI_RVALID ( axi4lite_0_S_RVALID[0:0] ),
      .S_AXI_RREADY ( axi4lite_0_S_RREADY[0:0] ),
      .M_AXI_ACLK ( pgassign1 ),
      .M_AXI_AWID ( axi4lite_0_M_AWID ),
      .M_AXI_AWADDR ( axi4lite_0_M_AWADDR ),
      .M_AXI_AWLEN ( axi4lite_0_M_AWLEN ),
      .M_AXI_AWSIZE ( axi4lite_0_M_AWSIZE ),
      .M_AXI_AWBURST ( axi4lite_0_M_AWBURST ),
      .M_AXI_AWLOCK (  ),
      .M_AXI_AWCACHE ( axi4lite_0_M_AWCACHE ),
      .M_AXI_AWPROT (  ),
      .M_AXI_AWREGION (  ),
      .M_AXI_AWQOS (  ),
      .M_AXI_AWUSER (  ),
      .M_AXI_AWVALID ( axi4lite_0_M_AWVALID ),
      .M_AXI_AWREADY ( axi4lite_0_M_AWREADY ),
      .M_AXI_WID (  ),
      .M_AXI_WDATA ( axi4lite_0_M_WDATA ),
      .M_AXI_WSTRB ( axi4lite_0_M_WSTRB ),
      .M_AXI_WLAST ( axi4lite_0_M_WLAST ),
      .M_AXI_WUSER (  ),
      .M_AXI_WVALID ( axi4lite_0_M_WVALID ),
      .M_AXI_WREADY ( axi4lite_0_M_WREADY ),
      .M_AXI_BID ( axi4lite_0_M_BID ),
      .M_AXI_BRESP ( axi4lite_0_M_BRESP ),
      .M_AXI_BUSER ( net_gnd11 ),
      .M_AXI_BVALID ( axi4lite_0_M_BVALID ),
      .M_AXI_BREADY ( axi4lite_0_M_BREADY ),
      .M_AXI_ARID ( axi4lite_0_M_ARID ),
      .M_AXI_ARADDR ( axi4lite_0_M_ARADDR ),
      .M_AXI_ARLEN ( axi4lite_0_M_ARLEN ),
      .M_AXI_ARSIZE ( axi4lite_0_M_ARSIZE ),
      .M_AXI_ARBURST ( axi4lite_0_M_ARBURST ),
      .M_AXI_ARLOCK (  ),
      .M_AXI_ARCACHE ( axi4lite_0_M_ARCACHE ),
      .M_AXI_ARPROT (  ),
      .M_AXI_ARREGION (  ),
      .M_AXI_ARQOS (  ),
      .M_AXI_ARUSER (  ),
      .M_AXI_ARVALID ( axi4lite_0_M_ARVALID ),
      .M_AXI_ARREADY ( axi4lite_0_M_ARREADY ),
      .M_AXI_RID ( axi4lite_0_M_RID ),
      .M_AXI_RDATA ( axi4lite_0_M_RDATA ),
      .M_AXI_RRESP ( axi4lite_0_M_RRESP ),
      .M_AXI_RLAST ( axi4lite_0_M_RLAST ),
      .M_AXI_RUSER ( net_gnd11 ),
      .M_AXI_RVALID ( axi4lite_0_M_RVALID ),
      .M_AXI_RREADY ( axi4lite_0_M_RREADY ),
      .S_AXI_CTRL_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32[0:31] ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 ),
      .INTERCONNECT_ARESET_OUT_N (  ),
      .DEBUG_AW_TRANS_SEQ (  ),
      .DEBUG_AW_ARB_GRANT (  ),
      .DEBUG_AR_TRANS_SEQ (  ),
      .DEBUG_AR_ARB_GRANT (  ),
      .DEBUG_AW_TRANS_QUAL (  ),
      .DEBUG_AW_ACCEPT_CNT (  ),
      .DEBUG_AW_ACTIVE_THREAD (  ),
      .DEBUG_AW_ACTIVE_TARGET (  ),
      .DEBUG_AW_ACTIVE_REGION (  ),
      .DEBUG_AW_ERROR (  ),
      .DEBUG_AW_TARGET (  ),
      .DEBUG_AR_TRANS_QUAL (  ),
      .DEBUG_AR_ACCEPT_CNT (  ),
      .DEBUG_AR_ACTIVE_THREAD (  ),
      .DEBUG_AR_ACTIVE_TARGET (  ),
      .DEBUG_AR_ACTIVE_REGION (  ),
      .DEBUG_AR_ERROR (  ),
      .DEBUG_AR_TARGET (  ),
      .DEBUG_B_TRANS_SEQ (  ),
      .DEBUG_R_BEAT_CNT (  ),
      .DEBUG_R_TRANS_SEQ (  ),
      .DEBUG_AW_ISSUING_CNT (  ),
      .DEBUG_AR_ISSUING_CNT (  ),
      .DEBUG_W_BEAT_CNT (  ),
      .DEBUG_W_TRANS_SEQ (  ),
      .DEBUG_BID_TARGET (  ),
      .DEBUG_BID_ERROR (  ),
      .DEBUG_RID_TARGET (  ),
      .DEBUG_RID_ERROR (  ),
      .DEBUG_SR_SC_ARADDR (  ),
      .DEBUG_SR_SC_ARADDRCONTROL (  ),
      .DEBUG_SR_SC_AWADDR (  ),
      .DEBUG_SR_SC_AWADDRCONTROL (  ),
      .DEBUG_SR_SC_BRESP (  ),
      .DEBUG_SR_SC_RDATA (  ),
      .DEBUG_SR_SC_RDATACONTROL (  ),
      .DEBUG_SR_SC_WDATA (  ),
      .DEBUG_SR_SC_WDATACONTROL (  ),
      .DEBUG_SC_SF_ARADDR (  ),
      .DEBUG_SC_SF_ARADDRCONTROL (  ),
      .DEBUG_SC_SF_AWADDR (  ),
      .DEBUG_SC_SF_AWADDRCONTROL (  ),
      .DEBUG_SC_SF_BRESP (  ),
      .DEBUG_SC_SF_RDATA (  ),
      .DEBUG_SC_SF_RDATACONTROL (  ),
      .DEBUG_SC_SF_WDATA (  ),
      .DEBUG_SC_SF_WDATACONTROL (  ),
      .DEBUG_SF_CB_ARADDR (  ),
      .DEBUG_SF_CB_ARADDRCONTROL (  ),
      .DEBUG_SF_CB_AWADDR (  ),
      .DEBUG_SF_CB_AWADDRCONTROL (  ),
      .DEBUG_SF_CB_BRESP (  ),
      .DEBUG_SF_CB_RDATA (  ),
      .DEBUG_SF_CB_RDATACONTROL (  ),
      .DEBUG_SF_CB_WDATA (  ),
      .DEBUG_SF_CB_WDATACONTROL (  ),
      .DEBUG_CB_MF_ARADDR (  ),
      .DEBUG_CB_MF_ARADDRCONTROL (  ),
      .DEBUG_CB_MF_AWADDR (  ),
      .DEBUG_CB_MF_AWADDRCONTROL (  ),
      .DEBUG_CB_MF_BRESP (  ),
      .DEBUG_CB_MF_RDATA (  ),
      .DEBUG_CB_MF_RDATACONTROL (  ),
      .DEBUG_CB_MF_WDATA (  ),
      .DEBUG_CB_MF_WDATACONTROL (  ),
      .DEBUG_MF_MC_ARADDR (  ),
      .DEBUG_MF_MC_ARADDRCONTROL (  ),
      .DEBUG_MF_MC_AWADDR (  ),
      .DEBUG_MF_MC_AWADDRCONTROL (  ),
      .DEBUG_MF_MC_BRESP (  ),
      .DEBUG_MF_MC_RDATA (  ),
      .DEBUG_MF_MC_RDATACONTROL (  ),
      .DEBUG_MF_MC_WDATA (  ),
      .DEBUG_MF_MC_WDATACONTROL (  ),
      .DEBUG_MC_MP_ARADDR (  ),
      .DEBUG_MC_MP_ARADDRCONTROL (  ),
      .DEBUG_MC_MP_AWADDR (  ),
      .DEBUG_MC_MP_AWADDRCONTROL (  ),
      .DEBUG_MC_MP_BRESP (  ),
      .DEBUG_MC_MP_RDATA (  ),
      .DEBUG_MC_MP_RDATACONTROL (  ),
      .DEBUG_MC_MP_WDATA (  ),
      .DEBUG_MC_MP_WDATACONTROL (  ),
      .DEBUG_MP_MR_ARADDR (  ),
      .DEBUG_MP_MR_ARADDRCONTROL (  ),
      .DEBUG_MP_MR_AWADDR (  ),
      .DEBUG_MP_MR_AWADDRCONTROL (  ),
      .DEBUG_MP_MR_BRESP (  ),
      .DEBUG_MP_MR_RDATA (  ),
      .DEBUG_MP_MR_RDATACONTROL (  ),
      .DEBUG_MP_MR_WDATA (  ),
      .DEBUG_MP_MR_WDATACONTROL (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  axi4_0_wrapper
    axi4_0 (
      .INTERCONNECT_ACLK ( clk_100_0000MHzPLL0[0] ),
      .INTERCONNECT_ARESETN ( proc_sys_reset_0_Interconnect_aresetn[0] ),
      .S_AXI_ARESET_OUT_N (  ),
      .M_AXI_ARESET_OUT_N ( axi4_0_M_ARESETN[0:0] ),
      .IRQ (  ),
      .S_AXI_ACLK ( pgassign2 ),
      .S_AXI_AWID ( axi4_0_S_AWID ),
      .S_AXI_AWADDR ( axi4_0_S_AWADDR ),
      .S_AXI_AWLEN ( axi4_0_S_AWLEN ),
      .S_AXI_AWSIZE ( axi4_0_S_AWSIZE ),
      .S_AXI_AWBURST ( axi4_0_S_AWBURST ),
      .S_AXI_AWLOCK ( axi4_0_S_AWLOCK ),
      .S_AXI_AWCACHE ( axi4_0_S_AWCACHE ),
      .S_AXI_AWPROT ( axi4_0_S_AWPROT ),
      .S_AXI_AWQOS ( axi4_0_S_AWQOS ),
      .S_AXI_AWUSER ( axi4_0_S_AWUSER ),
      .S_AXI_AWVALID ( axi4_0_S_AWVALID ),
      .S_AXI_AWREADY ( axi4_0_S_AWREADY ),
      .S_AXI_WID ( net_gnd8 ),
      .S_AXI_WDATA ( axi4_0_S_WDATA ),
      .S_AXI_WSTRB ( axi4_0_S_WSTRB ),
      .S_AXI_WLAST ( axi4_0_S_WLAST ),
      .S_AXI_WUSER ( axi4_0_S_WUSER ),
      .S_AXI_WVALID ( axi4_0_S_WVALID ),
      .S_AXI_WREADY ( axi4_0_S_WREADY ),
      .S_AXI_BID ( axi4_0_S_BID ),
      .S_AXI_BRESP ( axi4_0_S_BRESP ),
      .S_AXI_BUSER ( axi4_0_S_BUSER ),
      .S_AXI_BVALID ( axi4_0_S_BVALID ),
      .S_AXI_BREADY ( axi4_0_S_BREADY ),
      .S_AXI_ARID ( axi4_0_S_ARID ),
      .S_AXI_ARADDR ( axi4_0_S_ARADDR ),
      .S_AXI_ARLEN ( axi4_0_S_ARLEN ),
      .S_AXI_ARSIZE ( axi4_0_S_ARSIZE ),
      .S_AXI_ARBURST ( axi4_0_S_ARBURST ),
      .S_AXI_ARLOCK ( axi4_0_S_ARLOCK ),
      .S_AXI_ARCACHE ( axi4_0_S_ARCACHE ),
      .S_AXI_ARPROT ( axi4_0_S_ARPROT ),
      .S_AXI_ARQOS ( axi4_0_S_ARQOS ),
      .S_AXI_ARUSER ( axi4_0_S_ARUSER ),
      .S_AXI_ARVALID ( axi4_0_S_ARVALID ),
      .S_AXI_ARREADY ( axi4_0_S_ARREADY ),
      .S_AXI_RID ( axi4_0_S_RID ),
      .S_AXI_RDATA ( axi4_0_S_RDATA ),
      .S_AXI_RRESP ( axi4_0_S_RRESP ),
      .S_AXI_RLAST ( axi4_0_S_RLAST ),
      .S_AXI_RUSER ( axi4_0_S_RUSER ),
      .S_AXI_RVALID ( axi4_0_S_RVALID ),
      .S_AXI_RREADY ( axi4_0_S_RREADY ),
      .M_AXI_ACLK ( clk_100_0000MHzPLL0[0:0] ),
      .M_AXI_AWID ( axi4_0_M_AWID ),
      .M_AXI_AWADDR ( axi4_0_M_AWADDR ),
      .M_AXI_AWLEN ( axi4_0_M_AWLEN ),
      .M_AXI_AWSIZE ( axi4_0_M_AWSIZE ),
      .M_AXI_AWBURST ( axi4_0_M_AWBURST ),
      .M_AXI_AWLOCK ( axi4_0_M_AWLOCK ),
      .M_AXI_AWCACHE ( axi4_0_M_AWCACHE ),
      .M_AXI_AWPROT ( axi4_0_M_AWPROT ),
      .M_AXI_AWREGION (  ),
      .M_AXI_AWQOS ( axi4_0_M_AWQOS ),
      .M_AXI_AWUSER (  ),
      .M_AXI_AWVALID ( axi4_0_M_AWVALID[0:0] ),
      .M_AXI_AWREADY ( axi4_0_M_AWREADY[0:0] ),
      .M_AXI_WID (  ),
      .M_AXI_WDATA ( axi4_0_M_WDATA ),
      .M_AXI_WSTRB ( axi4_0_M_WSTRB ),
      .M_AXI_WLAST ( axi4_0_M_WLAST[0:0] ),
      .M_AXI_WUSER (  ),
      .M_AXI_WVALID ( axi4_0_M_WVALID[0:0] ),
      .M_AXI_WREADY ( axi4_0_M_WREADY[0:0] ),
      .M_AXI_BID ( axi4_0_M_BID ),
      .M_AXI_BRESP ( axi4_0_M_BRESP ),
      .M_AXI_BUSER ( net_gnd1[0:0] ),
      .M_AXI_BVALID ( axi4_0_M_BVALID[0:0] ),
      .M_AXI_BREADY ( axi4_0_M_BREADY[0:0] ),
      .M_AXI_ARID ( axi4_0_M_ARID ),
      .M_AXI_ARADDR ( axi4_0_M_ARADDR ),
      .M_AXI_ARLEN ( axi4_0_M_ARLEN ),
      .M_AXI_ARSIZE ( axi4_0_M_ARSIZE ),
      .M_AXI_ARBURST ( axi4_0_M_ARBURST ),
      .M_AXI_ARLOCK ( axi4_0_M_ARLOCK ),
      .M_AXI_ARCACHE ( axi4_0_M_ARCACHE ),
      .M_AXI_ARPROT ( axi4_0_M_ARPROT ),
      .M_AXI_ARREGION (  ),
      .M_AXI_ARQOS ( axi4_0_M_ARQOS ),
      .M_AXI_ARUSER (  ),
      .M_AXI_ARVALID ( axi4_0_M_ARVALID[0:0] ),
      .M_AXI_ARREADY ( axi4_0_M_ARREADY[0:0] ),
      .M_AXI_RID ( axi4_0_M_RID ),
      .M_AXI_RDATA ( axi4_0_M_RDATA ),
      .M_AXI_RRESP ( axi4_0_M_RRESP ),
      .M_AXI_RLAST ( axi4_0_M_RLAST[0:0] ),
      .M_AXI_RUSER ( net_gnd1[0:0] ),
      .M_AXI_RVALID ( axi4_0_M_RVALID[0:0] ),
      .M_AXI_RREADY ( axi4_0_M_RREADY[0:0] ),
      .S_AXI_CTRL_AWADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32[0:31] ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32[0:31] ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 ),
      .INTERCONNECT_ARESET_OUT_N (  ),
      .DEBUG_AW_TRANS_SEQ (  ),
      .DEBUG_AW_ARB_GRANT (  ),
      .DEBUG_AR_TRANS_SEQ (  ),
      .DEBUG_AR_ARB_GRANT (  ),
      .DEBUG_AW_TRANS_QUAL (  ),
      .DEBUG_AW_ACCEPT_CNT (  ),
      .DEBUG_AW_ACTIVE_THREAD (  ),
      .DEBUG_AW_ACTIVE_TARGET (  ),
      .DEBUG_AW_ACTIVE_REGION (  ),
      .DEBUG_AW_ERROR (  ),
      .DEBUG_AW_TARGET (  ),
      .DEBUG_AR_TRANS_QUAL (  ),
      .DEBUG_AR_ACCEPT_CNT (  ),
      .DEBUG_AR_ACTIVE_THREAD (  ),
      .DEBUG_AR_ACTIVE_TARGET (  ),
      .DEBUG_AR_ACTIVE_REGION (  ),
      .DEBUG_AR_ERROR (  ),
      .DEBUG_AR_TARGET (  ),
      .DEBUG_B_TRANS_SEQ (  ),
      .DEBUG_R_BEAT_CNT (  ),
      .DEBUG_R_TRANS_SEQ (  ),
      .DEBUG_AW_ISSUING_CNT (  ),
      .DEBUG_AR_ISSUING_CNT (  ),
      .DEBUG_W_BEAT_CNT (  ),
      .DEBUG_W_TRANS_SEQ (  ),
      .DEBUG_BID_TARGET (  ),
      .DEBUG_BID_ERROR (  ),
      .DEBUG_RID_TARGET (  ),
      .DEBUG_RID_ERROR (  ),
      .DEBUG_SR_SC_ARADDR (  ),
      .DEBUG_SR_SC_ARADDRCONTROL (  ),
      .DEBUG_SR_SC_AWADDR (  ),
      .DEBUG_SR_SC_AWADDRCONTROL (  ),
      .DEBUG_SR_SC_BRESP (  ),
      .DEBUG_SR_SC_RDATA (  ),
      .DEBUG_SR_SC_RDATACONTROL (  ),
      .DEBUG_SR_SC_WDATA (  ),
      .DEBUG_SR_SC_WDATACONTROL (  ),
      .DEBUG_SC_SF_ARADDR (  ),
      .DEBUG_SC_SF_ARADDRCONTROL (  ),
      .DEBUG_SC_SF_AWADDR (  ),
      .DEBUG_SC_SF_AWADDRCONTROL (  ),
      .DEBUG_SC_SF_BRESP (  ),
      .DEBUG_SC_SF_RDATA (  ),
      .DEBUG_SC_SF_RDATACONTROL (  ),
      .DEBUG_SC_SF_WDATA (  ),
      .DEBUG_SC_SF_WDATACONTROL (  ),
      .DEBUG_SF_CB_ARADDR (  ),
      .DEBUG_SF_CB_ARADDRCONTROL (  ),
      .DEBUG_SF_CB_AWADDR (  ),
      .DEBUG_SF_CB_AWADDRCONTROL (  ),
      .DEBUG_SF_CB_BRESP (  ),
      .DEBUG_SF_CB_RDATA (  ),
      .DEBUG_SF_CB_RDATACONTROL (  ),
      .DEBUG_SF_CB_WDATA (  ),
      .DEBUG_SF_CB_WDATACONTROL (  ),
      .DEBUG_CB_MF_ARADDR (  ),
      .DEBUG_CB_MF_ARADDRCONTROL (  ),
      .DEBUG_CB_MF_AWADDR (  ),
      .DEBUG_CB_MF_AWADDRCONTROL (  ),
      .DEBUG_CB_MF_BRESP (  ),
      .DEBUG_CB_MF_RDATA (  ),
      .DEBUG_CB_MF_RDATACONTROL (  ),
      .DEBUG_CB_MF_WDATA (  ),
      .DEBUG_CB_MF_WDATACONTROL (  ),
      .DEBUG_MF_MC_ARADDR (  ),
      .DEBUG_MF_MC_ARADDRCONTROL (  ),
      .DEBUG_MF_MC_AWADDR (  ),
      .DEBUG_MF_MC_AWADDRCONTROL (  ),
      .DEBUG_MF_MC_BRESP (  ),
      .DEBUG_MF_MC_RDATA (  ),
      .DEBUG_MF_MC_RDATACONTROL (  ),
      .DEBUG_MF_MC_WDATA (  ),
      .DEBUG_MF_MC_WDATACONTROL (  ),
      .DEBUG_MC_MP_ARADDR (  ),
      .DEBUG_MC_MP_ARADDRCONTROL (  ),
      .DEBUG_MC_MP_AWADDR (  ),
      .DEBUG_MC_MP_AWADDRCONTROL (  ),
      .DEBUG_MC_MP_BRESP (  ),
      .DEBUG_MC_MP_RDATA (  ),
      .DEBUG_MC_MP_RDATACONTROL (  ),
      .DEBUG_MC_MP_WDATA (  ),
      .DEBUG_MC_MP_WDATACONTROL (  ),
      .DEBUG_MP_MR_ARADDR (  ),
      .DEBUG_MP_MR_ARADDRCONTROL (  ),
      .DEBUG_MP_MR_AWADDR (  ),
      .DEBUG_MP_MR_AWADDRCONTROL (  ),
      .DEBUG_MP_MR_BRESP (  ),
      .DEBUG_MP_MR_RDATA (  ),
      .DEBUG_MP_MR_RDATACONTROL (  ),
      .DEBUG_MP_MR_WDATA (  ),
      .DEBUG_MP_MR_WDATACONTROL (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  rs232_uart_1_wrapper
    RS232_Uart_1 (
      .S_AXI_ACLK ( clk_100_0000MHzPLL0[0] ),
      .S_AXI_ARESETN ( axi4lite_0_M_ARESETN[1] ),
      .Interrupt (  ),
      .S_AXI_AWADDR ( axi4lite_0_M_AWADDR[63:32] ),
      .S_AXI_AWVALID ( axi4lite_0_M_AWVALID[1] ),
      .S_AXI_AWREADY ( axi4lite_0_M_AWREADY[1] ),
      .S_AXI_WDATA ( axi4lite_0_M_WDATA[63:32] ),
      .S_AXI_WSTRB ( axi4lite_0_M_WSTRB[7:4] ),
      .S_AXI_WVALID ( axi4lite_0_M_WVALID[1] ),
      .S_AXI_WREADY ( axi4lite_0_M_WREADY[1] ),
      .S_AXI_BRESP ( axi4lite_0_M_BRESP[3:2] ),
      .S_AXI_BVALID ( axi4lite_0_M_BVALID[1] ),
      .S_AXI_BREADY ( axi4lite_0_M_BREADY[1] ),
      .S_AXI_ARADDR ( axi4lite_0_M_ARADDR[63:32] ),
      .S_AXI_ARVALID ( axi4lite_0_M_ARVALID[1] ),
      .S_AXI_ARREADY ( axi4lite_0_M_ARREADY[1] ),
      .S_AXI_RDATA ( axi4lite_0_M_RDATA[63:32] ),
      .S_AXI_RRESP ( axi4lite_0_M_RRESP[3:2] ),
      .S_AXI_RVALID ( axi4lite_0_M_RVALID[1] ),
      .S_AXI_RREADY ( axi4lite_0_M_RREADY[1] ),
      .RX ( RS232_Uart_1_sin ),
      .TX ( RS232_Uart_1_sout )
    );

  (* BOX_TYPE = "user_black_box" *)
  push_buttons_5bits_wrapper
    Push_Buttons_5Bits (
      .S_AXI_ACLK ( clk_100_0000MHzPLL0[0] ),
      .S_AXI_ARESETN ( axi4lite_0_M_ARESETN[2] ),
      .S_AXI_AWADDR ( axi4lite_0_M_AWADDR[95:64] ),
      .S_AXI_AWVALID ( axi4lite_0_M_AWVALID[2] ),
      .S_AXI_AWREADY ( axi4lite_0_M_AWREADY[2] ),
      .S_AXI_WDATA ( axi4lite_0_M_WDATA[95:64] ),
      .S_AXI_WSTRB ( axi4lite_0_M_WSTRB[11:8] ),
      .S_AXI_WVALID ( axi4lite_0_M_WVALID[2] ),
      .S_AXI_WREADY ( axi4lite_0_M_WREADY[2] ),
      .S_AXI_BRESP ( axi4lite_0_M_BRESP[5:4] ),
      .S_AXI_BVALID ( axi4lite_0_M_BVALID[2] ),
      .S_AXI_BREADY ( axi4lite_0_M_BREADY[2] ),
      .S_AXI_ARADDR ( axi4lite_0_M_ARADDR[95:64] ),
      .S_AXI_ARVALID ( axi4lite_0_M_ARVALID[2] ),
      .S_AXI_ARREADY ( axi4lite_0_M_ARREADY[2] ),
      .S_AXI_RDATA ( axi4lite_0_M_RDATA[95:64] ),
      .S_AXI_RRESP ( axi4lite_0_M_RRESP[5:4] ),
      .S_AXI_RVALID ( axi4lite_0_M_RVALID[2] ),
      .S_AXI_RREADY ( axi4lite_0_M_RREADY[2] ),
      .IP2INTC_Irpt (  ),
      .GPIO_IO_I ( Push_Buttons_5Bits_TRI_I[0:4] ),
      .GPIO_IO_O (  ),
      .GPIO_IO_T (  ),
      .GPIO2_IO_I ( net_gnd32[0:31] ),
      .GPIO2_IO_O (  ),
      .GPIO2_IO_T (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  mcb_ddr2_wrapper
    MCB_DDR2 (
      .sysclk_2x ( clk_600_0000MHzPLL0_nobuf ),
      .sysclk_2x_180 ( clk_600_0000MHz180PLL0_nobuf ),
      .pll_ce_0 ( net_vcc0 ),
      .pll_ce_90 ( net_vcc0 ),
      .pll_lock ( proc_sys_reset_0_Dcm_locked ),
      .pll_lock_bufpll_o (  ),
      .sysclk_2x_bufpll_o (  ),
      .sysclk_2x_180_bufpll_o (  ),
      .pll_ce_0_bufpll_o (  ),
      .pll_ce_90_bufpll_o (  ),
      .sys_rst ( proc_sys_reset_0_BUS_STRUCT_RESET[0] ),
      .mcbx_dram_addr ( mcbx_dram_addr ),
      .mcbx_dram_ba ( mcbx_dram_ba ),
      .mcbx_dram_ras_n ( mcbx_dram_ras_n ),
      .mcbx_dram_cas_n ( mcbx_dram_cas_n ),
      .mcbx_dram_we_n ( mcbx_dram_we_n ),
      .mcbx_dram_cke ( mcbx_dram_cke ),
      .mcbx_dram_clk ( mcbx_dram_clk ),
      .mcbx_dram_clk_n ( mcbx_dram_clk_n ),
      .mcbx_dram_dq ( mcbx_dram_dq ),
      .mcbx_dram_dqs ( mcbx_dram_dqs ),
      .mcbx_dram_dqs_n ( mcbx_dram_dqs_n ),
      .mcbx_dram_udqs ( mcbx_dram_udqs ),
      .mcbx_dram_udqs_n ( mcbx_dram_udqs_n ),
      .mcbx_dram_udm ( mcbx_dram_udm ),
      .mcbx_dram_ldm ( mcbx_dram_ldm ),
      .mcbx_dram_odt ( mcbx_dram_odt ),
      .mcbx_dram_ddr3_rst (  ),
      .rzq ( rzq ),
      .zio ( zio ),
      .ui_clk ( clk_100_0000MHzPLL0[0] ),
      .uo_done_cal (  ),
      .s0_axi_aclk ( clk_100_0000MHzPLL0[0] ),
      .s0_axi_aresetn ( axi4_0_M_ARESETN[0] ),
      .s0_axi_awid ( axi4_0_M_AWID ),
      .s0_axi_awaddr ( axi4_0_M_AWADDR ),
      .s0_axi_awlen ( axi4_0_M_AWLEN ),
      .s0_axi_awsize ( axi4_0_M_AWSIZE ),
      .s0_axi_awburst ( axi4_0_M_AWBURST ),
      .s0_axi_awlock ( axi4_0_M_AWLOCK[0:0] ),
      .s0_axi_awcache ( axi4_0_M_AWCACHE ),
      .s0_axi_awprot ( axi4_0_M_AWPROT ),
      .s0_axi_awqos ( axi4_0_M_AWQOS ),
      .s0_axi_awvalid ( axi4_0_M_AWVALID[0] ),
      .s0_axi_awready ( axi4_0_M_AWREADY[0] ),
      .s0_axi_wdata ( axi4_0_M_WDATA ),
      .s0_axi_wstrb ( axi4_0_M_WSTRB ),
      .s0_axi_wlast ( axi4_0_M_WLAST[0] ),
      .s0_axi_wvalid ( axi4_0_M_WVALID[0] ),
      .s0_axi_wready ( axi4_0_M_WREADY[0] ),
      .s0_axi_bid ( axi4_0_M_BID ),
      .s0_axi_bresp ( axi4_0_M_BRESP ),
      .s0_axi_bvalid ( axi4_0_M_BVALID[0] ),
      .s0_axi_bready ( axi4_0_M_BREADY[0] ),
      .s0_axi_arid ( axi4_0_M_ARID ),
      .s0_axi_araddr ( axi4_0_M_ARADDR ),
      .s0_axi_arlen ( axi4_0_M_ARLEN ),
      .s0_axi_arsize ( axi4_0_M_ARSIZE ),
      .s0_axi_arburst ( axi4_0_M_ARBURST ),
      .s0_axi_arlock ( axi4_0_M_ARLOCK[0:0] ),
      .s0_axi_arcache ( axi4_0_M_ARCACHE ),
      .s0_axi_arprot ( axi4_0_M_ARPROT ),
      .s0_axi_arqos ( axi4_0_M_ARQOS ),
      .s0_axi_arvalid ( axi4_0_M_ARVALID[0] ),
      .s0_axi_arready ( axi4_0_M_ARREADY[0] ),
      .s0_axi_rid ( axi4_0_M_RID ),
      .s0_axi_rdata ( axi4_0_M_RDATA ),
      .s0_axi_rresp ( axi4_0_M_RRESP ),
      .s0_axi_rlast ( axi4_0_M_RLAST[0] ),
      .s0_axi_rvalid ( axi4_0_M_RVALID[0] ),
      .s0_axi_rready ( axi4_0_M_RREADY[0] ),
      .s1_axi_aclk ( net_gnd0 ),
      .s1_axi_aresetn ( net_gnd0 ),
      .s1_axi_awid ( net_gnd4[0:3] ),
      .s1_axi_awaddr ( net_gnd32[0:31] ),
      .s1_axi_awlen ( net_gnd8 ),
      .s1_axi_awsize ( net_gnd3[0:2] ),
      .s1_axi_awburst ( net_gnd2[0:1] ),
      .s1_axi_awlock ( net_gnd1[0:0] ),
      .s1_axi_awcache ( net_gnd4[0:3] ),
      .s1_axi_awprot ( net_gnd3[0:2] ),
      .s1_axi_awqos ( net_gnd4[0:3] ),
      .s1_axi_awvalid ( net_gnd0 ),
      .s1_axi_awready (  ),
      .s1_axi_wdata ( net_gnd32[0:31] ),
      .s1_axi_wstrb ( net_gnd4[0:3] ),
      .s1_axi_wlast ( net_gnd0 ),
      .s1_axi_wvalid ( net_gnd0 ),
      .s1_axi_wready (  ),
      .s1_axi_bid (  ),
      .s1_axi_bresp (  ),
      .s1_axi_bvalid (  ),
      .s1_axi_bready ( net_gnd0 ),
      .s1_axi_arid ( net_gnd4[0:3] ),
      .s1_axi_araddr ( net_gnd32[0:31] ),
      .s1_axi_arlen ( net_gnd8 ),
      .s1_axi_arsize ( net_gnd3[0:2] ),
      .s1_axi_arburst ( net_gnd2[0:1] ),
      .s1_axi_arlock ( net_gnd1[0:0] ),
      .s1_axi_arcache ( net_gnd4[0:3] ),
      .s1_axi_arprot ( net_gnd3[0:2] ),
      .s1_axi_arqos ( net_gnd4[0:3] ),
      .s1_axi_arvalid ( net_gnd0 ),
      .s1_axi_arready (  ),
      .s1_axi_rid (  ),
      .s1_axi_rdata (  ),
      .s1_axi_rresp (  ),
      .s1_axi_rlast (  ),
      .s1_axi_rvalid (  ),
      .s1_axi_rready ( net_gnd0 ),
      .s2_axi_aclk ( net_gnd0 ),
      .s2_axi_aresetn ( net_gnd0 ),
      .s2_axi_awid ( net_gnd4[0:3] ),
      .s2_axi_awaddr ( net_gnd32[0:31] ),
      .s2_axi_awlen ( net_gnd8 ),
      .s2_axi_awsize ( net_gnd3[0:2] ),
      .s2_axi_awburst ( net_gnd2[0:1] ),
      .s2_axi_awlock ( net_gnd1[0:0] ),
      .s2_axi_awcache ( net_gnd4[0:3] ),
      .s2_axi_awprot ( net_gnd3[0:2] ),
      .s2_axi_awqos ( net_gnd4[0:3] ),
      .s2_axi_awvalid ( net_gnd0 ),
      .s2_axi_awready (  ),
      .s2_axi_wdata ( net_gnd32[0:31] ),
      .s2_axi_wstrb ( net_gnd4[0:3] ),
      .s2_axi_wlast ( net_gnd0 ),
      .s2_axi_wvalid ( net_gnd0 ),
      .s2_axi_wready (  ),
      .s2_axi_bid (  ),
      .s2_axi_bresp (  ),
      .s2_axi_bvalid (  ),
      .s2_axi_bready ( net_gnd0 ),
      .s2_axi_arid ( net_gnd4[0:3] ),
      .s2_axi_araddr ( net_gnd32[0:31] ),
      .s2_axi_arlen ( net_gnd8 ),
      .s2_axi_arsize ( net_gnd3[0:2] ),
      .s2_axi_arburst ( net_gnd2[0:1] ),
      .s2_axi_arlock ( net_gnd1[0:0] ),
      .s2_axi_arcache ( net_gnd4[0:3] ),
      .s2_axi_arprot ( net_gnd3[0:2] ),
      .s2_axi_arqos ( net_gnd4[0:3] ),
      .s2_axi_arvalid ( net_gnd0 ),
      .s2_axi_arready (  ),
      .s2_axi_rid (  ),
      .s2_axi_rdata (  ),
      .s2_axi_rresp (  ),
      .s2_axi_rlast (  ),
      .s2_axi_rvalid (  ),
      .s2_axi_rready ( net_gnd0 ),
      .s3_axi_aclk ( net_gnd0 ),
      .s3_axi_aresetn ( net_gnd0 ),
      .s3_axi_awid ( net_gnd4[0:3] ),
      .s3_axi_awaddr ( net_gnd32[0:31] ),
      .s3_axi_awlen ( net_gnd8 ),
      .s3_axi_awsize ( net_gnd3[0:2] ),
      .s3_axi_awburst ( net_gnd2[0:1] ),
      .s3_axi_awlock ( net_gnd1[0:0] ),
      .s3_axi_awcache ( net_gnd4[0:3] ),
      .s3_axi_awprot ( net_gnd3[0:2] ),
      .s3_axi_awqos ( net_gnd4[0:3] ),
      .s3_axi_awvalid ( net_gnd0 ),
      .s3_axi_awready (  ),
      .s3_axi_wdata ( net_gnd32[0:31] ),
      .s3_axi_wstrb ( net_gnd4[0:3] ),
      .s3_axi_wlast ( net_gnd0 ),
      .s3_axi_wvalid ( net_gnd0 ),
      .s3_axi_wready (  ),
      .s3_axi_bid (  ),
      .s3_axi_bresp (  ),
      .s3_axi_bvalid (  ),
      .s3_axi_bready ( net_gnd0 ),
      .s3_axi_arid ( net_gnd4[0:3] ),
      .s3_axi_araddr ( net_gnd32[0:31] ),
      .s3_axi_arlen ( net_gnd8 ),
      .s3_axi_arsize ( net_gnd3[0:2] ),
      .s3_axi_arburst ( net_gnd2[0:1] ),
      .s3_axi_arlock ( net_gnd1[0:0] ),
      .s3_axi_arcache ( net_gnd4[0:3] ),
      .s3_axi_arprot ( net_gnd3[0:2] ),
      .s3_axi_arqos ( net_gnd4[0:3] ),
      .s3_axi_arvalid ( net_gnd0 ),
      .s3_axi_arready (  ),
      .s3_axi_rid (  ),
      .s3_axi_rdata (  ),
      .s3_axi_rresp (  ),
      .s3_axi_rlast (  ),
      .s3_axi_rvalid (  ),
      .s3_axi_rready ( net_gnd0 ),
      .s4_axi_aclk ( net_gnd0 ),
      .s4_axi_aresetn ( net_gnd0 ),
      .s4_axi_awid ( net_gnd4[0:3] ),
      .s4_axi_awaddr ( net_gnd32[0:31] ),
      .s4_axi_awlen ( net_gnd8 ),
      .s4_axi_awsize ( net_gnd3[0:2] ),
      .s4_axi_awburst ( net_gnd2[0:1] ),
      .s4_axi_awlock ( net_gnd1[0:0] ),
      .s4_axi_awcache ( net_gnd4[0:3] ),
      .s4_axi_awprot ( net_gnd3[0:2] ),
      .s4_axi_awqos ( net_gnd4[0:3] ),
      .s4_axi_awvalid ( net_gnd0 ),
      .s4_axi_awready (  ),
      .s4_axi_wdata ( net_gnd32[0:31] ),
      .s4_axi_wstrb ( net_gnd4[0:3] ),
      .s4_axi_wlast ( net_gnd0 ),
      .s4_axi_wvalid ( net_gnd0 ),
      .s4_axi_wready (  ),
      .s4_axi_bid (  ),
      .s4_axi_bresp (  ),
      .s4_axi_bvalid (  ),
      .s4_axi_bready ( net_gnd0 ),
      .s4_axi_arid ( net_gnd4[0:3] ),
      .s4_axi_araddr ( net_gnd32[0:31] ),
      .s4_axi_arlen ( net_gnd8 ),
      .s4_axi_arsize ( net_gnd3[0:2] ),
      .s4_axi_arburst ( net_gnd2[0:1] ),
      .s4_axi_arlock ( net_gnd1[0:0] ),
      .s4_axi_arcache ( net_gnd4[0:3] ),
      .s4_axi_arprot ( net_gnd3[0:2] ),
      .s4_axi_arqos ( net_gnd4[0:3] ),
      .s4_axi_arvalid ( net_gnd0 ),
      .s4_axi_arready (  ),
      .s4_axi_rid (  ),
      .s4_axi_rdata (  ),
      .s4_axi_rresp (  ),
      .s4_axi_rlast (  ),
      .s4_axi_rvalid (  ),
      .s4_axi_rready ( net_gnd0 ),
      .s5_axi_aclk ( net_gnd0 ),
      .s5_axi_aresetn ( net_gnd0 ),
      .s5_axi_awid ( net_gnd4[0:3] ),
      .s5_axi_awaddr ( net_gnd32[0:31] ),
      .s5_axi_awlen ( net_gnd8 ),
      .s5_axi_awsize ( net_gnd3[0:2] ),
      .s5_axi_awburst ( net_gnd2[0:1] ),
      .s5_axi_awlock ( net_gnd1[0:0] ),
      .s5_axi_awcache ( net_gnd4[0:3] ),
      .s5_axi_awprot ( net_gnd3[0:2] ),
      .s5_axi_awqos ( net_gnd4[0:3] ),
      .s5_axi_awvalid ( net_gnd0 ),
      .s5_axi_awready (  ),
      .s5_axi_wdata ( net_gnd32[0:31] ),
      .s5_axi_wstrb ( net_gnd4[0:3] ),
      .s5_axi_wlast ( net_gnd0 ),
      .s5_axi_wvalid ( net_gnd0 ),
      .s5_axi_wready (  ),
      .s5_axi_bid (  ),
      .s5_axi_bresp (  ),
      .s5_axi_bvalid (  ),
      .s5_axi_bready ( net_gnd0 ),
      .s5_axi_arid ( net_gnd4[0:3] ),
      .s5_axi_araddr ( net_gnd32[0:31] ),
      .s5_axi_arlen ( net_gnd8 ),
      .s5_axi_arsize ( net_gnd3[0:2] ),
      .s5_axi_arburst ( net_gnd2[0:1] ),
      .s5_axi_arlock ( net_gnd1[0:0] ),
      .s5_axi_arcache ( net_gnd4[0:3] ),
      .s5_axi_arprot ( net_gnd3[0:2] ),
      .s5_axi_arqos ( net_gnd4[0:3] ),
      .s5_axi_arvalid ( net_gnd0 ),
      .s5_axi_arready (  ),
      .s5_axi_rid (  ),
      .s5_axi_rdata (  ),
      .s5_axi_rresp (  ),
      .s5_axi_rlast (  ),
      .s5_axi_rvalid (  ),
      .s5_axi_rready ( net_gnd0 )
    );

  (* BOX_TYPE = "user_black_box" *)
  leds_8bits_wrapper
    LEDs_8Bits (
      .S_AXI_ACLK ( clk_100_0000MHzPLL0[0] ),
      .S_AXI_ARESETN ( axi4lite_0_M_ARESETN[3] ),
      .S_AXI_AWADDR ( axi4lite_0_M_AWADDR[127:96] ),
      .S_AXI_AWVALID ( axi4lite_0_M_AWVALID[3] ),
      .S_AXI_AWREADY ( axi4lite_0_M_AWREADY[3] ),
      .S_AXI_WDATA ( axi4lite_0_M_WDATA[127:96] ),
      .S_AXI_WSTRB ( axi4lite_0_M_WSTRB[15:12] ),
      .S_AXI_WVALID ( axi4lite_0_M_WVALID[3] ),
      .S_AXI_WREADY ( axi4lite_0_M_WREADY[3] ),
      .S_AXI_BRESP ( axi4lite_0_M_BRESP[7:6] ),
      .S_AXI_BVALID ( axi4lite_0_M_BVALID[3] ),
      .S_AXI_BREADY ( axi4lite_0_M_BREADY[3] ),
      .S_AXI_ARADDR ( axi4lite_0_M_ARADDR[127:96] ),
      .S_AXI_ARVALID ( axi4lite_0_M_ARVALID[3] ),
      .S_AXI_ARREADY ( axi4lite_0_M_ARREADY[3] ),
      .S_AXI_RDATA ( axi4lite_0_M_RDATA[127:96] ),
      .S_AXI_RRESP ( axi4lite_0_M_RRESP[7:6] ),
      .S_AXI_RVALID ( axi4lite_0_M_RVALID[3] ),
      .S_AXI_RREADY ( axi4lite_0_M_RREADY[3] ),
      .IP2INTC_Irpt (  ),
      .GPIO_IO_I ( net_gnd8 ),
      .GPIO_IO_O ( LEDs_8Bits_TRI_O ),
      .GPIO_IO_T (  ),
      .GPIO2_IO_I ( net_gnd32[0:31] ),
      .GPIO2_IO_O (  ),
      .GPIO2_IO_T (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  ethernet_lite_wrapper
    Ethernet_Lite (
      .S_AXI_ACLK ( clk_100_0000MHzPLL0[0] ),
      .S_AXI_ARESETN ( axi4lite_0_M_ARESETN[4] ),
      .IP2INTC_Irpt ( Ethernet_Lite_IP2INTC_Irpt[0] ),
      .S_AXI_AWID ( axi4lite_0_M_AWID[4:4] ),
      .S_AXI_AWADDR ( axi4lite_0_M_AWADDR[159:128] ),
      .S_AXI_AWLEN ( axi4lite_0_M_AWLEN[39:32] ),
      .S_AXI_AWSIZE ( axi4lite_0_M_AWSIZE[14:12] ),
      .S_AXI_AWBURST ( axi4lite_0_M_AWBURST[9:8] ),
      .S_AXI_AWCACHE ( axi4lite_0_M_AWCACHE[19:16] ),
      .S_AXI_AWVALID ( axi4lite_0_M_AWVALID[4] ),
      .S_AXI_AWREADY ( axi4lite_0_M_AWREADY[4] ),
      .S_AXI_WDATA ( axi4lite_0_M_WDATA[159:128] ),
      .S_AXI_WSTRB ( axi4lite_0_M_WSTRB[19:16] ),
      .S_AXI_WLAST ( axi4lite_0_M_WLAST[4] ),
      .S_AXI_WVALID ( axi4lite_0_M_WVALID[4] ),
      .S_AXI_WREADY ( axi4lite_0_M_WREADY[4] ),
      .S_AXI_BID ( axi4lite_0_M_BID[4:4] ),
      .S_AXI_BRESP ( axi4lite_0_M_BRESP[9:8] ),
      .S_AXI_BVALID ( axi4lite_0_M_BVALID[4] ),
      .S_AXI_BREADY ( axi4lite_0_M_BREADY[4] ),
      .S_AXI_ARID ( axi4lite_0_M_ARID[4:4] ),
      .S_AXI_ARADDR ( axi4lite_0_M_ARADDR[159:128] ),
      .S_AXI_ARLEN ( axi4lite_0_M_ARLEN[39:32] ),
      .S_AXI_ARSIZE ( axi4lite_0_M_ARSIZE[14:12] ),
      .S_AXI_ARBURST ( axi4lite_0_M_ARBURST[9:8] ),
      .S_AXI_ARCACHE ( axi4lite_0_M_ARCACHE[19:16] ),
      .S_AXI_ARVALID ( axi4lite_0_M_ARVALID[4] ),
      .S_AXI_ARREADY ( axi4lite_0_M_ARREADY[4] ),
      .S_AXI_RID ( axi4lite_0_M_RID[4:4] ),
      .S_AXI_RDATA ( axi4lite_0_M_RDATA[159:128] ),
      .S_AXI_RRESP ( axi4lite_0_M_RRESP[9:8] ),
      .S_AXI_RLAST ( axi4lite_0_M_RLAST[4] ),
      .S_AXI_RVALID ( axi4lite_0_M_RVALID[4] ),
      .S_AXI_RREADY ( axi4lite_0_M_RREADY[4] ),
      .PHY_tx_clk ( Ethernet_Lite_TX_CLK ),
      .PHY_rx_clk ( Ethernet_Lite_RX_CLK ),
      .PHY_crs ( Ethernet_Lite_CRS ),
      .PHY_dv ( Ethernet_Lite_RX_DV ),
      .PHY_rx_data ( Ethernet_Lite_RXD ),
      .PHY_col ( Ethernet_Lite_COL ),
      .PHY_rx_er ( Ethernet_Lite_RX_ER ),
      .PHY_rst_n ( Ethernet_Lite_PHY_RST_N ),
      .PHY_tx_en ( Ethernet_Lite_TX_EN ),
      .PHY_tx_data ( Ethernet_Lite_TXD ),
      .PHY_MDC ( Ethernet_Lite_MDC ),
      .PHY_MDIO_I ( Ethernet_Lite_MDIO_I ),
      .PHY_MDIO_O ( Ethernet_Lite_MDIO_O ),
      .PHY_MDIO_T ( Ethernet_Lite_MDIO_T )
    );

  (* BOX_TYPE = "user_black_box" *)
  dip_switches_8bits_wrapper
    DIP_Switches_8Bits (
      .S_AXI_ACLK ( clk_100_0000MHzPLL0[0] ),
      .S_AXI_ARESETN ( axi4lite_0_M_ARESETN[5] ),
      .S_AXI_AWADDR ( axi4lite_0_M_AWADDR[191:160] ),
      .S_AXI_AWVALID ( axi4lite_0_M_AWVALID[5] ),
      .S_AXI_AWREADY ( axi4lite_0_M_AWREADY[5] ),
      .S_AXI_WDATA ( axi4lite_0_M_WDATA[191:160] ),
      .S_AXI_WSTRB ( axi4lite_0_M_WSTRB[23:20] ),
      .S_AXI_WVALID ( axi4lite_0_M_WVALID[5] ),
      .S_AXI_WREADY ( axi4lite_0_M_WREADY[5] ),
      .S_AXI_BRESP ( axi4lite_0_M_BRESP[11:10] ),
      .S_AXI_BVALID ( axi4lite_0_M_BVALID[5] ),
      .S_AXI_BREADY ( axi4lite_0_M_BREADY[5] ),
      .S_AXI_ARADDR ( axi4lite_0_M_ARADDR[191:160] ),
      .S_AXI_ARVALID ( axi4lite_0_M_ARVALID[5] ),
      .S_AXI_ARREADY ( axi4lite_0_M_ARREADY[5] ),
      .S_AXI_RDATA ( axi4lite_0_M_RDATA[191:160] ),
      .S_AXI_RRESP ( axi4lite_0_M_RRESP[11:10] ),
      .S_AXI_RVALID ( axi4lite_0_M_RVALID[5] ),
      .S_AXI_RREADY ( axi4lite_0_M_RREADY[5] ),
      .IP2INTC_Irpt (  ),
      .GPIO_IO_I ( DIP_Switches_8Bits_TRI_I ),
      .GPIO_IO_O (  ),
      .GPIO_IO_T (  ),
      .GPIO2_IO_I ( net_gnd32[0:31] ),
      .GPIO2_IO_O (  ),
      .GPIO2_IO_T (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  axi_vdma_0_wrapper
    axi_vdma_0 (
      .s_axi_lite_aclk ( clk_100_0000MHzPLL0[0] ),
      .m_axi_sg_aclk ( net_gnd0 ),
      .m_axi_mm2s_aclk ( clk_100_0000MHzPLL0[0] ),
      .m_axi_s2mm_aclk ( net_gnd0 ),
      .m_axis_mm2s_aclk ( axi_vdma_0_M_AXIS_MM2S_ACLK ),
      .s_axis_s2mm_aclk ( net_gnd0 ),
      .axi_resetn ( axi4lite_0_M_ARESETN[6] ),
      .s_axi_lite_awvalid ( axi4lite_0_M_AWVALID[6] ),
      .s_axi_lite_awready ( axi4lite_0_M_AWREADY[6] ),
      .s_axi_lite_awaddr ( axi4lite_0_M_AWADDR[223:192] ),
      .s_axi_lite_wvalid ( axi4lite_0_M_WVALID[6] ),
      .s_axi_lite_wready ( axi4lite_0_M_WREADY[6] ),
      .s_axi_lite_wdata ( axi4lite_0_M_WDATA[223:192] ),
      .s_axi_lite_bresp ( axi4lite_0_M_BRESP[13:12] ),
      .s_axi_lite_bvalid ( axi4lite_0_M_BVALID[6] ),
      .s_axi_lite_bready ( axi4lite_0_M_BREADY[6] ),
      .s_axi_lite_arvalid ( axi4lite_0_M_ARVALID[6] ),
      .s_axi_lite_arready ( axi4lite_0_M_ARREADY[6] ),
      .s_axi_lite_araddr ( axi4lite_0_M_ARADDR[223:192] ),
      .s_axi_lite_rvalid ( axi4lite_0_M_RVALID[6] ),
      .s_axi_lite_rready ( axi4lite_0_M_RREADY[6] ),
      .s_axi_lite_rdata ( axi4lite_0_M_RDATA[223:192] ),
      .s_axi_lite_rresp ( axi4lite_0_M_RRESP[13:12] ),
      .m_axi_sg_araddr (  ),
      .m_axi_sg_arlen (  ),
      .m_axi_sg_arsize (  ),
      .m_axi_sg_arburst (  ),
      .m_axi_sg_arprot (  ),
      .m_axi_sg_arcache (  ),
      .m_axi_sg_arvalid (  ),
      .m_axi_sg_arready ( net_gnd0 ),
      .m_axi_sg_rdata ( net_gnd32[0:31] ),
      .m_axi_sg_rresp ( net_gnd2[0:1] ),
      .m_axi_sg_rlast ( net_gnd0 ),
      .m_axi_sg_rvalid ( net_gnd0 ),
      .m_axi_sg_rready (  ),
      .m_axi_mm2s_araddr ( axi4_0_S_ARADDR[95:64] ),
      .m_axi_mm2s_arlen ( axi4_0_S_ARLEN[23:16] ),
      .m_axi_mm2s_arsize ( axi4_0_S_ARSIZE[8:6] ),
      .m_axi_mm2s_arburst ( axi4_0_S_ARBURST[5:4] ),
      .m_axi_mm2s_arprot ( axi4_0_S_ARPROT[8:6] ),
      .m_axi_mm2s_arcache ( axi4_0_S_ARCACHE[11:8] ),
      .m_axi_mm2s_arvalid ( axi4_0_S_ARVALID[2] ),
      .m_axi_mm2s_arready ( axi4_0_S_ARREADY[2] ),
      .m_axi_mm2s_rdata ( axi4_0_S_RDATA[95:64] ),
      .m_axi_mm2s_rresp ( axi4_0_S_RRESP[5:4] ),
      .m_axi_mm2s_rlast ( axi4_0_S_RLAST[2] ),
      .m_axi_mm2s_rvalid ( axi4_0_S_RVALID[2] ),
      .m_axi_mm2s_rready ( axi4_0_S_RREADY[2] ),
      .mm2s_prmry_reset_out_n (  ),
      .m_axis_mm2s_tdata ( axi_vdma_0_M_AXIS_MM2S_TDATA ),
      .m_axis_mm2s_tkeep ( axi_vdma_0_M_AXIS_MM2S_TKEEP ),
      .m_axis_mm2s_tvalid ( axi_vdma_0_M_AXIS_MM2S_TVALID ),
      .m_axis_mm2s_tready ( axi_vdma_0_M_AXIS_MM2S_TREADY ),
      .m_axis_mm2s_tlast ( axi_vdma_0_M_AXIS_MM2S_TLAST ),
      .m_axis_mm2s_tuser (  ),
      .m_axi_s2mm_awaddr (  ),
      .m_axi_s2mm_awlen (  ),
      .m_axi_s2mm_awsize (  ),
      .m_axi_s2mm_awburst (  ),
      .m_axi_s2mm_awprot (  ),
      .m_axi_s2mm_awcache (  ),
      .m_axi_s2mm_awvalid (  ),
      .m_axi_s2mm_awready ( net_gnd0 ),
      .m_axi_s2mm_wdata (  ),
      .m_axi_s2mm_wstrb (  ),
      .m_axi_s2mm_wlast (  ),
      .m_axi_s2mm_wvalid (  ),
      .m_axi_s2mm_wready ( net_gnd0 ),
      .m_axi_s2mm_bresp ( net_gnd2[0:1] ),
      .m_axi_s2mm_bvalid ( net_gnd0 ),
      .m_axi_s2mm_bready (  ),
      .s2mm_prmry_reset_out_n (  ),
      .s_axis_s2mm_tdata ( net_gnd32[0:31] ),
      .s_axis_s2mm_tkeep ( net_vcc4 ),
      .s_axis_s2mm_tvalid ( net_gnd0 ),
      .s_axis_s2mm_tready (  ),
      .s_axis_s2mm_tlast ( net_gnd0 ),
      .s_axis_s2mm_tuser ( net_gnd1[0:0] ),
      .mm2s_fsync ( net_gnd0 ),
      .mm2s_frame_ptr_in ( net_gnd6 ),
      .mm2s_frame_ptr_out (  ),
      .mm2s_fsync_out ( axi_vdma_0_mm2s_fsync_out ),
      .mm2s_prmtr_update (  ),
      .mm2s_buffer_empty (  ),
      .mm2s_buffer_almost_empty ( axi_vdma_0_mm2s_buffer_almost_empty ),
      .s2mm_fsync ( net_gnd0 ),
      .s2mm_frame_ptr_in ( net_gnd6 ),
      .s2mm_frame_ptr_out (  ),
      .s2mm_fsync_out ( axi_vdma_0_s2mm_fsync_out ),
      .s2mm_buffer_full (  ),
      .s2mm_buffer_almost_full (  ),
      .s2mm_prmtr_update (  ),
      .mm2s_introut (  ),
      .s2mm_introut (  ),
      .axi_vdma_tstvec (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  axi_hdmi_0_wrapper
    axi_hdmi_0 (
      .ACLK ( clk_100_0000MHzPLL0[0] ),
      .MM2S_FSYNC_IN ( axi_vdma_0_mm2s_fsync_out ),
      .MM2S_BUFFER_ALMOST_EMPTY ( axi_vdma_0_mm2s_buffer_almost_empty ),
      .S2MM_FSYNC_IN ( axi_vdma_0_s2mm_fsync_out ),
      .S_AXIS_MM2S_ACLK ( axi_vdma_0_M_AXIS_MM2S_ACLK ),
      .S_AXIS_MM2S_ARESETN ( axi4lite_0_M_ARESETN[7] ),
      .S_AXIS_MM2S_TREADY ( axi_vdma_0_M_AXIS_MM2S_TREADY ),
      .S_AXIS_MM2S_TDATA ( axi_vdma_0_M_AXIS_MM2S_TDATA ),
      .S_AXIS_MM2S_TKEEP ( axi_vdma_0_M_AXIS_MM2S_TKEEP ),
      .S_AXIS_MM2S_TLAST ( axi_vdma_0_M_AXIS_MM2S_TLAST ),
      .S_AXIS_MM2S_TVALID ( axi_vdma_0_M_AXIS_MM2S_TVALID ),
      .M_AXIS_S2MM_ACLK (  ),
      .M_AXIS_S2MM_ARESETN ( axi4lite_0_M_ARESETN[7] ),
      .M_AXIS_S2MM_TVALID (  ),
      .M_AXIS_S2MM_TDATA (  ),
      .M_AXIS_S2MM_TKEEP (  ),
      .M_AXIS_S2MM_TLAST (  ),
      .M_AXIS_S2MM_TREADY ( net_gnd0 ),
      .TMDS_RX_CLK_P ( net_gnd0 ),
      .TMDS_RX_CLK_N ( net_gnd0 ),
      .TMDS_RX_2_P ( net_gnd0 ),
      .TMDS_RX_2_N ( net_gnd0 ),
      .TMDS_RX_1_P ( net_gnd0 ),
      .TMDS_RX_1_N ( net_gnd0 ),
      .TMDS_RX_0_P ( net_gnd0 ),
      .TMDS_RX_0_N ( net_gnd0 ),
      .TMDS_RX_SCL ( net_gnd0 ),
      .TMDS_TX_CLK_P ( axi_hdmi_0_TMDS_TX_CLK_P ),
      .TMDS_TX_CLK_N ( axi_hdmi_0_TMDS_TX_CLK_N ),
      .TMDS_TX_2_P ( axi_hdmi_0_TMDS_TX_2_P ),
      .TMDS_TX_2_N ( axi_hdmi_0_TMDS_TX_2_N ),
      .TMDS_TX_1_P ( axi_hdmi_0_TMDS_TX_1_P ),
      .TMDS_TX_1_N ( axi_hdmi_0_TMDS_TX_1_N ),
      .TMDS_TX_0_P ( axi_hdmi_0_TMDS_TX_0_P ),
      .TMDS_TX_0_N ( axi_hdmi_0_TMDS_TX_0_N ),
      .S_AXI_ACLK ( clk_100_0000MHzPLL0[0] ),
      .S_AXI_ARESETN ( axi4lite_0_M_ARESETN[7] ),
      .S_AXI_AWADDR ( axi4lite_0_M_AWADDR[255:224] ),
      .S_AXI_AWVALID ( axi4lite_0_M_AWVALID[7] ),
      .S_AXI_WDATA ( axi4lite_0_M_WDATA[255:224] ),
      .S_AXI_WSTRB ( axi4lite_0_M_WSTRB[31:28] ),
      .S_AXI_WVALID ( axi4lite_0_M_WVALID[7] ),
      .S_AXI_BREADY ( axi4lite_0_M_BREADY[7] ),
      .S_AXI_ARADDR ( axi4lite_0_M_ARADDR[255:224] ),
      .S_AXI_ARVALID ( axi4lite_0_M_ARVALID[7] ),
      .S_AXI_RREADY ( axi4lite_0_M_RREADY[7] ),
      .S_AXI_ARREADY ( axi4lite_0_M_ARREADY[7] ),
      .S_AXI_RDATA ( axi4lite_0_M_RDATA[255:224] ),
      .S_AXI_RRESP ( axi4lite_0_M_RRESP[15:14] ),
      .S_AXI_RVALID ( axi4lite_0_M_RVALID[7] ),
      .S_AXI_WREADY ( axi4lite_0_M_WREADY[7] ),
      .S_AXI_BRESP ( axi4lite_0_M_BRESP[15:14] ),
      .S_AXI_BVALID ( axi4lite_0_M_BVALID[7] ),
      .S_AXI_AWREADY ( axi4lite_0_M_AWREADY[7] ),
      .TMDS_RX_SDA_I ( axi_hdmi_0_TMDS_RX_SDA_I ),
      .TMDS_RX_SDA_O ( axi_hdmi_0_TMDS_RX_SDA_O ),
      .TMDS_RX_SDA_T ( axi_hdmi_0_TMDS_RX_SDA_T )
    );

  (* BOX_TYPE = "user_black_box" *)
  axi_intc_0_wrapper
    axi_intc_0 (
      .S_AXI_ACLK ( clk_100_0000MHzPLL0[0] ),
      .S_AXI_ARESETN ( axi4lite_0_M_ARESETN[8] ),
      .S_AXI_AWADDR ( axi4lite_0_M_AWADDR[287:256] ),
      .S_AXI_AWVALID ( axi4lite_0_M_AWVALID[8] ),
      .S_AXI_AWREADY ( axi4lite_0_M_AWREADY[8] ),
      .S_AXI_WDATA ( axi4lite_0_M_WDATA[287:256] ),
      .S_AXI_WSTRB ( axi4lite_0_M_WSTRB[35:32] ),
      .S_AXI_WVALID ( axi4lite_0_M_WVALID[8] ),
      .S_AXI_WREADY ( axi4lite_0_M_WREADY[8] ),
      .S_AXI_BRESP ( axi4lite_0_M_BRESP[17:16] ),
      .S_AXI_BVALID ( axi4lite_0_M_BVALID[8] ),
      .S_AXI_BREADY ( axi4lite_0_M_BREADY[8] ),
      .S_AXI_ARADDR ( axi4lite_0_M_ARADDR[287:256] ),
      .S_AXI_ARVALID ( axi4lite_0_M_ARVALID[8] ),
      .S_AXI_ARREADY ( axi4lite_0_M_ARREADY[8] ),
      .S_AXI_RDATA ( axi4lite_0_M_RDATA[287:256] ),
      .S_AXI_RRESP ( axi4lite_0_M_RRESP[17:16] ),
      .S_AXI_RVALID ( axi4lite_0_M_RVALID[8] ),
      .S_AXI_RREADY ( axi4lite_0_M_RREADY[8] ),
      .Intr ( Ethernet_Lite_IP2INTC_Irpt[0:0] ),
      .Irq (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  camera_stream_0_wrapper
    camera_stream_0 (
      .ACLK ( clk_100_0000MHzPLL0[0] ),
      .ARESETN ( proc_sys_reset_0_Peripheral_aresetn[0] ),
      .S_AXIS_TREADY (  ),
      .S_AXIS_TDATA ( net_gnd32[0:31] ),
      .S_AXIS_TLAST ( net_gnd0 ),
      .S_AXIS_TVALID ( net_gnd0 ),
      .M_AXIS_TVALID ( camera_stream_0_M_AXIS_TVALID ),
      .M_AXIS_TDATA ( camera_stream_0_M_AXIS_TDATA ),
      .M_AXIS_TLAST ( camera_stream_0_M_AXIS_TLAST ),
      .M_AXIS_TREADY ( camera_stream_0_M_AXIS_TREADY ),
      .RST_I ( proc_sys_reset_0_Peripheral_Reset[0] ),
      .CLK ( clock_generator_0_CLKOUT3 ),
      .CLK_180 ( clock_generator_0_CLKOUT4 ),
      .D_I ( camera_stream_0_D_I ),
      .PCLK_I ( CAMA_PCLK_I ),
      .MCLK_O ( camera_stream_0_MCLK_O ),
      .LV_I ( camera_stream_0_LV_I ),
      .FV_I ( camera_stream_0_FV_I ),
      .RST_O ( camera_stream_0_RST_O ),
      .PWDN_O ( camera_stream_0_PWDN_O ),
      .VDDEN_O ( camera_stream_0_VDDEN_O ),
      .DEBUG ( camera_stream_0_DEBUG ),
      .SDA_I ( CAMA_SDA_I ),
      .SDA_O ( CAMA_SDA_O ),
      .SDA_T ( CAMA_SDA_T ),
      .SCL_I ( CAMA_SCL_I ),
      .SCL_O ( CAMA_SCL_O ),
      .SCL_T ( CAMA_SCL_T )
    );

  (* BOX_TYPE = "user_black_box" *)
  axi_dma_0_wrapper
    axi_dma_0 (
      .s_axi_lite_aclk ( clk_100_0000MHzPLL0[0] ),
      .m_axi_sg_aclk ( net_gnd0 ),
      .m_axi_mm2s_aclk ( net_gnd0 ),
      .m_axi_s2mm_aclk ( clk_100_0000MHzPLL0[0] ),
      .axi_resetn ( axi4lite_0_M_ARESETN[9] ),
      .s_axi_lite_awvalid ( axi4lite_0_M_AWVALID[9] ),
      .s_axi_lite_awready ( axi4lite_0_M_AWREADY[9] ),
      .s_axi_lite_awaddr ( axi4lite_0_M_AWADDR[319:288] ),
      .s_axi_lite_wvalid ( axi4lite_0_M_WVALID[9] ),
      .s_axi_lite_wready ( axi4lite_0_M_WREADY[9] ),
      .s_axi_lite_wdata ( axi4lite_0_M_WDATA[319:288] ),
      .s_axi_lite_bresp ( axi4lite_0_M_BRESP[19:18] ),
      .s_axi_lite_bvalid ( axi4lite_0_M_BVALID[9] ),
      .s_axi_lite_bready ( axi4lite_0_M_BREADY[9] ),
      .s_axi_lite_arvalid ( axi4lite_0_M_ARVALID[9] ),
      .s_axi_lite_arready ( axi4lite_0_M_ARREADY[9] ),
      .s_axi_lite_araddr ( axi4lite_0_M_ARADDR[319:288] ),
      .s_axi_lite_rvalid ( axi4lite_0_M_RVALID[9] ),
      .s_axi_lite_rready ( axi4lite_0_M_RREADY[9] ),
      .s_axi_lite_rdata ( axi4lite_0_M_RDATA[319:288] ),
      .s_axi_lite_rresp ( axi4lite_0_M_RRESP[19:18] ),
      .m_axi_sg_awaddr (  ),
      .m_axi_sg_awlen (  ),
      .m_axi_sg_awsize (  ),
      .m_axi_sg_awburst (  ),
      .m_axi_sg_awprot (  ),
      .m_axi_sg_awcache (  ),
      .m_axi_sg_awvalid (  ),
      .m_axi_sg_awready ( net_gnd0 ),
      .m_axi_sg_wdata (  ),
      .m_axi_sg_wstrb (  ),
      .m_axi_sg_wlast (  ),
      .m_axi_sg_wvalid (  ),
      .m_axi_sg_wready ( net_gnd0 ),
      .m_axi_sg_bresp ( net_gnd2[0:1] ),
      .m_axi_sg_bvalid ( net_gnd0 ),
      .m_axi_sg_bready (  ),
      .m_axi_sg_araddr (  ),
      .m_axi_sg_arlen (  ),
      .m_axi_sg_arsize (  ),
      .m_axi_sg_arburst (  ),
      .m_axi_sg_arprot (  ),
      .m_axi_sg_arcache (  ),
      .m_axi_sg_arvalid (  ),
      .m_axi_sg_arready ( net_gnd0 ),
      .m_axi_sg_rdata ( net_gnd32[0:31] ),
      .m_axi_sg_rresp ( net_gnd2[0:1] ),
      .m_axi_sg_rlast ( net_gnd0 ),
      .m_axi_sg_rvalid ( net_gnd0 ),
      .m_axi_sg_rready (  ),
      .m_axi_mm2s_araddr (  ),
      .m_axi_mm2s_arlen (  ),
      .m_axi_mm2s_arsize (  ),
      .m_axi_mm2s_arburst (  ),
      .m_axi_mm2s_arprot (  ),
      .m_axi_mm2s_arcache (  ),
      .m_axi_mm2s_arvalid (  ),
      .m_axi_mm2s_arready ( net_gnd0 ),
      .m_axi_mm2s_rdata ( net_gnd32[0:31] ),
      .m_axi_mm2s_rresp ( net_gnd2[0:1] ),
      .m_axi_mm2s_rlast ( net_gnd0 ),
      .m_axi_mm2s_rvalid ( net_gnd0 ),
      .m_axi_mm2s_rready (  ),
      .mm2s_prmry_reset_out_n (  ),
      .m_axis_mm2s_tdata (  ),
      .m_axis_mm2s_tkeep (  ),
      .m_axis_mm2s_tvalid (  ),
      .m_axis_mm2s_tready ( net_gnd0 ),
      .m_axis_mm2s_tlast (  ),
      .mm2s_cntrl_reset_out_n (  ),
      .m_axis_mm2s_cntrl_tdata (  ),
      .m_axis_mm2s_cntrl_tkeep (  ),
      .m_axis_mm2s_cntrl_tvalid (  ),
      .m_axis_mm2s_cntrl_tready ( net_gnd0 ),
      .m_axis_mm2s_cntrl_tlast (  ),
      .m_axi_s2mm_awaddr ( axi4_0_S_AWADDR[127:96] ),
      .m_axi_s2mm_awlen ( axi4_0_S_AWLEN[31:24] ),
      .m_axi_s2mm_awsize ( axi4_0_S_AWSIZE[11:9] ),
      .m_axi_s2mm_awburst ( axi4_0_S_AWBURST[7:6] ),
      .m_axi_s2mm_awprot ( axi4_0_S_AWPROT[11:9] ),
      .m_axi_s2mm_awcache ( axi4_0_S_AWCACHE[15:12] ),
      .m_axi_s2mm_awvalid ( axi4_0_S_AWVALID[3] ),
      .m_axi_s2mm_awready ( axi4_0_S_AWREADY[3] ),
      .m_axi_s2mm_wdata ( axi4_0_S_WDATA[127:96] ),
      .m_axi_s2mm_wstrb ( axi4_0_S_WSTRB[15:12] ),
      .m_axi_s2mm_wlast ( axi4_0_S_WLAST[3] ),
      .m_axi_s2mm_wvalid ( axi4_0_S_WVALID[3] ),
      .m_axi_s2mm_wready ( axi4_0_S_WREADY[3] ),
      .m_axi_s2mm_bresp ( axi4_0_S_BRESP[7:6] ),
      .m_axi_s2mm_bvalid ( axi4_0_S_BVALID[3] ),
      .m_axi_s2mm_bready ( axi4_0_S_BREADY[3] ),
      .s2mm_prmry_reset_out_n (  ),
      .s_axis_s2mm_tdata ( camera_stream_0_M_AXIS_TDATA ),
      .s_axis_s2mm_tkeep ( net_vcc4 ),
      .s_axis_s2mm_tvalid ( camera_stream_0_M_AXIS_TVALID ),
      .s_axis_s2mm_tready ( camera_stream_0_M_AXIS_TREADY ),
      .s_axis_s2mm_tlast ( camera_stream_0_M_AXIS_TLAST ),
      .s2mm_sts_reset_out_n (  ),
      .s_axis_s2mm_sts_tdata ( net_gnd32[0:31] ),
      .s_axis_s2mm_sts_tkeep ( net_vcc4 ),
      .s_axis_s2mm_sts_tvalid ( net_gnd0 ),
      .s_axis_s2mm_sts_tready (  ),
      .s_axis_s2mm_sts_tlast ( net_gnd0 ),
      .mm2s_introut (  ),
      .s2mm_introut (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  chipscope_icon_0_wrapper
    chipscope_icon_0 (
      .control0 ( chipscope_icon_0_control0 ),
      .control1 (  ),
      .control2 (  ),
      .control3 (  ),
      .control4 (  ),
      .control5 (  ),
      .control6 (  ),
      .control7 (  ),
      .control8 (  ),
      .control9 (  ),
      .control10 (  ),
      .control11 (  ),
      .control12 (  ),
      .control13 (  ),
      .control14 (  ),
      .control15 (  ),
      .tdi_in ( bscan_tdi ),
      .reset_in ( bscan_reset ),
      .shift_in ( bscan_shift ),
      .update_in ( bscan_update ),
      .sel_in ( bscan_sel1 ),
      .drck_in ( bscan_drck1 ),
      .capture_in ( bscan_capture ),
      .tdo_out ( bscan_tdo1 )
    );

  (* BOX_TYPE = "user_black_box" *)
  chipscope_ila_0_wrapper
    chipscope_ila_0 (
      .CHIPSCOPE_ILA_CONTROL ( chipscope_icon_0_control0 ),
      .CLK ( clk_100_0000MHzPLL0[0] ),
      .DATA ( net_gnd32[0:31] ),
      .TRIG0 ( camera_stream_0_DEBUG ),
      .TRIG1 ( net_gnd8 ),
      .TRIG2 ( net_gnd8 ),
      .TRIG3 ( net_gnd8 ),
      .TRIG4 ( net_gnd8 ),
      .TRIG5 ( net_gnd8 ),
      .TRIG6 ( net_gnd8 ),
      .TRIG7 ( net_gnd8 ),
      .TRIG8 ( net_gnd8 ),
      .TRIG9 ( net_gnd8 ),
      .TRIG10 ( net_gnd8 ),
      .TRIG11 ( net_gnd8 ),
      .TRIG12 ( net_gnd8 ),
      .TRIG13 ( net_gnd8 ),
      .TRIG14 ( net_gnd8 ),
      .TRIG15 ( net_gnd8 ),
      .TRIG_OUT (  )
    );

  (* BOX_TYPE = "user_black_box" *)
  pmodjstk_top_0_wrapper
    pmodjstk_top_0 (
      .MISO ( pmodjstk_top_0_MISO ),
      .SS ( pmodjstk_top_0_SS ),
      .MOSI ( pmodjstk_top_0_MOSI ),
      .SCLK ( pmodjstk_top_0_SCLK ),
      .S_AXI_ACLK ( clk_100_0000MHzPLL0[0] ),
      .S_AXI_ARESETN ( axi4lite_0_M_ARESETN[10] ),
      .S_AXI_AWADDR ( axi4lite_0_M_AWADDR[351:320] ),
      .S_AXI_AWVALID ( axi4lite_0_M_AWVALID[10] ),
      .S_AXI_WDATA ( axi4lite_0_M_WDATA[351:320] ),
      .S_AXI_WSTRB ( axi4lite_0_M_WSTRB[43:40] ),
      .S_AXI_WVALID ( axi4lite_0_M_WVALID[10] ),
      .S_AXI_BREADY ( axi4lite_0_M_BREADY[10] ),
      .S_AXI_ARADDR ( axi4lite_0_M_ARADDR[351:320] ),
      .S_AXI_ARVALID ( axi4lite_0_M_ARVALID[10] ),
      .S_AXI_RREADY ( axi4lite_0_M_RREADY[10] ),
      .S_AXI_ARREADY ( axi4lite_0_M_ARREADY[10] ),
      .S_AXI_RDATA ( axi4lite_0_M_RDATA[351:320] ),
      .S_AXI_RRESP ( axi4lite_0_M_RRESP[21:20] ),
      .S_AXI_RVALID ( axi4lite_0_M_RVALID[10] ),
      .S_AXI_WREADY ( axi4lite_0_M_WREADY[10] ),
      .S_AXI_BRESP ( axi4lite_0_M_BRESP[21:20] ),
      .S_AXI_BVALID ( axi4lite_0_M_BVALID[10] ),
      .S_AXI_AWREADY ( axi4lite_0_M_AWREADY[10] )
    );

  IOBUF
    iobuf_0 (
      .I ( Ethernet_Lite_MDIO_O ),
      .IO ( Ethernet_Lite_MDIO ),
      .O ( Ethernet_Lite_MDIO_I ),
      .T ( Ethernet_Lite_MDIO_T )
    );

  IOBUF
    iobuf_1 (
      .I ( axi_hdmi_0_TMDS_RX_SDA_O ),
      .IO ( axi_hdmi_0_TMDS_RX_SDA_pin ),
      .O ( axi_hdmi_0_TMDS_RX_SDA_I ),
      .T ( axi_hdmi_0_TMDS_RX_SDA_T )
    );

  IOBUF
    iobuf_2 (
      .I ( CAMA_SDA_O ),
      .IO ( CAMA_SDA ),
      .O ( CAMA_SDA_I ),
      .T ( CAMA_SDA_T )
    );

  IOBUF
    iobuf_3 (
      .I ( CAMA_SCL_O ),
      .IO ( CAMA_SCL ),
      .O ( CAMA_SCL_I ),
      .T ( CAMA_SCL_T )
    );

endmodule

module proc_sys_reset_0_wrapper
  (
    Slowest_sync_clk,
    Ext_Reset_In,
    Aux_Reset_In,
    MB_Debug_Sys_Rst,
    Core_Reset_Req_0,
    Chip_Reset_Req_0,
    System_Reset_Req_0,
    Core_Reset_Req_1,
    Chip_Reset_Req_1,
    System_Reset_Req_1,
    Dcm_locked,
    RstcPPCresetcore_0,
    RstcPPCresetchip_0,
    RstcPPCresetsys_0,
    RstcPPCresetcore_1,
    RstcPPCresetchip_1,
    RstcPPCresetsys_1,
    MB_Reset,
    Bus_Struct_Reset,
    Peripheral_Reset,
    Interconnect_aresetn,
    Peripheral_aresetn
  );
  input Slowest_sync_clk;
  input Ext_Reset_In;
  input Aux_Reset_In;
  input MB_Debug_Sys_Rst;
  input Core_Reset_Req_0;
  input Chip_Reset_Req_0;
  input System_Reset_Req_0;
  input Core_Reset_Req_1;
  input Chip_Reset_Req_1;
  input System_Reset_Req_1;
  input Dcm_locked;
  output RstcPPCresetcore_0;
  output RstcPPCresetchip_0;
  output RstcPPCresetsys_0;
  output RstcPPCresetcore_1;
  output RstcPPCresetchip_1;
  output RstcPPCresetsys_1;
  output MB_Reset;
  output [0:0] Bus_Struct_Reset;
  output [0:0] Peripheral_Reset;
  output [0:0] Interconnect_aresetn;
  output [0:0] Peripheral_aresetn;
endmodule

module microblaze_0_ilmb_wrapper
  (
    LMB_Clk,
    SYS_Rst,
    LMB_Rst,
    M_ABus,
    M_ReadStrobe,
    M_WriteStrobe,
    M_AddrStrobe,
    M_DBus,
    M_BE,
    Sl_DBus,
    Sl_Ready,
    Sl_Wait,
    Sl_UE,
    Sl_CE,
    LMB_ABus,
    LMB_ReadStrobe,
    LMB_WriteStrobe,
    LMB_AddrStrobe,
    LMB_ReadDBus,
    LMB_WriteDBus,
    LMB_Ready,
    LMB_Wait,
    LMB_UE,
    LMB_CE,
    LMB_BE
  );
  input LMB_Clk;
  input SYS_Rst;
  output LMB_Rst;
  input [0:31] M_ABus;
  input M_ReadStrobe;
  input M_WriteStrobe;
  input M_AddrStrobe;
  input [0:31] M_DBus;
  input [0:3] M_BE;
  input [0:31] Sl_DBus;
  input [0:0] Sl_Ready;
  input [0:0] Sl_Wait;
  input [0:0] Sl_UE;
  input [0:0] Sl_CE;
  output [0:31] LMB_ABus;
  output LMB_ReadStrobe;
  output LMB_WriteStrobe;
  output LMB_AddrStrobe;
  output [0:31] LMB_ReadDBus;
  output [0:31] LMB_WriteDBus;
  output LMB_Ready;
  output LMB_Wait;
  output LMB_UE;
  output LMB_CE;
  output [0:3] LMB_BE;
endmodule

module microblaze_0_i_bram_ctrl_wrapper
  (
    LMB_Clk,
    LMB_Rst,
    LMB_ABus,
    LMB_WriteDBus,
    LMB_AddrStrobe,
    LMB_ReadStrobe,
    LMB_WriteStrobe,
    LMB_BE,
    Sl_DBus,
    Sl_Ready,
    Sl_Wait,
    Sl_UE,
    Sl_CE,
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_EN_A,
    BRAM_WEN_A,
    BRAM_Addr_A,
    BRAM_Din_A,
    BRAM_Dout_A,
    Interrupt,
    SPLB_CTRL_PLB_ABus,
    SPLB_CTRL_PLB_PAValid,
    SPLB_CTRL_PLB_masterID,
    SPLB_CTRL_PLB_RNW,
    SPLB_CTRL_PLB_BE,
    SPLB_CTRL_PLB_size,
    SPLB_CTRL_PLB_type,
    SPLB_CTRL_PLB_wrDBus,
    SPLB_CTRL_Sl_addrAck,
    SPLB_CTRL_Sl_SSize,
    SPLB_CTRL_Sl_wait,
    SPLB_CTRL_Sl_rearbitrate,
    SPLB_CTRL_Sl_wrDAck,
    SPLB_CTRL_Sl_wrComp,
    SPLB_CTRL_Sl_rdDBus,
    SPLB_CTRL_Sl_rdDAck,
    SPLB_CTRL_Sl_rdComp,
    SPLB_CTRL_Sl_MBusy,
    SPLB_CTRL_Sl_MWrErr,
    SPLB_CTRL_Sl_MRdErr,
    SPLB_CTRL_PLB_UABus,
    SPLB_CTRL_PLB_SAValid,
    SPLB_CTRL_PLB_rdPrim,
    SPLB_CTRL_PLB_wrPrim,
    SPLB_CTRL_PLB_abort,
    SPLB_CTRL_PLB_busLock,
    SPLB_CTRL_PLB_MSize,
    SPLB_CTRL_PLB_lockErr,
    SPLB_CTRL_PLB_wrBurst,
    SPLB_CTRL_PLB_rdBurst,
    SPLB_CTRL_PLB_wrPendReq,
    SPLB_CTRL_PLB_rdPendReq,
    SPLB_CTRL_PLB_wrPendPri,
    SPLB_CTRL_PLB_rdPendPri,
    SPLB_CTRL_PLB_reqPri,
    SPLB_CTRL_PLB_TAttribute,
    SPLB_CTRL_Sl_wrBTerm,
    SPLB_CTRL_Sl_rdWdAddr,
    SPLB_CTRL_Sl_rdBTerm,
    SPLB_CTRL_Sl_MIRQ,
    S_AXI_CTRL_ACLK,
    S_AXI_CTRL_ARESETN,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WSTRB,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY
  );
  input LMB_Clk;
  input LMB_Rst;
  input [0:31] LMB_ABus;
  input [0:31] LMB_WriteDBus;
  input LMB_AddrStrobe;
  input LMB_ReadStrobe;
  input LMB_WriteStrobe;
  input [0:3] LMB_BE;
  output [0:31] Sl_DBus;
  output Sl_Ready;
  output Sl_Wait;
  output Sl_UE;
  output Sl_CE;
  output BRAM_Rst_A;
  output BRAM_Clk_A;
  output BRAM_EN_A;
  output [0:3] BRAM_WEN_A;
  output [0:31] BRAM_Addr_A;
  input [0:31] BRAM_Din_A;
  output [0:31] BRAM_Dout_A;
  output Interrupt;
  input [0:31] SPLB_CTRL_PLB_ABus;
  input SPLB_CTRL_PLB_PAValid;
  input [0:0] SPLB_CTRL_PLB_masterID;
  input SPLB_CTRL_PLB_RNW;
  input [0:3] SPLB_CTRL_PLB_BE;
  input [0:3] SPLB_CTRL_PLB_size;
  input [0:2] SPLB_CTRL_PLB_type;
  input [0:31] SPLB_CTRL_PLB_wrDBus;
  output SPLB_CTRL_Sl_addrAck;
  output [0:1] SPLB_CTRL_Sl_SSize;
  output SPLB_CTRL_Sl_wait;
  output SPLB_CTRL_Sl_rearbitrate;
  output SPLB_CTRL_Sl_wrDAck;
  output SPLB_CTRL_Sl_wrComp;
  output [0:31] SPLB_CTRL_Sl_rdDBus;
  output SPLB_CTRL_Sl_rdDAck;
  output SPLB_CTRL_Sl_rdComp;
  output [0:0] SPLB_CTRL_Sl_MBusy;
  output [0:0] SPLB_CTRL_Sl_MWrErr;
  output [0:0] SPLB_CTRL_Sl_MRdErr;
  input [0:31] SPLB_CTRL_PLB_UABus;
  input SPLB_CTRL_PLB_SAValid;
  input SPLB_CTRL_PLB_rdPrim;
  input SPLB_CTRL_PLB_wrPrim;
  input SPLB_CTRL_PLB_abort;
  input SPLB_CTRL_PLB_busLock;
  input [0:1] SPLB_CTRL_PLB_MSize;
  input SPLB_CTRL_PLB_lockErr;
  input SPLB_CTRL_PLB_wrBurst;
  input SPLB_CTRL_PLB_rdBurst;
  input SPLB_CTRL_PLB_wrPendReq;
  input SPLB_CTRL_PLB_rdPendReq;
  input [0:1] SPLB_CTRL_PLB_wrPendPri;
  input [0:1] SPLB_CTRL_PLB_rdPendPri;
  input [0:1] SPLB_CTRL_PLB_reqPri;
  input [0:15] SPLB_CTRL_PLB_TAttribute;
  output SPLB_CTRL_Sl_wrBTerm;
  output [0:3] SPLB_CTRL_Sl_rdWdAddr;
  output SPLB_CTRL_Sl_rdBTerm;
  output [0:0] SPLB_CTRL_Sl_MIRQ;
  input S_AXI_CTRL_ACLK;
  input S_AXI_CTRL_ARESETN;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input [3:0] S_AXI_CTRL_WSTRB;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
endmodule

module microblaze_0_dlmb_wrapper
  (
    LMB_Clk,
    SYS_Rst,
    LMB_Rst,
    M_ABus,
    M_ReadStrobe,
    M_WriteStrobe,
    M_AddrStrobe,
    M_DBus,
    M_BE,
    Sl_DBus,
    Sl_Ready,
    Sl_Wait,
    Sl_UE,
    Sl_CE,
    LMB_ABus,
    LMB_ReadStrobe,
    LMB_WriteStrobe,
    LMB_AddrStrobe,
    LMB_ReadDBus,
    LMB_WriteDBus,
    LMB_Ready,
    LMB_Wait,
    LMB_UE,
    LMB_CE,
    LMB_BE
  );
  input LMB_Clk;
  input SYS_Rst;
  output LMB_Rst;
  input [0:31] M_ABus;
  input M_ReadStrobe;
  input M_WriteStrobe;
  input M_AddrStrobe;
  input [0:31] M_DBus;
  input [0:3] M_BE;
  input [0:31] Sl_DBus;
  input [0:0] Sl_Ready;
  input [0:0] Sl_Wait;
  input [0:0] Sl_UE;
  input [0:0] Sl_CE;
  output [0:31] LMB_ABus;
  output LMB_ReadStrobe;
  output LMB_WriteStrobe;
  output LMB_AddrStrobe;
  output [0:31] LMB_ReadDBus;
  output [0:31] LMB_WriteDBus;
  output LMB_Ready;
  output LMB_Wait;
  output LMB_UE;
  output LMB_CE;
  output [0:3] LMB_BE;
endmodule

module microblaze_0_d_bram_ctrl_wrapper
  (
    LMB_Clk,
    LMB_Rst,
    LMB_ABus,
    LMB_WriteDBus,
    LMB_AddrStrobe,
    LMB_ReadStrobe,
    LMB_WriteStrobe,
    LMB_BE,
    Sl_DBus,
    Sl_Ready,
    Sl_Wait,
    Sl_UE,
    Sl_CE,
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_EN_A,
    BRAM_WEN_A,
    BRAM_Addr_A,
    BRAM_Din_A,
    BRAM_Dout_A,
    Interrupt,
    SPLB_CTRL_PLB_ABus,
    SPLB_CTRL_PLB_PAValid,
    SPLB_CTRL_PLB_masterID,
    SPLB_CTRL_PLB_RNW,
    SPLB_CTRL_PLB_BE,
    SPLB_CTRL_PLB_size,
    SPLB_CTRL_PLB_type,
    SPLB_CTRL_PLB_wrDBus,
    SPLB_CTRL_Sl_addrAck,
    SPLB_CTRL_Sl_SSize,
    SPLB_CTRL_Sl_wait,
    SPLB_CTRL_Sl_rearbitrate,
    SPLB_CTRL_Sl_wrDAck,
    SPLB_CTRL_Sl_wrComp,
    SPLB_CTRL_Sl_rdDBus,
    SPLB_CTRL_Sl_rdDAck,
    SPLB_CTRL_Sl_rdComp,
    SPLB_CTRL_Sl_MBusy,
    SPLB_CTRL_Sl_MWrErr,
    SPLB_CTRL_Sl_MRdErr,
    SPLB_CTRL_PLB_UABus,
    SPLB_CTRL_PLB_SAValid,
    SPLB_CTRL_PLB_rdPrim,
    SPLB_CTRL_PLB_wrPrim,
    SPLB_CTRL_PLB_abort,
    SPLB_CTRL_PLB_busLock,
    SPLB_CTRL_PLB_MSize,
    SPLB_CTRL_PLB_lockErr,
    SPLB_CTRL_PLB_wrBurst,
    SPLB_CTRL_PLB_rdBurst,
    SPLB_CTRL_PLB_wrPendReq,
    SPLB_CTRL_PLB_rdPendReq,
    SPLB_CTRL_PLB_wrPendPri,
    SPLB_CTRL_PLB_rdPendPri,
    SPLB_CTRL_PLB_reqPri,
    SPLB_CTRL_PLB_TAttribute,
    SPLB_CTRL_Sl_wrBTerm,
    SPLB_CTRL_Sl_rdWdAddr,
    SPLB_CTRL_Sl_rdBTerm,
    SPLB_CTRL_Sl_MIRQ,
    S_AXI_CTRL_ACLK,
    S_AXI_CTRL_ARESETN,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WSTRB,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY
  );
  input LMB_Clk;
  input LMB_Rst;
  input [0:31] LMB_ABus;
  input [0:31] LMB_WriteDBus;
  input LMB_AddrStrobe;
  input LMB_ReadStrobe;
  input LMB_WriteStrobe;
  input [0:3] LMB_BE;
  output [0:31] Sl_DBus;
  output Sl_Ready;
  output Sl_Wait;
  output Sl_UE;
  output Sl_CE;
  output BRAM_Rst_A;
  output BRAM_Clk_A;
  output BRAM_EN_A;
  output [0:3] BRAM_WEN_A;
  output [0:31] BRAM_Addr_A;
  input [0:31] BRAM_Din_A;
  output [0:31] BRAM_Dout_A;
  output Interrupt;
  input [0:31] SPLB_CTRL_PLB_ABus;
  input SPLB_CTRL_PLB_PAValid;
  input [0:0] SPLB_CTRL_PLB_masterID;
  input SPLB_CTRL_PLB_RNW;
  input [0:3] SPLB_CTRL_PLB_BE;
  input [0:3] SPLB_CTRL_PLB_size;
  input [0:2] SPLB_CTRL_PLB_type;
  input [0:31] SPLB_CTRL_PLB_wrDBus;
  output SPLB_CTRL_Sl_addrAck;
  output [0:1] SPLB_CTRL_Sl_SSize;
  output SPLB_CTRL_Sl_wait;
  output SPLB_CTRL_Sl_rearbitrate;
  output SPLB_CTRL_Sl_wrDAck;
  output SPLB_CTRL_Sl_wrComp;
  output [0:31] SPLB_CTRL_Sl_rdDBus;
  output SPLB_CTRL_Sl_rdDAck;
  output SPLB_CTRL_Sl_rdComp;
  output [0:0] SPLB_CTRL_Sl_MBusy;
  output [0:0] SPLB_CTRL_Sl_MWrErr;
  output [0:0] SPLB_CTRL_Sl_MRdErr;
  input [0:31] SPLB_CTRL_PLB_UABus;
  input SPLB_CTRL_PLB_SAValid;
  input SPLB_CTRL_PLB_rdPrim;
  input SPLB_CTRL_PLB_wrPrim;
  input SPLB_CTRL_PLB_abort;
  input SPLB_CTRL_PLB_busLock;
  input [0:1] SPLB_CTRL_PLB_MSize;
  input SPLB_CTRL_PLB_lockErr;
  input SPLB_CTRL_PLB_wrBurst;
  input SPLB_CTRL_PLB_rdBurst;
  input SPLB_CTRL_PLB_wrPendReq;
  input SPLB_CTRL_PLB_rdPendReq;
  input [0:1] SPLB_CTRL_PLB_wrPendPri;
  input [0:1] SPLB_CTRL_PLB_rdPendPri;
  input [0:1] SPLB_CTRL_PLB_reqPri;
  input [0:15] SPLB_CTRL_PLB_TAttribute;
  output SPLB_CTRL_Sl_wrBTerm;
  output [0:3] SPLB_CTRL_Sl_rdWdAddr;
  output SPLB_CTRL_Sl_rdBTerm;
  output [0:0] SPLB_CTRL_Sl_MIRQ;
  input S_AXI_CTRL_ACLK;
  input S_AXI_CTRL_ARESETN;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input [3:0] S_AXI_CTRL_WSTRB;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
endmodule

module microblaze_0_bram_block_wrapper
  (
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_EN_A,
    BRAM_WEN_A,
    BRAM_Addr_A,
    BRAM_Din_A,
    BRAM_Dout_A,
    BRAM_Rst_B,
    BRAM_Clk_B,
    BRAM_EN_B,
    BRAM_WEN_B,
    BRAM_Addr_B,
    BRAM_Din_B,
    BRAM_Dout_B
  );
  input BRAM_Rst_A;
  input BRAM_Clk_A;
  input BRAM_EN_A;
  input [0:3] BRAM_WEN_A;
  input [0:31] BRAM_Addr_A;
  output [0:31] BRAM_Din_A;
  input [0:31] BRAM_Dout_A;
  input BRAM_Rst_B;
  input BRAM_Clk_B;
  input BRAM_EN_B;
  input [0:3] BRAM_WEN_B;
  input [0:31] BRAM_Addr_B;
  output [0:31] BRAM_Din_B;
  input [0:31] BRAM_Dout_B;
endmodule

module microblaze_0_wrapper
  (
    CLK,
    RESET,
    MB_RESET,
    INTERRUPT,
    EXT_BRK,
    EXT_NM_BRK,
    DBG_STOP,
    MB_Halted,
    MB_Error,
    LOCKSTEP_MASTER_OUT,
    LOCKSTEP_SLAVE_IN,
    LOCKSTEP_OUT,
    INSTR,
    IREADY,
    IWAIT,
    ICE,
    IUE,
    INSTR_ADDR,
    IFETCH,
    I_AS,
    IPLB_M_ABort,
    IPLB_M_ABus,
    IPLB_M_UABus,
    IPLB_M_BE,
    IPLB_M_busLock,
    IPLB_M_lockErr,
    IPLB_M_MSize,
    IPLB_M_priority,
    IPLB_M_rdBurst,
    IPLB_M_request,
    IPLB_M_RNW,
    IPLB_M_size,
    IPLB_M_TAttribute,
    IPLB_M_type,
    IPLB_M_wrBurst,
    IPLB_M_wrDBus,
    IPLB_MBusy,
    IPLB_MRdErr,
    IPLB_MWrErr,
    IPLB_MIRQ,
    IPLB_MWrBTerm,
    IPLB_MWrDAck,
    IPLB_MAddrAck,
    IPLB_MRdBTerm,
    IPLB_MRdDAck,
    IPLB_MRdDBus,
    IPLB_MRdWdAddr,
    IPLB_MRearbitrate,
    IPLB_MSSize,
    IPLB_MTimeout,
    DATA_READ,
    DREADY,
    DWAIT,
    DCE,
    DUE,
    DATA_WRITE,
    DATA_ADDR,
    D_AS,
    READ_STROBE,
    WRITE_STROBE,
    BYTE_ENABLE,
    DPLB_M_ABort,
    DPLB_M_ABus,
    DPLB_M_UABus,
    DPLB_M_BE,
    DPLB_M_busLock,
    DPLB_M_lockErr,
    DPLB_M_MSize,
    DPLB_M_priority,
    DPLB_M_rdBurst,
    DPLB_M_request,
    DPLB_M_RNW,
    DPLB_M_size,
    DPLB_M_TAttribute,
    DPLB_M_type,
    DPLB_M_wrBurst,
    DPLB_M_wrDBus,
    DPLB_MBusy,
    DPLB_MRdErr,
    DPLB_MWrErr,
    DPLB_MIRQ,
    DPLB_MWrBTerm,
    DPLB_MWrDAck,
    DPLB_MAddrAck,
    DPLB_MRdBTerm,
    DPLB_MRdDAck,
    DPLB_MRdDBus,
    DPLB_MRdWdAddr,
    DPLB_MRearbitrate,
    DPLB_MSSize,
    DPLB_MTimeout,
    M_AXI_IP_AWID,
    M_AXI_IP_AWADDR,
    M_AXI_IP_AWLEN,
    M_AXI_IP_AWSIZE,
    M_AXI_IP_AWBURST,
    M_AXI_IP_AWLOCK,
    M_AXI_IP_AWCACHE,
    M_AXI_IP_AWPROT,
    M_AXI_IP_AWQOS,
    M_AXI_IP_AWVALID,
    M_AXI_IP_AWREADY,
    M_AXI_IP_WDATA,
    M_AXI_IP_WSTRB,
    M_AXI_IP_WLAST,
    M_AXI_IP_WVALID,
    M_AXI_IP_WREADY,
    M_AXI_IP_BID,
    M_AXI_IP_BRESP,
    M_AXI_IP_BVALID,
    M_AXI_IP_BREADY,
    M_AXI_IP_ARID,
    M_AXI_IP_ARADDR,
    M_AXI_IP_ARLEN,
    M_AXI_IP_ARSIZE,
    M_AXI_IP_ARBURST,
    M_AXI_IP_ARLOCK,
    M_AXI_IP_ARCACHE,
    M_AXI_IP_ARPROT,
    M_AXI_IP_ARQOS,
    M_AXI_IP_ARVALID,
    M_AXI_IP_ARREADY,
    M_AXI_IP_RID,
    M_AXI_IP_RDATA,
    M_AXI_IP_RRESP,
    M_AXI_IP_RLAST,
    M_AXI_IP_RVALID,
    M_AXI_IP_RREADY,
    M_AXI_DP_AWID,
    M_AXI_DP_AWADDR,
    M_AXI_DP_AWLEN,
    M_AXI_DP_AWSIZE,
    M_AXI_DP_AWBURST,
    M_AXI_DP_AWLOCK,
    M_AXI_DP_AWCACHE,
    M_AXI_DP_AWPROT,
    M_AXI_DP_AWQOS,
    M_AXI_DP_AWVALID,
    M_AXI_DP_AWREADY,
    M_AXI_DP_WDATA,
    M_AXI_DP_WSTRB,
    M_AXI_DP_WLAST,
    M_AXI_DP_WVALID,
    M_AXI_DP_WREADY,
    M_AXI_DP_BID,
    M_AXI_DP_BRESP,
    M_AXI_DP_BVALID,
    M_AXI_DP_BREADY,
    M_AXI_DP_ARID,
    M_AXI_DP_ARADDR,
    M_AXI_DP_ARLEN,
    M_AXI_DP_ARSIZE,
    M_AXI_DP_ARBURST,
    M_AXI_DP_ARLOCK,
    M_AXI_DP_ARCACHE,
    M_AXI_DP_ARPROT,
    M_AXI_DP_ARQOS,
    M_AXI_DP_ARVALID,
    M_AXI_DP_ARREADY,
    M_AXI_DP_RID,
    M_AXI_DP_RDATA,
    M_AXI_DP_RRESP,
    M_AXI_DP_RLAST,
    M_AXI_DP_RVALID,
    M_AXI_DP_RREADY,
    M_AXI_IC_AWID,
    M_AXI_IC_AWADDR,
    M_AXI_IC_AWLEN,
    M_AXI_IC_AWSIZE,
    M_AXI_IC_AWBURST,
    M_AXI_IC_AWLOCK,
    M_AXI_IC_AWCACHE,
    M_AXI_IC_AWPROT,
    M_AXI_IC_AWQOS,
    M_AXI_IC_AWVALID,
    M_AXI_IC_AWREADY,
    M_AXI_IC_AWUSER,
    M_AXI_IC_WDATA,
    M_AXI_IC_WSTRB,
    M_AXI_IC_WLAST,
    M_AXI_IC_WVALID,
    M_AXI_IC_WREADY,
    M_AXI_IC_WUSER,
    M_AXI_IC_BID,
    M_AXI_IC_BRESP,
    M_AXI_IC_BVALID,
    M_AXI_IC_BREADY,
    M_AXI_IC_BUSER,
    M_AXI_IC_ARID,
    M_AXI_IC_ARADDR,
    M_AXI_IC_ARLEN,
    M_AXI_IC_ARSIZE,
    M_AXI_IC_ARBURST,
    M_AXI_IC_ARLOCK,
    M_AXI_IC_ARCACHE,
    M_AXI_IC_ARPROT,
    M_AXI_IC_ARQOS,
    M_AXI_IC_ARVALID,
    M_AXI_IC_ARREADY,
    M_AXI_IC_ARUSER,
    M_AXI_IC_RID,
    M_AXI_IC_RDATA,
    M_AXI_IC_RRESP,
    M_AXI_IC_RLAST,
    M_AXI_IC_RVALID,
    M_AXI_IC_RREADY,
    M_AXI_IC_RUSER,
    M_AXI_DC_AWID,
    M_AXI_DC_AWADDR,
    M_AXI_DC_AWLEN,
    M_AXI_DC_AWSIZE,
    M_AXI_DC_AWBURST,
    M_AXI_DC_AWLOCK,
    M_AXI_DC_AWCACHE,
    M_AXI_DC_AWPROT,
    M_AXI_DC_AWQOS,
    M_AXI_DC_AWVALID,
    M_AXI_DC_AWREADY,
    M_AXI_DC_AWUSER,
    M_AXI_DC_WDATA,
    M_AXI_DC_WSTRB,
    M_AXI_DC_WLAST,
    M_AXI_DC_WVALID,
    M_AXI_DC_WREADY,
    M_AXI_DC_WUSER,
    M_AXI_DC_BID,
    M_AXI_DC_BRESP,
    M_AXI_DC_BVALID,
    M_AXI_DC_BREADY,
    M_AXI_DC_BUSER,
    M_AXI_DC_ARID,
    M_AXI_DC_ARADDR,
    M_AXI_DC_ARLEN,
    M_AXI_DC_ARSIZE,
    M_AXI_DC_ARBURST,
    M_AXI_DC_ARLOCK,
    M_AXI_DC_ARCACHE,
    M_AXI_DC_ARPROT,
    M_AXI_DC_ARQOS,
    M_AXI_DC_ARVALID,
    M_AXI_DC_ARREADY,
    M_AXI_DC_ARUSER,
    M_AXI_DC_RID,
    M_AXI_DC_RDATA,
    M_AXI_DC_RRESP,
    M_AXI_DC_RLAST,
    M_AXI_DC_RVALID,
    M_AXI_DC_RREADY,
    M_AXI_DC_RUSER,
    DBG_CLK,
    DBG_TDI,
    DBG_TDO,
    DBG_REG_EN,
    DBG_SHIFT,
    DBG_CAPTURE,
    DBG_UPDATE,
    DEBUG_RST,
    Trace_Instruction,
    Trace_Valid_Instr,
    Trace_PC,
    Trace_Reg_Write,
    Trace_Reg_Addr,
    Trace_MSR_Reg,
    Trace_PID_Reg,
    Trace_New_Reg_Value,
    Trace_Exception_Taken,
    Trace_Exception_Kind,
    Trace_Jump_Taken,
    Trace_Delay_Slot,
    Trace_Data_Address,
    Trace_Data_Access,
    Trace_Data_Read,
    Trace_Data_Write,
    Trace_Data_Write_Value,
    Trace_Data_Byte_Enable,
    Trace_DCache_Req,
    Trace_DCache_Hit,
    Trace_DCache_Rdy,
    Trace_DCache_Read,
    Trace_ICache_Req,
    Trace_ICache_Hit,
    Trace_ICache_Rdy,
    Trace_OF_PipeRun,
    Trace_EX_PipeRun,
    Trace_MEM_PipeRun,
    Trace_MB_Halted,
    Trace_Jump_Hit,
    FSL0_S_CLK,
    FSL0_S_READ,
    FSL0_S_DATA,
    FSL0_S_CONTROL,
    FSL0_S_EXISTS,
    FSL0_M_CLK,
    FSL0_M_WRITE,
    FSL0_M_DATA,
    FSL0_M_CONTROL,
    FSL0_M_FULL,
    FSL1_S_CLK,
    FSL1_S_READ,
    FSL1_S_DATA,
    FSL1_S_CONTROL,
    FSL1_S_EXISTS,
    FSL1_M_CLK,
    FSL1_M_WRITE,
    FSL1_M_DATA,
    FSL1_M_CONTROL,
    FSL1_M_FULL,
    FSL2_S_CLK,
    FSL2_S_READ,
    FSL2_S_DATA,
    FSL2_S_CONTROL,
    FSL2_S_EXISTS,
    FSL2_M_CLK,
    FSL2_M_WRITE,
    FSL2_M_DATA,
    FSL2_M_CONTROL,
    FSL2_M_FULL,
    FSL3_S_CLK,
    FSL3_S_READ,
    FSL3_S_DATA,
    FSL3_S_CONTROL,
    FSL3_S_EXISTS,
    FSL3_M_CLK,
    FSL3_M_WRITE,
    FSL3_M_DATA,
    FSL3_M_CONTROL,
    FSL3_M_FULL,
    FSL4_S_CLK,
    FSL4_S_READ,
    FSL4_S_DATA,
    FSL4_S_CONTROL,
    FSL4_S_EXISTS,
    FSL4_M_CLK,
    FSL4_M_WRITE,
    FSL4_M_DATA,
    FSL4_M_CONTROL,
    FSL4_M_FULL,
    FSL5_S_CLK,
    FSL5_S_READ,
    FSL5_S_DATA,
    FSL5_S_CONTROL,
    FSL5_S_EXISTS,
    FSL5_M_CLK,
    FSL5_M_WRITE,
    FSL5_M_DATA,
    FSL5_M_CONTROL,
    FSL5_M_FULL,
    FSL6_S_CLK,
    FSL6_S_READ,
    FSL6_S_DATA,
    FSL6_S_CONTROL,
    FSL6_S_EXISTS,
    FSL6_M_CLK,
    FSL6_M_WRITE,
    FSL6_M_DATA,
    FSL6_M_CONTROL,
    FSL6_M_FULL,
    FSL7_S_CLK,
    FSL7_S_READ,
    FSL7_S_DATA,
    FSL7_S_CONTROL,
    FSL7_S_EXISTS,
    FSL7_M_CLK,
    FSL7_M_WRITE,
    FSL7_M_DATA,
    FSL7_M_CONTROL,
    FSL7_M_FULL,
    FSL8_S_CLK,
    FSL8_S_READ,
    FSL8_S_DATA,
    FSL8_S_CONTROL,
    FSL8_S_EXISTS,
    FSL8_M_CLK,
    FSL8_M_WRITE,
    FSL8_M_DATA,
    FSL8_M_CONTROL,
    FSL8_M_FULL,
    FSL9_S_CLK,
    FSL9_S_READ,
    FSL9_S_DATA,
    FSL9_S_CONTROL,
    FSL9_S_EXISTS,
    FSL9_M_CLK,
    FSL9_M_WRITE,
    FSL9_M_DATA,
    FSL9_M_CONTROL,
    FSL9_M_FULL,
    FSL10_S_CLK,
    FSL10_S_READ,
    FSL10_S_DATA,
    FSL10_S_CONTROL,
    FSL10_S_EXISTS,
    FSL10_M_CLK,
    FSL10_M_WRITE,
    FSL10_M_DATA,
    FSL10_M_CONTROL,
    FSL10_M_FULL,
    FSL11_S_CLK,
    FSL11_S_READ,
    FSL11_S_DATA,
    FSL11_S_CONTROL,
    FSL11_S_EXISTS,
    FSL11_M_CLK,
    FSL11_M_WRITE,
    FSL11_M_DATA,
    FSL11_M_CONTROL,
    FSL11_M_FULL,
    FSL12_S_CLK,
    FSL12_S_READ,
    FSL12_S_DATA,
    FSL12_S_CONTROL,
    FSL12_S_EXISTS,
    FSL12_M_CLK,
    FSL12_M_WRITE,
    FSL12_M_DATA,
    FSL12_M_CONTROL,
    FSL12_M_FULL,
    FSL13_S_CLK,
    FSL13_S_READ,
    FSL13_S_DATA,
    FSL13_S_CONTROL,
    FSL13_S_EXISTS,
    FSL13_M_CLK,
    FSL13_M_WRITE,
    FSL13_M_DATA,
    FSL13_M_CONTROL,
    FSL13_M_FULL,
    FSL14_S_CLK,
    FSL14_S_READ,
    FSL14_S_DATA,
    FSL14_S_CONTROL,
    FSL14_S_EXISTS,
    FSL14_M_CLK,
    FSL14_M_WRITE,
    FSL14_M_DATA,
    FSL14_M_CONTROL,
    FSL14_M_FULL,
    FSL15_S_CLK,
    FSL15_S_READ,
    FSL15_S_DATA,
    FSL15_S_CONTROL,
    FSL15_S_EXISTS,
    FSL15_M_CLK,
    FSL15_M_WRITE,
    FSL15_M_DATA,
    FSL15_M_CONTROL,
    FSL15_M_FULL,
    M0_AXIS_TLAST,
    M0_AXIS_TDATA,
    M0_AXIS_TVALID,
    M0_AXIS_TREADY,
    S0_AXIS_TLAST,
    S0_AXIS_TDATA,
    S0_AXIS_TVALID,
    S0_AXIS_TREADY,
    M1_AXIS_TLAST,
    M1_AXIS_TDATA,
    M1_AXIS_TVALID,
    M1_AXIS_TREADY,
    S1_AXIS_TLAST,
    S1_AXIS_TDATA,
    S1_AXIS_TVALID,
    S1_AXIS_TREADY,
    M2_AXIS_TLAST,
    M2_AXIS_TDATA,
    M2_AXIS_TVALID,
    M2_AXIS_TREADY,
    S2_AXIS_TLAST,
    S2_AXIS_TDATA,
    S2_AXIS_TVALID,
    S2_AXIS_TREADY,
    M3_AXIS_TLAST,
    M3_AXIS_TDATA,
    M3_AXIS_TVALID,
    M3_AXIS_TREADY,
    S3_AXIS_TLAST,
    S3_AXIS_TDATA,
    S3_AXIS_TVALID,
    S3_AXIS_TREADY,
    M4_AXIS_TLAST,
    M4_AXIS_TDATA,
    M4_AXIS_TVALID,
    M4_AXIS_TREADY,
    S4_AXIS_TLAST,
    S4_AXIS_TDATA,
    S4_AXIS_TVALID,
    S4_AXIS_TREADY,
    M5_AXIS_TLAST,
    M5_AXIS_TDATA,
    M5_AXIS_TVALID,
    M5_AXIS_TREADY,
    S5_AXIS_TLAST,
    S5_AXIS_TDATA,
    S5_AXIS_TVALID,
    S5_AXIS_TREADY,
    M6_AXIS_TLAST,
    M6_AXIS_TDATA,
    M6_AXIS_TVALID,
    M6_AXIS_TREADY,
    S6_AXIS_TLAST,
    S6_AXIS_TDATA,
    S6_AXIS_TVALID,
    S6_AXIS_TREADY,
    M7_AXIS_TLAST,
    M7_AXIS_TDATA,
    M7_AXIS_TVALID,
    M7_AXIS_TREADY,
    S7_AXIS_TLAST,
    S7_AXIS_TDATA,
    S7_AXIS_TVALID,
    S7_AXIS_TREADY,
    M8_AXIS_TLAST,
    M8_AXIS_TDATA,
    M8_AXIS_TVALID,
    M8_AXIS_TREADY,
    S8_AXIS_TLAST,
    S8_AXIS_TDATA,
    S8_AXIS_TVALID,
    S8_AXIS_TREADY,
    M9_AXIS_TLAST,
    M9_AXIS_TDATA,
    M9_AXIS_TVALID,
    M9_AXIS_TREADY,
    S9_AXIS_TLAST,
    S9_AXIS_TDATA,
    S9_AXIS_TVALID,
    S9_AXIS_TREADY,
    M10_AXIS_TLAST,
    M10_AXIS_TDATA,
    M10_AXIS_TVALID,
    M10_AXIS_TREADY,
    S10_AXIS_TLAST,
    S10_AXIS_TDATA,
    S10_AXIS_TVALID,
    S10_AXIS_TREADY,
    M11_AXIS_TLAST,
    M11_AXIS_TDATA,
    M11_AXIS_TVALID,
    M11_AXIS_TREADY,
    S11_AXIS_TLAST,
    S11_AXIS_TDATA,
    S11_AXIS_TVALID,
    S11_AXIS_TREADY,
    M12_AXIS_TLAST,
    M12_AXIS_TDATA,
    M12_AXIS_TVALID,
    M12_AXIS_TREADY,
    S12_AXIS_TLAST,
    S12_AXIS_TDATA,
    S12_AXIS_TVALID,
    S12_AXIS_TREADY,
    M13_AXIS_TLAST,
    M13_AXIS_TDATA,
    M13_AXIS_TVALID,
    M13_AXIS_TREADY,
    S13_AXIS_TLAST,
    S13_AXIS_TDATA,
    S13_AXIS_TVALID,
    S13_AXIS_TREADY,
    M14_AXIS_TLAST,
    M14_AXIS_TDATA,
    M14_AXIS_TVALID,
    M14_AXIS_TREADY,
    S14_AXIS_TLAST,
    S14_AXIS_TDATA,
    S14_AXIS_TVALID,
    S14_AXIS_TREADY,
    M15_AXIS_TLAST,
    M15_AXIS_TDATA,
    M15_AXIS_TVALID,
    M15_AXIS_TREADY,
    S15_AXIS_TLAST,
    S15_AXIS_TDATA,
    S15_AXIS_TVALID,
    S15_AXIS_TREADY,
    ICACHE_FSL_IN_CLK,
    ICACHE_FSL_IN_READ,
    ICACHE_FSL_IN_DATA,
    ICACHE_FSL_IN_CONTROL,
    ICACHE_FSL_IN_EXISTS,
    ICACHE_FSL_OUT_CLK,
    ICACHE_FSL_OUT_WRITE,
    ICACHE_FSL_OUT_DATA,
    ICACHE_FSL_OUT_CONTROL,
    ICACHE_FSL_OUT_FULL,
    DCACHE_FSL_IN_CLK,
    DCACHE_FSL_IN_READ,
    DCACHE_FSL_IN_DATA,
    DCACHE_FSL_IN_CONTROL,
    DCACHE_FSL_IN_EXISTS,
    DCACHE_FSL_OUT_CLK,
    DCACHE_FSL_OUT_WRITE,
    DCACHE_FSL_OUT_DATA,
    DCACHE_FSL_OUT_CONTROL,
    DCACHE_FSL_OUT_FULL
  );
  input CLK;
  input RESET;
  input MB_RESET;
  input INTERRUPT;
  input EXT_BRK;
  input EXT_NM_BRK;
  input DBG_STOP;
  output MB_Halted;
  output MB_Error;
  output [0:4095] LOCKSTEP_MASTER_OUT;
  input [0:4095] LOCKSTEP_SLAVE_IN;
  output [0:4095] LOCKSTEP_OUT;
  input [0:31] INSTR;
  input IREADY;
  input IWAIT;
  input ICE;
  input IUE;
  output [0:31] INSTR_ADDR;
  output IFETCH;
  output I_AS;
  output IPLB_M_ABort;
  output [0:31] IPLB_M_ABus;
  output [0:31] IPLB_M_UABus;
  output [0:3] IPLB_M_BE;
  output IPLB_M_busLock;
  output IPLB_M_lockErr;
  output [0:1] IPLB_M_MSize;
  output [0:1] IPLB_M_priority;
  output IPLB_M_rdBurst;
  output IPLB_M_request;
  output IPLB_M_RNW;
  output [0:3] IPLB_M_size;
  output [0:15] IPLB_M_TAttribute;
  output [0:2] IPLB_M_type;
  output IPLB_M_wrBurst;
  output [0:31] IPLB_M_wrDBus;
  input IPLB_MBusy;
  input IPLB_MRdErr;
  input IPLB_MWrErr;
  input IPLB_MIRQ;
  input IPLB_MWrBTerm;
  input IPLB_MWrDAck;
  input IPLB_MAddrAck;
  input IPLB_MRdBTerm;
  input IPLB_MRdDAck;
  input [0:31] IPLB_MRdDBus;
  input [0:3] IPLB_MRdWdAddr;
  input IPLB_MRearbitrate;
  input [0:1] IPLB_MSSize;
  input IPLB_MTimeout;
  input [0:31] DATA_READ;
  input DREADY;
  input DWAIT;
  input DCE;
  input DUE;
  output [0:31] DATA_WRITE;
  output [0:31] DATA_ADDR;
  output D_AS;
  output READ_STROBE;
  output WRITE_STROBE;
  output [0:3] BYTE_ENABLE;
  output DPLB_M_ABort;
  output [0:31] DPLB_M_ABus;
  output [0:31] DPLB_M_UABus;
  output [0:3] DPLB_M_BE;
  output DPLB_M_busLock;
  output DPLB_M_lockErr;
  output [0:1] DPLB_M_MSize;
  output [0:1] DPLB_M_priority;
  output DPLB_M_rdBurst;
  output DPLB_M_request;
  output DPLB_M_RNW;
  output [0:3] DPLB_M_size;
  output [0:15] DPLB_M_TAttribute;
  output [0:2] DPLB_M_type;
  output DPLB_M_wrBurst;
  output [0:31] DPLB_M_wrDBus;
  input DPLB_MBusy;
  input DPLB_MRdErr;
  input DPLB_MWrErr;
  input DPLB_MIRQ;
  input DPLB_MWrBTerm;
  input DPLB_MWrDAck;
  input DPLB_MAddrAck;
  input DPLB_MRdBTerm;
  input DPLB_MRdDAck;
  input [0:31] DPLB_MRdDBus;
  input [0:3] DPLB_MRdWdAddr;
  input DPLB_MRearbitrate;
  input [0:1] DPLB_MSSize;
  input DPLB_MTimeout;
  output [0:0] M_AXI_IP_AWID;
  output [31:0] M_AXI_IP_AWADDR;
  output [7:0] M_AXI_IP_AWLEN;
  output [2:0] M_AXI_IP_AWSIZE;
  output [1:0] M_AXI_IP_AWBURST;
  output M_AXI_IP_AWLOCK;
  output [3:0] M_AXI_IP_AWCACHE;
  output [2:0] M_AXI_IP_AWPROT;
  output [3:0] M_AXI_IP_AWQOS;
  output M_AXI_IP_AWVALID;
  input M_AXI_IP_AWREADY;
  output [31:0] M_AXI_IP_WDATA;
  output [3:0] M_AXI_IP_WSTRB;
  output M_AXI_IP_WLAST;
  output M_AXI_IP_WVALID;
  input M_AXI_IP_WREADY;
  input [0:0] M_AXI_IP_BID;
  input [1:0] M_AXI_IP_BRESP;
  input M_AXI_IP_BVALID;
  output M_AXI_IP_BREADY;
  output [0:0] M_AXI_IP_ARID;
  output [31:0] M_AXI_IP_ARADDR;
  output [7:0] M_AXI_IP_ARLEN;
  output [2:0] M_AXI_IP_ARSIZE;
  output [1:0] M_AXI_IP_ARBURST;
  output M_AXI_IP_ARLOCK;
  output [3:0] M_AXI_IP_ARCACHE;
  output [2:0] M_AXI_IP_ARPROT;
  output [3:0] M_AXI_IP_ARQOS;
  output M_AXI_IP_ARVALID;
  input M_AXI_IP_ARREADY;
  input [0:0] M_AXI_IP_RID;
  input [31:0] M_AXI_IP_RDATA;
  input [1:0] M_AXI_IP_RRESP;
  input M_AXI_IP_RLAST;
  input M_AXI_IP_RVALID;
  output M_AXI_IP_RREADY;
  output [0:0] M_AXI_DP_AWID;
  output [31:0] M_AXI_DP_AWADDR;
  output [7:0] M_AXI_DP_AWLEN;
  output [2:0] M_AXI_DP_AWSIZE;
  output [1:0] M_AXI_DP_AWBURST;
  output M_AXI_DP_AWLOCK;
  output [3:0] M_AXI_DP_AWCACHE;
  output [2:0] M_AXI_DP_AWPROT;
  output [3:0] M_AXI_DP_AWQOS;
  output M_AXI_DP_AWVALID;
  input M_AXI_DP_AWREADY;
  output [31:0] M_AXI_DP_WDATA;
  output [3:0] M_AXI_DP_WSTRB;
  output M_AXI_DP_WLAST;
  output M_AXI_DP_WVALID;
  input M_AXI_DP_WREADY;
  input [0:0] M_AXI_DP_BID;
  input [1:0] M_AXI_DP_BRESP;
  input M_AXI_DP_BVALID;
  output M_AXI_DP_BREADY;
  output [0:0] M_AXI_DP_ARID;
  output [31:0] M_AXI_DP_ARADDR;
  output [7:0] M_AXI_DP_ARLEN;
  output [2:0] M_AXI_DP_ARSIZE;
  output [1:0] M_AXI_DP_ARBURST;
  output M_AXI_DP_ARLOCK;
  output [3:0] M_AXI_DP_ARCACHE;
  output [2:0] M_AXI_DP_ARPROT;
  output [3:0] M_AXI_DP_ARQOS;
  output M_AXI_DP_ARVALID;
  input M_AXI_DP_ARREADY;
  input [0:0] M_AXI_DP_RID;
  input [31:0] M_AXI_DP_RDATA;
  input [1:0] M_AXI_DP_RRESP;
  input M_AXI_DP_RLAST;
  input M_AXI_DP_RVALID;
  output M_AXI_DP_RREADY;
  output [0:0] M_AXI_IC_AWID;
  output [31:0] M_AXI_IC_AWADDR;
  output [7:0] M_AXI_IC_AWLEN;
  output [2:0] M_AXI_IC_AWSIZE;
  output [1:0] M_AXI_IC_AWBURST;
  output M_AXI_IC_AWLOCK;
  output [3:0] M_AXI_IC_AWCACHE;
  output [2:0] M_AXI_IC_AWPROT;
  output [3:0] M_AXI_IC_AWQOS;
  output M_AXI_IC_AWVALID;
  input M_AXI_IC_AWREADY;
  output [4:0] M_AXI_IC_AWUSER;
  output [31:0] M_AXI_IC_WDATA;
  output [3:0] M_AXI_IC_WSTRB;
  output M_AXI_IC_WLAST;
  output M_AXI_IC_WVALID;
  input M_AXI_IC_WREADY;
  output [0:0] M_AXI_IC_WUSER;
  input [0:0] M_AXI_IC_BID;
  input [1:0] M_AXI_IC_BRESP;
  input M_AXI_IC_BVALID;
  output M_AXI_IC_BREADY;
  input [0:0] M_AXI_IC_BUSER;
  output [0:0] M_AXI_IC_ARID;
  output [31:0] M_AXI_IC_ARADDR;
  output [7:0] M_AXI_IC_ARLEN;
  output [2:0] M_AXI_IC_ARSIZE;
  output [1:0] M_AXI_IC_ARBURST;
  output M_AXI_IC_ARLOCK;
  output [3:0] M_AXI_IC_ARCACHE;
  output [2:0] M_AXI_IC_ARPROT;
  output [3:0] M_AXI_IC_ARQOS;
  output M_AXI_IC_ARVALID;
  input M_AXI_IC_ARREADY;
  output [4:0] M_AXI_IC_ARUSER;
  input [0:0] M_AXI_IC_RID;
  input [31:0] M_AXI_IC_RDATA;
  input [1:0] M_AXI_IC_RRESP;
  input M_AXI_IC_RLAST;
  input M_AXI_IC_RVALID;
  output M_AXI_IC_RREADY;
  input [0:0] M_AXI_IC_RUSER;
  output [0:0] M_AXI_DC_AWID;
  output [31:0] M_AXI_DC_AWADDR;
  output [7:0] M_AXI_DC_AWLEN;
  output [2:0] M_AXI_DC_AWSIZE;
  output [1:0] M_AXI_DC_AWBURST;
  output M_AXI_DC_AWLOCK;
  output [3:0] M_AXI_DC_AWCACHE;
  output [2:0] M_AXI_DC_AWPROT;
  output [3:0] M_AXI_DC_AWQOS;
  output M_AXI_DC_AWVALID;
  input M_AXI_DC_AWREADY;
  output [4:0] M_AXI_DC_AWUSER;
  output [31:0] M_AXI_DC_WDATA;
  output [3:0] M_AXI_DC_WSTRB;
  output M_AXI_DC_WLAST;
  output M_AXI_DC_WVALID;
  input M_AXI_DC_WREADY;
  output [0:0] M_AXI_DC_WUSER;
  input [0:0] M_AXI_DC_BID;
  input [1:0] M_AXI_DC_BRESP;
  input M_AXI_DC_BVALID;
  output M_AXI_DC_BREADY;
  input [0:0] M_AXI_DC_BUSER;
  output [0:0] M_AXI_DC_ARID;
  output [31:0] M_AXI_DC_ARADDR;
  output [7:0] M_AXI_DC_ARLEN;
  output [2:0] M_AXI_DC_ARSIZE;
  output [1:0] M_AXI_DC_ARBURST;
  output M_AXI_DC_ARLOCK;
  output [3:0] M_AXI_DC_ARCACHE;
  output [2:0] M_AXI_DC_ARPROT;
  output [3:0] M_AXI_DC_ARQOS;
  output M_AXI_DC_ARVALID;
  input M_AXI_DC_ARREADY;
  output [4:0] M_AXI_DC_ARUSER;
  input [0:0] M_AXI_DC_RID;
  input [31:0] M_AXI_DC_RDATA;
  input [1:0] M_AXI_DC_RRESP;
  input M_AXI_DC_RLAST;
  input M_AXI_DC_RVALID;
  output M_AXI_DC_RREADY;
  input [0:0] M_AXI_DC_RUSER;
  input DBG_CLK;
  input DBG_TDI;
  output DBG_TDO;
  input [0:7] DBG_REG_EN;
  input DBG_SHIFT;
  input DBG_CAPTURE;
  input DBG_UPDATE;
  input DEBUG_RST;
  output [0:31] Trace_Instruction;
  output Trace_Valid_Instr;
  output [0:31] Trace_PC;
  output Trace_Reg_Write;
  output [0:4] Trace_Reg_Addr;
  output [0:14] Trace_MSR_Reg;
  output [0:7] Trace_PID_Reg;
  output [0:31] Trace_New_Reg_Value;
  output Trace_Exception_Taken;
  output [0:4] Trace_Exception_Kind;
  output Trace_Jump_Taken;
  output Trace_Delay_Slot;
  output [0:31] Trace_Data_Address;
  output Trace_Data_Access;
  output Trace_Data_Read;
  output Trace_Data_Write;
  output [0:31] Trace_Data_Write_Value;
  output [0:3] Trace_Data_Byte_Enable;
  output Trace_DCache_Req;
  output Trace_DCache_Hit;
  output Trace_DCache_Rdy;
  output Trace_DCache_Read;
  output Trace_ICache_Req;
  output Trace_ICache_Hit;
  output Trace_ICache_Rdy;
  output Trace_OF_PipeRun;
  output Trace_EX_PipeRun;
  output Trace_MEM_PipeRun;
  output Trace_MB_Halted;
  output Trace_Jump_Hit;
  output FSL0_S_CLK;
  output FSL0_S_READ;
  input [0:31] FSL0_S_DATA;
  input FSL0_S_CONTROL;
  input FSL0_S_EXISTS;
  output FSL0_M_CLK;
  output FSL0_M_WRITE;
  output [0:31] FSL0_M_DATA;
  output FSL0_M_CONTROL;
  input FSL0_M_FULL;
  output FSL1_S_CLK;
  output FSL1_S_READ;
  input [0:31] FSL1_S_DATA;
  input FSL1_S_CONTROL;
  input FSL1_S_EXISTS;
  output FSL1_M_CLK;
  output FSL1_M_WRITE;
  output [0:31] FSL1_M_DATA;
  output FSL1_M_CONTROL;
  input FSL1_M_FULL;
  output FSL2_S_CLK;
  output FSL2_S_READ;
  input [0:31] FSL2_S_DATA;
  input FSL2_S_CONTROL;
  input FSL2_S_EXISTS;
  output FSL2_M_CLK;
  output FSL2_M_WRITE;
  output [0:31] FSL2_M_DATA;
  output FSL2_M_CONTROL;
  input FSL2_M_FULL;
  output FSL3_S_CLK;
  output FSL3_S_READ;
  input [0:31] FSL3_S_DATA;
  input FSL3_S_CONTROL;
  input FSL3_S_EXISTS;
  output FSL3_M_CLK;
  output FSL3_M_WRITE;
  output [0:31] FSL3_M_DATA;
  output FSL3_M_CONTROL;
  input FSL3_M_FULL;
  output FSL4_S_CLK;
  output FSL4_S_READ;
  input [0:31] FSL4_S_DATA;
  input FSL4_S_CONTROL;
  input FSL4_S_EXISTS;
  output FSL4_M_CLK;
  output FSL4_M_WRITE;
  output [0:31] FSL4_M_DATA;
  output FSL4_M_CONTROL;
  input FSL4_M_FULL;
  output FSL5_S_CLK;
  output FSL5_S_READ;
  input [0:31] FSL5_S_DATA;
  input FSL5_S_CONTROL;
  input FSL5_S_EXISTS;
  output FSL5_M_CLK;
  output FSL5_M_WRITE;
  output [0:31] FSL5_M_DATA;
  output FSL5_M_CONTROL;
  input FSL5_M_FULL;
  output FSL6_S_CLK;
  output FSL6_S_READ;
  input [0:31] FSL6_S_DATA;
  input FSL6_S_CONTROL;
  input FSL6_S_EXISTS;
  output FSL6_M_CLK;
  output FSL6_M_WRITE;
  output [0:31] FSL6_M_DATA;
  output FSL6_M_CONTROL;
  input FSL6_M_FULL;
  output FSL7_S_CLK;
  output FSL7_S_READ;
  input [0:31] FSL7_S_DATA;
  input FSL7_S_CONTROL;
  input FSL7_S_EXISTS;
  output FSL7_M_CLK;
  output FSL7_M_WRITE;
  output [0:31] FSL7_M_DATA;
  output FSL7_M_CONTROL;
  input FSL7_M_FULL;
  output FSL8_S_CLK;
  output FSL8_S_READ;
  input [0:31] FSL8_S_DATA;
  input FSL8_S_CONTROL;
  input FSL8_S_EXISTS;
  output FSL8_M_CLK;
  output FSL8_M_WRITE;
  output [0:31] FSL8_M_DATA;
  output FSL8_M_CONTROL;
  input FSL8_M_FULL;
  output FSL9_S_CLK;
  output FSL9_S_READ;
  input [0:31] FSL9_S_DATA;
  input FSL9_S_CONTROL;
  input FSL9_S_EXISTS;
  output FSL9_M_CLK;
  output FSL9_M_WRITE;
  output [0:31] FSL9_M_DATA;
  output FSL9_M_CONTROL;
  input FSL9_M_FULL;
  output FSL10_S_CLK;
  output FSL10_S_READ;
  input [0:31] FSL10_S_DATA;
  input FSL10_S_CONTROL;
  input FSL10_S_EXISTS;
  output FSL10_M_CLK;
  output FSL10_M_WRITE;
  output [0:31] FSL10_M_DATA;
  output FSL10_M_CONTROL;
  input FSL10_M_FULL;
  output FSL11_S_CLK;
  output FSL11_S_READ;
  input [0:31] FSL11_S_DATA;
  input FSL11_S_CONTROL;
  input FSL11_S_EXISTS;
  output FSL11_M_CLK;
  output FSL11_M_WRITE;
  output [0:31] FSL11_M_DATA;
  output FSL11_M_CONTROL;
  input FSL11_M_FULL;
  output FSL12_S_CLK;
  output FSL12_S_READ;
  input [0:31] FSL12_S_DATA;
  input FSL12_S_CONTROL;
  input FSL12_S_EXISTS;
  output FSL12_M_CLK;
  output FSL12_M_WRITE;
  output [0:31] FSL12_M_DATA;
  output FSL12_M_CONTROL;
  input FSL12_M_FULL;
  output FSL13_S_CLK;
  output FSL13_S_READ;
  input [0:31] FSL13_S_DATA;
  input FSL13_S_CONTROL;
  input FSL13_S_EXISTS;
  output FSL13_M_CLK;
  output FSL13_M_WRITE;
  output [0:31] FSL13_M_DATA;
  output FSL13_M_CONTROL;
  input FSL13_M_FULL;
  output FSL14_S_CLK;
  output FSL14_S_READ;
  input [0:31] FSL14_S_DATA;
  input FSL14_S_CONTROL;
  input FSL14_S_EXISTS;
  output FSL14_M_CLK;
  output FSL14_M_WRITE;
  output [0:31] FSL14_M_DATA;
  output FSL14_M_CONTROL;
  input FSL14_M_FULL;
  output FSL15_S_CLK;
  output FSL15_S_READ;
  input [0:31] FSL15_S_DATA;
  input FSL15_S_CONTROL;
  input FSL15_S_EXISTS;
  output FSL15_M_CLK;
  output FSL15_M_WRITE;
  output [0:31] FSL15_M_DATA;
  output FSL15_M_CONTROL;
  input FSL15_M_FULL;
  output M0_AXIS_TLAST;
  output [31:0] M0_AXIS_TDATA;
  output M0_AXIS_TVALID;
  input M0_AXIS_TREADY;
  input S0_AXIS_TLAST;
  input [31:0] S0_AXIS_TDATA;
  input S0_AXIS_TVALID;
  output S0_AXIS_TREADY;
  output M1_AXIS_TLAST;
  output [31:0] M1_AXIS_TDATA;
  output M1_AXIS_TVALID;
  input M1_AXIS_TREADY;
  input S1_AXIS_TLAST;
  input [31:0] S1_AXIS_TDATA;
  input S1_AXIS_TVALID;
  output S1_AXIS_TREADY;
  output M2_AXIS_TLAST;
  output [31:0] M2_AXIS_TDATA;
  output M2_AXIS_TVALID;
  input M2_AXIS_TREADY;
  input S2_AXIS_TLAST;
  input [31:0] S2_AXIS_TDATA;
  input S2_AXIS_TVALID;
  output S2_AXIS_TREADY;
  output M3_AXIS_TLAST;
  output [31:0] M3_AXIS_TDATA;
  output M3_AXIS_TVALID;
  input M3_AXIS_TREADY;
  input S3_AXIS_TLAST;
  input [31:0] S3_AXIS_TDATA;
  input S3_AXIS_TVALID;
  output S3_AXIS_TREADY;
  output M4_AXIS_TLAST;
  output [31:0] M4_AXIS_TDATA;
  output M4_AXIS_TVALID;
  input M4_AXIS_TREADY;
  input S4_AXIS_TLAST;
  input [31:0] S4_AXIS_TDATA;
  input S4_AXIS_TVALID;
  output S4_AXIS_TREADY;
  output M5_AXIS_TLAST;
  output [31:0] M5_AXIS_TDATA;
  output M5_AXIS_TVALID;
  input M5_AXIS_TREADY;
  input S5_AXIS_TLAST;
  input [31:0] S5_AXIS_TDATA;
  input S5_AXIS_TVALID;
  output S5_AXIS_TREADY;
  output M6_AXIS_TLAST;
  output [31:0] M6_AXIS_TDATA;
  output M6_AXIS_TVALID;
  input M6_AXIS_TREADY;
  input S6_AXIS_TLAST;
  input [31:0] S6_AXIS_TDATA;
  input S6_AXIS_TVALID;
  output S6_AXIS_TREADY;
  output M7_AXIS_TLAST;
  output [31:0] M7_AXIS_TDATA;
  output M7_AXIS_TVALID;
  input M7_AXIS_TREADY;
  input S7_AXIS_TLAST;
  input [31:0] S7_AXIS_TDATA;
  input S7_AXIS_TVALID;
  output S7_AXIS_TREADY;
  output M8_AXIS_TLAST;
  output [31:0] M8_AXIS_TDATA;
  output M8_AXIS_TVALID;
  input M8_AXIS_TREADY;
  input S8_AXIS_TLAST;
  input [31:0] S8_AXIS_TDATA;
  input S8_AXIS_TVALID;
  output S8_AXIS_TREADY;
  output M9_AXIS_TLAST;
  output [31:0] M9_AXIS_TDATA;
  output M9_AXIS_TVALID;
  input M9_AXIS_TREADY;
  input S9_AXIS_TLAST;
  input [31:0] S9_AXIS_TDATA;
  input S9_AXIS_TVALID;
  output S9_AXIS_TREADY;
  output M10_AXIS_TLAST;
  output [31:0] M10_AXIS_TDATA;
  output M10_AXIS_TVALID;
  input M10_AXIS_TREADY;
  input S10_AXIS_TLAST;
  input [31:0] S10_AXIS_TDATA;
  input S10_AXIS_TVALID;
  output S10_AXIS_TREADY;
  output M11_AXIS_TLAST;
  output [31:0] M11_AXIS_TDATA;
  output M11_AXIS_TVALID;
  input M11_AXIS_TREADY;
  input S11_AXIS_TLAST;
  input [31:0] S11_AXIS_TDATA;
  input S11_AXIS_TVALID;
  output S11_AXIS_TREADY;
  output M12_AXIS_TLAST;
  output [31:0] M12_AXIS_TDATA;
  output M12_AXIS_TVALID;
  input M12_AXIS_TREADY;
  input S12_AXIS_TLAST;
  input [31:0] S12_AXIS_TDATA;
  input S12_AXIS_TVALID;
  output S12_AXIS_TREADY;
  output M13_AXIS_TLAST;
  output [31:0] M13_AXIS_TDATA;
  output M13_AXIS_TVALID;
  input M13_AXIS_TREADY;
  input S13_AXIS_TLAST;
  input [31:0] S13_AXIS_TDATA;
  input S13_AXIS_TVALID;
  output S13_AXIS_TREADY;
  output M14_AXIS_TLAST;
  output [31:0] M14_AXIS_TDATA;
  output M14_AXIS_TVALID;
  input M14_AXIS_TREADY;
  input S14_AXIS_TLAST;
  input [31:0] S14_AXIS_TDATA;
  input S14_AXIS_TVALID;
  output S14_AXIS_TREADY;
  output M15_AXIS_TLAST;
  output [31:0] M15_AXIS_TDATA;
  output M15_AXIS_TVALID;
  input M15_AXIS_TREADY;
  input S15_AXIS_TLAST;
  input [31:0] S15_AXIS_TDATA;
  input S15_AXIS_TVALID;
  output S15_AXIS_TREADY;
  output ICACHE_FSL_IN_CLK;
  output ICACHE_FSL_IN_READ;
  input [0:31] ICACHE_FSL_IN_DATA;
  input ICACHE_FSL_IN_CONTROL;
  input ICACHE_FSL_IN_EXISTS;
  output ICACHE_FSL_OUT_CLK;
  output ICACHE_FSL_OUT_WRITE;
  output [0:31] ICACHE_FSL_OUT_DATA;
  output ICACHE_FSL_OUT_CONTROL;
  input ICACHE_FSL_OUT_FULL;
  output DCACHE_FSL_IN_CLK;
  output DCACHE_FSL_IN_READ;
  input [0:31] DCACHE_FSL_IN_DATA;
  input DCACHE_FSL_IN_CONTROL;
  input DCACHE_FSL_IN_EXISTS;
  output DCACHE_FSL_OUT_CLK;
  output DCACHE_FSL_OUT_WRITE;
  output [0:31] DCACHE_FSL_OUT_DATA;
  output DCACHE_FSL_OUT_CONTROL;
  input DCACHE_FSL_OUT_FULL;
endmodule

module debug_module_wrapper
  (
    Interrupt,
    Debug_SYS_Rst,
    Ext_BRK,
    Ext_NM_BRK,
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_RREADY,
    SPLB_Clk,
    SPLB_Rst,
    PLB_ABus,
    PLB_UABus,
    PLB_PAValid,
    PLB_SAValid,
    PLB_rdPrim,
    PLB_wrPrim,
    PLB_masterID,
    PLB_abort,
    PLB_busLock,
    PLB_RNW,
    PLB_BE,
    PLB_MSize,
    PLB_size,
    PLB_type,
    PLB_lockErr,
    PLB_wrDBus,
    PLB_wrBurst,
    PLB_rdBurst,
    PLB_wrPendReq,
    PLB_rdPendReq,
    PLB_wrPendPri,
    PLB_rdPendPri,
    PLB_reqPri,
    PLB_TAttribute,
    Sl_addrAck,
    Sl_SSize,
    Sl_wait,
    Sl_rearbitrate,
    Sl_wrDAck,
    Sl_wrComp,
    Sl_wrBTerm,
    Sl_rdDBus,
    Sl_rdWdAddr,
    Sl_rdDAck,
    Sl_rdComp,
    Sl_rdBTerm,
    Sl_MBusy,
    Sl_MWrErr,
    Sl_MRdErr,
    Sl_MIRQ,
    Dbg_Clk_0,
    Dbg_TDI_0,
    Dbg_TDO_0,
    Dbg_Reg_En_0,
    Dbg_Capture_0,
    Dbg_Shift_0,
    Dbg_Update_0,
    Dbg_Rst_0,
    Dbg_Clk_1,
    Dbg_TDI_1,
    Dbg_TDO_1,
    Dbg_Reg_En_1,
    Dbg_Capture_1,
    Dbg_Shift_1,
    Dbg_Update_1,
    Dbg_Rst_1,
    Dbg_Clk_2,
    Dbg_TDI_2,
    Dbg_TDO_2,
    Dbg_Reg_En_2,
    Dbg_Capture_2,
    Dbg_Shift_2,
    Dbg_Update_2,
    Dbg_Rst_2,
    Dbg_Clk_3,
    Dbg_TDI_3,
    Dbg_TDO_3,
    Dbg_Reg_En_3,
    Dbg_Capture_3,
    Dbg_Shift_3,
    Dbg_Update_3,
    Dbg_Rst_3,
    Dbg_Clk_4,
    Dbg_TDI_4,
    Dbg_TDO_4,
    Dbg_Reg_En_4,
    Dbg_Capture_4,
    Dbg_Shift_4,
    Dbg_Update_4,
    Dbg_Rst_4,
    Dbg_Clk_5,
    Dbg_TDI_5,
    Dbg_TDO_5,
    Dbg_Reg_En_5,
    Dbg_Capture_5,
    Dbg_Shift_5,
    Dbg_Update_5,
    Dbg_Rst_5,
    Dbg_Clk_6,
    Dbg_TDI_6,
    Dbg_TDO_6,
    Dbg_Reg_En_6,
    Dbg_Capture_6,
    Dbg_Shift_6,
    Dbg_Update_6,
    Dbg_Rst_6,
    Dbg_Clk_7,
    Dbg_TDI_7,
    Dbg_TDO_7,
    Dbg_Reg_En_7,
    Dbg_Capture_7,
    Dbg_Shift_7,
    Dbg_Update_7,
    Dbg_Rst_7,
    bscan_tdi,
    bscan_reset,
    bscan_shift,
    bscan_update,
    bscan_capture,
    bscan_sel1,
    bscan_drck1,
    bscan_tdo1,
    Ext_JTAG_DRCK,
    Ext_JTAG_RESET,
    Ext_JTAG_SEL,
    Ext_JTAG_CAPTURE,
    Ext_JTAG_SHIFT,
    Ext_JTAG_UPDATE,
    Ext_JTAG_TDI,
    Ext_JTAG_TDO
  );
  output Interrupt;
  output Debug_SYS_Rst;
  output Ext_BRK;
  output Ext_NM_BRK;
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [31:0] S_AXI_AWADDR;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [31:0] S_AXI_ARADDR;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
  input SPLB_Clk;
  input SPLB_Rst;
  input [0:31] PLB_ABus;
  input [0:31] PLB_UABus;
  input PLB_PAValid;
  input PLB_SAValid;
  input PLB_rdPrim;
  input PLB_wrPrim;
  input [0:2] PLB_masterID;
  input PLB_abort;
  input PLB_busLock;
  input PLB_RNW;
  input [0:3] PLB_BE;
  input [0:1] PLB_MSize;
  input [0:3] PLB_size;
  input [0:2] PLB_type;
  input PLB_lockErr;
  input [0:31] PLB_wrDBus;
  input PLB_wrBurst;
  input PLB_rdBurst;
  input PLB_wrPendReq;
  input PLB_rdPendReq;
  input [0:1] PLB_wrPendPri;
  input [0:1] PLB_rdPendPri;
  input [0:1] PLB_reqPri;
  input [0:15] PLB_TAttribute;
  output Sl_addrAck;
  output [0:1] Sl_SSize;
  output Sl_wait;
  output Sl_rearbitrate;
  output Sl_wrDAck;
  output Sl_wrComp;
  output Sl_wrBTerm;
  output [0:31] Sl_rdDBus;
  output [0:3] Sl_rdWdAddr;
  output Sl_rdDAck;
  output Sl_rdComp;
  output Sl_rdBTerm;
  output [0:7] Sl_MBusy;
  output [0:7] Sl_MWrErr;
  output [0:7] Sl_MRdErr;
  output [0:7] Sl_MIRQ;
  output Dbg_Clk_0;
  output Dbg_TDI_0;
  input Dbg_TDO_0;
  output [0:7] Dbg_Reg_En_0;
  output Dbg_Capture_0;
  output Dbg_Shift_0;
  output Dbg_Update_0;
  output Dbg_Rst_0;
  output Dbg_Clk_1;
  output Dbg_TDI_1;
  input Dbg_TDO_1;
  output [0:7] Dbg_Reg_En_1;
  output Dbg_Capture_1;
  output Dbg_Shift_1;
  output Dbg_Update_1;
  output Dbg_Rst_1;
  output Dbg_Clk_2;
  output Dbg_TDI_2;
  input Dbg_TDO_2;
  output [0:7] Dbg_Reg_En_2;
  output Dbg_Capture_2;
  output Dbg_Shift_2;
  output Dbg_Update_2;
  output Dbg_Rst_2;
  output Dbg_Clk_3;
  output Dbg_TDI_3;
  input Dbg_TDO_3;
  output [0:7] Dbg_Reg_En_3;
  output Dbg_Capture_3;
  output Dbg_Shift_3;
  output Dbg_Update_3;
  output Dbg_Rst_3;
  output Dbg_Clk_4;
  output Dbg_TDI_4;
  input Dbg_TDO_4;
  output [0:7] Dbg_Reg_En_4;
  output Dbg_Capture_4;
  output Dbg_Shift_4;
  output Dbg_Update_4;
  output Dbg_Rst_4;
  output Dbg_Clk_5;
  output Dbg_TDI_5;
  input Dbg_TDO_5;
  output [0:7] Dbg_Reg_En_5;
  output Dbg_Capture_5;
  output Dbg_Shift_5;
  output Dbg_Update_5;
  output Dbg_Rst_5;
  output Dbg_Clk_6;
  output Dbg_TDI_6;
  input Dbg_TDO_6;
  output [0:7] Dbg_Reg_En_6;
  output Dbg_Capture_6;
  output Dbg_Shift_6;
  output Dbg_Update_6;
  output Dbg_Rst_6;
  output Dbg_Clk_7;
  output Dbg_TDI_7;
  input Dbg_TDO_7;
  output [0:7] Dbg_Reg_En_7;
  output Dbg_Capture_7;
  output Dbg_Shift_7;
  output Dbg_Update_7;
  output Dbg_Rst_7;
  output bscan_tdi;
  output bscan_reset;
  output bscan_shift;
  output bscan_update;
  output bscan_capture;
  output bscan_sel1;
  output bscan_drck1;
  input bscan_tdo1;
  output Ext_JTAG_DRCK;
  output Ext_JTAG_RESET;
  output Ext_JTAG_SEL;
  output Ext_JTAG_CAPTURE;
  output Ext_JTAG_SHIFT;
  output Ext_JTAG_UPDATE;
  output Ext_JTAG_TDI;
  input Ext_JTAG_TDO;
endmodule

module clock_generator_0_wrapper
  (
    CLKIN,
    CLKOUT0,
    CLKOUT1,
    CLKOUT2,
    CLKOUT3,
    CLKOUT4,
    CLKOUT5,
    CLKOUT6,
    CLKOUT7,
    CLKOUT8,
    CLKOUT9,
    CLKOUT10,
    CLKOUT11,
    CLKOUT12,
    CLKOUT13,
    CLKOUT14,
    CLKOUT15,
    CLKFBIN,
    CLKFBOUT,
    PSCLK,
    PSEN,
    PSINCDEC,
    PSDONE,
    RST,
    LOCKED
  );
  input CLKIN;
  output CLKOUT0;
  output CLKOUT1;
  output CLKOUT2;
  output CLKOUT3;
  output CLKOUT4;
  output CLKOUT5;
  output CLKOUT6;
  output CLKOUT7;
  output CLKOUT8;
  output CLKOUT9;
  output CLKOUT10;
  output CLKOUT11;
  output CLKOUT12;
  output CLKOUT13;
  output CLKOUT14;
  output CLKOUT15;
  input CLKFBIN;
  output CLKFBOUT;
  input PSCLK;
  input PSEN;
  input PSINCDEC;
  output PSDONE;
  input RST;
  output LOCKED;
endmodule

module axi4lite_0_wrapper
  (
    INTERCONNECT_ACLK,
    INTERCONNECT_ARESETN,
    S_AXI_ARESET_OUT_N,
    M_AXI_ARESET_OUT_N,
    IRQ,
    S_AXI_ACLK,
    S_AXI_AWID,
    S_AXI_AWADDR,
    S_AXI_AWLEN,
    S_AXI_AWSIZE,
    S_AXI_AWBURST,
    S_AXI_AWLOCK,
    S_AXI_AWCACHE,
    S_AXI_AWPROT,
    S_AXI_AWQOS,
    S_AXI_AWUSER,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WLAST,
    S_AXI_WUSER,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BID,
    S_AXI_BRESP,
    S_AXI_BUSER,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARID,
    S_AXI_ARADDR,
    S_AXI_ARLEN,
    S_AXI_ARSIZE,
    S_AXI_ARBURST,
    S_AXI_ARLOCK,
    S_AXI_ARCACHE,
    S_AXI_ARPROT,
    S_AXI_ARQOS,
    S_AXI_ARUSER,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RID,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RLAST,
    S_AXI_RUSER,
    S_AXI_RVALID,
    S_AXI_RREADY,
    M_AXI_ACLK,
    M_AXI_AWID,
    M_AXI_AWADDR,
    M_AXI_AWLEN,
    M_AXI_AWSIZE,
    M_AXI_AWBURST,
    M_AXI_AWLOCK,
    M_AXI_AWCACHE,
    M_AXI_AWPROT,
    M_AXI_AWREGION,
    M_AXI_AWQOS,
    M_AXI_AWUSER,
    M_AXI_AWVALID,
    M_AXI_AWREADY,
    M_AXI_WID,
    M_AXI_WDATA,
    M_AXI_WSTRB,
    M_AXI_WLAST,
    M_AXI_WUSER,
    M_AXI_WVALID,
    M_AXI_WREADY,
    M_AXI_BID,
    M_AXI_BRESP,
    M_AXI_BUSER,
    M_AXI_BVALID,
    M_AXI_BREADY,
    M_AXI_ARID,
    M_AXI_ARADDR,
    M_AXI_ARLEN,
    M_AXI_ARSIZE,
    M_AXI_ARBURST,
    M_AXI_ARLOCK,
    M_AXI_ARCACHE,
    M_AXI_ARPROT,
    M_AXI_ARREGION,
    M_AXI_ARQOS,
    M_AXI_ARUSER,
    M_AXI_ARVALID,
    M_AXI_ARREADY,
    M_AXI_RID,
    M_AXI_RDATA,
    M_AXI_RRESP,
    M_AXI_RLAST,
    M_AXI_RUSER,
    M_AXI_RVALID,
    M_AXI_RREADY,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY,
    INTERCONNECT_ARESET_OUT_N,
    DEBUG_AW_TRANS_SEQ,
    DEBUG_AW_ARB_GRANT,
    DEBUG_AR_TRANS_SEQ,
    DEBUG_AR_ARB_GRANT,
    DEBUG_AW_TRANS_QUAL,
    DEBUG_AW_ACCEPT_CNT,
    DEBUG_AW_ACTIVE_THREAD,
    DEBUG_AW_ACTIVE_TARGET,
    DEBUG_AW_ACTIVE_REGION,
    DEBUG_AW_ERROR,
    DEBUG_AW_TARGET,
    DEBUG_AR_TRANS_QUAL,
    DEBUG_AR_ACCEPT_CNT,
    DEBUG_AR_ACTIVE_THREAD,
    DEBUG_AR_ACTIVE_TARGET,
    DEBUG_AR_ACTIVE_REGION,
    DEBUG_AR_ERROR,
    DEBUG_AR_TARGET,
    DEBUG_B_TRANS_SEQ,
    DEBUG_R_BEAT_CNT,
    DEBUG_R_TRANS_SEQ,
    DEBUG_AW_ISSUING_CNT,
    DEBUG_AR_ISSUING_CNT,
    DEBUG_W_BEAT_CNT,
    DEBUG_W_TRANS_SEQ,
    DEBUG_BID_TARGET,
    DEBUG_BID_ERROR,
    DEBUG_RID_TARGET,
    DEBUG_RID_ERROR,
    DEBUG_SR_SC_ARADDR,
    DEBUG_SR_SC_ARADDRCONTROL,
    DEBUG_SR_SC_AWADDR,
    DEBUG_SR_SC_AWADDRCONTROL,
    DEBUG_SR_SC_BRESP,
    DEBUG_SR_SC_RDATA,
    DEBUG_SR_SC_RDATACONTROL,
    DEBUG_SR_SC_WDATA,
    DEBUG_SR_SC_WDATACONTROL,
    DEBUG_SC_SF_ARADDR,
    DEBUG_SC_SF_ARADDRCONTROL,
    DEBUG_SC_SF_AWADDR,
    DEBUG_SC_SF_AWADDRCONTROL,
    DEBUG_SC_SF_BRESP,
    DEBUG_SC_SF_RDATA,
    DEBUG_SC_SF_RDATACONTROL,
    DEBUG_SC_SF_WDATA,
    DEBUG_SC_SF_WDATACONTROL,
    DEBUG_SF_CB_ARADDR,
    DEBUG_SF_CB_ARADDRCONTROL,
    DEBUG_SF_CB_AWADDR,
    DEBUG_SF_CB_AWADDRCONTROL,
    DEBUG_SF_CB_BRESP,
    DEBUG_SF_CB_RDATA,
    DEBUG_SF_CB_RDATACONTROL,
    DEBUG_SF_CB_WDATA,
    DEBUG_SF_CB_WDATACONTROL,
    DEBUG_CB_MF_ARADDR,
    DEBUG_CB_MF_ARADDRCONTROL,
    DEBUG_CB_MF_AWADDR,
    DEBUG_CB_MF_AWADDRCONTROL,
    DEBUG_CB_MF_BRESP,
    DEBUG_CB_MF_RDATA,
    DEBUG_CB_MF_RDATACONTROL,
    DEBUG_CB_MF_WDATA,
    DEBUG_CB_MF_WDATACONTROL,
    DEBUG_MF_MC_ARADDR,
    DEBUG_MF_MC_ARADDRCONTROL,
    DEBUG_MF_MC_AWADDR,
    DEBUG_MF_MC_AWADDRCONTROL,
    DEBUG_MF_MC_BRESP,
    DEBUG_MF_MC_RDATA,
    DEBUG_MF_MC_RDATACONTROL,
    DEBUG_MF_MC_WDATA,
    DEBUG_MF_MC_WDATACONTROL,
    DEBUG_MC_MP_ARADDR,
    DEBUG_MC_MP_ARADDRCONTROL,
    DEBUG_MC_MP_AWADDR,
    DEBUG_MC_MP_AWADDRCONTROL,
    DEBUG_MC_MP_BRESP,
    DEBUG_MC_MP_RDATA,
    DEBUG_MC_MP_RDATACONTROL,
    DEBUG_MC_MP_WDATA,
    DEBUG_MC_MP_WDATACONTROL,
    DEBUG_MP_MR_ARADDR,
    DEBUG_MP_MR_ARADDRCONTROL,
    DEBUG_MP_MR_AWADDR,
    DEBUG_MP_MR_AWADDRCONTROL,
    DEBUG_MP_MR_BRESP,
    DEBUG_MP_MR_RDATA,
    DEBUG_MP_MR_RDATACONTROL,
    DEBUG_MP_MR_WDATA,
    DEBUG_MP_MR_WDATACONTROL
  );
  input INTERCONNECT_ACLK;
  input INTERCONNECT_ARESETN;
  output [0:0] S_AXI_ARESET_OUT_N;
  output [10:0] M_AXI_ARESET_OUT_N;
  output IRQ;
  input [0:0] S_AXI_ACLK;
  input [0:0] S_AXI_AWID;
  input [31:0] S_AXI_AWADDR;
  input [7:0] S_AXI_AWLEN;
  input [2:0] S_AXI_AWSIZE;
  input [1:0] S_AXI_AWBURST;
  input [1:0] S_AXI_AWLOCK;
  input [3:0] S_AXI_AWCACHE;
  input [2:0] S_AXI_AWPROT;
  input [3:0] S_AXI_AWQOS;
  input [0:0] S_AXI_AWUSER;
  input [0:0] S_AXI_AWVALID;
  output [0:0] S_AXI_AWREADY;
  input [0:0] S_AXI_WID;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input [0:0] S_AXI_WLAST;
  input [0:0] S_AXI_WUSER;
  input [0:0] S_AXI_WVALID;
  output [0:0] S_AXI_WREADY;
  output [0:0] S_AXI_BID;
  output [1:0] S_AXI_BRESP;
  output [0:0] S_AXI_BUSER;
  output [0:0] S_AXI_BVALID;
  input [0:0] S_AXI_BREADY;
  input [0:0] S_AXI_ARID;
  input [31:0] S_AXI_ARADDR;
  input [7:0] S_AXI_ARLEN;
  input [2:0] S_AXI_ARSIZE;
  input [1:0] S_AXI_ARBURST;
  input [1:0] S_AXI_ARLOCK;
  input [3:0] S_AXI_ARCACHE;
  input [2:0] S_AXI_ARPROT;
  input [3:0] S_AXI_ARQOS;
  input [0:0] S_AXI_ARUSER;
  input [0:0] S_AXI_ARVALID;
  output [0:0] S_AXI_ARREADY;
  output [0:0] S_AXI_RID;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output [0:0] S_AXI_RLAST;
  output [0:0] S_AXI_RUSER;
  output [0:0] S_AXI_RVALID;
  input [0:0] S_AXI_RREADY;
  input [10:0] M_AXI_ACLK;
  output [10:0] M_AXI_AWID;
  output [351:0] M_AXI_AWADDR;
  output [87:0] M_AXI_AWLEN;
  output [32:0] M_AXI_AWSIZE;
  output [21:0] M_AXI_AWBURST;
  output [21:0] M_AXI_AWLOCK;
  output [43:0] M_AXI_AWCACHE;
  output [32:0] M_AXI_AWPROT;
  output [43:0] M_AXI_AWREGION;
  output [43:0] M_AXI_AWQOS;
  output [10:0] M_AXI_AWUSER;
  output [10:0] M_AXI_AWVALID;
  input [10:0] M_AXI_AWREADY;
  output [10:0] M_AXI_WID;
  output [351:0] M_AXI_WDATA;
  output [43:0] M_AXI_WSTRB;
  output [10:0] M_AXI_WLAST;
  output [10:0] M_AXI_WUSER;
  output [10:0] M_AXI_WVALID;
  input [10:0] M_AXI_WREADY;
  input [10:0] M_AXI_BID;
  input [21:0] M_AXI_BRESP;
  input [10:0] M_AXI_BUSER;
  input [10:0] M_AXI_BVALID;
  output [10:0] M_AXI_BREADY;
  output [10:0] M_AXI_ARID;
  output [351:0] M_AXI_ARADDR;
  output [87:0] M_AXI_ARLEN;
  output [32:0] M_AXI_ARSIZE;
  output [21:0] M_AXI_ARBURST;
  output [21:0] M_AXI_ARLOCK;
  output [43:0] M_AXI_ARCACHE;
  output [32:0] M_AXI_ARPROT;
  output [43:0] M_AXI_ARREGION;
  output [43:0] M_AXI_ARQOS;
  output [10:0] M_AXI_ARUSER;
  output [10:0] M_AXI_ARVALID;
  input [10:0] M_AXI_ARREADY;
  input [10:0] M_AXI_RID;
  input [351:0] M_AXI_RDATA;
  input [21:0] M_AXI_RRESP;
  input [10:0] M_AXI_RLAST;
  input [10:0] M_AXI_RUSER;
  input [10:0] M_AXI_RVALID;
  output [10:0] M_AXI_RREADY;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
  output INTERCONNECT_ARESET_OUT_N;
  output [7:0] DEBUG_AW_TRANS_SEQ;
  output [7:0] DEBUG_AW_ARB_GRANT;
  output [7:0] DEBUG_AR_TRANS_SEQ;
  output [7:0] DEBUG_AR_ARB_GRANT;
  output [0:0] DEBUG_AW_TRANS_QUAL;
  output [7:0] DEBUG_AW_ACCEPT_CNT;
  output [15:0] DEBUG_AW_ACTIVE_THREAD;
  output [7:0] DEBUG_AW_ACTIVE_TARGET;
  output [7:0] DEBUG_AW_ACTIVE_REGION;
  output [7:0] DEBUG_AW_ERROR;
  output [7:0] DEBUG_AW_TARGET;
  output [0:0] DEBUG_AR_TRANS_QUAL;
  output [7:0] DEBUG_AR_ACCEPT_CNT;
  output [15:0] DEBUG_AR_ACTIVE_THREAD;
  output [7:0] DEBUG_AR_ACTIVE_TARGET;
  output [7:0] DEBUG_AR_ACTIVE_REGION;
  output [7:0] DEBUG_AR_ERROR;
  output [7:0] DEBUG_AR_TARGET;
  output [7:0] DEBUG_B_TRANS_SEQ;
  output [7:0] DEBUG_R_BEAT_CNT;
  output [7:0] DEBUG_R_TRANS_SEQ;
  output [7:0] DEBUG_AW_ISSUING_CNT;
  output [7:0] DEBUG_AR_ISSUING_CNT;
  output [7:0] DEBUG_W_BEAT_CNT;
  output [7:0] DEBUG_W_TRANS_SEQ;
  output [7:0] DEBUG_BID_TARGET;
  output DEBUG_BID_ERROR;
  output [7:0] DEBUG_RID_TARGET;
  output DEBUG_RID_ERROR;
  output [31:0] DEBUG_SR_SC_ARADDR;
  output [23:0] DEBUG_SR_SC_ARADDRCONTROL;
  output [31:0] DEBUG_SR_SC_AWADDR;
  output [23:0] DEBUG_SR_SC_AWADDRCONTROL;
  output [4:0] DEBUG_SR_SC_BRESP;
  output [31:0] DEBUG_SR_SC_RDATA;
  output [5:0] DEBUG_SR_SC_RDATACONTROL;
  output [31:0] DEBUG_SR_SC_WDATA;
  output [6:0] DEBUG_SR_SC_WDATACONTROL;
  output [31:0] DEBUG_SC_SF_ARADDR;
  output [23:0] DEBUG_SC_SF_ARADDRCONTROL;
  output [31:0] DEBUG_SC_SF_AWADDR;
  output [23:0] DEBUG_SC_SF_AWADDRCONTROL;
  output [4:0] DEBUG_SC_SF_BRESP;
  output [31:0] DEBUG_SC_SF_RDATA;
  output [5:0] DEBUG_SC_SF_RDATACONTROL;
  output [31:0] DEBUG_SC_SF_WDATA;
  output [6:0] DEBUG_SC_SF_WDATACONTROL;
  output [31:0] DEBUG_SF_CB_ARADDR;
  output [23:0] DEBUG_SF_CB_ARADDRCONTROL;
  output [31:0] DEBUG_SF_CB_AWADDR;
  output [23:0] DEBUG_SF_CB_AWADDRCONTROL;
  output [4:0] DEBUG_SF_CB_BRESP;
  output [31:0] DEBUG_SF_CB_RDATA;
  output [5:0] DEBUG_SF_CB_RDATACONTROL;
  output [31:0] DEBUG_SF_CB_WDATA;
  output [6:0] DEBUG_SF_CB_WDATACONTROL;
  output [31:0] DEBUG_CB_MF_ARADDR;
  output [23:0] DEBUG_CB_MF_ARADDRCONTROL;
  output [31:0] DEBUG_CB_MF_AWADDR;
  output [23:0] DEBUG_CB_MF_AWADDRCONTROL;
  output [4:0] DEBUG_CB_MF_BRESP;
  output [31:0] DEBUG_CB_MF_RDATA;
  output [5:0] DEBUG_CB_MF_RDATACONTROL;
  output [31:0] DEBUG_CB_MF_WDATA;
  output [6:0] DEBUG_CB_MF_WDATACONTROL;
  output [31:0] DEBUG_MF_MC_ARADDR;
  output [23:0] DEBUG_MF_MC_ARADDRCONTROL;
  output [31:0] DEBUG_MF_MC_AWADDR;
  output [23:0] DEBUG_MF_MC_AWADDRCONTROL;
  output [4:0] DEBUG_MF_MC_BRESP;
  output [31:0] DEBUG_MF_MC_RDATA;
  output [5:0] DEBUG_MF_MC_RDATACONTROL;
  output [31:0] DEBUG_MF_MC_WDATA;
  output [6:0] DEBUG_MF_MC_WDATACONTROL;
  output [31:0] DEBUG_MC_MP_ARADDR;
  output [23:0] DEBUG_MC_MP_ARADDRCONTROL;
  output [31:0] DEBUG_MC_MP_AWADDR;
  output [23:0] DEBUG_MC_MP_AWADDRCONTROL;
  output [4:0] DEBUG_MC_MP_BRESP;
  output [31:0] DEBUG_MC_MP_RDATA;
  output [5:0] DEBUG_MC_MP_RDATACONTROL;
  output [31:0] DEBUG_MC_MP_WDATA;
  output [6:0] DEBUG_MC_MP_WDATACONTROL;
  output [31:0] DEBUG_MP_MR_ARADDR;
  output [23:0] DEBUG_MP_MR_ARADDRCONTROL;
  output [31:0] DEBUG_MP_MR_AWADDR;
  output [23:0] DEBUG_MP_MR_AWADDRCONTROL;
  output [4:0] DEBUG_MP_MR_BRESP;
  output [31:0] DEBUG_MP_MR_RDATA;
  output [5:0] DEBUG_MP_MR_RDATACONTROL;
  output [31:0] DEBUG_MP_MR_WDATA;
  output [6:0] DEBUG_MP_MR_WDATACONTROL;
endmodule

module axi4_0_wrapper
  (
    INTERCONNECT_ACLK,
    INTERCONNECT_ARESETN,
    S_AXI_ARESET_OUT_N,
    M_AXI_ARESET_OUT_N,
    IRQ,
    S_AXI_ACLK,
    S_AXI_AWID,
    S_AXI_AWADDR,
    S_AXI_AWLEN,
    S_AXI_AWSIZE,
    S_AXI_AWBURST,
    S_AXI_AWLOCK,
    S_AXI_AWCACHE,
    S_AXI_AWPROT,
    S_AXI_AWQOS,
    S_AXI_AWUSER,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WLAST,
    S_AXI_WUSER,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BID,
    S_AXI_BRESP,
    S_AXI_BUSER,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARID,
    S_AXI_ARADDR,
    S_AXI_ARLEN,
    S_AXI_ARSIZE,
    S_AXI_ARBURST,
    S_AXI_ARLOCK,
    S_AXI_ARCACHE,
    S_AXI_ARPROT,
    S_AXI_ARQOS,
    S_AXI_ARUSER,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RID,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RLAST,
    S_AXI_RUSER,
    S_AXI_RVALID,
    S_AXI_RREADY,
    M_AXI_ACLK,
    M_AXI_AWID,
    M_AXI_AWADDR,
    M_AXI_AWLEN,
    M_AXI_AWSIZE,
    M_AXI_AWBURST,
    M_AXI_AWLOCK,
    M_AXI_AWCACHE,
    M_AXI_AWPROT,
    M_AXI_AWREGION,
    M_AXI_AWQOS,
    M_AXI_AWUSER,
    M_AXI_AWVALID,
    M_AXI_AWREADY,
    M_AXI_WID,
    M_AXI_WDATA,
    M_AXI_WSTRB,
    M_AXI_WLAST,
    M_AXI_WUSER,
    M_AXI_WVALID,
    M_AXI_WREADY,
    M_AXI_BID,
    M_AXI_BRESP,
    M_AXI_BUSER,
    M_AXI_BVALID,
    M_AXI_BREADY,
    M_AXI_ARID,
    M_AXI_ARADDR,
    M_AXI_ARLEN,
    M_AXI_ARSIZE,
    M_AXI_ARBURST,
    M_AXI_ARLOCK,
    M_AXI_ARCACHE,
    M_AXI_ARPROT,
    M_AXI_ARREGION,
    M_AXI_ARQOS,
    M_AXI_ARUSER,
    M_AXI_ARVALID,
    M_AXI_ARREADY,
    M_AXI_RID,
    M_AXI_RDATA,
    M_AXI_RRESP,
    M_AXI_RLAST,
    M_AXI_RUSER,
    M_AXI_RVALID,
    M_AXI_RREADY,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY,
    INTERCONNECT_ARESET_OUT_N,
    DEBUG_AW_TRANS_SEQ,
    DEBUG_AW_ARB_GRANT,
    DEBUG_AR_TRANS_SEQ,
    DEBUG_AR_ARB_GRANT,
    DEBUG_AW_TRANS_QUAL,
    DEBUG_AW_ACCEPT_CNT,
    DEBUG_AW_ACTIVE_THREAD,
    DEBUG_AW_ACTIVE_TARGET,
    DEBUG_AW_ACTIVE_REGION,
    DEBUG_AW_ERROR,
    DEBUG_AW_TARGET,
    DEBUG_AR_TRANS_QUAL,
    DEBUG_AR_ACCEPT_CNT,
    DEBUG_AR_ACTIVE_THREAD,
    DEBUG_AR_ACTIVE_TARGET,
    DEBUG_AR_ACTIVE_REGION,
    DEBUG_AR_ERROR,
    DEBUG_AR_TARGET,
    DEBUG_B_TRANS_SEQ,
    DEBUG_R_BEAT_CNT,
    DEBUG_R_TRANS_SEQ,
    DEBUG_AW_ISSUING_CNT,
    DEBUG_AR_ISSUING_CNT,
    DEBUG_W_BEAT_CNT,
    DEBUG_W_TRANS_SEQ,
    DEBUG_BID_TARGET,
    DEBUG_BID_ERROR,
    DEBUG_RID_TARGET,
    DEBUG_RID_ERROR,
    DEBUG_SR_SC_ARADDR,
    DEBUG_SR_SC_ARADDRCONTROL,
    DEBUG_SR_SC_AWADDR,
    DEBUG_SR_SC_AWADDRCONTROL,
    DEBUG_SR_SC_BRESP,
    DEBUG_SR_SC_RDATA,
    DEBUG_SR_SC_RDATACONTROL,
    DEBUG_SR_SC_WDATA,
    DEBUG_SR_SC_WDATACONTROL,
    DEBUG_SC_SF_ARADDR,
    DEBUG_SC_SF_ARADDRCONTROL,
    DEBUG_SC_SF_AWADDR,
    DEBUG_SC_SF_AWADDRCONTROL,
    DEBUG_SC_SF_BRESP,
    DEBUG_SC_SF_RDATA,
    DEBUG_SC_SF_RDATACONTROL,
    DEBUG_SC_SF_WDATA,
    DEBUG_SC_SF_WDATACONTROL,
    DEBUG_SF_CB_ARADDR,
    DEBUG_SF_CB_ARADDRCONTROL,
    DEBUG_SF_CB_AWADDR,
    DEBUG_SF_CB_AWADDRCONTROL,
    DEBUG_SF_CB_BRESP,
    DEBUG_SF_CB_RDATA,
    DEBUG_SF_CB_RDATACONTROL,
    DEBUG_SF_CB_WDATA,
    DEBUG_SF_CB_WDATACONTROL,
    DEBUG_CB_MF_ARADDR,
    DEBUG_CB_MF_ARADDRCONTROL,
    DEBUG_CB_MF_AWADDR,
    DEBUG_CB_MF_AWADDRCONTROL,
    DEBUG_CB_MF_BRESP,
    DEBUG_CB_MF_RDATA,
    DEBUG_CB_MF_RDATACONTROL,
    DEBUG_CB_MF_WDATA,
    DEBUG_CB_MF_WDATACONTROL,
    DEBUG_MF_MC_ARADDR,
    DEBUG_MF_MC_ARADDRCONTROL,
    DEBUG_MF_MC_AWADDR,
    DEBUG_MF_MC_AWADDRCONTROL,
    DEBUG_MF_MC_BRESP,
    DEBUG_MF_MC_RDATA,
    DEBUG_MF_MC_RDATACONTROL,
    DEBUG_MF_MC_WDATA,
    DEBUG_MF_MC_WDATACONTROL,
    DEBUG_MC_MP_ARADDR,
    DEBUG_MC_MP_ARADDRCONTROL,
    DEBUG_MC_MP_AWADDR,
    DEBUG_MC_MP_AWADDRCONTROL,
    DEBUG_MC_MP_BRESP,
    DEBUG_MC_MP_RDATA,
    DEBUG_MC_MP_RDATACONTROL,
    DEBUG_MC_MP_WDATA,
    DEBUG_MC_MP_WDATACONTROL,
    DEBUG_MP_MR_ARADDR,
    DEBUG_MP_MR_ARADDRCONTROL,
    DEBUG_MP_MR_AWADDR,
    DEBUG_MP_MR_AWADDRCONTROL,
    DEBUG_MP_MR_BRESP,
    DEBUG_MP_MR_RDATA,
    DEBUG_MP_MR_RDATACONTROL,
    DEBUG_MP_MR_WDATA,
    DEBUG_MP_MR_WDATACONTROL
  );
  input INTERCONNECT_ACLK;
  input INTERCONNECT_ARESETN;
  output [3:0] S_AXI_ARESET_OUT_N;
  output [0:0] M_AXI_ARESET_OUT_N;
  output IRQ;
  input [3:0] S_AXI_ACLK;
  input [7:0] S_AXI_AWID;
  input [127:0] S_AXI_AWADDR;
  input [31:0] S_AXI_AWLEN;
  input [11:0] S_AXI_AWSIZE;
  input [7:0] S_AXI_AWBURST;
  input [7:0] S_AXI_AWLOCK;
  input [15:0] S_AXI_AWCACHE;
  input [11:0] S_AXI_AWPROT;
  input [15:0] S_AXI_AWQOS;
  input [19:0] S_AXI_AWUSER;
  input [3:0] S_AXI_AWVALID;
  output [3:0] S_AXI_AWREADY;
  input [7:0] S_AXI_WID;
  input [127:0] S_AXI_WDATA;
  input [15:0] S_AXI_WSTRB;
  input [3:0] S_AXI_WLAST;
  input [3:0] S_AXI_WUSER;
  input [3:0] S_AXI_WVALID;
  output [3:0] S_AXI_WREADY;
  output [7:0] S_AXI_BID;
  output [7:0] S_AXI_BRESP;
  output [3:0] S_AXI_BUSER;
  output [3:0] S_AXI_BVALID;
  input [3:0] S_AXI_BREADY;
  input [7:0] S_AXI_ARID;
  input [127:0] S_AXI_ARADDR;
  input [31:0] S_AXI_ARLEN;
  input [11:0] S_AXI_ARSIZE;
  input [7:0] S_AXI_ARBURST;
  input [7:0] S_AXI_ARLOCK;
  input [15:0] S_AXI_ARCACHE;
  input [11:0] S_AXI_ARPROT;
  input [15:0] S_AXI_ARQOS;
  input [19:0] S_AXI_ARUSER;
  input [3:0] S_AXI_ARVALID;
  output [3:0] S_AXI_ARREADY;
  output [7:0] S_AXI_RID;
  output [127:0] S_AXI_RDATA;
  output [7:0] S_AXI_RRESP;
  output [3:0] S_AXI_RLAST;
  output [3:0] S_AXI_RUSER;
  output [3:0] S_AXI_RVALID;
  input [3:0] S_AXI_RREADY;
  input [0:0] M_AXI_ACLK;
  output [1:0] M_AXI_AWID;
  output [31:0] M_AXI_AWADDR;
  output [7:0] M_AXI_AWLEN;
  output [2:0] M_AXI_AWSIZE;
  output [1:0] M_AXI_AWBURST;
  output [1:0] M_AXI_AWLOCK;
  output [3:0] M_AXI_AWCACHE;
  output [2:0] M_AXI_AWPROT;
  output [3:0] M_AXI_AWREGION;
  output [3:0] M_AXI_AWQOS;
  output [4:0] M_AXI_AWUSER;
  output [0:0] M_AXI_AWVALID;
  input [0:0] M_AXI_AWREADY;
  output [1:0] M_AXI_WID;
  output [31:0] M_AXI_WDATA;
  output [3:0] M_AXI_WSTRB;
  output [0:0] M_AXI_WLAST;
  output [0:0] M_AXI_WUSER;
  output [0:0] M_AXI_WVALID;
  input [0:0] M_AXI_WREADY;
  input [1:0] M_AXI_BID;
  input [1:0] M_AXI_BRESP;
  input [0:0] M_AXI_BUSER;
  input [0:0] M_AXI_BVALID;
  output [0:0] M_AXI_BREADY;
  output [1:0] M_AXI_ARID;
  output [31:0] M_AXI_ARADDR;
  output [7:0] M_AXI_ARLEN;
  output [2:0] M_AXI_ARSIZE;
  output [1:0] M_AXI_ARBURST;
  output [1:0] M_AXI_ARLOCK;
  output [3:0] M_AXI_ARCACHE;
  output [2:0] M_AXI_ARPROT;
  output [3:0] M_AXI_ARREGION;
  output [3:0] M_AXI_ARQOS;
  output [4:0] M_AXI_ARUSER;
  output [0:0] M_AXI_ARVALID;
  input [0:0] M_AXI_ARREADY;
  input [1:0] M_AXI_RID;
  input [31:0] M_AXI_RDATA;
  input [1:0] M_AXI_RRESP;
  input [0:0] M_AXI_RLAST;
  input [0:0] M_AXI_RUSER;
  input [0:0] M_AXI_RVALID;
  output [0:0] M_AXI_RREADY;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
  output INTERCONNECT_ARESET_OUT_N;
  output [7:0] DEBUG_AW_TRANS_SEQ;
  output [7:0] DEBUG_AW_ARB_GRANT;
  output [7:0] DEBUG_AR_TRANS_SEQ;
  output [7:0] DEBUG_AR_ARB_GRANT;
  output [0:0] DEBUG_AW_TRANS_QUAL;
  output [7:0] DEBUG_AW_ACCEPT_CNT;
  output [15:0] DEBUG_AW_ACTIVE_THREAD;
  output [7:0] DEBUG_AW_ACTIVE_TARGET;
  output [7:0] DEBUG_AW_ACTIVE_REGION;
  output [7:0] DEBUG_AW_ERROR;
  output [7:0] DEBUG_AW_TARGET;
  output [0:0] DEBUG_AR_TRANS_QUAL;
  output [7:0] DEBUG_AR_ACCEPT_CNT;
  output [15:0] DEBUG_AR_ACTIVE_THREAD;
  output [7:0] DEBUG_AR_ACTIVE_TARGET;
  output [7:0] DEBUG_AR_ACTIVE_REGION;
  output [7:0] DEBUG_AR_ERROR;
  output [7:0] DEBUG_AR_TARGET;
  output [7:0] DEBUG_B_TRANS_SEQ;
  output [7:0] DEBUG_R_BEAT_CNT;
  output [7:0] DEBUG_R_TRANS_SEQ;
  output [7:0] DEBUG_AW_ISSUING_CNT;
  output [7:0] DEBUG_AR_ISSUING_CNT;
  output [7:0] DEBUG_W_BEAT_CNT;
  output [7:0] DEBUG_W_TRANS_SEQ;
  output [7:0] DEBUG_BID_TARGET;
  output DEBUG_BID_ERROR;
  output [7:0] DEBUG_RID_TARGET;
  output DEBUG_RID_ERROR;
  output [31:0] DEBUG_SR_SC_ARADDR;
  output [24:0] DEBUG_SR_SC_ARADDRCONTROL;
  output [31:0] DEBUG_SR_SC_AWADDR;
  output [24:0] DEBUG_SR_SC_AWADDRCONTROL;
  output [5:0] DEBUG_SR_SC_BRESP;
  output [31:0] DEBUG_SR_SC_RDATA;
  output [6:0] DEBUG_SR_SC_RDATACONTROL;
  output [31:0] DEBUG_SR_SC_WDATA;
  output [6:0] DEBUG_SR_SC_WDATACONTROL;
  output [31:0] DEBUG_SC_SF_ARADDR;
  output [24:0] DEBUG_SC_SF_ARADDRCONTROL;
  output [31:0] DEBUG_SC_SF_AWADDR;
  output [24:0] DEBUG_SC_SF_AWADDRCONTROL;
  output [5:0] DEBUG_SC_SF_BRESP;
  output [31:0] DEBUG_SC_SF_RDATA;
  output [6:0] DEBUG_SC_SF_RDATACONTROL;
  output [31:0] DEBUG_SC_SF_WDATA;
  output [6:0] DEBUG_SC_SF_WDATACONTROL;
  output [31:0] DEBUG_SF_CB_ARADDR;
  output [24:0] DEBUG_SF_CB_ARADDRCONTROL;
  output [31:0] DEBUG_SF_CB_AWADDR;
  output [24:0] DEBUG_SF_CB_AWADDRCONTROL;
  output [5:0] DEBUG_SF_CB_BRESP;
  output [31:0] DEBUG_SF_CB_RDATA;
  output [6:0] DEBUG_SF_CB_RDATACONTROL;
  output [31:0] DEBUG_SF_CB_WDATA;
  output [6:0] DEBUG_SF_CB_WDATACONTROL;
  output [31:0] DEBUG_CB_MF_ARADDR;
  output [24:0] DEBUG_CB_MF_ARADDRCONTROL;
  output [31:0] DEBUG_CB_MF_AWADDR;
  output [24:0] DEBUG_CB_MF_AWADDRCONTROL;
  output [5:0] DEBUG_CB_MF_BRESP;
  output [31:0] DEBUG_CB_MF_RDATA;
  output [6:0] DEBUG_CB_MF_RDATACONTROL;
  output [31:0] DEBUG_CB_MF_WDATA;
  output [6:0] DEBUG_CB_MF_WDATACONTROL;
  output [31:0] DEBUG_MF_MC_ARADDR;
  output [24:0] DEBUG_MF_MC_ARADDRCONTROL;
  output [31:0] DEBUG_MF_MC_AWADDR;
  output [24:0] DEBUG_MF_MC_AWADDRCONTROL;
  output [5:0] DEBUG_MF_MC_BRESP;
  output [31:0] DEBUG_MF_MC_RDATA;
  output [6:0] DEBUG_MF_MC_RDATACONTROL;
  output [31:0] DEBUG_MF_MC_WDATA;
  output [6:0] DEBUG_MF_MC_WDATACONTROL;
  output [31:0] DEBUG_MC_MP_ARADDR;
  output [24:0] DEBUG_MC_MP_ARADDRCONTROL;
  output [31:0] DEBUG_MC_MP_AWADDR;
  output [24:0] DEBUG_MC_MP_AWADDRCONTROL;
  output [5:0] DEBUG_MC_MP_BRESP;
  output [31:0] DEBUG_MC_MP_RDATA;
  output [6:0] DEBUG_MC_MP_RDATACONTROL;
  output [31:0] DEBUG_MC_MP_WDATA;
  output [6:0] DEBUG_MC_MP_WDATACONTROL;
  output [31:0] DEBUG_MP_MR_ARADDR;
  output [24:0] DEBUG_MP_MR_ARADDRCONTROL;
  output [31:0] DEBUG_MP_MR_AWADDR;
  output [24:0] DEBUG_MP_MR_AWADDRCONTROL;
  output [5:0] DEBUG_MP_MR_BRESP;
  output [31:0] DEBUG_MP_MR_RDATA;
  output [6:0] DEBUG_MP_MR_RDATACONTROL;
  output [31:0] DEBUG_MP_MR_WDATA;
  output [6:0] DEBUG_MP_MR_WDATACONTROL;
endmodule

module rs232_uart_1_wrapper
  (
    S_AXI_ACLK,
    S_AXI_ARESETN,
    Interrupt,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_RREADY,
    RX,
    TX
  );
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  output Interrupt;
  input [31:0] S_AXI_AWADDR;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [31:0] S_AXI_ARADDR;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
  input RX;
  output TX;
endmodule

module push_buttons_5bits_wrapper
  (
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_RREADY,
    IP2INTC_Irpt,
    GPIO_IO_I,
    GPIO_IO_O,
    GPIO_IO_T,
    GPIO2_IO_I,
    GPIO2_IO_O,
    GPIO2_IO_T
  );
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [31:0] S_AXI_AWADDR;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [31:0] S_AXI_ARADDR;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
  output IP2INTC_Irpt;
  input [4:0] GPIO_IO_I;
  output [4:0] GPIO_IO_O;
  output [4:0] GPIO_IO_T;
  input [31:0] GPIO2_IO_I;
  output [31:0] GPIO2_IO_O;
  output [31:0] GPIO2_IO_T;
endmodule

module mcb_ddr2_wrapper
  (
    sysclk_2x,
    sysclk_2x_180,
    pll_ce_0,
    pll_ce_90,
    pll_lock,
    pll_lock_bufpll_o,
    sysclk_2x_bufpll_o,
    sysclk_2x_180_bufpll_o,
    pll_ce_0_bufpll_o,
    pll_ce_90_bufpll_o,
    sys_rst,
    mcbx_dram_addr,
    mcbx_dram_ba,
    mcbx_dram_ras_n,
    mcbx_dram_cas_n,
    mcbx_dram_we_n,
    mcbx_dram_cke,
    mcbx_dram_clk,
    mcbx_dram_clk_n,
    mcbx_dram_dq,
    mcbx_dram_dqs,
    mcbx_dram_dqs_n,
    mcbx_dram_udqs,
    mcbx_dram_udqs_n,
    mcbx_dram_udm,
    mcbx_dram_ldm,
    mcbx_dram_odt,
    mcbx_dram_ddr3_rst,
    rzq,
    zio,
    ui_clk,
    uo_done_cal,
    s0_axi_aclk,
    s0_axi_aresetn,
    s0_axi_awid,
    s0_axi_awaddr,
    s0_axi_awlen,
    s0_axi_awsize,
    s0_axi_awburst,
    s0_axi_awlock,
    s0_axi_awcache,
    s0_axi_awprot,
    s0_axi_awqos,
    s0_axi_awvalid,
    s0_axi_awready,
    s0_axi_wdata,
    s0_axi_wstrb,
    s0_axi_wlast,
    s0_axi_wvalid,
    s0_axi_wready,
    s0_axi_bid,
    s0_axi_bresp,
    s0_axi_bvalid,
    s0_axi_bready,
    s0_axi_arid,
    s0_axi_araddr,
    s0_axi_arlen,
    s0_axi_arsize,
    s0_axi_arburst,
    s0_axi_arlock,
    s0_axi_arcache,
    s0_axi_arprot,
    s0_axi_arqos,
    s0_axi_arvalid,
    s0_axi_arready,
    s0_axi_rid,
    s0_axi_rdata,
    s0_axi_rresp,
    s0_axi_rlast,
    s0_axi_rvalid,
    s0_axi_rready,
    s1_axi_aclk,
    s1_axi_aresetn,
    s1_axi_awid,
    s1_axi_awaddr,
    s1_axi_awlen,
    s1_axi_awsize,
    s1_axi_awburst,
    s1_axi_awlock,
    s1_axi_awcache,
    s1_axi_awprot,
    s1_axi_awqos,
    s1_axi_awvalid,
    s1_axi_awready,
    s1_axi_wdata,
    s1_axi_wstrb,
    s1_axi_wlast,
    s1_axi_wvalid,
    s1_axi_wready,
    s1_axi_bid,
    s1_axi_bresp,
    s1_axi_bvalid,
    s1_axi_bready,
    s1_axi_arid,
    s1_axi_araddr,
    s1_axi_arlen,
    s1_axi_arsize,
    s1_axi_arburst,
    s1_axi_arlock,
    s1_axi_arcache,
    s1_axi_arprot,
    s1_axi_arqos,
    s1_axi_arvalid,
    s1_axi_arready,
    s1_axi_rid,
    s1_axi_rdata,
    s1_axi_rresp,
    s1_axi_rlast,
    s1_axi_rvalid,
    s1_axi_rready,
    s2_axi_aclk,
    s2_axi_aresetn,
    s2_axi_awid,
    s2_axi_awaddr,
    s2_axi_awlen,
    s2_axi_awsize,
    s2_axi_awburst,
    s2_axi_awlock,
    s2_axi_awcache,
    s2_axi_awprot,
    s2_axi_awqos,
    s2_axi_awvalid,
    s2_axi_awready,
    s2_axi_wdata,
    s2_axi_wstrb,
    s2_axi_wlast,
    s2_axi_wvalid,
    s2_axi_wready,
    s2_axi_bid,
    s2_axi_bresp,
    s2_axi_bvalid,
    s2_axi_bready,
    s2_axi_arid,
    s2_axi_araddr,
    s2_axi_arlen,
    s2_axi_arsize,
    s2_axi_arburst,
    s2_axi_arlock,
    s2_axi_arcache,
    s2_axi_arprot,
    s2_axi_arqos,
    s2_axi_arvalid,
    s2_axi_arready,
    s2_axi_rid,
    s2_axi_rdata,
    s2_axi_rresp,
    s2_axi_rlast,
    s2_axi_rvalid,
    s2_axi_rready,
    s3_axi_aclk,
    s3_axi_aresetn,
    s3_axi_awid,
    s3_axi_awaddr,
    s3_axi_awlen,
    s3_axi_awsize,
    s3_axi_awburst,
    s3_axi_awlock,
    s3_axi_awcache,
    s3_axi_awprot,
    s3_axi_awqos,
    s3_axi_awvalid,
    s3_axi_awready,
    s3_axi_wdata,
    s3_axi_wstrb,
    s3_axi_wlast,
    s3_axi_wvalid,
    s3_axi_wready,
    s3_axi_bid,
    s3_axi_bresp,
    s3_axi_bvalid,
    s3_axi_bready,
    s3_axi_arid,
    s3_axi_araddr,
    s3_axi_arlen,
    s3_axi_arsize,
    s3_axi_arburst,
    s3_axi_arlock,
    s3_axi_arcache,
    s3_axi_arprot,
    s3_axi_arqos,
    s3_axi_arvalid,
    s3_axi_arready,
    s3_axi_rid,
    s3_axi_rdata,
    s3_axi_rresp,
    s3_axi_rlast,
    s3_axi_rvalid,
    s3_axi_rready,
    s4_axi_aclk,
    s4_axi_aresetn,
    s4_axi_awid,
    s4_axi_awaddr,
    s4_axi_awlen,
    s4_axi_awsize,
    s4_axi_awburst,
    s4_axi_awlock,
    s4_axi_awcache,
    s4_axi_awprot,
    s4_axi_awqos,
    s4_axi_awvalid,
    s4_axi_awready,
    s4_axi_wdata,
    s4_axi_wstrb,
    s4_axi_wlast,
    s4_axi_wvalid,
    s4_axi_wready,
    s4_axi_bid,
    s4_axi_bresp,
    s4_axi_bvalid,
    s4_axi_bready,
    s4_axi_arid,
    s4_axi_araddr,
    s4_axi_arlen,
    s4_axi_arsize,
    s4_axi_arburst,
    s4_axi_arlock,
    s4_axi_arcache,
    s4_axi_arprot,
    s4_axi_arqos,
    s4_axi_arvalid,
    s4_axi_arready,
    s4_axi_rid,
    s4_axi_rdata,
    s4_axi_rresp,
    s4_axi_rlast,
    s4_axi_rvalid,
    s4_axi_rready,
    s5_axi_aclk,
    s5_axi_aresetn,
    s5_axi_awid,
    s5_axi_awaddr,
    s5_axi_awlen,
    s5_axi_awsize,
    s5_axi_awburst,
    s5_axi_awlock,
    s5_axi_awcache,
    s5_axi_awprot,
    s5_axi_awqos,
    s5_axi_awvalid,
    s5_axi_awready,
    s5_axi_wdata,
    s5_axi_wstrb,
    s5_axi_wlast,
    s5_axi_wvalid,
    s5_axi_wready,
    s5_axi_bid,
    s5_axi_bresp,
    s5_axi_bvalid,
    s5_axi_bready,
    s5_axi_arid,
    s5_axi_araddr,
    s5_axi_arlen,
    s5_axi_arsize,
    s5_axi_arburst,
    s5_axi_arlock,
    s5_axi_arcache,
    s5_axi_arprot,
    s5_axi_arqos,
    s5_axi_arvalid,
    s5_axi_arready,
    s5_axi_rid,
    s5_axi_rdata,
    s5_axi_rresp,
    s5_axi_rlast,
    s5_axi_rvalid,
    s5_axi_rready
  );
  input sysclk_2x;
  input sysclk_2x_180;
  input pll_ce_0;
  input pll_ce_90;
  input pll_lock;
  output pll_lock_bufpll_o;
  output sysclk_2x_bufpll_o;
  output sysclk_2x_180_bufpll_o;
  output pll_ce_0_bufpll_o;
  output pll_ce_90_bufpll_o;
  input sys_rst;
  output [12:0] mcbx_dram_addr;
  output [2:0] mcbx_dram_ba;
  output mcbx_dram_ras_n;
  output mcbx_dram_cas_n;
  output mcbx_dram_we_n;
  output mcbx_dram_cke;
  output mcbx_dram_clk;
  output mcbx_dram_clk_n;
  inout [15:0] mcbx_dram_dq;
  inout mcbx_dram_dqs;
  inout mcbx_dram_dqs_n;
  inout mcbx_dram_udqs;
  inout mcbx_dram_udqs_n;
  output mcbx_dram_udm;
  output mcbx_dram_ldm;
  output mcbx_dram_odt;
  output mcbx_dram_ddr3_rst;
  inout rzq;
  inout zio;
  input ui_clk;
  output uo_done_cal;
  input s0_axi_aclk;
  input s0_axi_aresetn;
  input [1:0] s0_axi_awid;
  input [31:0] s0_axi_awaddr;
  input [7:0] s0_axi_awlen;
  input [2:0] s0_axi_awsize;
  input [1:0] s0_axi_awburst;
  input [0:0] s0_axi_awlock;
  input [3:0] s0_axi_awcache;
  input [2:0] s0_axi_awprot;
  input [3:0] s0_axi_awqos;
  input s0_axi_awvalid;
  output s0_axi_awready;
  input [31:0] s0_axi_wdata;
  input [3:0] s0_axi_wstrb;
  input s0_axi_wlast;
  input s0_axi_wvalid;
  output s0_axi_wready;
  output [1:0] s0_axi_bid;
  output [1:0] s0_axi_bresp;
  output s0_axi_bvalid;
  input s0_axi_bready;
  input [1:0] s0_axi_arid;
  input [31:0] s0_axi_araddr;
  input [7:0] s0_axi_arlen;
  input [2:0] s0_axi_arsize;
  input [1:0] s0_axi_arburst;
  input [0:0] s0_axi_arlock;
  input [3:0] s0_axi_arcache;
  input [2:0] s0_axi_arprot;
  input [3:0] s0_axi_arqos;
  input s0_axi_arvalid;
  output s0_axi_arready;
  output [1:0] s0_axi_rid;
  output [31:0] s0_axi_rdata;
  output [1:0] s0_axi_rresp;
  output s0_axi_rlast;
  output s0_axi_rvalid;
  input s0_axi_rready;
  input s1_axi_aclk;
  input s1_axi_aresetn;
  input [3:0] s1_axi_awid;
  input [31:0] s1_axi_awaddr;
  input [7:0] s1_axi_awlen;
  input [2:0] s1_axi_awsize;
  input [1:0] s1_axi_awburst;
  input [0:0] s1_axi_awlock;
  input [3:0] s1_axi_awcache;
  input [2:0] s1_axi_awprot;
  input [3:0] s1_axi_awqos;
  input s1_axi_awvalid;
  output s1_axi_awready;
  input [31:0] s1_axi_wdata;
  input [3:0] s1_axi_wstrb;
  input s1_axi_wlast;
  input s1_axi_wvalid;
  output s1_axi_wready;
  output [3:0] s1_axi_bid;
  output [1:0] s1_axi_bresp;
  output s1_axi_bvalid;
  input s1_axi_bready;
  input [3:0] s1_axi_arid;
  input [31:0] s1_axi_araddr;
  input [7:0] s1_axi_arlen;
  input [2:0] s1_axi_arsize;
  input [1:0] s1_axi_arburst;
  input [0:0] s1_axi_arlock;
  input [3:0] s1_axi_arcache;
  input [2:0] s1_axi_arprot;
  input [3:0] s1_axi_arqos;
  input s1_axi_arvalid;
  output s1_axi_arready;
  output [3:0] s1_axi_rid;
  output [31:0] s1_axi_rdata;
  output [1:0] s1_axi_rresp;
  output s1_axi_rlast;
  output s1_axi_rvalid;
  input s1_axi_rready;
  input s2_axi_aclk;
  input s2_axi_aresetn;
  input [3:0] s2_axi_awid;
  input [31:0] s2_axi_awaddr;
  input [7:0] s2_axi_awlen;
  input [2:0] s2_axi_awsize;
  input [1:0] s2_axi_awburst;
  input [0:0] s2_axi_awlock;
  input [3:0] s2_axi_awcache;
  input [2:0] s2_axi_awprot;
  input [3:0] s2_axi_awqos;
  input s2_axi_awvalid;
  output s2_axi_awready;
  input [31:0] s2_axi_wdata;
  input [3:0] s2_axi_wstrb;
  input s2_axi_wlast;
  input s2_axi_wvalid;
  output s2_axi_wready;
  output [3:0] s2_axi_bid;
  output [1:0] s2_axi_bresp;
  output s2_axi_bvalid;
  input s2_axi_bready;
  input [3:0] s2_axi_arid;
  input [31:0] s2_axi_araddr;
  input [7:0] s2_axi_arlen;
  input [2:0] s2_axi_arsize;
  input [1:0] s2_axi_arburst;
  input [0:0] s2_axi_arlock;
  input [3:0] s2_axi_arcache;
  input [2:0] s2_axi_arprot;
  input [3:0] s2_axi_arqos;
  input s2_axi_arvalid;
  output s2_axi_arready;
  output [3:0] s2_axi_rid;
  output [31:0] s2_axi_rdata;
  output [1:0] s2_axi_rresp;
  output s2_axi_rlast;
  output s2_axi_rvalid;
  input s2_axi_rready;
  input s3_axi_aclk;
  input s3_axi_aresetn;
  input [3:0] s3_axi_awid;
  input [31:0] s3_axi_awaddr;
  input [7:0] s3_axi_awlen;
  input [2:0] s3_axi_awsize;
  input [1:0] s3_axi_awburst;
  input [0:0] s3_axi_awlock;
  input [3:0] s3_axi_awcache;
  input [2:0] s3_axi_awprot;
  input [3:0] s3_axi_awqos;
  input s3_axi_awvalid;
  output s3_axi_awready;
  input [31:0] s3_axi_wdata;
  input [3:0] s3_axi_wstrb;
  input s3_axi_wlast;
  input s3_axi_wvalid;
  output s3_axi_wready;
  output [3:0] s3_axi_bid;
  output [1:0] s3_axi_bresp;
  output s3_axi_bvalid;
  input s3_axi_bready;
  input [3:0] s3_axi_arid;
  input [31:0] s3_axi_araddr;
  input [7:0] s3_axi_arlen;
  input [2:0] s3_axi_arsize;
  input [1:0] s3_axi_arburst;
  input [0:0] s3_axi_arlock;
  input [3:0] s3_axi_arcache;
  input [2:0] s3_axi_arprot;
  input [3:0] s3_axi_arqos;
  input s3_axi_arvalid;
  output s3_axi_arready;
  output [3:0] s3_axi_rid;
  output [31:0] s3_axi_rdata;
  output [1:0] s3_axi_rresp;
  output s3_axi_rlast;
  output s3_axi_rvalid;
  input s3_axi_rready;
  input s4_axi_aclk;
  input s4_axi_aresetn;
  input [3:0] s4_axi_awid;
  input [31:0] s4_axi_awaddr;
  input [7:0] s4_axi_awlen;
  input [2:0] s4_axi_awsize;
  input [1:0] s4_axi_awburst;
  input [0:0] s4_axi_awlock;
  input [3:0] s4_axi_awcache;
  input [2:0] s4_axi_awprot;
  input [3:0] s4_axi_awqos;
  input s4_axi_awvalid;
  output s4_axi_awready;
  input [31:0] s4_axi_wdata;
  input [3:0] s4_axi_wstrb;
  input s4_axi_wlast;
  input s4_axi_wvalid;
  output s4_axi_wready;
  output [3:0] s4_axi_bid;
  output [1:0] s4_axi_bresp;
  output s4_axi_bvalid;
  input s4_axi_bready;
  input [3:0] s4_axi_arid;
  input [31:0] s4_axi_araddr;
  input [7:0] s4_axi_arlen;
  input [2:0] s4_axi_arsize;
  input [1:0] s4_axi_arburst;
  input [0:0] s4_axi_arlock;
  input [3:0] s4_axi_arcache;
  input [2:0] s4_axi_arprot;
  input [3:0] s4_axi_arqos;
  input s4_axi_arvalid;
  output s4_axi_arready;
  output [3:0] s4_axi_rid;
  output [31:0] s4_axi_rdata;
  output [1:0] s4_axi_rresp;
  output s4_axi_rlast;
  output s4_axi_rvalid;
  input s4_axi_rready;
  input s5_axi_aclk;
  input s5_axi_aresetn;
  input [3:0] s5_axi_awid;
  input [31:0] s5_axi_awaddr;
  input [7:0] s5_axi_awlen;
  input [2:0] s5_axi_awsize;
  input [1:0] s5_axi_awburst;
  input [0:0] s5_axi_awlock;
  input [3:0] s5_axi_awcache;
  input [2:0] s5_axi_awprot;
  input [3:0] s5_axi_awqos;
  input s5_axi_awvalid;
  output s5_axi_awready;
  input [31:0] s5_axi_wdata;
  input [3:0] s5_axi_wstrb;
  input s5_axi_wlast;
  input s5_axi_wvalid;
  output s5_axi_wready;
  output [3:0] s5_axi_bid;
  output [1:0] s5_axi_bresp;
  output s5_axi_bvalid;
  input s5_axi_bready;
  input [3:0] s5_axi_arid;
  input [31:0] s5_axi_araddr;
  input [7:0] s5_axi_arlen;
  input [2:0] s5_axi_arsize;
  input [1:0] s5_axi_arburst;
  input [0:0] s5_axi_arlock;
  input [3:0] s5_axi_arcache;
  input [2:0] s5_axi_arprot;
  input [3:0] s5_axi_arqos;
  input s5_axi_arvalid;
  output s5_axi_arready;
  output [3:0] s5_axi_rid;
  output [31:0] s5_axi_rdata;
  output [1:0] s5_axi_rresp;
  output s5_axi_rlast;
  output s5_axi_rvalid;
  input s5_axi_rready;
endmodule

module leds_8bits_wrapper
  (
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_RREADY,
    IP2INTC_Irpt,
    GPIO_IO_I,
    GPIO_IO_O,
    GPIO_IO_T,
    GPIO2_IO_I,
    GPIO2_IO_O,
    GPIO2_IO_T
  );
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [31:0] S_AXI_AWADDR;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [31:0] S_AXI_ARADDR;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
  output IP2INTC_Irpt;
  input [7:0] GPIO_IO_I;
  output [7:0] GPIO_IO_O;
  output [7:0] GPIO_IO_T;
  input [31:0] GPIO2_IO_I;
  output [31:0] GPIO2_IO_O;
  output [31:0] GPIO2_IO_T;
endmodule

module ethernet_lite_wrapper
  (
    S_AXI_ACLK,
    S_AXI_ARESETN,
    IP2INTC_Irpt,
    S_AXI_AWID,
    S_AXI_AWADDR,
    S_AXI_AWLEN,
    S_AXI_AWSIZE,
    S_AXI_AWBURST,
    S_AXI_AWCACHE,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WLAST,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BID,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARID,
    S_AXI_ARADDR,
    S_AXI_ARLEN,
    S_AXI_ARSIZE,
    S_AXI_ARBURST,
    S_AXI_ARCACHE,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RID,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RLAST,
    S_AXI_RVALID,
    S_AXI_RREADY,
    PHY_tx_clk,
    PHY_rx_clk,
    PHY_crs,
    PHY_dv,
    PHY_rx_data,
    PHY_col,
    PHY_rx_er,
    PHY_rst_n,
    PHY_tx_en,
    PHY_tx_data,
    PHY_MDC,
    PHY_MDIO_I,
    PHY_MDIO_O,
    PHY_MDIO_T
  );
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  output IP2INTC_Irpt;
  input [0:0] S_AXI_AWID;
  input [31:0] S_AXI_AWADDR;
  input [7:0] S_AXI_AWLEN;
  input [2:0] S_AXI_AWSIZE;
  input [1:0] S_AXI_AWBURST;
  input [3:0] S_AXI_AWCACHE;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WLAST;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [0:0] S_AXI_BID;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [0:0] S_AXI_ARID;
  input [31:0] S_AXI_ARADDR;
  input [7:0] S_AXI_ARLEN;
  input [2:0] S_AXI_ARSIZE;
  input [1:0] S_AXI_ARBURST;
  input [3:0] S_AXI_ARCACHE;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [0:0] S_AXI_RID;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RLAST;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
  input PHY_tx_clk;
  input PHY_rx_clk;
  input PHY_crs;
  input PHY_dv;
  input [3:0] PHY_rx_data;
  input PHY_col;
  input PHY_rx_er;
  output PHY_rst_n;
  output PHY_tx_en;
  output [3:0] PHY_tx_data;
  output PHY_MDC;
  input PHY_MDIO_I;
  output PHY_MDIO_O;
  output PHY_MDIO_T;
endmodule

module dip_switches_8bits_wrapper
  (
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_RREADY,
    IP2INTC_Irpt,
    GPIO_IO_I,
    GPIO_IO_O,
    GPIO_IO_T,
    GPIO2_IO_I,
    GPIO2_IO_O,
    GPIO2_IO_T
  );
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [31:0] S_AXI_AWADDR;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [31:0] S_AXI_ARADDR;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
  output IP2INTC_Irpt;
  input [7:0] GPIO_IO_I;
  output [7:0] GPIO_IO_O;
  output [7:0] GPIO_IO_T;
  input [31:0] GPIO2_IO_I;
  output [31:0] GPIO2_IO_O;
  output [31:0] GPIO2_IO_T;
endmodule

module axi_vdma_0_wrapper
  (
    s_axi_lite_aclk,
    m_axi_sg_aclk,
    m_axi_mm2s_aclk,
    m_axi_s2mm_aclk,
    m_axis_mm2s_aclk,
    s_axis_s2mm_aclk,
    axi_resetn,
    s_axi_lite_awvalid,
    s_axi_lite_awready,
    s_axi_lite_awaddr,
    s_axi_lite_wvalid,
    s_axi_lite_wready,
    s_axi_lite_wdata,
    s_axi_lite_bresp,
    s_axi_lite_bvalid,
    s_axi_lite_bready,
    s_axi_lite_arvalid,
    s_axi_lite_arready,
    s_axi_lite_araddr,
    s_axi_lite_rvalid,
    s_axi_lite_rready,
    s_axi_lite_rdata,
    s_axi_lite_rresp,
    m_axi_sg_araddr,
    m_axi_sg_arlen,
    m_axi_sg_arsize,
    m_axi_sg_arburst,
    m_axi_sg_arprot,
    m_axi_sg_arcache,
    m_axi_sg_arvalid,
    m_axi_sg_arready,
    m_axi_sg_rdata,
    m_axi_sg_rresp,
    m_axi_sg_rlast,
    m_axi_sg_rvalid,
    m_axi_sg_rready,
    m_axi_mm2s_araddr,
    m_axi_mm2s_arlen,
    m_axi_mm2s_arsize,
    m_axi_mm2s_arburst,
    m_axi_mm2s_arprot,
    m_axi_mm2s_arcache,
    m_axi_mm2s_arvalid,
    m_axi_mm2s_arready,
    m_axi_mm2s_rdata,
    m_axi_mm2s_rresp,
    m_axi_mm2s_rlast,
    m_axi_mm2s_rvalid,
    m_axi_mm2s_rready,
    mm2s_prmry_reset_out_n,
    m_axis_mm2s_tdata,
    m_axis_mm2s_tkeep,
    m_axis_mm2s_tvalid,
    m_axis_mm2s_tready,
    m_axis_mm2s_tlast,
    m_axis_mm2s_tuser,
    m_axi_s2mm_awaddr,
    m_axi_s2mm_awlen,
    m_axi_s2mm_awsize,
    m_axi_s2mm_awburst,
    m_axi_s2mm_awprot,
    m_axi_s2mm_awcache,
    m_axi_s2mm_awvalid,
    m_axi_s2mm_awready,
    m_axi_s2mm_wdata,
    m_axi_s2mm_wstrb,
    m_axi_s2mm_wlast,
    m_axi_s2mm_wvalid,
    m_axi_s2mm_wready,
    m_axi_s2mm_bresp,
    m_axi_s2mm_bvalid,
    m_axi_s2mm_bready,
    s2mm_prmry_reset_out_n,
    s_axis_s2mm_tdata,
    s_axis_s2mm_tkeep,
    s_axis_s2mm_tvalid,
    s_axis_s2mm_tready,
    s_axis_s2mm_tlast,
    s_axis_s2mm_tuser,
    mm2s_fsync,
    mm2s_frame_ptr_in,
    mm2s_frame_ptr_out,
    mm2s_fsync_out,
    mm2s_prmtr_update,
    mm2s_buffer_empty,
    mm2s_buffer_almost_empty,
    s2mm_fsync,
    s2mm_frame_ptr_in,
    s2mm_frame_ptr_out,
    s2mm_fsync_out,
    s2mm_buffer_full,
    s2mm_buffer_almost_full,
    s2mm_prmtr_update,
    mm2s_introut,
    s2mm_introut,
    axi_vdma_tstvec
  );
  input s_axi_lite_aclk;
  input m_axi_sg_aclk;
  input m_axi_mm2s_aclk;
  input m_axi_s2mm_aclk;
  input m_axis_mm2s_aclk;
  input s_axis_s2mm_aclk;
  input axi_resetn;
  input s_axi_lite_awvalid;
  output s_axi_lite_awready;
  input [31:0] s_axi_lite_awaddr;
  input s_axi_lite_wvalid;
  output s_axi_lite_wready;
  input [31:0] s_axi_lite_wdata;
  output [1:0] s_axi_lite_bresp;
  output s_axi_lite_bvalid;
  input s_axi_lite_bready;
  input s_axi_lite_arvalid;
  output s_axi_lite_arready;
  input [31:0] s_axi_lite_araddr;
  output s_axi_lite_rvalid;
  input s_axi_lite_rready;
  output [31:0] s_axi_lite_rdata;
  output [1:0] s_axi_lite_rresp;
  output [31:0] m_axi_sg_araddr;
  output [7:0] m_axi_sg_arlen;
  output [2:0] m_axi_sg_arsize;
  output [1:0] m_axi_sg_arburst;
  output [2:0] m_axi_sg_arprot;
  output [3:0] m_axi_sg_arcache;
  output m_axi_sg_arvalid;
  input m_axi_sg_arready;
  input [31:0] m_axi_sg_rdata;
  input [1:0] m_axi_sg_rresp;
  input m_axi_sg_rlast;
  input m_axi_sg_rvalid;
  output m_axi_sg_rready;
  output [31:0] m_axi_mm2s_araddr;
  output [7:0] m_axi_mm2s_arlen;
  output [2:0] m_axi_mm2s_arsize;
  output [1:0] m_axi_mm2s_arburst;
  output [2:0] m_axi_mm2s_arprot;
  output [3:0] m_axi_mm2s_arcache;
  output m_axi_mm2s_arvalid;
  input m_axi_mm2s_arready;
  input [31:0] m_axi_mm2s_rdata;
  input [1:0] m_axi_mm2s_rresp;
  input m_axi_mm2s_rlast;
  input m_axi_mm2s_rvalid;
  output m_axi_mm2s_rready;
  output mm2s_prmry_reset_out_n;
  output [31:0] m_axis_mm2s_tdata;
  output [3:0] m_axis_mm2s_tkeep;
  output m_axis_mm2s_tvalid;
  input m_axis_mm2s_tready;
  output m_axis_mm2s_tlast;
  output [0:0] m_axis_mm2s_tuser;
  output [31:0] m_axi_s2mm_awaddr;
  output [7:0] m_axi_s2mm_awlen;
  output [2:0] m_axi_s2mm_awsize;
  output [1:0] m_axi_s2mm_awburst;
  output [2:0] m_axi_s2mm_awprot;
  output [3:0] m_axi_s2mm_awcache;
  output m_axi_s2mm_awvalid;
  input m_axi_s2mm_awready;
  output [31:0] m_axi_s2mm_wdata;
  output [3:0] m_axi_s2mm_wstrb;
  output m_axi_s2mm_wlast;
  output m_axi_s2mm_wvalid;
  input m_axi_s2mm_wready;
  input [1:0] m_axi_s2mm_bresp;
  input m_axi_s2mm_bvalid;
  output m_axi_s2mm_bready;
  output s2mm_prmry_reset_out_n;
  input [31:0] s_axis_s2mm_tdata;
  input [3:0] s_axis_s2mm_tkeep;
  input s_axis_s2mm_tvalid;
  output s_axis_s2mm_tready;
  input s_axis_s2mm_tlast;
  input [0:0] s_axis_s2mm_tuser;
  input mm2s_fsync;
  input [5:0] mm2s_frame_ptr_in;
  output [5:0] mm2s_frame_ptr_out;
  output mm2s_fsync_out;
  output mm2s_prmtr_update;
  output mm2s_buffer_empty;
  output mm2s_buffer_almost_empty;
  input s2mm_fsync;
  input [5:0] s2mm_frame_ptr_in;
  output [5:0] s2mm_frame_ptr_out;
  output s2mm_fsync_out;
  output s2mm_buffer_full;
  output s2mm_buffer_almost_full;
  output s2mm_prmtr_update;
  output mm2s_introut;
  output s2mm_introut;
  output [63:0] axi_vdma_tstvec;
endmodule

module axi_hdmi_0_wrapper
  (
    ACLK,
    MM2S_FSYNC_IN,
    MM2S_BUFFER_ALMOST_EMPTY,
    S2MM_FSYNC_IN,
    S_AXIS_MM2S_ACLK,
    S_AXIS_MM2S_ARESETN,
    S_AXIS_MM2S_TREADY,
    S_AXIS_MM2S_TDATA,
    S_AXIS_MM2S_TKEEP,
    S_AXIS_MM2S_TLAST,
    S_AXIS_MM2S_TVALID,
    M_AXIS_S2MM_ACLK,
    M_AXIS_S2MM_ARESETN,
    M_AXIS_S2MM_TVALID,
    M_AXIS_S2MM_TDATA,
    M_AXIS_S2MM_TKEEP,
    M_AXIS_S2MM_TLAST,
    M_AXIS_S2MM_TREADY,
    TMDS_RX_CLK_P,
    TMDS_RX_CLK_N,
    TMDS_RX_2_P,
    TMDS_RX_2_N,
    TMDS_RX_1_P,
    TMDS_RX_1_N,
    TMDS_RX_0_P,
    TMDS_RX_0_N,
    TMDS_RX_SCL,
    TMDS_TX_CLK_P,
    TMDS_TX_CLK_N,
    TMDS_TX_2_P,
    TMDS_TX_2_N,
    TMDS_TX_1_P,
    TMDS_TX_1_N,
    TMDS_TX_0_P,
    TMDS_TX_0_N,
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_RREADY,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_AWREADY,
    TMDS_RX_SDA_I,
    TMDS_RX_SDA_O,
    TMDS_RX_SDA_T
  );
  input ACLK;
  input MM2S_FSYNC_IN;
  input MM2S_BUFFER_ALMOST_EMPTY;
  input S2MM_FSYNC_IN;
  output S_AXIS_MM2S_ACLK;
  input S_AXIS_MM2S_ARESETN;
  output S_AXIS_MM2S_TREADY;
  input [31:0] S_AXIS_MM2S_TDATA;
  input [3:0] S_AXIS_MM2S_TKEEP;
  input S_AXIS_MM2S_TLAST;
  input S_AXIS_MM2S_TVALID;
  output M_AXIS_S2MM_ACLK;
  input M_AXIS_S2MM_ARESETN;
  output M_AXIS_S2MM_TVALID;
  output [31:0] M_AXIS_S2MM_TDATA;
  output [3:0] M_AXIS_S2MM_TKEEP;
  output M_AXIS_S2MM_TLAST;
  input M_AXIS_S2MM_TREADY;
  input TMDS_RX_CLK_P;
  input TMDS_RX_CLK_N;
  input TMDS_RX_2_P;
  input TMDS_RX_2_N;
  input TMDS_RX_1_P;
  input TMDS_RX_1_N;
  input TMDS_RX_0_P;
  input TMDS_RX_0_N;
  input TMDS_RX_SCL;
  output TMDS_TX_CLK_P;
  output TMDS_TX_CLK_N;
  output TMDS_TX_2_P;
  output TMDS_TX_2_N;
  output TMDS_TX_1_P;
  output TMDS_TX_1_N;
  output TMDS_TX_0_P;
  output TMDS_TX_0_N;
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [31:0] S_AXI_AWADDR;
  input S_AXI_AWVALID;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WVALID;
  input S_AXI_BREADY;
  input [31:0] S_AXI_ARADDR;
  input S_AXI_ARVALID;
  input S_AXI_RREADY;
  output S_AXI_ARREADY;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  output S_AXI_WREADY;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  output S_AXI_AWREADY;
  input TMDS_RX_SDA_I;
  output TMDS_RX_SDA_O;
  output TMDS_RX_SDA_T;
endmodule

module axi_intc_0_wrapper
  (
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_RREADY,
    Intr,
    Irq
  );
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [31:0] S_AXI_AWADDR;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [31:0] S_AXI_ARADDR;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
  input [0:0] Intr;
  output Irq;
endmodule

module camera_stream_0_wrapper
  (
    ACLK,
    ARESETN,
    S_AXIS_TREADY,
    S_AXIS_TDATA,
    S_AXIS_TLAST,
    S_AXIS_TVALID,
    M_AXIS_TVALID,
    M_AXIS_TDATA,
    M_AXIS_TLAST,
    M_AXIS_TREADY,
    RST_I,
    CLK,
    CLK_180,
    D_I,
    PCLK_I,
    MCLK_O,
    LV_I,
    FV_I,
    RST_O,
    PWDN_O,
    VDDEN_O,
    DEBUG,
    SDA_I,
    SDA_O,
    SDA_T,
    SCL_I,
    SCL_O,
    SCL_T
  );
  input ACLK;
  input ARESETN;
  output S_AXIS_TREADY;
  input [31:0] S_AXIS_TDATA;
  input S_AXIS_TLAST;
  input S_AXIS_TVALID;
  output M_AXIS_TVALID;
  output [31:0] M_AXIS_TDATA;
  output M_AXIS_TLAST;
  input M_AXIS_TREADY;
  input RST_I;
  input CLK;
  input CLK_180;
  input [7:0] D_I;
  input PCLK_I;
  output MCLK_O;
  input LV_I;
  input FV_I;
  output RST_O;
  output PWDN_O;
  output VDDEN_O;
  output [7:0] DEBUG;
  input SDA_I;
  output SDA_O;
  output SDA_T;
  input SCL_I;
  output SCL_O;
  output SCL_T;
endmodule

module axi_dma_0_wrapper
  (
    s_axi_lite_aclk,
    m_axi_sg_aclk,
    m_axi_mm2s_aclk,
    m_axi_s2mm_aclk,
    axi_resetn,
    s_axi_lite_awvalid,
    s_axi_lite_awready,
    s_axi_lite_awaddr,
    s_axi_lite_wvalid,
    s_axi_lite_wready,
    s_axi_lite_wdata,
    s_axi_lite_bresp,
    s_axi_lite_bvalid,
    s_axi_lite_bready,
    s_axi_lite_arvalid,
    s_axi_lite_arready,
    s_axi_lite_araddr,
    s_axi_lite_rvalid,
    s_axi_lite_rready,
    s_axi_lite_rdata,
    s_axi_lite_rresp,
    m_axi_sg_awaddr,
    m_axi_sg_awlen,
    m_axi_sg_awsize,
    m_axi_sg_awburst,
    m_axi_sg_awprot,
    m_axi_sg_awcache,
    m_axi_sg_awvalid,
    m_axi_sg_awready,
    m_axi_sg_wdata,
    m_axi_sg_wstrb,
    m_axi_sg_wlast,
    m_axi_sg_wvalid,
    m_axi_sg_wready,
    m_axi_sg_bresp,
    m_axi_sg_bvalid,
    m_axi_sg_bready,
    m_axi_sg_araddr,
    m_axi_sg_arlen,
    m_axi_sg_arsize,
    m_axi_sg_arburst,
    m_axi_sg_arprot,
    m_axi_sg_arcache,
    m_axi_sg_arvalid,
    m_axi_sg_arready,
    m_axi_sg_rdata,
    m_axi_sg_rresp,
    m_axi_sg_rlast,
    m_axi_sg_rvalid,
    m_axi_sg_rready,
    m_axi_mm2s_araddr,
    m_axi_mm2s_arlen,
    m_axi_mm2s_arsize,
    m_axi_mm2s_arburst,
    m_axi_mm2s_arprot,
    m_axi_mm2s_arcache,
    m_axi_mm2s_arvalid,
    m_axi_mm2s_arready,
    m_axi_mm2s_rdata,
    m_axi_mm2s_rresp,
    m_axi_mm2s_rlast,
    m_axi_mm2s_rvalid,
    m_axi_mm2s_rready,
    mm2s_prmry_reset_out_n,
    m_axis_mm2s_tdata,
    m_axis_mm2s_tkeep,
    m_axis_mm2s_tvalid,
    m_axis_mm2s_tready,
    m_axis_mm2s_tlast,
    mm2s_cntrl_reset_out_n,
    m_axis_mm2s_cntrl_tdata,
    m_axis_mm2s_cntrl_tkeep,
    m_axis_mm2s_cntrl_tvalid,
    m_axis_mm2s_cntrl_tready,
    m_axis_mm2s_cntrl_tlast,
    m_axi_s2mm_awaddr,
    m_axi_s2mm_awlen,
    m_axi_s2mm_awsize,
    m_axi_s2mm_awburst,
    m_axi_s2mm_awprot,
    m_axi_s2mm_awcache,
    m_axi_s2mm_awvalid,
    m_axi_s2mm_awready,
    m_axi_s2mm_wdata,
    m_axi_s2mm_wstrb,
    m_axi_s2mm_wlast,
    m_axi_s2mm_wvalid,
    m_axi_s2mm_wready,
    m_axi_s2mm_bresp,
    m_axi_s2mm_bvalid,
    m_axi_s2mm_bready,
    s2mm_prmry_reset_out_n,
    s_axis_s2mm_tdata,
    s_axis_s2mm_tkeep,
    s_axis_s2mm_tvalid,
    s_axis_s2mm_tready,
    s_axis_s2mm_tlast,
    s2mm_sts_reset_out_n,
    s_axis_s2mm_sts_tdata,
    s_axis_s2mm_sts_tkeep,
    s_axis_s2mm_sts_tvalid,
    s_axis_s2mm_sts_tready,
    s_axis_s2mm_sts_tlast,
    mm2s_introut,
    s2mm_introut
  );
  input s_axi_lite_aclk;
  input m_axi_sg_aclk;
  input m_axi_mm2s_aclk;
  input m_axi_s2mm_aclk;
  input axi_resetn;
  input s_axi_lite_awvalid;
  output s_axi_lite_awready;
  input [31:0] s_axi_lite_awaddr;
  input s_axi_lite_wvalid;
  output s_axi_lite_wready;
  input [31:0] s_axi_lite_wdata;
  output [1:0] s_axi_lite_bresp;
  output s_axi_lite_bvalid;
  input s_axi_lite_bready;
  input s_axi_lite_arvalid;
  output s_axi_lite_arready;
  input [31:0] s_axi_lite_araddr;
  output s_axi_lite_rvalid;
  input s_axi_lite_rready;
  output [31:0] s_axi_lite_rdata;
  output [1:0] s_axi_lite_rresp;
  output [31:0] m_axi_sg_awaddr;
  output [7:0] m_axi_sg_awlen;
  output [2:0] m_axi_sg_awsize;
  output [1:0] m_axi_sg_awburst;
  output [2:0] m_axi_sg_awprot;
  output [3:0] m_axi_sg_awcache;
  output m_axi_sg_awvalid;
  input m_axi_sg_awready;
  output [31:0] m_axi_sg_wdata;
  output [3:0] m_axi_sg_wstrb;
  output m_axi_sg_wlast;
  output m_axi_sg_wvalid;
  input m_axi_sg_wready;
  input [1:0] m_axi_sg_bresp;
  input m_axi_sg_bvalid;
  output m_axi_sg_bready;
  output [31:0] m_axi_sg_araddr;
  output [7:0] m_axi_sg_arlen;
  output [2:0] m_axi_sg_arsize;
  output [1:0] m_axi_sg_arburst;
  output [2:0] m_axi_sg_arprot;
  output [3:0] m_axi_sg_arcache;
  output m_axi_sg_arvalid;
  input m_axi_sg_arready;
  input [31:0] m_axi_sg_rdata;
  input [1:0] m_axi_sg_rresp;
  input m_axi_sg_rlast;
  input m_axi_sg_rvalid;
  output m_axi_sg_rready;
  output [31:0] m_axi_mm2s_araddr;
  output [7:0] m_axi_mm2s_arlen;
  output [2:0] m_axi_mm2s_arsize;
  output [1:0] m_axi_mm2s_arburst;
  output [2:0] m_axi_mm2s_arprot;
  output [3:0] m_axi_mm2s_arcache;
  output m_axi_mm2s_arvalid;
  input m_axi_mm2s_arready;
  input [31:0] m_axi_mm2s_rdata;
  input [1:0] m_axi_mm2s_rresp;
  input m_axi_mm2s_rlast;
  input m_axi_mm2s_rvalid;
  output m_axi_mm2s_rready;
  output mm2s_prmry_reset_out_n;
  output [31:0] m_axis_mm2s_tdata;
  output [3:0] m_axis_mm2s_tkeep;
  output m_axis_mm2s_tvalid;
  input m_axis_mm2s_tready;
  output m_axis_mm2s_tlast;
  output mm2s_cntrl_reset_out_n;
  output [31:0] m_axis_mm2s_cntrl_tdata;
  output [3:0] m_axis_mm2s_cntrl_tkeep;
  output m_axis_mm2s_cntrl_tvalid;
  input m_axis_mm2s_cntrl_tready;
  output m_axis_mm2s_cntrl_tlast;
  output [31:0] m_axi_s2mm_awaddr;
  output [7:0] m_axi_s2mm_awlen;
  output [2:0] m_axi_s2mm_awsize;
  output [1:0] m_axi_s2mm_awburst;
  output [2:0] m_axi_s2mm_awprot;
  output [3:0] m_axi_s2mm_awcache;
  output m_axi_s2mm_awvalid;
  input m_axi_s2mm_awready;
  output [31:0] m_axi_s2mm_wdata;
  output [3:0] m_axi_s2mm_wstrb;
  output m_axi_s2mm_wlast;
  output m_axi_s2mm_wvalid;
  input m_axi_s2mm_wready;
  input [1:0] m_axi_s2mm_bresp;
  input m_axi_s2mm_bvalid;
  output m_axi_s2mm_bready;
  output s2mm_prmry_reset_out_n;
  input [31:0] s_axis_s2mm_tdata;
  input [3:0] s_axis_s2mm_tkeep;
  input s_axis_s2mm_tvalid;
  output s_axis_s2mm_tready;
  input s_axis_s2mm_tlast;
  output s2mm_sts_reset_out_n;
  input [31:0] s_axis_s2mm_sts_tdata;
  input [3:0] s_axis_s2mm_sts_tkeep;
  input s_axis_s2mm_sts_tvalid;
  output s_axis_s2mm_sts_tready;
  input s_axis_s2mm_sts_tlast;
  output mm2s_introut;
  output s2mm_introut;
endmodule

module chipscope_icon_0_wrapper
  (
    control0,
    control1,
    control2,
    control3,
    control4,
    control5,
    control6,
    control7,
    control8,
    control9,
    control10,
    control11,
    control12,
    control13,
    control14,
    control15,
    tdi_in,
    reset_in,
    shift_in,
    update_in,
    sel_in,
    drck_in,
    capture_in,
    tdo_out
  );
  output [35:0] control0;
  output [35:0] control1;
  output [35:0] control2;
  output [35:0] control3;
  output [35:0] control4;
  output [35:0] control5;
  output [35:0] control6;
  output [35:0] control7;
  output [35:0] control8;
  output [35:0] control9;
  output [35:0] control10;
  output [35:0] control11;
  output [35:0] control12;
  output [35:0] control13;
  output [35:0] control14;
  output [35:0] control15;
  input tdi_in;
  input reset_in;
  input shift_in;
  input update_in;
  input sel_in;
  input drck_in;
  input capture_in;
  output tdo_out;
endmodule

module chipscope_ila_0_wrapper
  (
    CHIPSCOPE_ILA_CONTROL,
    CLK,
    DATA,
    TRIG0,
    TRIG1,
    TRIG2,
    TRIG3,
    TRIG4,
    TRIG5,
    TRIG6,
    TRIG7,
    TRIG8,
    TRIG9,
    TRIG10,
    TRIG11,
    TRIG12,
    TRIG13,
    TRIG14,
    TRIG15,
    TRIG_OUT
  );
  input [35:0] CHIPSCOPE_ILA_CONTROL;
  input CLK;
  input [31:0] DATA;
  input [7:0] TRIG0;
  input [7:0] TRIG1;
  input [7:0] TRIG2;
  input [7:0] TRIG3;
  input [7:0] TRIG4;
  input [7:0] TRIG5;
  input [7:0] TRIG6;
  input [7:0] TRIG7;
  input [7:0] TRIG8;
  input [7:0] TRIG9;
  input [7:0] TRIG10;
  input [7:0] TRIG11;
  input [7:0] TRIG12;
  input [7:0] TRIG13;
  input [7:0] TRIG14;
  input [7:0] TRIG15;
  output TRIG_OUT;
endmodule

module pmodjstk_top_0_wrapper
  (
    MISO,
    SS,
    MOSI,
    SCLK,
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_RREADY,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_AWREADY
  );
  input MISO;
  output SS;
  output MOSI;
  output SCLK;
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [31:0] S_AXI_AWADDR;
  input S_AXI_AWVALID;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WVALID;
  input S_AXI_BREADY;
  input [31:0] S_AXI_ARADDR;
  input S_AXI_ARVALID;
  input S_AXI_RREADY;
  output S_AXI_ARREADY;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  output S_AXI_WREADY;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  output S_AXI_AWREADY;
endmodule

