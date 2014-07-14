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

#include "lwipopts.h"
#include "lwip/stats.h"
#include "lwip/sys.h"
#include "lwip/inet_chksum.h"

#include "netif/xadapter.h"
#include "netif/xemacpsif.h"
#include "xstatus.h"

#include "xlwipconfig.h"
#include "xparameters.h"
#include "xparameters_ps.h"

#ifdef CONFIG_XTRACE
#include "xtrace.h"
#endif

#define INTC_BASE_ADDR		XPAR_SCUGIC_CPU_BASEADDR
#define INTC_DIST_BASE_ADDR	XPAR_SCUGIC_DIST_BASEADDR

/* Byte alignment of BDs */
#define BD_ALIGNMENT (XEMACPS_DMABD_MINIMUM_ALIGNMENT*2)

static int tx_pbufs_storage[XLWIP_CONFIG_N_TX_DESC];
static int rx_pbufs_storage[XLWIP_CONFIG_N_RX_DESC];

#define XEMACPS_BD_TO_INDEX(ringptr, bdptr)				\
	(((u32)bdptr - (u32)(ringptr)->BaseBdAddr) / (ringptr)->Separation)


int
is_tx_space_available(xemacpsif_s *emac)
{
	XEmacPs_BdRing *txring;
	int freecnt = 0;

	txring = &(XEmacPs_GetTxRing(&emac->emacps));

	/* tx space is available as long as there are valid BD's */
	freecnt = XEmacPs_BdRingGetFreeCnt(txring);
	return freecnt;
}

int
process_sent_bds(XEmacPs_BdRing *txring)
{
	XEmacPs_Bd *txbdset, *txbd;
	XEmacPs_Bd *CurBdPntr;
	int n_bds, i;
	XStatus Status;
	int n_bds_freed = 0, n_pbufs_freed = 0;
	int no_bds_freed = 1;
	int errorFlag = 0;
	unsigned int BdIndex;
	struct pbuf *p;

	/* obtain processed BD's */
	n_bds = XEmacPs_BdRingFromHwTx(txring, XLWIP_CONFIG_N_TX_DESC, &txbdset);
	if (n_bds == 0)  {
		return;
	}

	/* free the processed BD's */
	n_pbufs_freed = n_bds;
	CurBdPntr = txbdset;
	while (n_pbufs_freed > 0) {
		XEmacPs_BdSetTxUsed(CurBdPntr);
		XEmacPs_BdClearLast(CurBdPntr);
		BdIndex = XEMACPS_BD_TO_INDEX(txring, CurBdPntr);
		p = (struct pbuf *)tx_pbufs_storage[BdIndex];
		pbuf_free(p);
		CurBdPntr = XEmacPs_BdRingNext(txring, CurBdPntr);
		n_pbufs_freed--;
	}
	Status = XEmacPs_BdRingFree(txring, n_bds, txbdset);
	if (Status != XST_SUCCESS) {
		xil_printf("Failure while freeing in Tx Done ISR\r\n");
	}

	return 0;
}

void
emacps_send_handler(void *arg)
{
	unsigned irq_status;
	struct xemac_s *xemac;
	xemacpsif_s   *xemacpsif;
	XEmacPs_BdRing *TxRingPtr;
	struct xtopology_t *xtopologyp;
	XEmacPs *xemacps;
	SYS_ARCH_DECL_PROTECT(lev);
	SYS_ARCH_PROTECT(lev);

	xemac = (struct xemac_s *)(arg);
	xemacpsif = (xemacpsif_s *)(xemac->state);
	TxRingPtr = &(XEmacPs_GetTxRing(&xemacpsif->emacps));
	xtopologyp = &xtopology[xemac->topology_index];
	xemacps = &xemacpsif->emacps;

	/* If Transmit done interrupt is asserted, process completed BD's */
	process_sent_bds(TxRingPtr);
	SYS_ARCH_UNPROTECT(lev);

}

