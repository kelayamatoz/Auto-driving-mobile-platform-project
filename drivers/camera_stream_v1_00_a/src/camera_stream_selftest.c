/*****************************************************************************
* Filename:          /home/sam/atlys-bsb/drivers/camera_stream_v1_00_a/src/camera_stream_selftest.c
* Version:           1.00.a
* Description:       
* Date:              Wed Apr 25 21:06:10 2012 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#include "xparameters.h"
#include "camera_stream.h"

/* IMPORTANT:
*  Slot ID is hard coded in this example to 0. Modify it if needs to connected to different slot.
*/
#define input_slot_id   0
#define output_slot_id  0

XStatus CAMERA_STREAM_SelfTest()
{
	 unsigned int input_0[8];     
	 unsigned int output_0[32];     

	 //Initialize your input data over here: 
	 input_0[0] = 12345;     
	 input_0[1] = 24690;     
	 input_0[2] = 37035;     
	 input_0[3] = 49380;     
	 input_0[4] = 61725;     
	 input_0[5] = 74070;     
	 input_0[6] = 86415;     
	 input_0[7] = 98760;     

	 //Call the macro with instance specific slot IDs
	 camera_stream(
		 input_slot_id,
		 output_slot_id,
		 input_0,      
		 output_0       
		 );

	 if (output_0[0] != 444420)
		 return XST_FAILURE;
	 if (output_0[31] != 444420)
		 return XST_FAILURE;

	 return XST_SUCCESS;
}
