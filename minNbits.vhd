--Libraries imports
library ieee;
use ieee.std_logic_1164.all;

--Entity declaration
ENTITY minNbits IS
	GENERIC(
		N : IN NATURAL := 16
	);

	PORT(
		A : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		S : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	);
END;

--Architecture behavior
ARCHITECTURE behavior OF minNbits IS

	COMPONENT NotNbit IS
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
			A,B : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Cin : IN STD_LOGIC;
			S : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Cout : OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL tempA, tempB : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL tempCo : STD_LOGIC;

BEGIN

	NotB : NotNbit GENERIC MAP (N) PORT MAP (A, tempA);

	tempB(N-1 DOWNTO 1) <= (OTHERS => '0');
	tempB(0) <= '1';

	add : faG GENERIC MAP (N) PORT MAP (tempA, tempB, '0', S, tempCo);

END;