XStatus
emacps_sgsend(xemacpsif_s *xemacpsif, struct pbuf *p)
{
	struct pbuf *q;
	int n_pbufs;
	XEmacPs_Bd *txbdset, *txbd, *last_txbd = NULL;
	XStatus Status;
	XEmacPs_BdRing *txring;
	unsigned max_frame_size;
	unsigned int BdIndex;

	SYS_ARCH_DECL_PROTECT(lev);
	SYS_ARCH_PROTECT(lev);

    	max_frame_size = XEMACPS_MAX_FRAME_SIZE - 18;
	txring = &(XEmacPs_GetTxRing(&xemacpsif->emacps));

	/* first count the number of pbufs */
	for (q = p, n_pbufs = 0; q != NULL; q = q->next)
		n_pbufs++;

	/* obtain as many BD's */
	Status = XEmacPs_BdRingAlloc(txring, n_pbufs, &txbdset);
	if (Status != XST_SUCCESS) {
		LWIP_DEBUGF(NETIF_DEBUG, ("sgsend: Error allocating TxBD\r\n"));
		return ERR_IF;
	}

	for(q = p, txbd = txbdset; q != NULL; q = q->next) {
		/* Send the data from the pbuf to the interface, one pbuf at a
		   time. The size of the data in each pbuf is kept in the ->len
		   variable. */
		XEmacPs_BdSetAddressTx(txbd, (u32)q->payload);
		if (q->len > max_frame_size)
			XEmacPs_BdSetLength(txbd, max_frame_size);
		else
			XEmacPs_BdSetLength(txbd, q->len);
		XEmacPs_BdClearTxUsed(txbd);
		XEmacPs_BdClearLast(txbd);
		XEmacPs_BdClearTxNoCRC(txbd);
		BdIndex = XEMACPS_BD_TO_INDEX(txring, txbd);
		tx_pbufs_storage[BdIndex] = (int)q;
		Xil_DCacheFlushRange((unsigned int)q->payload, (unsigned)q->len);

		pbuf_ref(q);
		last_txbd = txbd;
 		txbd = XEmacPs_BdRingNext(txring, txbd);
	}

	XEmacPs_BdSetLast(last_txbd);

	/* enq to h/w */
	Status = XEmacPs_BdRingToHw(txring, n_pbufs, txbdset);
	/* Start transmit */

	XEmacPs_WriteReg((xemacpsif->emacps).Config.BaseAddress,
	XEMACPS_NWCTRL_OFFSET,
	(XEmacPs_ReadReg((xemacpsif->emacps).Config.BaseAddress,
	XEMACPS_NWCTRL_OFFSET) | XEMACPS_NWCTRL_STARTTX_MASK));
	SYS_ARCH_UNPROTECT(lev);
	return Status;
}

void
_setup_rx_bds(XEmacPs_BdRing *rxring)
{
	XEmacPs_Bd *rxbd, *CurBdPtr;
	int n_bds, i;
	XStatus Status;
	struct pbuf *p;
	u32 BdSts;
	unsigned int FreeBds, k;
	unsigned int BdIndex;

	FreeBds = XEmacPs_BdRingGetFreeCnt (rxring);
	Status = XEmacPs_BdRingAlloc(rxring, FreeBds, &rxbd);
	if (Status != XST_SUCCESS) {
		LWIP_DEBUGF(NETIF_DEBUG, ("setup_rx_bds: Error allocating RxBD\r\n"));
		return;
	}
	for (k = 0, CurBdPtr = rxbd; k < FreeBds; k++) {
		p = pbuf_alloc(PBUF_RAW, XEMACPS_MAX_FRAME_SIZE, PBUF_POOL);

		if (!p) {
#if LINK_STATS
			lwip_stats.link.memerr++;
			lwip_stats.link.drop++;
#endif
			LWIP_DEBUGF(NETIF_DEBUG, ("unable to alloc pbuf in recv_handler\r\n"));
			return;
		}
		XEmacPs_BdSetAddressRx(CurBdPtr, (u32)p->payload);
		XEmacPs_BdSetLast(CurBdPtr);
		BdIndex = XEMACPS_BD_TO_INDEX(rxring, CurBdPtr);
		rx_pbufs_storage[BdIndex] = (int)p;

		Xil_DCacheInvalidateRange((unsigned int)p->payload, (unsigned)XEMACPS_MAX_FRAME_SIZE);
		Xil_DCacheInvalidateRange((unsigned int)CurBdPtr, (unsigned)sizeof (*CurBdPtr));
		CurBdPtr = XEmacPs_BdRingNext (rxring, CurBdPtr);

		/* Enqueue to HW */
	}
	Status = XEmacPs_BdRingToHw(rxring, FreeBds, rxbd);
	if (Status != XST_SUCCESS) {
		LWIP_DEBUGF(NETIF_DEBUG, ("Error committing RxBD to hardware: "));
		if (Status == XST_DMA_SG_LIST_ERROR)
			LWIP_DEBUGF(NETIF_DEBUG, ("XST_DMA_SG_LIST_ERROR: this function was called out of sequence with XEmacPs_BdRingAlloc()\r\n"));
		else
			LWIP_DEBUGF(NETIF_DEBUG, ("set of BDs was rejected because the first BD did not have its start-of-packet bit set, or the last BD did not have its end-of-packet bit set, or any one of the BD set has 0 as length value\r\n"));
		return;
	}
}

