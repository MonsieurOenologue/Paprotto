LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY muxproc IS
	GENERIC (N : POSITIVE := 8);
	PORT(
	a, b, c, d, e, f, g, h, i, j : IN std_logic_vector(N-1 DOWNTO 0);
	sel : IN std_logic_vector(3 DOWNTO 0);
	S : OUT std_logic_vector(N-1 DOWNTO 0)
);
END ENTITY muxproc;

ARCHITECTURE Behavior OF muxproc IS
	SIGNAL Qs : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
BEGIN
	mux : PROCESS(sel)
	BEGIN
		CASE sel IS
			when "0000" =>
				Qs <= a;
			when "0001" =>
			  Qs <= b;
			when "0010" =>
				Qs <= c;
			when "0011" =>
				Qs <= d;
			when "0100" =>
				Qs <= e;
			when "0101" =>
				Qs <= f;
			when "0110" =>
			  Qs <= g;
			when "0111" =>
			  Qs <= h;
			when "1000" =>
			  Qs <= i;
			when "1001" =>
			  Qs <= j;
			when others =>
				NULL;
		END CASE;
	END PROCESS mux;
	S <= Qs;
END ARCHITECTURE Behavior;



