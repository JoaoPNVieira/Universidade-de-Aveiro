library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ControlPanel is
	port(	clock		:	in 	std_logic; 	-- CLOCK_50
				
													-- Priority:
			turnOn	:	in		std_logic; 	-- 1º
			inReset	:  in		std_logic;  -- 2º			
			door		:	in 	std_logic;  -- 3º -------- || Washing Machine Door: door = '1' (OPEN)  | door = '0' (CLOSE) 
			inStart	:	in		std_logic;	-- 4º
			sel		:	in 	std_logic_vector(1 downto 0); 										
			outReset :	out	std_logic;
			program	:	out	std_logic_vector(1 downto 0);
			outStart	:	out	std_logic;
			
			outOn		:	out	std_logic;
			outRes	:	out	std_logic;
			outDoor	:	out	std_logic;
			outStr	:	out	std_logic);
																				
			
end ControlPanel;

architecture Behavior of ControlPanel is
begin
	
	process(clock)
	begin
	
		
		if (rising_edge(clock)) then
			outStart <= inStart;
			outReset <= inReset;
			outOn		<= turnOn; 
			outRes	<= not inReset; 
			outDoor	<= door; 
			outStr	<= inStart; 
			
			if 	(turnOn = '0') 	then program <= "00"; 
			elsif (inReset = '1') 	then program <= "00"; 
			elsif (door ='0') 		then program <= "00";
			elsif (inStart = '0') 	then program <= "00";
			else
				if 	(sel = "01") then		program <= sel; 	-- P1
				elsif (sel = "11") then 	program <= sel; 	-- P2
				elsif (sel = "10") then 	program <= sel; 	-- P3
				else								program <= "00"; 	-- IDLE
				end if;
			end if;
		end if;
		
	end process;
end Behavior;


-- Washing Machine - Select Program (GREY CODE):	
			
--P0: sel <= "00" (IDLE - Hidden)
--P1: sel <= "01" (NORMAL WASH)
--P2: sel <= "11" (PRE-WASH)
--P3: sel <= "10" (EXTRA-SPIN)