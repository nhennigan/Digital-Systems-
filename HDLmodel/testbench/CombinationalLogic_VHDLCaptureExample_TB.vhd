
-- Title / Description / Signal dictionary
-- Model name: CombinationalLogic_VHDLCaptureExample_TB_TB  
-- Description: Testbench for combinational logic example
-- Authors: Fearghal Morgan, National University of Ireland, Galway 
-- Date: 16/9/2019
-- Change History: Initial version

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY CombinationalLogic_VHDLCaptureExample_TB IS END CombinationalLogic_VHDLCaptureExample_TB;
 
ARCHITECTURE behavior OF CombinationalLogic_VHDLCaptureExample_TB IS 
COMPONENT CombinationalLogic_VHDLCaptureExample is
    Port ( s    				   : in  STD_LOGIC;   
           m1   				   : in  STD_LOGIC;   
           m0   				   : in  STD_LOGIC;   
           mOut_Concurr_GateLevel  : out STD_LOGIC;
           mOut_IFWithDefault	   : out STD_LOGIC;
           mOut_IFWithoutDefault   : out STD_LOGIC;
           mOut_Concurr_WithSelect : out STD_LOGIC;
           mOut_Concurr_WhenElse   : out STD_LOGIC
          );
END COMPONENT;

signal s                        : std_logic; 
signal m1                       : std_logic; 
signal m0                       : std_logic; 
signal mOut_Concurr_GateLevel   : std_logic; 
signal mOut_IFWithDefault	    : STD_LOGIC; 
signal mOut_IFWithoutDefault    : STD_LOGIC; 
signal mOut_Concurr_WithSelect  : STD_LOGIC;  
signal mOut_Concurr_WhenElse    : STD_LOGIC;
signal testNo                  : integer; -- test numbers aids locating each simulation waveform test 
signal endOfSim                : boolean := false;  -- assert at end of simulation to show end point
 
BEGIN

uut: CombinationalLogic_VHDLCaptureExample PORT MAP -- Instantiate the Unit Under Test (UUT)
	(s    				     => s,    				      
     m1   				     => m1,   		 
     m0   				     => m0,   		 
	 mOut_Concurr_GateLevel  => mOut_Concurr_GateLevel,
	 mOut_IFWithDefault	     => mOut_IFWithDefault,     
	 mOut_IFWithoutDefault   => mOut_IFWithoutDefault,
	 mOut_Concurr_WithSelect => mOut_Concurr_WithSelect,
	 mOut_Concurr_WhenElse   => mOut_Concurr_WhenElse  
	 );

stim_i: process -- Stimulus process
-- variable value changes immediately on assignment in process  
-- Use tempVec to define the TB i/p signal vector sel, muxIn1, muxIn0
variable tempVec : std_logic_vector(2 downto 0); 
begin
    report "%N : Simulation start";
    endOfSim <= false;
    testNo <= 0; 
    
     for i in 0 to 7 loop
         tempVec := std_logic_vector(TO_UNSIGNED(i, 3)); -- generate 3-bit vector
         s    <= tempVec(2);  -- assign variable bits to the mux2_1 input signals
         m1 <= tempVec(1);
         m0 <= tempVec(0);
         wait for 10 ns;        -- delay, time progresses in simulation 
       end loop; 
   
       testNo <= 1; -- test number 
       s    <= '0';  -- clear all inputs
       m1 <= '0';  
       m0 <= '0';  
       wait for 10 ns; 
   

    endOfSim <= true;
    report "%N : Simulation end";

	wait;
	
end process;

END behavior;