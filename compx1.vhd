library ieee;
use ieee.std_logic_1164.all;

entity compx1 is port(
	input_A, input_B : in std_logic;
	A_greater_B, A_equal_B, A_less_B: out std_logic
	);
end compx1;

architecture comPx1_bool of compx1 is
	begin
	A_greater_B <= input_A and (not input_B);
	A_equal_B <= (input_A and input_B) or ((not input_A) and (not input_B));
	A_less_B <= (not input_A) and (input_B);
end architecture;