library IEEE;
use IEEE.STD_LOGIC_1164.all;
	entity SeqShiftUnit is
	generic(N			: 		positive := 4);
		port(	clk 		: in 	std_logic; -- uso continuo
				dataIn 	: in 	std_logic_vector((N-1) downto 0); -- uso continuo
				siLeft 	: in 	std_logic; -- 
				siRight 	: in 	std_logic; -- 
				loadEn 	: in 	std_logic; -- uso continuo
				rotate 	: in 	std_logic; -- done
				dirLeft 	: in 	std_logic; -- uso continuo
				shArith 	: in 	std_logic; -- done
				dataOut 	: out std_logic_vector((N-1) downto 0));
end SeqShiftUnit;

architecture Behavioral of SeqShiftUnit is
	signal s_shiftReg : std_logic_vector((N-1) downto 0);
begin
	process(clk)
	begin
		if (falling_edge(clk)) then
			if (loadEn = '1') then  s_shiftReg <= dataIn;
			
			elsif (rotate = '1') then
				if (dirLeft = '1') then 
					s_shiftReg <= s_shiftReg((N-2) downto 0) & s_shiftReg((N-1));
				else 
					s_shiftReg <= s_shiftReg(0) & s_shiftReg((N-1) downto 1);
			end if;
				
			elsif (shArith = '1') then -- PRESERVA SINAL
				if (dirLeft = '1') then 
					s_shiftReg <= s_shiftReg((N-2) downto 0) & s_shiftReg(N-1);
				else 
					s_shiftReg <= s_shiftReg(0) & s_shiftReg((N-1) downto 1);
				end if;
			elsif ( 
			
			end if;
		end if;
	end process;
	
	dataOut <= s_shiftReg;

end Behavioral ;