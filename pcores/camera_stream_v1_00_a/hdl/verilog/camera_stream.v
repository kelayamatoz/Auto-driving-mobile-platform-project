// Important: find the instances of TODO


//----------------------------------------------------------------------------
// camera_stream - module
//----------------------------------------------------------------------------
// IMPORTANT:
// DO NOT MODIFY THIS FILE EXCEPT IN THE DESIGNATED SECTIONS.
//
// SEARCH FOR --USER TO DETERMINE WHERE CHANGES ARE ALLOWED.
//
// TYPICALLY, THE ONLY ACCEPTABLE CHANGES INVOLVE ADDING NEW
// PORTS AND GENERICS THAT GET PASSED THROUGH TO THE INSTANTIATION
// OF THE USER_LOGIC ENTITY.
//----------------------------------------------------------------------------
//
// ***************************************************************************
// ** Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.            **
// **                                                                       **
// ** Xilinx, Inc.                                                          **
// ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"         **
// ** AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND       **
// ** SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,        **
// ** OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,        **
// ** APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION           **
// ** THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,     **
// ** AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE      **
// ** FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY              **
// ** WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE               **
// ** IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR        **
// ** REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF       **
// ** INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       **
// ** FOR A PARTICULAR PURPOSE.                                             **
// **                                                                       **
// ***************************************************************************
//
//----------------------------------------------------------------------------
// Filename:          camera_stream
// Version:           1.00.a
// Description:       Example Axi Streaming core (Verilog).
// Date:              Wed Apr 25 21:06:10 2012 (by Create and Import Peripheral Wizard)
// Verilog Standard:  Verilog-2001
//----------------------------------------------------------------------------
// Naming Conventions:
//   active low signals:                    "*_n"
//   clock signals:                         "clk", "clk_div#", "clk_#x"
//   reset signals:                         "rst", "rst_n"
//   generics:                              "C_*"
//   user defined types:                    "*_TYPE"
//   state machine next state:              "*_ns"
//   state machine current state:           "*_cs"
//   combinatorial signals:                 "*_com"
//   pipelined or register delay signals:   "*_d#"
//   counter signals:                       "*cnt*"
//   clock enable signals:                  "*_ce"
//   internal version of output port:       "*_i"
//   device pins:                           "*_pin"
//   ports:                                 "- Names begin with Uppercase"
//   processes:                             "*_PROCESS"
//   component instantiations:              "<ENTITY_>I_<#|FUNC>"
//----------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////
//
//
// Definition of Ports
// ACLK           : Synchronous clock
// ARESETN        : System reset, active low
// S_AXIS_TREADY  : Ready to accept data in
// S_AXIS_TDATA   : Data in 
// S_AXIS_TLAST   : Optional data in qualifier
// S_AXIS_TVALID  : Data in is valid
// M_AXIS_TVALID  : Data out is valid
// M_AXIS_TDATA   : Data Out
// M_AXIS_TLAST   : Optional data out qualifier
// M_AXIS_TREADY  : Connected slave device is ready to accept data out
//
////////////////////////////////////////////////////////////////////////////////

//----------------------------------------
// Module Section
//----------------------------------------
module camera_stream 
(
    // ADD USER PORTS BELOW THIS LINE
    RST_I,  
    CLK,
    CLK_180,
    DEBUG,
    SDA_I,
    SCL_I,
    SDA_T,
    SCL_T,
    SDA_O,
    SCL_O,
    D_I,
    PCLK_I,
    MCLK_O,
    LV_I,
    FV_I,
    RST_O,
    PWDN_O,
    VDDEN_O,
    // ADD USER PORTS ABOVE THIS LINE 
    
    // DO NOT EDIT BELOW THIS LINE ////////////////////
    // Bus protocol ports, do not add or delete. 
    ACLK,
    ARESETN,
    S_AXIS_TREADY,
    S_AXIS_TDATA,
    S_AXIS_TLAST,
    S_AXIS_TVALID,
    M_AXIS_TVALID,
    M_AXIS_TDATA,
    M_AXIS_TLAST,
    M_AXIS_TREADY
    // DO NOT EDIT ABOVE THIS LINE ////////////////////
    );

// ADD USER PORTS BELOW THIS LINE 
// 24MHz differential SPI clock
input         RST_I;
input         CLK;
input         CLK_180;

// Camera Signals
input         SDA_I;
input         SCL_I;
output         SDA_T;
output         SCL_T;
output         SDA_O;
output         SCL_O;
input [7:0]   D_I;
(* BUFFER_TYPE = "BUFG" *) input         PCLK_I;
output        MCLK_O;
input         LV_I;
input         FV_I;
output        RST_O; // Active low
output        PWDN_O; // Active high
output        VDDEN_O;
// ADD USER PORTS ABOVE THIS LINE 

