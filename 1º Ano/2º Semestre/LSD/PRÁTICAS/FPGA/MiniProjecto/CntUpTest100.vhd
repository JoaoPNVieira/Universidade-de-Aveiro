-- Testbench do componente CntUp100

library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entidade sem portos
entity CntUpTest100 is
end CntUpTest100;



architecture Stimulus of CntUpTest100 is

	-- Sinais para ligar às entradas da uut
	signal s_clk, s_reset, s_enable : std_logic;
	-- Sinal para ligar às saídas da uut
	signal s_count : std_logic_vector(6 downto 0);

begin
	-- Instanciação da UUT
	uut : entity work.CntUp100(Behavioral)
				port map(clk 		=> s_clk,
							reset 	=> s_reset,
							enable 	=> s_enable,
							count 	=> s_count);
	
	-- Processo de  clock: (Rising Edge)
	-- Janela de 10000 ns: (recomendado)
	
	clock_proc : process
	begin
		s_clk <= '0'; 
		wait for 100 ns;
		
		s_clk <= '1'; 
		wait for 100 ns;
	end process;

	--Process stim
	stim_proc : process
	begin
	s_reset <= '1';
	wait for 150 ns;
	
	s_reset <= '0';
	s_enable <= '1';
	
	wait for 5000 ns;

	s_enable <= '0';
	
	wait for 500 ns;
	
	end process;

end Stimulus;