library ieee;
use ieee.std_logic_1164.all;

entity Compx4 is port (
	A : in std_logic_vector(3 downto 0);
	B : in std_logic_vector(3 downto 0);
	AGTB_out : out std_logic;
	AEQB_out : out std_logic;
	ALTB_out : out std_logic
);
end Compx4;

architecture Compx4_logic of Compx4 is

component compx1 port(
	input_A, input_B : in std_logic;
	A_greater_B, A_equal_B, A_less_B: out std_logic
	);
end component compx1;

signal AGTB : std_logic_vector(3 downto 0);
signal AEQB : std_logic_vector(3 downto 0);
signal ALTB : std_logic_vector(3 downto 0);


begin 

	INST1: compx1 port map(A(0), B(0), AGTB(0), AEQB(0), ALTB(0));
	INST2: compx1 port map(A(1), B(1), AGTB(1), AEQB(1), ALTB(1));
	INST3: compx1 port map(A(2), B(2), AGTB(2), AEQB(2), ALTB(2));
	INST4: compx1 port map(A(3), B(3), AGTB(3), AEQB(3), ALTB(3));
	 
	AGTB_out <= AGTB(3) or (AEQB(3) and AGTB(2)) or (AEQB(3) and AEQB(2) and AGTB(1)) or (AEQB(3) and AEQB(2) and AEQB(1) and AGTB(0));
	ALTB_out <= ALTB(3) or (AEQB(3) and ALTB(2)) or (AEQB(3) and AEQB(2) and ALTB(1)) or (AEQB(3) and AEQB(2) and AEQB(1) and ALTB(0));
	AEQB_out <= AEQB(3) and AEQB(2) and AEQB(1) and AEQB(0);

end architecture;