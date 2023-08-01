-- Componente: Contador de Modulo 100 (6 bits counter)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CntUp100 is
	port(	clk   	: 	in 	std_logic;
			reset 	: 	in		std_logic;
			enable	: 	in 	std_logic;
			count 	: 	out 	std_logic_vector(6 downto 0));
end CntUp100;

architecture Behavioral of CntUp100 is
	signal s_count : unsigned(6 downto 0);
begin
	process(clk)
	begin
		
		if (rising_edge(clk)) then
			if (reset = '1') 		then 	s_count <= (others => '0');
			elsif(enable = '0') 	then 	s_count <= s_count;
			else 								s_count <= s_count+1;
			
			end if;
		end if;
	end process;
	count <= std_logic_vector(s_count);
end Behavioral;