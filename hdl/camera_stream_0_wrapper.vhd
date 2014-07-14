-------------------------------------------------------------------------------
-- camera_stream_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library camera_stream_v1_00_a;
use camera_stream_v1_00_a.all;

entity camera_stream_0_wrapper is
  port (
    ACLK : in std_logic;
    ARESETN : in std_logic;
    S_AXIS_TREADY : out std_logic;
    S_AXIS_TDATA : in std_logic_vector(31 downto 0);
    S_AXIS_TLAST : in std_logic;
    S_AXIS_TVALID : in std_logic;
    M_AXIS_TVALID : out std_logic;
    M_AXIS_TDATA : out std_logic_vector(31 downto 0);
    M_AXIS_TLAST : out std_logic;
    M_AXIS_TREADY : in std_logic;
    RST_I : in std_logic;
    CLK : in std_logic;
    CLK_180 : in std_logic;
    D_I : in std_logic_vector(7 downto 0);
    PCLK_I : in std_logic;
    MCLK_O : out std_logic;
    LV_I : in std_logic;
    FV_I : in std_logic;
    RST_O : out std_logic;
    PWDN_O : out std_logic;
    VDDEN_O : out std_logic;
    DEBUG : out std_logic_vector(7 downto 0);
    SDA_I : in std_logic;
    SDA_O : out std_logic;
    SDA_T : out std_logic;
    SCL_I : in std_logic;
    SCL_O : out std_logic;
    SCL_T : out std_logic
  );
end camera_stream_0_wrapper;

architecture STRUCTURE of camera_stream_0_wrapper is

  component camera_stream is
    port (
      ACLK : in std_logic;
      ARESETN : in std_logic;
      S_AXIS_TREADY : out std_logic;
      S_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S_AXIS_TLAST : in std_logic;
      S_AXIS_TVALID : in std_logic;
      M_AXIS_TVALID : out std_logic;
      M_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M_AXIS_TLAST : out std_logic;
      M_AXIS_TREADY : in std_logic;
      RST_I : in std_logic;
      CLK : in std_logic;
      CLK_180 : in std_logic;
      D_I : in std_logic_vector(7 downto 0);
      PCLK_I : in std_logic;
      MCLK_O : out std_logic;
      LV_I : in std_logic;
      FV_I : in std_logic;
      RST_O : out std_logic;
      PWDN_O : out std_logic;
      VDDEN_O : out std_logic;
      DEBUG : out std_logic_vector(7 downto 0);
      SDA_I : in std_logic;
      SDA_O : out std_logic;
      SDA_T : out std_logic;
      SCL_I : in std_logic;
      SCL_O : out std_logic;
      SCL_T : out std_logic
    );
  end component;

begin

  camera_stream_0 : camera_stream
    port map (
      ACLK => ACLK,
      ARESETN => ARESETN,
      S_AXIS_TREADY => S_AXIS_TREADY,
      S_AXIS_TDATA => S_AXIS_TDATA,
      S_AXIS_TLAST => S_AXIS_TLAST,
      S_AXIS_TVALID => S_AXIS_TVALID,
      M_AXIS_TVALID => M_AXIS_TVALID,
      M_AXIS_TDATA => M_AXIS_TDATA,
      M_AXIS_TLAST => M_AXIS_TLAST,
      M_AXIS_TREADY => M_AXIS_TREADY,
      RST_I => RST_I,
      CLK => CLK,
      CLK_180 => CLK_180,
      D_I => D_I,
      PCLK_I => PCLK_I,
      MCLK_O => MCLK_O,
      LV_I => LV_I,
      FV_I => FV_I,
      RST_O => RST_O,
      PWDN_O => PWDN_O,
      VDDEN_O => VDDEN_O,
      DEBUG => DEBUG,
      SDA_I => SDA_I,
      SDA_O => SDA_O,
      SDA_T => SDA_T,
      SCL_I => SCL_I,
      SCL_O => SCL_O,
      SCL_T => SCL_T
    );

end architecture STRUCTURE;

