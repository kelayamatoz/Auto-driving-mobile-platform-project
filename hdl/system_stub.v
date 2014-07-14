//-----------------------------------------------------------------------------
// system_stub.v
//-----------------------------------------------------------------------------

module system_stub
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

  (* BOX_TYPE = "user_black_box" *)
  system
    system_i (
      .zio ( zio ),
      .rzq ( rzq ),
      .mcbx_dram_we_n ( mcbx_dram_we_n ),
      .mcbx_dram_udqs_n ( mcbx_dram_udqs_n ),
      .mcbx_dram_udqs ( mcbx_dram_udqs ),
      .mcbx_dram_udm ( mcbx_dram_udm ),
      .mcbx_dram_ras_n ( mcbx_dram_ras_n ),
      .mcbx_dram_odt ( mcbx_dram_odt ),
      .mcbx_dram_ldm ( mcbx_dram_ldm ),
      .mcbx_dram_dqs_n ( mcbx_dram_dqs_n ),
      .mcbx_dram_dqs ( mcbx_dram_dqs ),
      .mcbx_dram_dq ( mcbx_dram_dq ),
      .mcbx_dram_clk_n ( mcbx_dram_clk_n ),
      .mcbx_dram_clk ( mcbx_dram_clk ),
      .mcbx_dram_cke ( mcbx_dram_cke ),
      .mcbx_dram_cas_n ( mcbx_dram_cas_n ),
      .mcbx_dram_ba ( mcbx_dram_ba ),
      .mcbx_dram_addr ( mcbx_dram_addr ),
      .RS232_Uart_1_sout ( RS232_Uart_1_sout ),
      .RS232_Uart_1_sin ( RS232_Uart_1_sin ),
      .RESET ( RESET ),
      .Push_Buttons_5Bits_TRI_I ( Push_Buttons_5Bits_TRI_I ),
      .LEDs_8Bits_TRI_O ( LEDs_8Bits_TRI_O ),
      .GCLK ( GCLK ),
      .Ethernet_Lite_TX_EN ( Ethernet_Lite_TX_EN ),
      .Ethernet_Lite_TX_CLK ( Ethernet_Lite_TX_CLK ),
      .Ethernet_Lite_TXD ( Ethernet_Lite_TXD ),
      .Ethernet_Lite_RX_ER ( Ethernet_Lite_RX_ER ),
      .Ethernet_Lite_RX_DV ( Ethernet_Lite_RX_DV ),
      .Ethernet_Lite_RX_CLK ( Ethernet_Lite_RX_CLK ),
      .Ethernet_Lite_RXD ( Ethernet_Lite_RXD ),
      .Ethernet_Lite_PHY_RST_N ( Ethernet_Lite_PHY_RST_N ),
      .Ethernet_Lite_MDIO ( Ethernet_Lite_MDIO ),
      .Ethernet_Lite_MDC ( Ethernet_Lite_MDC ),
      .Ethernet_Lite_CRS ( Ethernet_Lite_CRS ),
      .Ethernet_Lite_COL ( Ethernet_Lite_COL ),
      .DIP_Switches_8Bits_TRI_I ( DIP_Switches_8Bits_TRI_I ),
      .TMDS_TX_CLK_P ( TMDS_TX_CLK_P ),
      .TMDS_TX_CLK_N ( TMDS_TX_CLK_N ),
      .TMDS_TX_2_P ( TMDS_TX_2_P ),
      .TMDS_TX_2_N ( TMDS_TX_2_N ),
      .TMDS_TX_1_P ( TMDS_TX_1_P ),
      .TMDS_TX_1_N ( TMDS_TX_1_N ),
      .TMDS_TX_0_P ( TMDS_TX_0_P ),
      .TMDS_TX_0_N ( TMDS_TX_0_N ),
      .axi_hdmi_0_TMDS_RX_SDA_pin ( axi_hdmi_0_TMDS_RX_SDA_pin ),
      .CAMA_SDA ( CAMA_SDA ),
      .CAMA_PCLK_I ( CAMA_PCLK_I ),
      .CAMA_D_I ( CAMA_D_I ),
      .CAMA_SCL ( CAMA_SCL ),
      .CAMA_FV_I ( CAMA_FV_I ),
      .CAMA_MCLK_O ( CAMA_MCLK_O ),
      .CAMA_RST_O ( CAMA_RST_O ),
      .CAMA_PWDN_O ( CAMA_PWDN_O ),
      .CAMX_VDDEN_O ( CAMX_VDDEN_O ),
      .CAMA_LV_I ( CAMA_LV_I ),
      .chipscope_ila_0_TRIG0_pin ( chipscope_ila_0_TRIG0_pin ),
      .pmodjstk_top_0_MISO_pin ( pmodjstk_top_0_MISO_pin ),
      .pmodjstk_top_0_MOSI_pin ( pmodjstk_top_0_MOSI_pin ),
      .pmodjstk_top_0_SS_pin ( pmodjstk_top_0_SS_pin ),
      .pmodjstk_top_0_SCLK_pin ( pmodjstk_top_0_SCLK_pin )
    );

endmodule

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
  input Ethernet_Lite_TX_CLK;
  output [3:0] Ethernet_Lite_TXD;
  input Ethernet_Lite_RX_ER;
  input Ethernet_Lite_RX_DV;
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
endmodule

