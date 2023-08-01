-- WashingFSM Testbench

library IEEE;
use IEEE.STD_LOGIC_1164.all; 

entity WashingFSM_Tb is 
end WashingFSM_Tb;

architecture Stimulus of WashingFSM_Tb is

	signal s_clk, s_start, s_res, s_change, s_timeEn : std_logic;
	signal s_valve, s_pump, s_rinse, s_spin, s_finish : std_logic;
	signal s_jump, s_prog, s_rep : std_logic_vector(1 downto 0);
	signal s_timeReq : std_logic_vector(3 downto 0);
	
	begin
	
		uut : entity work.WashingFSM(Behavior)
					port map(-- In --
								clock 		=> s_clk,
								enable		=>	s_start,
								reset 		=>	s_res,
								inData 		=>	s_prog, 	
								change		=>	s_change, 	
								jump			=>	s_jump,		
								-- Out --
								timerEn		=>	s_timeEn,  
								timerReq		=> s_timeReq,		
								water_valve => s_valve,
								water_pump	=> s_pump,
								rinse			=> s_rinse,
								spin			=> s_spin,
								finish 		=> s_finish,
								repeat		=> s_rep);
								
								
										
		clock_proc : process
		begin
			s_clk <= '0'; 
			wait for 100 ns;
			s_clk <= '1'; 
			wait for 100 ns;
		end process;
		
		
	-- RTL Simulation: 5000 ns
		stim_proc : process
		begin
			
			-- Ideal Conditions: s_prog pass
			
			s_start 	<= '1' ;
			s_res		<= '0' ;
			s_prog	<= "11";
			s_change	<= '0' ;
			s_jump	<= "00";
			
			wait for 350 ns ; -- Ideal Conditions: s_prog pass
			
			s_start 	<= '1' ;
			s_res		<= '0' ;
			s_prog	<= "10";
			s_change	<= '0' ;
			s_jump	<= "00";
			
			wait for 350 ns ; -- Ideal Conditions: s_prog pass
						
			s_start 	<= '1' ;
			s_res		<= '0' ;
			s_prog	<= "01";
			s_change	<= '0' ;
			s_jump	<= "00";						
			
			wait for 350 ns ; -- Reset test
						
			s_start 	<= '1' ;
			s_res		<= '1' ;
			s_prog	<= "01";
			s_change	<= '0' ;
			s_jump	<= "00";	

			wait for 350 ns ; -- Enable test
						
			s_start 	<= '0' ;
			s_res		<= '0' ;
			s_prog	<= "01";
			s_change	<= '0' ;
			s_jump	<= "00";
			
			wait for 350 ns ; -- Begin: change & jump test
						
			s_start 	<= '1' ;
			s_res		<= '0' ;
			s_prog	<= "01";
			s_change	<= '1' ;
			s_jump	<= "00";
			
			wait for 350 ns ;
						
			s_start 	<= '1' ;
			s_res		<= '0' ;
			s_prog	<= "01";
			s_change	<= '1' ;
			s_jump	<= "01";
						
			wait for 350 ns ;
						
			s_start 	<= '1' ;
			s_res		<= '0' ;
			s_prog	<= "01";
			s_change	<= '1' ;
			s_jump	<= "11";						

			wait for 350 ns ; -- 
						
			s_start 	<= '1' ;
			s_res		<= '0' ;
			s_prog	<= "01";
			s_change	<= '1' ;
			s_jump	<= "10";
			
			wait for 350 ns ;
						
			s_start 	<= '1' ;
			s_res		<= '0' ;
			s_prog	<= "11";
			s_change	<= '1' ;
			s_jump	<= "01";
			
			wait for 350 ns ;
						
			s_start 	<= '1' ;
			s_res		<= '0' ;
			s_prog	<= "11";
			s_change	<= '1' ;
			s_jump	<= "10";
			
			wait for 350 ns; -- END
		end process;
end Stimulus;
