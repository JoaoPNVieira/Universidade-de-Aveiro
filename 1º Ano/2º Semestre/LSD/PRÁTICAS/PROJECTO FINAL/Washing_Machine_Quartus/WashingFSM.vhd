library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity WashingFSM is
	port(	clock 		: in std_logic;
			enable		: in std_logic;
			reset 		: in std_logic;
			inData 		: in std_logic_vector(1 downto 0); 	
			change		: in std_logic; 							-- Signal to change States after time required of operation
			jump			: in std_logic_vector(1 downto 0);
			
			timerEn		: out std_logic;
			timerReq		: out std_logic_vector(3 downto 0);
			water_valve : out	std_logic;
			water_pump	: out std_logic;
			rinse			: out std_logic;
			spin			: out std_logic;
			finish 		: out std_logic;
			repeat		: out std_logic_vector(1 downto 0));
end WashingFSM;

architecture Behavior of WashingFSM is
	
	type 		TState is (S0,S1,S2,S3,S4,S5);
	signal 	pState, nState: TState;

begin
	
	sync_proc : process(clock)
	begin
		if (rising_edge(clock)) then
			if 	(reset = '1') 	then 	pState 	<= S0; 
												
												
			
			
			elsif (enable = '0') then 	pState <= S0;
			else								pState <= nState;
			end if;
		end if;
	end process;
	
	comb_proc : process(pState, inData, change, jump)
	begin
	
	timerReq 	<= "0000"; timerEn 	<= '0'; water_valve 	<= '0'; repeat <= "00";
	water_pump 	<= '0'	; rinse 		<= '0'; spin	<= '0'; finish	<= '0';

	
	nState <= pState; -- Sate is keept if no transition
	
	
	
		case pState is
---------Initial State S0 (Idle)----------------------
			when S0 =>					
				
				
				-- Programs P1 : Initiation --
				if 	(inData = "01") then nState <= S1; timerEn	<= '0'; timerReq <= "0000"; repeat	<= "00";
				-- Programs P2 : Initiation --
				elsif (inData = "11") then nState <= S1; timerEn	<= '0'; timerReq <= "0000"; repeat	<= "00";
				-- Programs P3 : Initiation --					
				elsif (inData = "10") then nState <= S4; timerEn	<= '0'; timerReq <= "0000"; repeat	<= "00";
				
				
				else nState <= S0; timerEn	<= '0'; timerReq <= "0000"; repeat	<= "00";
				end if;
				
---------State S1 (Task: Fill with Water)--------------
			when S1 => 
				
				-- Programs P1 : Operation Nº1 --
				if 	(inData = "01") then 	timerReq <= "0111"; timerEn <= '1'; water_valve <= '1';
					if (change = '1')  then 	nState <= S2; water_valve <= '0'; timerEn <= '0';
					end if;
				
				-- Programs P2 : Operation Nº1 --
				elsif	(inData = "11") then 	timerReq <= "0111"; timerEn <= '1'; water_valve <= '1';
					if (change = '1')  then 	nState <= S2; water_valve <= '0'; timerEn <= '0';
					end if;
					
				elsif	(inData = "10") then		nState <= S0;

				else nState <= S1;
				end if;
---------State S2 (Task: Soak)-------------------------
			when S2 => 
			
				-- Programs P1 & P2 : Operation Nº2 --
				if 	(inData = "01") then 	timerReq <= "1010"; timerEn <= '1'; water_pump <= '1';
					if (change = '1')  then 	nState <= S3; water_pump <= '0'; timerEn <= '0';
					end if;
				
				elsif	(inData = "11") then 	timerReq <= "1010"; timerEn <= '1'; water_pump <= '1';
					if (change = '1')  then 	nState <= S3; water_pump <= '0'; timerEn <= '0';
					end if;
				
				elsif	(inData = "10") then		nState <= S0;

				else nState <= S2;
				end if;
---------State S3 (Task: Empty Water)------------------
			when S3 => 			
			
			-- Program P1: Operation Nº3 & Nº6 & Nº7 --
				if 	(inData = "01") then timerReq <= "0100"; timerEn <= '1'; rinse <= '1'; 
					if (change = '1' ) then 
						if		(jump = "01") then 	repeat <= "11"; rinse <= '0'; timerEn <= '0'; nState <= S4;-- 2nd Jump
						elsif	(jump = "11") then 	repeat <= "00"; rinse <= '0'; timerEn <= '0'; nState <= S5;-- ENDING (State 5)
						else 								repeat <= "01"; rinse <= '0'; timerEn <= '0'; nState <= S1;-- 1st Jump
						end if;
					end if;

			-- Program P2: Operations Nº3 & Nº5 --		
				elsif (inData = "11") then timerReq <= "0100"; timerEn <= '1'; rinse <= '1'; 
					if (change = '1' ) then 
						if 	(jump = "01") then 	repeat <= "00"; rinse  <= '0' ; timerEn <= '0'; nState <= S5; -- ENDING (State 5)
						else 								repeat <= "01"; rinse <= '0'; timerEn <= '0'; nState <= S4;
						end if;
					end if;
		
			-- Program P3: Operation Nº2 -- To Final State S5 --					
				elsif (inData = "10") then timerReq <= "0100"; timerEn <= '1'; rinse <= '1';
					if (change = '1' ) then rinse 	<= '0'	; timerEn <= '0'; nState <= S5;
					end if;
					
				else nState <= S3;
				end if;
---------State S4 (Task: Spin)------------------------- 
			when S4 => 
				
				-- Program P1: Operation Nº7 --
				if 	(inData = "01") then timerReq <= "0101"; timerEn <= '1'; spin <= '1' ;
					if (change = '1' ) then spin 		<= '0'	; timerEn <= '0'; nState <= S3;
					end if;
					
				-- Program P2: Operation Nº4 --------					
				elsif (inData = "11") then timerReq <= "0101"; timerEn <= '1'; spin <= '1' ;
					if (change = '1' ) then spin 	 	<= '0'	; timerEn <= '0'; nState <= S3; 
					end if;	
			
				-- Program P3: Operation Nº1 --------					
				elsif (inData = "10") then timerReq <= "0101"; timerEn <= '1'; spin <= '1' ;
					if (change = '1' ) then spin 		<= '0'	; timerEn <= '0'; nState <= S3;
					end if;	
				
				else nState <= S4;
				end if;
---------State S5 (Task: FINISH! Wait 2s)--------------
			when S5 => 	
			
			timerReq <= "0010"; timerEn <= '1';
			if(change = '1' ) then finish <='1'; timerEn <= '0'; nState <= S0;
			
			else nState <= S5;
			end if;
-------------------------------------------------------
			when others => nState <= S0;
		end case;
	end process;
end Behavior;
	
	