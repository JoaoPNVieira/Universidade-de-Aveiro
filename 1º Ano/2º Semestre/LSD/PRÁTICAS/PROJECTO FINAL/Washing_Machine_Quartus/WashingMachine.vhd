-- TOP LEVEL

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity WashingMachine is
	port(	CLOCK_50	: in  std_logic; -- GLOBAL
			SW   		: in  std_logic_vector(5 downto 0);
			LEDG 		: out std_logic_vector(7 downto 7);
			LEDR 		: out std_logic_vector(17 downto 0);
			HEX4 		: out std_logic_vector(6 downto 0);
			HEX5 		: out std_logic_vector(6 downto 0);
			HEX6 		: out std_logic_vector(6 downto 0);
			HEX7 		: out std_logic_vector(6 downto 0));
end WashingMachine;

architecture Shell of WashingMachine is
	
	-- Signal creation - by decending order:
	--
	-- [ControlPanel]
		-- New signals
		signal s_clk, s_turnOn, s_inReset, s_door, s_inStart : std_logic;	
		signal s_sel, s_program : std_logic_vector(1 downto 0);
		signal s_outReset, s_outStart : std_logic;
		signal s_outOn, s_outRes, s_outDoor, s_outStr : std_logic;
		
	-- [WashingFSM]
		--	New signals
		signal s_change, s_timerEn : std_logic;
		signal s_jump, s_repeat : std_logic_vector(1 downto 0);
		signal s_timerReq : std_logic_vector(3 downto 0);

	-- [Pulser]
		-- New signals
		signal s_pulse : std_logic;
			
	-- [RMan | Timer_Register | Timer]
		-- New signals
		signal s_reset, s_resetOut, s_timeReset : std_logic;
		signal s_countDoz : std_logic_vector(2 downto 0);
		signal s_countUnit, s_unitOut : std_logic_vector(3 downto 0);
		
begin

			s_clk 		<= CLOCK_50;
			s_turnOn 	<= SW(0);
			s_inReset 	<= SW(1);
			s_door		<= SW(2);
			s_inStart	<= SW(3);
			s_sel			<= SW(5 downto 4);

			
	
		control:		entity work.ControlPanel(Behavior) -- OK
							port map(-- In --
										clock 	=> s_clk,
										turnOn 	=> s_turnOn,
										inReset 	=> s_inReset,			
										door 		=> s_door,
										inStart	=> s_inStart,
										sel		=> s_sel, 	
										-- Out --
										outReset => s_outReset,
										program	=> s_program,
										outStart	=> s_outStart,
										outOn		=> LEDR(0),
										outRes	=> LEDR(1),
										outDoor	=> LEDR(2),
										outStr	=> LEDR(3));
									
								
								
			fsm:		entity work.WashingFSM(Behavior) -- OK
							port map(-- In --
										clock 		=> s_clk,
										enable		=>	s_outStart,
										reset 		=>	s_outReset,
										inData 		=>	s_program,	
										change		=>	s_change, 	
										jump			=>	s_jump,		
										-- Out --
										timerEn		=>	s_timerEn,  
										timerReq		=> s_timerReq,		
										water_valve => LEDR(17),
										water_pump	=> LEDR(16),
										rinse			=> LEDR(15),
										spin			=> LEDR(14),
										finish 		=> LEDG(7),
										repeat		=> s_repeat);
									
									
									
	statejumps:		entity work.JumpRegister(Behavior) -- OK
							port map(-- In --
										clock 		=> s_clk,
										enable		=> s_outStart,
										jumpIn		=> s_repeat,
										-- Out --
										jumpOut		=> s_jump);
										
										
										
	display_prog:	entity work.Bin7SegDecProg(Behavior) -- OK
							port map(-- In --
										enable		=> s_outStart,
										binSel   	=> s_program,
										-- Out --
										decProg		=> HEX7, 
										decOutSel	=> HEX6);
								
								
								
			pulse:	entity work.Pulser(Behavior) -- OK
							port map(-- In --
										clock 		=> s_clk,
										reset 		=> s_outReset,
										-- Out --
										pulse 		=> s_pulse);
										
										
										
			RMan:		entity work.RMan(Behavior) -- OK
							port map(-- In --
										clock 		=> s_clk,
										globRes 		=> s_outReset,
										tRes			=> s_resetOut, 
										-- Out --
										reset			=> s_reset);
										
										
										
		timereg:		entity work.Timer_Register(Behavior) -- OK
							port map(-- In --
										clock 		=> s_clk,
										enable		=> s_timerEn,
										resetIn		=> s_timeReset,
										unitIn		=> s_countUnit,
										-- Out --
										resetOut		=> s_resetOut,
										unitOut		=>	s_unitOut);
										
										
										
			timer:	entity work.Timer(Behavior) -- OK
							port map(-- In --
										clock 		=> s_pulse,
										reset 		=> s_reset,
										enable		=> s_timerEn,
										inTime		=> s_timerReq,
										inUnit		=> s_unitOut,
										-- Out --
										countUnit 	=> s_countUnit,
										countDoz		=> s_countDoz,
										change		=> s_change,
										timeReset	=> s_timeReset);
										
										
										
	display_time:	entity work.Bin7SegDec_Timer(Behavior) 
							port map(-- In --
										enable		=> s_timerEn,
										inUnit 		=> s_countUnit,
										inDoz	   	=> s_countDoz,
										-- Out --
										decUnit		=> HEX4,
										decDoz		=> HEX5);
										
										
		
end Shell;
	