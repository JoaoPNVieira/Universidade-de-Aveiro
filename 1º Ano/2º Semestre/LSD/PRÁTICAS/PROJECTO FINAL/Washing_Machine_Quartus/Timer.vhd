library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity Timer is
	port(	clock   		: 	in 	std_logic;
			reset 		: 	in		std_logic;
			enable		: 	in 	std_logic;
			inTime		: 	in		std_logic_vector(3 downto 0); -- Link to timer request of FSM
			inUnit		:	in		std_logic_vector(3 downto 0);
			countUnit 	: 	out 	std_logic_vector(3 downto 0);
			countDoz		: 	out	std_logic_vector(2 downto 0);
			change		:	out	std_logic;
			timeReset	:	out	std_logic); 						-- Change State
end Timer;

architecture Behavior of Timer is
	
	signal s_change, s_reset	 : std_logic;
	signal s_countUnit : unsigned(3 downto 0) := "0000";
	signal s_countDoz  : unsigned(2 downto 0) := "000" ;
	
begin
	

	process(clock)
	begin	
	
		
		if (rising_edge(clock)) then 													
			
			s_change <= '0';
			s_reset 	<= '0';
			if (reset = '1')  then 	s_countUnit <= (others => '0'); 			
											s_countDoz 	<= (others => '0');
											s_reset		<= '0';
			
			elsif	(enable = '1') then 	s_countUnit <= s_countUnit+1; s_reset 	<= '0';
				
				if		(s_countUnit = "1011") then	s_countUnit <= "0000";
																s_countDoz 	<= s_countDoz+1;  
																																	
				elsif (s_countDoz = "111") 	then  s_countUnit <= "0000"; 
																s_countDoz  <= "000"	; 
																s_change		<= '1'	; -- Overflow, sync and error prevention
				
				elsif (inTime = inUnit) 		then 	s_change 	<= '1';
																s_countUnit <= "0000"; 
																s_countDoz  <= "000"	;
																s_reset		<=	'1';
				
			elsif (enable = '0') 				then	s_countUnit <= s_countUnit; 
																s_countDoz  <= s_countDoz;
				end if;
			end if;
		end if;

	end process;
	
	timeReset 	<= s_reset;
	change 		<= s_change;
	countUnit 	<= std_logic_vector(s_countUnit);
	countDoz	 	<= std_logic_vector(s_countDoz);
	
end Behavior;