##############################################################################
## Filename:          /home/sam/atlys-bsb/drivers/camera_v1_00_a/data/camera_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Wed Apr 25 09:15:00 2012 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "camera" "NUM_INSTANCES" "DEVICE_ID" "C_S_AXI_MEM0_BASEADDR" "C_S_AXI_MEM0_HIGHADDR" 
}
