library IEEE;
use IEEE.STD_LOGIC_1164.all; 

entity WashingMachine_Tb is 
end WashingMachine_Tb;

architecture Stimulus of WashingMachine_Tb is

	-- In Signals
	signal s_clk : std_logic;
	signal s_sw	 : std_logic_vector(5 downto 0);

	-- Out Signals --
	signal s_ledg : std_logic_vector(8 downto 8);
	signal s_ledr : std_logic_vector(3 downto 0);
	signal s_hex4 : std_logic_vector(6 downto 0);
	signal s_hex5 : std_logic_vector(6 downto 0);
	signal s_hex6 : std_logic_vector(6 downto 0);
	signal s_hex7 : std_logic_vector(6 downto 0);
				
	begin
	
		uut : entity work.WashingMachine(Shell)
					port map(-- In --
								CLOCK_50 =>	s_clk,
								SW			=> s_sw,  		
								-- Out --
								LEDG 		=> s_ledg,
								LEDR 		=> s_ledr,
								HEX4 		=> s_hex4,
								HEX5 		=> s_hex5,
								HEX6 		=> s_hex6,
								HEX7 		=> s_hex7);
								
								
										
		clock_proc : process
		begin
			s_clk <= '0'; 
			wait for 100 ns;
			s_clk <= '1'; 
			wait for 100 ns;
		end process;
		
	-- RTL Simulation: ~6400 ns
		stim_proc : process
		begin
			
		-- SW(5): Select | SW(4): Select | SW(3): Start | SW(2): Door | SW(1): Reset | SW(0): Turn On	
			
			s_sw <= "001101";
			wait for 1000 ns;
			s_sw <= "001111";
			wait for 300 ns;
			
			s_sw <= "011101";
			wait for 1000 ns;
			s_sw <= "011111";
			wait for 300 ns;
			
			s_sw <= "101101";
			wait for 1000 ns;
			s_sw <= "101111";
			wait for 300 ns;

			s_sw <= "111101";
			wait for 1000 ns;
			s_sw <= "111111";
			wait for 300 ns;
			
			s_sw <= "010101";
			wait for 300 ns;
			
			s_sw <= "011001";
			wait for 300 ns;
			
			s_sw <= "011100";
			wait for 300 ns;
			
			s_sw <= "011111";
			wait for 300 ns;

			
		end process;
end Stimulus;
