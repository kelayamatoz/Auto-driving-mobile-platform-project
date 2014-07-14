/*
 * Copyright (c) 2010 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

#include "netif/xemacpsif.h"
#include "lwipopts.h"


void emacps_recv_handler(void *arg);
void emacps_send_handler(void *arg);
void emacps_error_handler(void *arg, u8 Direction, u32 ErrorWord);

XEmacPs_Config *
lookup_config(unsigned mac_base)
{
	extern XEmacPs_Config XEmacPs_ConfigTable[];
	XEmacPs_Config *CfgPtr = NULL;
	int i;

	for (i = 0; i < XPAR_XEMACPS_NUM_INSTANCES; i++) {
		if (XEmacPs_ConfigTable[i].BaseAddress == mac_base) {
			CfgPtr = &XEmacPs_ConfigTable[i];
			break;
		}
	}

	return (CfgPtr);
}

void
init_emacps(xemacpsif_s *xemacps, struct netif *netif)
{
	int rdy;
	unsigned mac_address = (unsigned)(netif->state);
	unsigned link_speed = 1000;
	unsigned options;
        unsigned lock_message_printed = 0;
	XEmacPs *xemacpsp;
	XEmacPs_Config *mac_config;
	int Status = XST_SUCCESS;

	/* obtain config of this emac */
	mac_config = lookup_config(mac_address);

	xemacpsp = &xemacps->emacps;
#if 0

	options = XEmacPs_GetOptions(xemacpsp);

	options |= XEMACPS_FLOW_CONTROL_OPTION;
	options |= XEMACPS_TRANSMITTER_ENABLE_OPTION;
	options |= XEMACPS_RECEIVER_ENABLE_OPTION;
	options |= XEMACPS_FCS_STRIP_OPTION;
	options |= XEMACPS_BROADCAST_OPTION;
	options |= XEMACPS_FCS_INSERT_OPTION;
	options |= XEMACPS_RX_CHKSUM_ENABLE_OPTION;
     	options |= XEMACPS_TX_CHKSUM_ENABLE_OPTION;
     	options |= XEMACPS_LENTYPE_ERR_OPTION;

	XEmacPs_SetOptions(xemacpsp, options);
	XEmacPs_ClearOptions(xemacpsp, ~options);
#endif
	/* set mac address */
	Status = XEmacPs_SetMacAddress(xemacpsp, (void*)(netif->hwaddr), 1);
	if (Status != XST_SUCCESS) {
		xil_printf("In %s:Emac Mac Address set failed...\r\n",__func__);
	}
	link_speed = Phy_Setup(xemacpsp);
    	XEmacPs_SetOperatingSpeed(xemacpsp, link_speed);

	/* Setting the operating speed of the MAC needs a delay. */
	{
		volatile int wait;
		for (wait=0; wait < 20000; wait++);
	}
	Status = XEmacPs_SetOptions(xemacpsp, XEMACPS_PROMISC_OPTION);
	if (Status != XST_SUCCESS) {
		xil_printf("In %s:Setting up of promiscuous mode failed...\r\n",__func__);
	}
}

void setup_isr (struct xemac_s *xemac)
{
	xemacpsif_s   *xemacpsif;

	xemacpsif = (xemacpsif_s *)(xemac->state);
	/*
	 * Setup callbacks
	 */
	XEmacPs_SetHandler(&xemacpsif->emacps, XEMACPS_HANDLER_DMASEND,
				     (void *) emacps_send_handler,
				     (void *) xemac);

	XEmacPs_SetHandler(&xemacpsif->emacps, XEMACPS_HANDLER_DMARECV,
				    (void *) emacps_recv_handler,
				    (void *) xemac);

	XEmacPs_SetHandler(&xemacpsif->emacps, XEMACPS_HANDLER_ERROR,
				    (void *) emacps_error_handler,
				    (void *) xemac);
}

void start_emacps (xemacpsif_s *xemacps)
{
	/* start the temac */
    	XEmacPs_Start(&xemacps->emacps);
}


void
emacps_error_handler(void *arg,u8 Direction, u32 ErrorWord)
{
	struct xemac_s *xemac;
	xemacpsif_s   *xemacpsif;
	struct xtopology_t *xtopologyp;
	XEmacPs *xemacps;

	xemac = (struct xemac_s *)(arg);
	xemacpsif = (xemacpsif_s *)(xemac->state);
	xtopologyp = &xtopology[xemac->topology_index];
	xemacps = &xemacpsif->emacps;
	xil_printf("ERROR\r\n");

	switch (Direction) {
	case XEMACPS_RECV:
		if (ErrorWord & XEMACPS_RXSR_HRESPNOK_MASK) {
			xil_printf("Receive DMA error\r\n");
		}
		if (ErrorWord & XEMACPS_RXSR_RXOVR_MASK) {
			xil_printf("Receive over run\r\n");
		}
		if (ErrorWord & XEMACPS_RXSR_BUFFNA_MASK) {
			xil_printf("Receive buffer not available\r\n");
		}
		break;
	case XEMACPS_SEND:
		if (ErrorWord & XEMACPS_TXSR_HRESPNOK_MASK) {
			xil_printf("Transmit DMA error\r\n");
		}
		if (ErrorWord & XEMACPS_TXSR_URUN_MASK) {
			xil_printf("Transmit under run\r\n");
		}
		if (ErrorWord & XEMACPS_TXSR_BUFEXH_MASK) {
			xil_printf("Transmit buffer exhausted\r\n");
		}
		if (ErrorWord & XEMACPS_TXSR_RXOVR_MASK) {
			xil_printf("Transmit retry excessed limits\r\n");
		}
		if (ErrorWord & XEMACPS_TXSR_FRAMERX_MASK) {
			xil_printf("Transmit collision\r\n");
		}
		if (ErrorWord & XEMACPS_TXSR_USEDREAD_MASK) {
			xil_printf("Transmit buffer not available\r\n");
		}
		break;
	}
	/* Need to add code here */;
}
