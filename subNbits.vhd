--Libraries imports
library ieee;
use ieee.std_logic_1164.all;

--Entity declaration
ENTITY subNbits IS
	GENERIC(
		N : IN NATURAL := 16
	);

	PORT(
		A, B : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Cin : IN STD_LOGIC; 
		S : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Cout : OUT STD_LOGIC 
	);
END;

--Architecture behavior
ARCHITECTURE behavior OF subNbits IS

	COMPONENT minNbits IS
		GENERIC(
			N : IN NATURAL := 16
		);

		PORT(
			A : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			S : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT faG IS
		GENERIC(
			N : IN NATURAL := 16
		);

		PORT(
			A, B : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Cin : IN STD_LOGIC; 
			S : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Cout : OUT STD_LOGIC 
		);
	END COMPONENT;

	SIGNAL tempB : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL tempCo : STD_LOGIC_VECTOR(N-1 DOWNTO 0);

BEGIN

	min : minNbits GENERIC MAP (N) PORT MAP (B, tempB);
	add : faG GENERIC MAP (N) PORT MAP (A, tempB, Cin, S, Cout);

END;