void
zero_tcp_ip_checksum_fields(struct pbuf *p)
{
	/* the way checksum works in this implementation of lwIP is as follows:
		   	- if checksum offload is disabled, then lwIP stack performs all checksum calculations
			- if checksum is enabled,
				- if computed csum says packet is valid, then we zero out the checksum field
				- if computed csum says packet is invalid, we leave checksum as is
				- upper layer recomputes checksum if it finds a non-zero checksum value
	 */
	struct ethip_hdr *ehdr = p->payload;
	u32_t iphdr_len;
	u8_t proto = IPH_PROTO(&ehdr->ip);

	iphdr_len = (IPH_HL(&ehdr->ip) * 4);

	if (htons(ehdr->eth.type) == ETHTYPE_IP)  {
		*(u16_t*)(p->payload + XEMACPS_HDR_SIZE + 10) = 0;
		if (proto == IP_PROTO_TCP) {
			/* set checksum = 0 */
			*(u16_t*)(p->payload + XEMACPS_HDR_SIZE + iphdr_len + 16) = 0;
		}
		if (proto == IP_PROTO_UDP) {
			/* set checksum = 0 */
			*(u16_t*)(p->payload + XEMACPS_HDR_SIZE + iphdr_len + 6) = 0;
		}
	}
}


/*
 * compare if the h/w computed checksum (stored in the rxbd)
 * equals the TCP checksum value in the packet
 */
#if 0
int
is_checksum_valid(void)
{
	int IPHdrCsumErrors;
	int TCPCsumErrors;
	int UDPCsumErrors;

	IPHdrCsumErrors = XEmacPs_ReadReg(Mac.Config.BaseAddress, XEMACPS_RXIPCCNT_OFFSET);
	TCPCsumErrors = XEmacPs_ReadReg(Mac.Config.BaseAddress, XEMACPS_RXTCPCCNT_OFFSET);
	UDPCsumErrors = XEmacPs_ReadReg(Mac.Config.BaseAddress, XEMACPS_RXUDPCCNT_OFFSET);

	if ((IPHdrCsumErrors != 0) || (TCPCsumErrors != 0) || (UDPCsumErrors != 0)) {
		return 0;
	}
	else
		return 1;

}
#endif


