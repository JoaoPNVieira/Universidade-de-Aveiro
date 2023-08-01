library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity JumpRegister is
	
	port(	clock 	:	in std_logic;
			enable	:	in std_logic;
			jumpIn	:	in std_logic_vector(1 downto 0);
			jumpOut	:	out std_logic_vector(1 downto 0));
			
end JumpRegister;

architecture Behavior of JumpRegister is
begin

	process(clock, enable)
	begin
		if(enable = '0') 					then jumpOut <= (others	=>'0');
		elsif (rising_edge(clock)) 	then jumpOut <= jumpIn;
		end if;
		
	end process;
end Behavior;