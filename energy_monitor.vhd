library ieee;
use ieee.std_logic_1164.all;

entity energy_monitor is port 
(
	AGTB, AEQB, ALTB, vacation_mode, MC_test_mode, window_open, door_open					: in std_logic;
	furnace, at_temp, AC, blower, window, door, vacation, increase, decrease, run			: out std_logic
);
end energy_monitor;
	
	
	
ARCHITECTURE control OF energy_monitor IS 
begin
	process (AGTB, AEQB, ALTB, window_open, door_open, vacation_mode, MC_test_mode)
	begin 
	
		run <= '0';

		if (AGTB = '1') then
		increase <= '1';
		decrease <= '0';
		furnace <= '1';
		else 
		increase <= '0';
		furnace <= '0';
		end if;
			
		if (ALTB = '1') then
		increase <= '0';
		decrease <= '1';
		AC <= '1';
		
		else 
		decrease <= '0';
		AC<= '0';
			
		end if;

		if (AEQB = '1' OR MC_test_mode = '1' OR window_open = '1' OR door_open = '1') then 
		run <= '0';
		else 
		run <= '1';
		end if;

		if (AEQB = '1') then 
		blower <= '0';
		at_temp <= '1';
		else 
		blower <= '1';
		at_temp <= '0';
		end if ;
			
		if (AEQB = '0' AND NOT (MC_test_mode = '1' OR window_open = '1' OR door_open = '1')) then 
		blower <= '1';
		else 
		blower <= '0';
		end if;
			
		if (door_open ='1') then 
		door <= '1';
		else
		door <= '0';
		end if;
			
		if (window_open = '1') then 
		window <= '1';
		else 
		window <= '0';
		end if;
			
		if (vacation_mode = '1') then 
		vacation <='1';
		else 
		vacation <='0';
		end if;
		
		end process;
		
end control;