-- Componente: Multiplexer 2-to-1 :

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux2_1 is
	port(	sel		: in	std_logic;
			inputs	: in	std_logic_vector(1 downto 0);
			outputs	: out	std_logic);
end Mux2_1;

architecture Behavioral of Mux2_1 is
begin
	process(sel,inputs)
	begin
		
		if (sel = '0') then 	outputs <= inputs(0);
		else 						outputs <= inputs(1);
		end if;
	
	end process;
end Behavioral;