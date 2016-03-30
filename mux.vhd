LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS
	GENERIC (N : POSITIVE := 8);
	PORT(
	a, b, c, d, e : IN std_logic_vector(N-1 DOWNTO 0);
	sel : IN std_logic_vector(3 DOWNTO 0);
	S : OUT std_logic_vector(N-1 DOWNTO 0)
);
END ENTITY mux;

ARCHITECTURE Behavior OF mux IS
	SIGNAL Qs : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
BEGIN
	mux : PROCESS(sel)
	BEGIN
		CASE sel IS
			when "0100" =>
				Qs <= a;
			when "0011" =>
			when "0101" =>
				Qs <= c;
			when "0110" =>
				Qs <= d;
			when "0111" =>
				Qs <= e;
			when "1000" =>
				Qs <= f;
			when others =>
				NULL;
		END CASE;
		S <= Qs;
	END PROCESS mux;
END ARCHITECTURE Behavior;

