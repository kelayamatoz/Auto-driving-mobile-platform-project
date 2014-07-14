create_clock [get_ports {Ethernet_Lite_TX_CLK}] -name Ethernet_Lite_TX_CLK -period 40 -waveform {0 14}
create_clock [get_ports {Ethernet_Lite_RX_CLK}] -name Ethernet_Lite_RX_CLK -period 40 -waveform {0 14}
set_output_delay 10 [get_ports {Ethernet_Lite_TXD Ethernet_Lite_TX_EN}] -clock {Ethernet_Lite_TX_CLK}
set_input_delay 34 [get_ports {Ethernet_Lite_RXD Ethernet_Lite_CRS Ethernet_Lite_RX_DV Ethernet_Lite_COL Ethernet_Lite_RX_ER}] -clock {Ethernet_Lite_RX_CLK}
set_clock_uncertainty -setup 6 [get_clocks {Ethernet_Lite_TX_CLK Ethernet_Lite_RX_CLK}]
set_false_path -from [get_pins Ethernet_Lite/S_AXI_ACLK] -to [get_pins Ethernet_Lite/PHY_tx_clk]
set_false_path -from [get_pins Ethernet_Lite/PHY_tx_clk] -to [get_pins Ethernet_Lite/S_AXI_ACLK]
set_false_path -from [get_pins Ethernet_Lite/S_AXI_ACLK] -to [get_pins Ethernet_Lite/PHY_rx_clk]
set_false_path -from [get_pins Ethernet_Lite/PHY_rx_clk] -to [get_pins Ethernet_Lite/S_AXI_ACLK]
