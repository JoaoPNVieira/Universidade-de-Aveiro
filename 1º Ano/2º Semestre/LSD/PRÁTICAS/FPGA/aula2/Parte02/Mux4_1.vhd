-- Componente: Multiplexer 4-to-1 :

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux4_1 is
	port(	sel		: in	std_logic_vector(1 downto 0);
			inputs	: in	std_logic_vector(3 downto 0);
			outputs	: out	std_logic);
end Mux4_1;

architecture Behavioral of Mux4_1 is
begin
	process(sel,inputs)
	begin
		
		if 	(sel = "00") then outputs <= inputs(0);
		elsif (Sel = "01") then	outputs <= inputs(1);
		elsif (Sel = "10") then	outputs <= inputs(2);
		else							outputs <= inputs(3);
		end if;
	
	end process;
end Behavioral;