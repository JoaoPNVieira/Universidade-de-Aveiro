library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ShiftRegisterN is
	generic(size	:	positive := 4 );
	port(	clk		:	in		std_logic;
			sin		:	in		std_logic;
			dataOut	:	out 	std_logic_vector((size-1) downto 0));
end ShiftRegisterN;

architecture RTL of ShiftRegisterN is
	signal s_shiftReg	:	std_logic_vector((size-1) downto 0);
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			s_shiftReg <= sin & s_shiftReg((size-1) downto 1);
		end if;
	end process;
	
	dataOut <= s_shiftReg;

end RTL;
