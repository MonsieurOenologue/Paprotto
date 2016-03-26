LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY alu IS
	GENERIC(N:POSITIVE := 8);
	PORT(
			clk : IN std_logic;
			sel : IN std_logic_vector(3 DOWNTO 0);
	A, B : IN std_logic_vector(N-1 DOWNTO 0);
	Q : OUT std_logic_vector(N-1 DOWNTO 0)
	Cout : OUT std_logic;
);
END ENTITY alu;

ARCHITECTURE behavior OF alu IS
	COMPONENT faG IS
		GENERIC(N : POSITIVE := 8);
		PORT(
		A,B : IN std_logic_vector(N-1 DOWNTO 0);
		Cin : IN std_logic;
		S : OUT std_logic_vector(N-1 DOWNTO 0);
		Cout : OUT std_logic
	);
	END COMPONENT;


	SIGNAL As, Bs, Qs : STD_LOGIC_VECTOR(N DOWNTO 0);
BEGIN
	As <= A;
	Bs <= B;
	PROCESS(clk)
	BEGIN
		if(rising_edge(clk)) THEN
			CASE sel IS
				when "0010" =>
					fa : faG (generic : N) port map(As, Bs, 0, Qs, Cout); --add
				when "0011" =>
				--SUB
				when "0100"=>
				--MULT
				when "0101"=>
					Qs <= As OR Bs; 	--OR
				when "0110"=>
					Qs <= NOT As; 		--NOT
				when "0111"=>
					Qs <= As AND Bs;	--AND
				when "1000"=>
					Qs <= As XOR Bs;	--XOR
				when others =>
					NULL;
			END CASE;
		END IF;
	END PROCESS;
	S <= Qs;
END ARCHITECTURE behavior;