void
emacps_recv_handler(void *arg)
{
	struct pbuf *p;
	unsigned irq_status, i;
	XEmacPs_Bd *rxbdset, *CurBdPtr;
	struct xemac_s *xemac;
	xemacpsif_s *xemacpsif;
	XEmacPs_BdRing *rxring;
	struct xtopology_t *xtopologyp;
	XEmacPs *xemacps;
	volatile int bd_processed;
	int rx_bytes, k;
	unsigned int BdIndex;
	SYS_ARCH_DECL_PROTECT(lev);
	SYS_ARCH_PROTECT(lev);

	xemac = (struct xemac_s *)(arg);
	xemacpsif = (xemacpsif_s *)(xemac->state);
	rxring = &XEmacPs_GetRxRing(&xemacpsif->emacps);
	xtopologyp = &xtopology[xemac->topology_index];
	xemacps = &xemacpsif->emacps;

	/*
	 * If Reception done interrupt is asserted, call RX call back function
	 * to handle the processed BDs and then raise the according flag.
	 */

	bd_processed = XEmacPs_BdRingFromHwRx(rxring, XLWIP_CONFIG_N_RX_DESC, &rxbdset);

	if (bd_processed <= 0) {
		return;
	}
	for (k = 0, CurBdPtr=rxbdset; k < bd_processed; k++) {
		BdIndex = XEMACPS_BD_TO_INDEX(rxring, CurBdPtr);
		p = (struct pbuf *)rx_pbufs_storage[BdIndex];
		/*
		 * Adjust the buffer size to the actual number of bytes received.
		 */
		rx_bytes = XEmacPs_BdGetLength(CurBdPtr);
		pbuf_realloc(p, rx_bytes);
		Xil_DCacheInvalidateRange((unsigned int)p->payload, (unsigned)XEMACPS_MAX_FRAME_SIZE);
		//zero_tcp_ip_checksum_fields(p);
		/* store it in the receive queue,
		 * where it'll be processed by a different handler
		 */
		if (pq_enqueue(xemacpsif->recv_q, (void*)p) < 0) {
#if LINK_STATS
			lwip_stats.link.memerr++;
			lwip_stats.link.drop++;
#endif
			pbuf_free(p);
		}
		XEmacPs_BdClearRxNew (CurBdPtr);
		CurBdPtr = XEmacPs_BdRingNext( rxring, CurBdPtr);
	}
	/* free up the BD's */
	XEmacPs_BdRingFree(rxring, bd_processed, rxbdset);
	_setup_rx_bds(rxring);
	SYS_ARCH_UNPROTECT(lev);
	return;
}

void *
alloc_bdspace(int n_desc)
{
	int space = XEmacPs_BdRingMemCalc(BD_ALIGNMENT, n_desc);
	int padding = BD_ALIGNMENT*2;
	void *unaligned_mem = mem_malloc(space + padding*4);
	void *aligned_mem = (void *)(((unsigned)(unaligned_mem + BD_ALIGNMENT)) & ~(BD_ALIGNMENT - 1));

	return aligned_mem;
}

