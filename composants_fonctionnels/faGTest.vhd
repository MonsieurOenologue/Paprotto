LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testfaG IS
END ENTITY testfaG;

Architecture Test OF testfaG IS
  COMPONENT faG IS
	GENERIC(N : POSITIVE := 8);
	PORT(
	 A,B : IN std_logic_vector(N-1 DOWNTO 0);
	 Cin : IN std_logic;
	 S : OUT std_logic_vector(N-1 DOWNTO 0);
	 Cout : OUT std_logic
  );
  END COMPONENT;
  
  SIGNAL s_A, s_B, s_S : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL s_Cin, s_Cout : STD_LOGIC;
  BEGIN
    testfaG : faG GENERIC MAP(16) PORT MAP(s_A, s_B, '0', s_S, s_Cout);
    ProcessSimulation : PROCESS
    BEGIN
      s_A <= "1000000000000001";
      s_B <= "1000000000000010";
      WAIT FOR 40 ns;
      
      WAIT;
    END PROCESS ProcessSimulation;
  END Test; 
