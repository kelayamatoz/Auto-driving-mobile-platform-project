
/*
 * EE109 Starter Code
 * Spring 2012
 * Sam D'Amico
 *
 * Minor edits by Chris Copeland in 2013
 */

#include <stdio.h>
#include "xparameters.h"
#include "xil_cache.h"
#include "xintc.h"
#include "intc_header.h"
#include "xbasic_types.h"
#include "xgpio.h"
#include "gpio_header.h"
#include "xemaclite.h"
#include "xemaclite_example.h"
#include "emaclite_header.h"
#include "uartlite_header.h"
#include "xemaclite_example.h"
#include "xaxivdma.h"
#include "xaxidma.h"

// Size of the frames being sent
#define EMACLITE_TEST_FRAME_SIZE    1000

void InitVideo();

static int EmacLiteSendFrame(XEmacLite *InstancePtr, u32 PayloadSize);

static int EmacLiteRecvFrame(u32 PayloadSize);

static u8 LocalAddress[XEL_MAC_ADDR_SIZE] =
{
    0x00, 0x0A, 0x35, 0x01, 0x02, 0x03
};
static u8 RemoteAddress[XEL_MAC_ADDR_SIZE] =
{
    0x00, 0x10, 0xa4, 0xb6, 0xfd, 0x09
};


// Framebuffer for video
static XAxiVdma vdma;
static XAxiVdma_DmaSetup dmasetup;
static u32 frames[640*480*3];
static u16 camera[640*480];

// Framebuffer pointer
unsigned char *fptr;

XIntc intcInstance;

unsigned int t[] = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                    1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,1,1,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                    0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0};

int main()
{

    static XIntc intc;

    Xil_ICacheEnable();
    Xil_DCacheEnable();

    xil_printf("Testing UART output.\r\n");

    // Camera DMA Configuration
    XAxiDma_Config *dmaconf = XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID);
    XAxiDma dma;
    XAxiDma_CfgInitialize(&dma, dmaconf);
    XAxiDma_Resume(&dma);
    XAxiDma_Reset(&dma);
    while(!XAxiDma_ResetIsDone(&dma));

    // Initialize Video
    InitVideo();

    // Example camera DMA read
    // Note - transfer MUST be 4096B
    // Data format is 20-bit pixel number (stored in a 32 bit integer) followed by 16-bit RGB values
    // This will not work until you implement camera_stream.v.
    // (or at least, until you have it barely working)
    //int resdde = XAxiDma_SimpleTransfer(&dma, (u32)((unsigned char*)&camera), 4096, XAXIDMA_DEVICE_TO_DMA);
    //while(XAxiDma_Busy(&dma,XAXIDMA_DEVICE_TO_DMA));


    int Status;
    XEmacLite *EmacLiteInstPtr = &EmacLiteInstance;
    u32 PhyAddress = 0;
    RecvFrameLength = 0;
    XEmacLite_Config *ConfigPtr;

    /*
     * Initialize the EmacLite device.
     */
    ConfigPtr = XEmacLite_LookupConfig(XPAR_ETHERNET_LITE_DEVICE_ID);
    if (ConfigPtr == NULL) {
        return XST_FAILURE;
    }
    Status = XEmacLite_CfgInitialize(EmacLiteInstPtr,
                    ConfigPtr,
                    ConfigPtr->BaseAddress);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    /*
     * Set the MAC address.
     */
    XEmacLite_SetMacAddress(EmacLiteInstPtr, LocalAddress);

    /*
     * Empty any existing receive frames.
     */
    XEmacLite_FlushReceive(EmacLiteInstPtr);

    /*
     * Check if there is a TX buffer available, if there isn't it is an
     * error.
     */
    if (XEmacLite_TxBufferAvailable(EmacLiteInstPtr) != TRUE) {
        return XST_FAILURE;
    }

    /*
     * Reset the receive frame length to zero.
     */
    RecvFrameLength = 0;

    // Example program that sends packets and changes the color of an on-screen box upon receiving a packet.
    unsigned char c = 0;
    unsigned char r=0xFF, g=0x0, b=0x0;

    while(1) {
        c++;
        if(XEmacLite_IsTxDone(ConfigPtr->BaseAddress)) {
            Status = EmacLiteSendFrame(EmacLiteInstPtr, EMACLITE_TEST_FRAME_SIZE);
            if (Status != XST_SUCCESS) {
                if (XEmacLite_IsMdioConfigured(EmacLiteInstPtr)) {
                    return XST_FAILURE;
                }
            }
        }
        else {
            RecvFrameLength = XEmacLite_Recv(EmacLiteInstPtr, (u8 *)RxFrame);
            if (RecvFrameLength > 0) {
            	xil_printf("Received a packet!\r\n");
                unsigned char oldr = r;
                r=g;
                g=b;
                b=oldr;
            }
            // Example of writing data to the screen
            int x, y;
            for (x = 0; x < 20; x++)
                for (y = 0; y < 20; y++)
                    if (t[y*20 + x]) {
                        fptr[y*640*4 + x*4] = b;
                        fptr[y*640*4 + x*4 + 1] = g;
                        fptr[y*640*4 + x*4 + 2] = r;
                    }
        }
    }

    Xil_DCacheDisable();
    Xil_ICacheDisable();

    return 0;
}