XStatus
init_dma(struct xemac_s *xemac)
{
	XEmacPs_Config *DMAConfig;
	XEmacPs_Bd BdTemplate;
	XEmacPs_BdRing *RxRingPtr, *TxRingPtr;
	XEmacPs_Bd *rxbd;
	struct pbuf *p;
	XStatus Status;
	int i;
	unsigned int BdIndex;
	xemacpsif_s *xemacpsif = (xemacpsif_s *)(xemac->state);
#if NO_SYS
	struct xtopology_t *xtopologyp = &xtopology[xemac->topology_index];
#endif

	RxRingPtr = &XEmacPs_GetRxRing(&xemacpsif->emacps);
	TxRingPtr = &XEmacPs_GetTxRing(&xemacpsif->emacps);
	LWIP_DEBUGF(NETIF_DEBUG, ("RxRingPtr: 0x%08x\r\n", RxRingPtr));
	LWIP_DEBUGF(NETIF_DEBUG, ("TxRingPtr: 0x%08x\r\n", TxRingPtr));

	xemacpsif->rx_bdspace = alloc_bdspace(XLWIP_CONFIG_N_RX_DESC);
	xemacpsif->tx_bdspace = alloc_bdspace(XLWIP_CONFIG_N_TX_DESC);
	LWIP_DEBUGF(NETIF_DEBUG, ("rx_bdspace: 0x%08x\r\n", xemacpsif->rx_bdspace));
	LWIP_DEBUGF(NETIF_DEBUG, ("tx_bdspace: 0x%08x\r\n", xemacpsif->tx_bdspace));

	if (!xemacpsif->rx_bdspace || !xemacpsif->tx_bdspace) {
		xil_printf("%s@%d: Error: Unable to allocate memory for TX/RX buffer descriptors",
				__FILE__, __LINE__);
		return XST_FAILURE;
	}

	/*
	 * Setup RxBD space.
	 *
	 * Setup a BD template for the Rx channel. This template will be copied to
	 * every RxBD. We will not have to explicitly set these again.
	 */
	XEmacPs_BdClear(&BdTemplate);

	/*
	 * Create the RxBD ring
	 */

	Status = XEmacPs_BdRingCreate(RxRingPtr, (u32) xemacpsif->rx_bdspace,
				(u32) xemacpsif->rx_bdspace, BD_ALIGNMENT,
				     XLWIP_CONFIG_N_RX_DESC);

	if (Status != XST_SUCCESS) {
		LWIP_DEBUGF(NETIF_DEBUG, ("Error setting up RxBD space\r\n"));
		return XST_FAILURE;
	}

	Status = XEmacPs_BdRingClone(RxRingPtr, &BdTemplate, XEMACPS_RECV);
	if (Status != XST_SUCCESS) {
		LWIP_DEBUGF(NETIF_DEBUG, ("Error initializing RxBD space\r\n"));
		return XST_FAILURE;
	}

	XEmacPs_BdClear(&BdTemplate);
	XEmacPs_BdSetStatus(&BdTemplate, XEMACPS_TXBUF_USED_MASK);
	/*
	 * Create the TxBD ring
	 */
	Status = XEmacPs_BdRingCreate(TxRingPtr, (u32) xemacpsif->tx_bdspace,
				(u32) xemacpsif->tx_bdspace, BD_ALIGNMENT,
				     XLWIP_CONFIG_N_TX_DESC);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* We reuse the bd template, as the same one will work for both rx and tx. */
	Status = XEmacPs_BdRingClone(TxRingPtr, &BdTemplate, XEMACPS_SEND);
	if (Status != XST_SUCCESS) {
		return ERR_IF;
	}

	/*
	 * Allocate RX descriptors, 1 RxBD at a time.
	 */
	for (i = 0; i < XLWIP_CONFIG_N_RX_DESC; i++) {
		Status = XEmacPs_BdRingAlloc(RxRingPtr, 1, &rxbd);
		if (Status != XST_SUCCESS) {
			LWIP_DEBUGF(NETIF_DEBUG, ("init_dma: Error allocating RxBD\r\n"));
			return ERR_IF;
		}

		p = pbuf_alloc(PBUF_RAW, XEMACPS_MAX_FRAME_SIZE, PBUF_POOL);
		if (!p) {
#if LINK_STATS
			lwip_stats.link.memerr++;
			lwip_stats.link.drop++;
#endif
			LWIP_DEBUGF(NETIF_DEBUG, ("unable to alloc pbuf in recv_handler\r\n"));
			return -1;
		}


		XEmacPs_BdSetAddressRx(rxbd, (u32)p->payload);
		XEmacPs_BdSetLast(rxbd);

		BdIndex = XEMACPS_BD_TO_INDEX(RxRingPtr, rxbd);
		rx_pbufs_storage[BdIndex] = (int)p;

		Xil_DCacheInvalidateRange((unsigned int)p->payload, (unsigned)XEMACPS_MAX_FRAME_SIZE);
		Xil_DCacheInvalidateRange((unsigned int)rxbd, (unsigned)sizeof (*rxbd));

		/* Enqueue to HW */
		Status = XEmacPs_BdRingToHw(RxRingPtr, 1, rxbd);
		if (Status != XST_SUCCESS) {
			LWIP_DEBUGF(NETIF_DEBUG, ("Error: committing RxBD to HW\r\n"));
			return XST_FAILURE;
		}
	}

	/*
	 * Connect the device driver handler that will be called when an
	 * interrupt for the device occurs, the handler defined above performs
	 * the specific interrupt processing for the device.
	 */
	XScuGic_RegisterHandler(INTC_BASE_ADDR, xtopologyp->scugic_emac_intr,
				(Xil_ExceptionHandler)XEmacPs_IntrHandler,
						(void *)&xemacpsif->emacps);
	/*
	 * Enable the interrupt for emacps.
	 */
	XScuGic_EnableIntr(INTC_DIST_BASE_ADDR, (u32) xtopologyp->scugic_emac_intr);
	return 0;
}
