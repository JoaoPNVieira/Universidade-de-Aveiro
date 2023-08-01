library IEEE;
use IEEE.STD_LOGIC_1164.all; 

entity Bin7SegDec_Timer_Tb is 
end Bin7SegDec_Timer_Tb;

architecture Stimulus of Bin7SegDec_Timer_Tb is

	-- In Signals
	signal s_clk, s_en : std_logic;
	signal s_uni : std_logic_vector(3 downto 0);
	signal s_doz : std_logic_vector(2 downto 0);
	-- Out Signals --
	signal s_hex1, s_hex2 : std_logic_vector(6 downto 0);

	
	begin
	
		uut : entity work.Bin7SegDec_Timer(Behavior)
					port map(-- In --
								enable	=> s_en,
								inUnit 	=> s_uni,
								inDoz	   => s_doz,
								-- Out --
								decUnit	=> s_hex1,
								decDoz	=> s_hex2);
								
								
										
		clock_proc : process
		begin
			s_clk <= '0'; 
			wait for 100 ns;
			s_clk <= '1'; 
			wait for 100 ns;
		end process;
		
	-- RTL Simulation: 5400 ns
		stim_proc : process
		begin
			
			s_en	<= '1' ;
			s_uni	<= "0001" ;
			s_doz	<= "001";
			
			wait for 300 ns;
			
			s_en	<= '1' ;
			s_uni	<= "0010" ;
			s_doz	<= "010";
			
			wait for 300 ns;
			
			s_en	<= '1' ;
			s_uni	<= "0011" ;
			s_doz	<= "011";
			
			wait for 300 ns;
			
			s_en	<= '1' ;
			s_uni	<= "0100" ;
			s_doz	<= "100";
			
			wait for 300 ns;
			
			s_en	<= '1' ;
			s_uni	<= "0101" ;
			s_doz	<= "101";
			
			wait for 300 ns;
			
			s_en	<= '1' ;
			s_uni	<= "0110" ;
			s_doz	<= "110";
			
			wait for 300 ns;

			s_en	<= '1' ;
			s_uni	<= "0111" ;
			s_doz	<= "111";
			
			wait for 300 ns;

			s_en	<= '0' ;
			s_uni	<= "0111" ;
			s_doz	<= "111";
			
			wait for 600 ns;

			s_en	<= '1' ;
			s_uni	<= "1000" ;
			s_doz	<= "000";
			
			wait for 300 ns;

			s_en	<= '1' ;
			s_uni	<= "1001" ;
			s_doz	<= "000";
			
			wait for 300 ns;

			s_en	<= '1' ;
			s_uni	<= "1010" ;
			s_doz	<= "000";
			
			wait for 300 ns;

			s_en	<= '1' ;
			s_uni	<= "1011" ;
			s_doz	<= "000";
			
			wait for 300 ns;

			s_en	<= '1' ;
			s_uni	<= "1100" ;
			s_doz	<= "000";
			
			wait for 300 ns;

			s_en	<= '1' ;
			s_uni	<= "1101" ;
			s_doz	<= "000";
			
			wait for 300 ns;

			s_en	<= '1' ;
			s_uni	<= "1110" ;
			s_doz	<= "000";
			
			wait for 300 ns;
			
			s_en	<= '1' ;
			s_uni	<= "1111" ;
			s_doz	<= "000";
			
			wait for 300 ns;
		end process;
end Stimulus;
