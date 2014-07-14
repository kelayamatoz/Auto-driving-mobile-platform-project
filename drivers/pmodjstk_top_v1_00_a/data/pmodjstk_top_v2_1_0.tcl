##############################################################################
## Filename:          /afs/ir.stanford.edu/class/ee109/groups/6/jstk/drivers/pmodjstk_top_v1_00_a/data/pmodjstk_top_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Fri May 24 16:57:55 2013 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "pmodjstk_top" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
