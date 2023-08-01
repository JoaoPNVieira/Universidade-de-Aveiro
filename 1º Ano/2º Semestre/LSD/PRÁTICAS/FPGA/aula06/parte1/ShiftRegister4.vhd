library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ShiftRegister4 is
	port(	clk		:	in		std_logic;
			sin		:	in		std_logic;
			dataOut	:	out 	std_logic_vector(3 downto 0));
end ShiftRegister4;

architecture RTL of ShiftRegister4 is
	signal s_shiftReg	:	std_logic_vector(3 downto 0);
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			s_shiftReg <= sin & s_shiftReg(2 downto 0) & sin;
		end if;
	end process;
	
	dataOut <= s_shiftReg;

end RTL;
