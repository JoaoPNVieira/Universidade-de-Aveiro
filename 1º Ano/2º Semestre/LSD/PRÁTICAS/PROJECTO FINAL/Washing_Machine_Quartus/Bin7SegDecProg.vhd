library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity Bin7SegDecProg is 

	port(	enable   	: in  std_logic;
			binSel   	: in  std_logic_vector(1 downto 0) ;   
			decProg		: out std_logic_vector(6 downto 0) ; -- Display letter P for Program 
			decOutSel	: out std_logic_vector(6 downto 0)); -- Display number of program choosen

end Bin7SegDecProg; 


architecture Behavior of Bin7SegDecProg is 
begin
	
		decProg 	 <= 	"0001100" when (enable = '1') else 	-- P
							"1111111"; 									-- Disable: Tudo apagado

		decOutSel <= 	"1111111" when (enable = '0')  else
							"1111001" when (binSel = "01") else -- 1 
							"0100100" when (binSel = "11") else -- 2
							"0110000" when (binSel = "10") else	-- 3
							"1111111";									
						
end Behavior;