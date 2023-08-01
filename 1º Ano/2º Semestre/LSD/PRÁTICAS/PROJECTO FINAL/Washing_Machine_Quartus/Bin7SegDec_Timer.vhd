-- Componente: Binary 7 Segment Decoder - Display Time
library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity Bin7SegDec_Timer is 

	port(	enable   : in  std_logic;
			inUnit 	: in  std_logic_vector(3 downto 0) ;
			inDoz	   : in  std_logic_vector(2 downto 0) ;			
			decUnit	: out std_logic_vector(6 downto 0) ; -- Display time: units
			decDoz	: out std_logic_vector(6 downto 0)); -- Display time: dozens

end Bin7SegDec_Timer; 


architecture Behavior of Bin7SegDec_Timer is 
begin

		-- 1: LED OFF
		-- 0: LED ON 
		
		decUnit	<= "0111110" when (enable   = '0' ) else 	-- Disable (=) 
						"1111001" when (inUnit = "0001") else 	-- 1 
						"0100100" when (inUnit = "0010") else 	-- 2 
						"0110000" when (inUnit = "0011") else 	-- 3 
						"0011001" when (inUnit = "0100") else 	-- 4 
						"0010010" when (inUnit = "0101")	else 	-- 5 
						"0000010" when (inUnit = "0110") else 	-- 6
						"1111000" when (inUnit = "0111") else 	-- 7
						"0000000" when (inUnit = "1000") else 	-- 8 
						"0010000" when (inUnit = "1001") else 	-- 9 
						"1000000" when (inUnit = "0000" 
												or inUnit = "1010"); -- 0 
		
		
		decDoz <=	"0111110" when (enable   = '0' ) else 	-- Disable (=)
						"1111001" when (inDoz = "001") 	else 	-- 1 
						"0100100" when (inDoz = "010") 	else 	-- 2 
						"0110000" when (inDoz = "011") 	else 	-- 3 
						"0011001" when (inDoz = "100") 	else 	-- 4 
						"0010010" when (inDoz = "101") 	else 	-- 5 
						"0000010" when (inDoz = "110")	else 	-- 6 
						"1111000" when (inDoz = "111")	else 	-- 7 
						"1000000"; -- 0 
						
end Behavior;