input                                     ACLK;
input                                     ARESETN;
output                                    S_AXIS_TREADY;
input      [31 : 0]                       S_AXIS_TDATA;
input                                     S_AXIS_TLAST;
input                                     S_AXIS_TVALID;
output                                    M_AXIS_TVALID;
output reg [31 : 0]                       M_AXIS_TDATA;
output                                    M_AXIS_TLAST;
input                                     M_AXIS_TREADY;

// you can use this signal to ascertain the state of the camera
// it is currently connected to Digilent's CamCtl module.
// read hdl/vhdl/camctl.hdl for more details on what its value means
output [7:0] DEBUG;

// these signals are also outputs of the CamCtl module
// the camera data is given as 5:6:5 RGB
wire [15:0] camera_data;
wire camera_data_valid;
wire camera_clk;

// these signals indicate to the AXI interface
// whether there is valid data in the FIFO queue
wire fifo_dout_empty;
assign M_AXIS_TVALID = ~fifo_dout_empty;

// this module never accepts input, so we
// set its AXI slave "ready" signal to 0
assign S_AXIS_TREADY  = 1'b0;


// indicate to the AXI interface when we are
// transmitting the last line of the data
reg [9:0] count;
always @(posedge ACLK) begin
    if (~ARESETN)
        count <= 10'b0;
    else if (M_AXIS_TREADY & ~fifo_dout_empty)
        count <= count + 1'd1;
    else
        count <= count;
    // TODO: implement a dffre where:
    // r = ~ARESETN
    // e = M_AXIS_TREADY & ~fifo_dout_empty
    // d = count + 1'd1
    // q = count
end
assign M_AXIS_TLAST = (count == 10'd1023);

// TODO: determine when to increment our position along the FIFO
wire fifo_inc = M_AXIS_TREADY & ~fifo_dout_empty;

// this is the data read from the FIFO, which will be sent over AXI
// it consists of two instances of the 36-bit input
wire [71:0] fifo_dout;



// TODO: assign the data to be sent over AXI according to the camera's
// data transmission format
// you should be using fifo_dout, and potentially other signals,
// depending on how you will process the data to reconstruct a frame
always @(*) begin
    if(count == 0)
        M_AXIS_TDATA = {12'b0, fifo_dout[35:16]};
        //M_AXIS_TDATA <= 32'hFFFFFFFF;
    else
        M_AXIS_TDATA = {fifo_dout[51:36], fifo_dout[15:0]};
        //M_AXIS_TDATA <= {fifo_dout[31:16], fifo_dout[15:0]};
end




// increment the pixel number of the frame, resetting to 0
// when the pixel number reaches 640x480 == 307200
reg [19:0] pixel;
always @(posedge camera_clk) begin
    if (RST_I | (pixel == 20'd307200))
        pixel <= 20'b0;
    else if (camera_data_valid)
        pixel <= pixel + 1'd1;
    else
        pixel <= pixel;
    // TODO: implement a dffre where:
    // r = RST_I | (pixel == 20'd307200)
    // e = camera_data_valid
    // d = pixel + 1'd1
    // q = pixel
end


// instance of a fifo, generated by Xilinx CoreGen
camera_fifo fifo(.rst(RST_I),
                 .wr_clk(camera_clk),
                 .rd_clk(ACLK),
                 .din({pixel, camera_data}),
                 .wr_en(camera_data_valid),
                 .rd_en(fifo_inc),
                 .dout(fifo_dout),
                 .full(),
                 .empty(fifo_dout_empty),
                 .valid()
                 );

// Digilent's CamCtl module for the VmodCAM
CamCtl camctl(.RST_I(RST_I),
              .CLK(CLK),
              .CLK_180(CLK_180),
              .D_O(camera_data),
              .PCLK_O(camera_clk),
              .DV_O(camera_data_valid),
              .SDA_O(SDA_O),
              .SDA_I(SDA_I),
              .SDA_T(SDA_T),
              .SCL_O(SCL_O),
              .SCL_I(SCL_I),
              .SCL_T(SCL_T),
              .D_I(D_I),
              .PCLK_I(PCLK_I),
              .MCLK_O(MCLK_O),
              .LV_I(LV_I),
              .FV_I(FV_I),
              .RST_O(RST_O),
              .PWDN_O(PWDN_O),
              .VDDEN_O(VDDEN_O),
              .DEBUG(DEBUG)
              );
   
endmodule
