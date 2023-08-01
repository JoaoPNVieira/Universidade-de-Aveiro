library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SeqDetFSM is
	port(	clk	:	in		std_logic;
			reset	:	in		std_logic;
			xIn	:	in		std_logic;
			yOut	:	out	std_logic);
end SeqDetFSM;

architecture MealyArch of SeqDetFSM is

	type state is (A, B, C, D);
	signal Pstate, Nstate	: state;

begin
	sync_proc : process(clk)
	begin
		if (rising_edge(clk)) then
			if (Reset = '1') then 	Pstate <= A;
			else 							Pstate <= Nstate;
			end if;
		end if;
	end process;
	
	comb_proc : process(Pstate,xIn)
	begin
	
	yOut <= '0'; --Default para todos os when
	
	case Pstate is
	
		when A => 	if (xIn = '1') then 	Nstate <= B;
						else						Nstate <= A;
						end if;
		
		when B =>	if (xIn = '1') then	Nstate <= B;
						else						Nstate <= C;
						end if;
		
		when C =>	if (xIn = '1') then	Nstate <= B;
						else						Nstate <= D;
						end if;
		
		when D =>	if (xIn = '1') then	Nstate <= B; yOut <= '1';
						else						Nstate <= A;
						end if;
		
		when others => Nstate <= A;

	end case;
	end process;

end MealyArch;	