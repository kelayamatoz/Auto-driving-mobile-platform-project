/*****************************************************************************
* Filename:          /home/sam/atlys-bsb/drivers/camera_v1_00_a/src/camera.h
* Version:           1.00.a
* Description:       camera Driver Header File
* Date:              Wed Apr 25 09:15:00 2012 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef CAMERA_H
#define CAMERA_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"

/************************** Constant Definitions ***************************/


/**************************** Type Definitions *****************************/


/**
 *
 * Write/Read 32 bit value to/from CAMERA user logic memory (BRAM).
 *
 * @param   Address is the memory address of the CAMERA device.
 * @param   Data is the value written to user logic memory.
 *
 * @return  The data from the user logic memory.
 *
 * @note
 * C-style signature:
 * 	void CAMERA_mWriteMemory(Xuint32 Address, Xuint32 Data)
 * 	Xuint32 CAMERA_mReadMemory(Xuint32 Address)
 *
 */
#define CAMERA_mWriteMemory(Address, Data) \
 	Xil_Out32(Address, (Xuint32)(Data))
#define CAMERA_mReadMemory(Address) \
 	Xil_In32(Address)

/************************** Function Prototypes ****************************/


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the CAMERA instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus CAMERA_SelfTest(void * baseaddr_p);

#endif /** CAMERA_H */
