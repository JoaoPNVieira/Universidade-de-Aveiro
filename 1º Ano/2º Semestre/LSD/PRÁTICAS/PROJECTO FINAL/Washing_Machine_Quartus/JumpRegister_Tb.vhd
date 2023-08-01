library IEEE;
use IEEE.STD_LOGIC_1164.all; 

entity JumpRegister_Tb is 
end JumpRegister_Tb;

architecture Stimulus of JumpRegister_Tb is

	-- In Signals
	signal s_clk, s_en : std_logic;
	signal s_jIn : std_logic_vector(1 downto 0);

	-- Out Signals --
	signal s_jOut : std_logic_vector(1 downto 0);

	
	begin
	
		uut : entity work.JumpRegister(Behavior)
					port map(-- In --
								clock 	=> s_clk,
								enable	=> s_en,
								jumpIn	=> s_jIn,
								-- Out --
								jumpOut	=> s_jOut);
								
								
								
		clock_proc : process
		begin
			s_clk <= '0'; 
			wait for 100 ns;
			s_clk <= '1'; 
			wait for 100 ns;
		end process;
		
		
		
	-- RTL Simulation: 1500 ns
		stim_proc : process
		begin
			
			s_en	<= '1' ;
			s_jIn <= "00";
			
			wait for 300 ns;
			
			s_en	<= '1' ;
			s_jIn <= "01";
				
			wait for 300 ns;
			
			s_en	<= '1' ;
			s_jIn <= "10";
				
			wait for 300 ns;
			
			s_en	<= '1' ;
			s_jIn <= "11";
				
			wait for 300 ns;
			
			s_en	<= '1' ;
			s_jIn <= "01";
				
			wait for 300 ns;
		end process;
end Stimulus;
