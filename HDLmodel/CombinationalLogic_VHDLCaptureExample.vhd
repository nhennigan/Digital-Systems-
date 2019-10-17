-- Title / Description / Signal dictionary
-- Model name: CombinationalLogic_VHDLCaptureExample 
-- Description: combinational logic assignment 
-- Authors: Niamh Hennigan, National University of Ireland, Galway 
-- Date: 17/9/2019
-- Change History: Initial version

-- signal dictionary 
-- Inputs
--   s: 		1-bit control input
--   m1, m0 	1-bit data inputs
-- Outputs
--   mOut_Concurr_GateLevel 	1-bit output using concurrent statement and gate level (Boolean logic) assignment
--   mOut_IFWithDefault			1-bit output using if statement, with default assignment approach 
--   mOut_IFWithoutDefault  	1-bit output using if statement, default assignment approach 
--   mOut_Concurr_WithSelect  	1-bit output using concurrent conditional 'select/when' statement (no process required) 
--   mOut_Concurr_WhenElse		1-bit output using concurrent conditional 'when/else' statement (no process required) 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CombinationalLogic_VHDLCaptureExample is
    Port ( s    				   : in  STD_LOGIC;   
           m1   				   : in  STD_LOGIC;   
           m0   				   : in  STD_LOGIC;   
           mOut_Concurr_GateLevel  : out STD_LOGIC;
           mOut_IFWithDefault	   : out STD_LOGIC;
           mOut_IFWithoutDefault   : out STD_LOGIC;
           mOut_Concurr_WithSelect : out STD_LOGIC;
           mOut_Concurr_WhenElse   : out STD_LOGIC
          );
end CombinationalLogic_VHDLCaptureExample;

architecture combinational of CombinationalLogic_VHDLCaptureExample is

signal sInverted : std_logic; -- internal signal
signal  sm1: std_logic; -- internal signal
signal sm0 : std_logic; -- internal signal

begin

--Gate Level
sInverted_i: sInverted <= not s;
sm1_i: sm1 <= s and m1;
sm0_i: sm0 <= sInverted and m0;

mOut_Concurr_GateLevel_i: mOut_Concurr_GateLevel <= sm1 or sm0;

  
testComb_IFWithDefault_i: process (s,m1,m0)
begin
    mOut_IFWithDefault <= m1;  --default
    if s = '0' then
        mOut_IFWithDefault <= m0;
    end if;
end process;

 
mOut_IFWithoutDefault_i: process (s,m1,m0)
begin
    if s = '0' then
        mOut_IFWithoutDefault <= m0;
    else
        mOut_IFWithoutDefault <= m1;
    end if;
end process;
  

mOut_Concurr_WhenElse_i: mOut_Concurr_WhenElse <= '1'
    when sm0 = '1' or sm1 ='1'
    else '0';

end combinational;