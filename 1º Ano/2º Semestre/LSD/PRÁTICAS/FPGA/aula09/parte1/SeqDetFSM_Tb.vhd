library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SeqDetFSM_Tb is
end SeqDetFSM_Tb;

architecture Stimulus of SeqDetFSM_Tb is

	-- Sinais de entrada UUT
	signal s_reset, s_xIn : std_logic;
	
	--Sinais de saida UUT
	signal s_yOut : std_logic;

begin
	-- Instanciação UUT
	utt : entity work.SeqDetFSM(MealyArch)
			port map(reset	=> s_reset,
						xIn	=>	s_xIn,
						yOut	=> s_yOut);
	
	-- Process stim
	stim_proc : process
	begin
		wait for 100ns;
		
		s_xIn <= '0'; -- A
		wait for 100ns;
			
		s_xIn <= '1'; -- B
		wait for 100ns;
		
		s_xIn <= '1'; -- B
		wait for 100ns;
		
		s_xIn <= '0'; -- C
		wait for 100ns;
		
		s_xIn <= '1'; -- B
		wait for 100ns; 
		
		s_xIn <= '0'; -- C
		wait for 100ns;
		
		s_xIn <= '0'; -- D
		wait for 100ns;
		
		s_xIn <= '0'; -- A
		wait for 100ns;
		
		s_xIn <= '1'; -- B
		wait for 100ns; 
		
		s_xIn <= '0'; -- C
		wait for 100ns;
		
		s_xIn <= '0'; -- D
		wait for 100ns;
		
		S_xIn <= '1'; -- B & zOut = 1
		wait for 100ns;
		
		s_xIn <= '0'; -- C
		wait for 100ns;
		
		s_xIn <= '0'; -- D
		wait for 100ns;
		
		S_xIn <= '1'; -- B & zOut = 1
		wait for 300ns;
		
		-- Tempo de Testbench: 1400 + 300 = 1700NS
		-- Tempo de Testbench (final recomendado): 2000ns
	end process;
end Stimulus;
		
		
		