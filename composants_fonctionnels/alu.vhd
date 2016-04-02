LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY alu IS
	GENERIC(N:IN POSITIVE := 16);
	PORT(
		sel : IN std_logic_vector(3 DOWNTO 0);
		A, B : IN std_logic_vector(N-1 DOWNTO 0);
		Q : OUT std_logic_vector(N-1 DOWNTO 0);
		Cout : OUT std_logic
	);
	END ENTITY alu;

ARCHITECTURE behavior OF alu IS
	COMPONENT faG IS
		GENERIC(N : POSITIVE := 16);
		PORT(
		A,B : IN std_logic_vector(N-1 DOWNTO 0);
		Cin : IN std_logic;
		S : OUT std_logic_vector(N-1 DOWNTO 0);
		Cout : OUT std_logic
	);
	END COMPONENT;
	
--	COMPONENT mux IS
	--GENERIC (N : POSITIVE := 16);
	--PORT(
	--a, b, c, d, e, f : IN std_logic_vector(N-1 DOWNTO 0);
	--sel : IN std_logic_vector(3 DOWNTO 0);
	--S : OUT std_logic_vector(N-1 DOWNTO 0);
--END COMPONENT;


--SIGNAL faResult, AorB, AandB, notA, AxorB : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
SIGNAL s_Cout : STD_LOGIC := '0';
SIGNAL Qs, faResult : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
BEGIN
 	fa : faG GENERIC MAP(N) PORT MAP(A,B,'0', faResult, Cout); --add
	WITH sel SELECT
		Qs <= faResult when "0010",
		    (others=>'0') when "0011",
		    (A OR B) when "0100",
		    (NOT A) when "0101",
		    (A AND B) when "0110",
			  (A XOR B) when "0111",
			  (others=>'0') WHEN others;
	Q <= Qs;
--		fa : faG GENERIC MAP(N) PORT MAP(A => A, B => B, Cin=>'0', S=>faResult, Cout=>Cout); --add
--		AorB <=(A OR B);
--		notA <= (NOT A);
--	  AandB <= A AND B;
--		AxorB <= A XOR B;
--		muxN : mux GENERIC MAP(N) PORT MAP(a => faResult,b=>A, c=>AorB, d=>notA, e=>AandB, f=>AxorB, sel=>sel, S=>Q);

END ARCHITECTURE behavior;
