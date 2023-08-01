library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity  RMan is

	port(	clock		: in  std_logic;
			globRes	: in	std_logic;
			tRes		: in	std_logic;
			reset		: out	std_logic);
			
end RMan;

architecture Behavior of RMan is
begin
	
	process(clock)
	begin
		if (rising_edge(clock)) then 	
			if (tRes = '1') then reset <= tRes;
			else						reset <= globRes;
			end if;
		end if;
	
	end process;
end Behavior;