void InitVideo()
{
    XAxiVdma_CfgInitialize(&vdma, XAxiVdma_LookupConfig(XPAR_AXI_VDMA_0_DEVICE_ID), XPAR_AXI_VDMA_0_BASEADDR);
    XAxiVdma_Reset(&vdma, XAXIVDMA_READ);
    while(XAxiVdma_ResetNotDone(&vdma, XAXIVDMA_READ));
    
    dmasetup.VertSizeInput = 480;
    dmasetup.HoriSizeInput = 640*4;
    dmasetup.FrameDelay = 0;
    dmasetup.EnableCircularBuf = 0;
    dmasetup.EnableSync = 0;
    dmasetup.PointNum = 0;
    dmasetup.EnableFrameCounter = 0;
    
    dmasetup.Stride = 2560;
    fptr = (unsigned char*)&frames;
    
    dmasetup.FixedFrameStoreAddr = 0;
    dmasetup.FrameStoreStartAddr[0] = (int)fptr;
    dmasetup.FrameStoreStartAddr[1] = (int)fptr+dmasetup.Stride*480;
    dmasetup.FrameStoreStartAddr[2] = (int)fptr+dmasetup.Stride*480*2;
    
    XAxiVdma_DmaConfig(&vdma, XAXIVDMA_READ, &dmasetup);
    XAxiVdma_DmaSetBufferAddr(&vdma, XAXIVDMA_READ, dmasetup.FrameStoreStartAddr);
    
    XAxiVdma_DmaStart(&vdma, XAXIVDMA_READ);
}


/******************************************************************************/
/**
*
* This function sends a frame of given size.
*
* @param    XEmacInstancePtr is a pointer to the XEmacLite instance.
* @param    PayloadSize is the size of the frame to create. The size only
*       reflects the payload size, it does not include the Ethernet
*       header size (14 bytes) nor the Ethernet CRC size (4 bytes).
*
* @return   XST_SUCCESS if successful, else a driver-specific return code.
*
* @note     None.
*
******************************************************************************/
static int EmacLiteSendFrame(XEmacLite *InstancePtr, u32 PayloadSize)
{
    u8 *FramePtr;
    int Index;
    FramePtr = (u8 *)TxFrame;

    /*
     * Set up the destination address as the local address for
     * Phy Loopback.
     */
    if (XEmacLite_IsMdioConfigured(InstancePtr)) {

        *FramePtr++ = LocalAddress[0];
        *FramePtr++ = LocalAddress[1];
        *FramePtr++ = LocalAddress[2];
        *FramePtr++ = LocalAddress[3];
        *FramePtr++ = LocalAddress[4];
        *FramePtr++ = LocalAddress[5];
    } else {
        /*
         * Fill in the valid Destination MAC address if
         * the Loopback is not enabled.
         */
        *FramePtr++ = RemoteAddress[0];
        *FramePtr++ = RemoteAddress[1];
        *FramePtr++ = RemoteAddress[2];
        *FramePtr++ = RemoteAddress[3];
        *FramePtr++ = RemoteAddress[4];
        *FramePtr++ = RemoteAddress[5];
    }

    /*
     * Fill in the source MAC address.
     */
    *FramePtr++ = LocalAddress[0];
    *FramePtr++ = LocalAddress[1];
    *FramePtr++ = LocalAddress[2];
    *FramePtr++ = LocalAddress[3];
    *FramePtr++ = LocalAddress[4];
    *FramePtr++ = LocalAddress[5];

    /*
     * Set up the type/length field - be sure its in network order.
     */
    *((u16 *)FramePtr) = Xil_Htons(PayloadSize);
    FramePtr++;
    FramePtr++;

    /*
     * Now fill in the data field with known values so we can verify them
     * on receive.
     */
    for (Index = 0; Index < PayloadSize; Index++) {
        *FramePtr++ = (u8)Index;
    }

    /*
     * Now send the frame.
     */
    return XEmacLite_Send(InstancePtr, (u8 *)TxFrame,
                PayloadSize + XEL_HEADER_SIZE);
}

/******************************************************************************/
/**
*
* This function receives a frame of given size. This function assumes interrupt
* mode, receives the frame and verifies its contents.
*
* @param    PayloadSize is the size of the frame to receive.
*       The size only reflects the payload size, it does not include the
*       Ethernet header size (14 bytes) nor the Ethernet CRC size (4
*       bytes).
*
* @return   XST_SUCCESS if successful, a driver-specific return code if not.
*
* @note     None.
*
******************************************************************************/
static int EmacLiteRecvFrame(u32 PayloadSize)
{
    u8 *FramePtr;

    /*
     * This assumes MAC does not strip padding or CRC.
     */
    if (RecvFrameLength != 0) {
        int Index;

        /*
         * Verify length, which should be the payload size.
         */
        if ((RecvFrameLength- (XEL_HEADER_SIZE + XEL_FCS_SIZE)) !=
                PayloadSize) {
            return XST_LOOPBACK_ERROR;
        }

        /*
         * Verify the contents of the Received Frame.
         */
        FramePtr = (u8 *)RxFrame;
        FramePtr += XEL_HEADER_SIZE;    /* Get past the header */

        for (Index = 0; Index < PayloadSize; Index++) {
            if (*FramePtr++ != (u8)Index) {
                return XST_LOOPBACK_ERROR;
            }
        }
    }

    return XST_SUCCESS;
}
