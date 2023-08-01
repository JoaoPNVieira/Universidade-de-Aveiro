library IEEE;
use IEEE.STD_LOGIC_1164.all; 

entity Timer_Tb is 
end Timer_Tb;

architecture Stimulus of Timer_Tb is

	-- In Signals
	signal s_clk, s_res, s_timeEn, s_timeRes : std_logic;
	signal s_time : std_logic_vector(3 downto 0);

	-- Out Signals --
	signal s_change: std_logic;
	signal s_unit : std_logic_vector(3 downto 0); 
	signal s_doz : std_logic_vector(2 downto 0);

	
	begin
	
		uut :	entity work.Timer(Behavior)
					port map(-- In --
								clock 		=> s_clk,
								reset 		=> s_res,
								enable		=> s_timeEn,
								inTime		=> s_time,
								inUnit		=> s_unit,
								-- Out --
								countUnit 	=> s_unit,
								countDoz		=> s_doz,
								change		=> s_change,
								timeReset	=> s_timeRes);
								
								
										
		clock_proc : process
		begin
			s_clk <= '0'; 
			wait for 50 ns;
			s_clk <= '1'; 
			wait for 50 ns;
		end process;
		
		
		
	-- RTL Simulation: 3000 ns
		stim_proc : process
		begin
			
			s_res		<= '0';
			s_timeEn <= '1';
			s_time	<= "0111" ;
				
			wait for 800 ns;
			
			s_res		<= '1';
			s_timeEn <= '1';
			s_time	<= "1010" ;
			
			wait for 200 ns;
			
			s_res		<= '0';
			s_timeEn <= '1';
			s_time	<= "1010" ;
			
			wait for 2000 ns;
		end process;
end Stimulus;
