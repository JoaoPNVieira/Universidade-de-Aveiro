library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ShiftRegister_Demo is
	generic(size	:	positive := 8);
		port(	CLOCK_50	:	in		std_logic:
				SW			:	in		std_logic_vector(3 downto 0);
				LEDR		:	out 	std_logic_vector(3 downto 0);

end ShiftRegister_Demo;


architecture RTL of ShiftRegister_Demo is
	signal clk_1hz : std_logic;
begin
	
	divisor: entity WORK.clkDiviDERn(Behavioral)
				generic map(divfactor => 50_000_000);
				port map(	clkIn  => CLOCK_50, 
								clkOut => clk_1hz);
				
	
	shifter: entity WORK.ShiftRegisterN(Behavioral)
					port map(clk	=>	clk_1hz,
					sin => SW(0);
					dataOut => LEDR);
end RTL;
