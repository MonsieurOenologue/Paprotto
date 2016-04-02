LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testALU IS
END ENTITY testALU;

Architecture Test OF testALU IS
  COMPONENT alu IS
	GENERIC(N: POSITIVE := 16);
	PORT(
		sel : IN std_logic_vector(3 DOWNTO 0);
		A, B : IN std_logic_vector(N-1 DOWNTO 0);
		Q : OUT std_logic_vector(N-1 DOWNTO 0);
		Cout : OUT std_logic
	);
	END COMPONENT;
	SIGNAL s_sel : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL s_A, s_B : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL s_Q : STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000000";
	SIGNAL s_Cout : STD_LOGIC;
	
	BEGIN
	  aluTest : alu GENERIC MAP(16) PORT MAP(s_sel, s_A, s_B, s_Q, s_Cout);
	  ProcessSimulation : PROCESS
	  BEGIN
	    s_sel <= "0010";
	    s_A <= "1000000000000011";
	    s_B <= "1000000000000010";
	    WAIT FOR 10 ns;
	    s_sel <= "0100";
	    WAIT FOR 10 ns;
	    s_sel <= "0101";
	    WAIT FOR 10 ns;
	    s_sel <= "0110";
	    WAIT FOR 10 ns;
	    s_sel <= "0111";
	    WAIT FOR 10 ns;
	    s_A <= "0011110000110000";
	    WAIT FOR 10 ns;
	    s_sel <= "0010";
	    WAIT FOR 10 ns;
	    
	    WAIT;
	    END PROCESS ProcessSimulation;
	END Test;
	        
	  
