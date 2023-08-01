library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Timer_Register is

	port(	clock 	: in  std_logic;
			enable	: in  std_logic;
			resetIn	: in	std_logic;
			unitIn 	: in  std_logic_vector(3 downto 0);
			resetOut	: out	std_logic;
			unitOut	: out std_logic_vector(3 downto 0));
			
end Timer_Register;

architecture Behavior of Timer_Register is
begin
	
	process(clock, enable)
	begin
		if(enable = '0') 					then 	unitOut 	<= (others	=>'0'); resetOut <= '0';
		elsif (rising_edge(clock)) 	then 	unitOut 	<= unitIn; resetOut <= resetIn;
		end if;
	
	end process;
end Behavior;