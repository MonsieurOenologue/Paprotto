LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY alu IS
	GENERIC(N:IN NATURAL := 8);
	PORT(
<<<<<<< HEAD
			sel : IN std_logic_vector(3 DOWNTO 0);
	A, B : IN std_logic_vector(N-1 DOWNTO 0);
	Q : OUT std_logic_vector(N-1 DOWNTO 0);
	Cout : OUT std_logic
);
=======
		clk : IN std_logic;
		sel : IN std_logic_vector(3 DOWNTO 0);
		A, B : IN std_logic_vector(N-1 DOWNTO 0);
		Q : OUT std_logic_vector(N-1 DOWNTO 0);
		Cout : OUT std_logic
	);
>>>>>>> cac67abae9924fcbf4aefba27ed06df33c1312c2
END ENTITY alu;

ARCHITECTURE behavior OF alu IS
	COMPONENT faG IS
		GENERIC(N : IN NATURAL := 8);
		PORT(
		A,B : IN std_logic_vector(N-1 DOWNTO 0);
		Cin : IN std_logic;
		S : OUT std_logic_vector(N-1 DOWNTO 0);
		Cout : OUT std_logic
	);
	END COMPONENT;
	
	COMPONENT mux IS
	GENERIC (N : POSITIVE := 8);
	PORT(
	a, b, c, d, e, f : IN std_logic_vector(N-1 DOWNTO 0);
	sel : IN std_logic_vector(3 DOWNTO 0);
	S : OUT std_logic_vector(N-1 DOWNTO 0)
);
END COMPONENT;


	SIGNAL faResult, AorB, AandB, notA, AxorB : STD_LOGIC_VECTOR(N DOWNTO 0);
BEGIN
<<<<<<< HEAD
			
					fa : faG GENERIC MAP(N) PORT MAP(A => A, B => B, Cin=>'0', S=>faResult, Cout=>Cout); --add
					  AorB <=(A OR B);
					  notA <= (NOT A);
					  AandB <= A AND B;
					  AxorB <= A XOR B;
					muxN : mux GENERIC MAP(N) PORT MAP(a => faResult,b=>A, c=>AorB, d=>notA, e=>AandB, f=>AxorB, sel=>sel, S=>Q);
			
=======
	As <= A;
	Bs <= B;
	PROCESS(clk)
	BEGIN
		if(rising_edge(clk)) THEN
			CASE sel IS
				when "0010" =>
					 fa : faG GENERIC MAP(N) PORT MAP(As, Bs, '0', Qs, Cout); --add --This line has a problem (see below) : 
					-- - mismatched input 'generic' expecting ')'
					-- - A subprogram call can not have an empty parameter list. Add a parameter or remove the parenthesis
					-- - no viable alternative at input 'N'
				when "0011" =>
				--SUB
				when "0100" =>
				--MULT
				when "0101" =>
					Qs <= As OR Bs; 	--OR
				when "0110" =>
					Qs <= NOT As; 		--NOT
				when "0111" =>
					Qs <= As AND Bs;	--AND
				when "1000" =>
					Qs <= As XOR Bs;	--XOR
				when others =>
					NULL;
			END CASE;
		END IF;
	END PROCESS;
	-- S <= Qs; -- Don't know the purpose of this line (???)
>>>>>>> cac67abae9924fcbf4aefba27ed06df33c1312c2
END ARCHITECTURE behavior;
