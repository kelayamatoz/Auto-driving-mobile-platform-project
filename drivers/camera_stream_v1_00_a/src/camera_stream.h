/*****************************************************************************
* Filename:          /home/sam/atlys-bsb/drivers/camera_stream_v1_00_a/src/camera_stream.h
* Version:           1.00.a
* Description:       camera_stream () Driver Header File
* Date:              Wed Apr 25 21:06:10 2012 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef CAMERA_STREAM_H
#define CAMERA_STREAM_H

#include "xstatus.h"

#include "fsl.h" 
#define write_into_fsl(val, id)  putfsl(val, id)
#define read_from_fsl(val, id)  getfsl(val, id)

/*
* A macro for accessing AXI4STREAM peripheral.
*
* This example driver writes all the data in the input arguments
* into the input AXI4STREAM bus through blocking writes. AXI4STREAM peripheral will
* automatically read from the AXI4STREAM bus. Once all the inputs
* have been written, the output from the AXI4STREAM peripheral is read
* into output arguments through blocking reads.
*
* Arguments:
*	 input_slot_id
*		 Compile time constant indicating AXI4STREAM (FSL) slot from
*		 which coprocessor read the input data. Defined in
*		 xparameters.h .
*	 output_slot_id
*		 Compile time constant indicating AXI4STREAM (FSL) slot into
*		 which the coprocessor write output data. Defined in
*		 xparameters.h .
*	 input_0    An array of unsigned integers. Array size is 8
*	 output_0   An array of unsigned integers. Array size is 32
*
* Caveats:
*    The output_slot_id and input_slot_id arguments must be
*    constants available at compile time. Do not pass
*    variables for these arguments.
*
*    Since this is a macro, using it too many times will
*    increase the size of your application. In such cases,
*    or when this macro is too simplistic for your
*    application you may want to create your own instance
*    specific driver function (not a macro) using the 
*    macros defined in this file and the slot
*    identifiers defined in xparameters.h .  Please see the
*    example code (camera_stream_selftest.c) for details.
*/

#define  camera_stream(\
		 input_slot_id,\
		 output_slot_id,\
		 input_0,      \
		 output_0       \
		 )\
{\
   int i;\
\
   for (i=0; i<8; i++)\
   {\
      write_into_fsl(input_0[i], input_slot_id);\
   }\
\
   for (i=0; i<32; i++)\
   {\
      read_from_fsl(output_0[i], output_slot_id);\
   }\
}

XStatus CAMERA_STREAM_SelfTest();

#endif 
