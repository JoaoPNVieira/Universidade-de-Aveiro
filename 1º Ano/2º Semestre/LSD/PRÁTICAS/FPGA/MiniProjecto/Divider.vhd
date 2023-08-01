library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity Divider is
	port(	enable		: 	in		std_logic;
			inputs		: 	in		std_logic_vector(6 downto 0);
			msb4			: 	out	std_logic_vector(3 downto 0);
			lsb4			:	out	std_logic_vector(3 downto 0));
			
end Divider;

architecture Behav of Divider is

	signal s_lsb4, s_msb4  	: unsigned(3 downto 0);
	signal s_inputs 			: unsigned(6 downto 0);

begin
	process(enable,inputs)
	begin
	
		s_msb4 <= '0' & unsigned(std_logic_vector(inputs(6 downto 4)));
		s_lsb4 <= unsigned(std_logic_vector(inputs(3 downto 0)));

		msb4 <= std_logic_vector(s_msb4);	
		lsb4 <= std_logic_vector(s_lsb4);
					
	end process;
end Behav;
