-- Componente: Pulser de 1Hz - (1x por segundo)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Pulser is

	generic (	MAX 	: positive := 50_000_000); -- 50Mhz
		port ( 	clock : in 	std_logic;
					reset : in 	std_logic;
					pulse : out std_logic);
end Pulser;

architecture Behavior of Pulser is

	signal s_count : natural range 0 to MAX-1; -- MAX-1

begin	
	process(clock)
	begin
		if (rising_edge(clock)) then pulse <= '0';  -- condição contra metaestabilidade
			if (reset = '1') then s_count <= 0;
			else s_count <= s_count + 1;
			
			if (s_count = MAX-1) then s_count <= 0; pulse <= '1';
			end if;
			end if;
		end if;
	end process;
end Behavior;