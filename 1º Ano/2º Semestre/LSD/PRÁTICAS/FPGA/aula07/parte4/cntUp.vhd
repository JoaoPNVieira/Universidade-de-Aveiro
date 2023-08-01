library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity cntUp is
	port(	clk		:	in 	std_logic;
			reset		:	in		std_logic;
			enable	:	in		std_logic;
			cntval	:	out	std_logic_vector(29 downto 0);
end cntUp;

architecture Behavioral of cntUp is

	signal s_cntval	:	unsigned(29 downto 0);

begin