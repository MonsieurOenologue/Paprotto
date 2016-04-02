LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testMUX IS
END testMUX;

Architecture Test OF testMUX IS
  COMPONENT mux IS
	GENERIC (N : POSITIVE := 8);
	PORT(
	 a, b, c, d, e, f : IN std_logic_vector(N-1 DOWNTO 0);
	 sel : IN std_logic_vector(3 DOWNTO 0);
	 S : OUT std_logic_vector(N-1 DOWNTO 0)
  );
  END COMPONENT;
  
  SIGNAL s_a, s_b, s_c, s_d, s_e, s_f : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL s_sel : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL s_S : STD_LOGIC_VECTOR(15 DOWNTO 0);
    
    BEGIN
      test_mux : mux GENERIC MAP(16) PORT MAP(s_a, s_b, s_c, s_d, s_e, s_f, s_sel, s_S);
      ProcessSimulation : PROCESS
        BEGIN
          s_a <= "0000000000000000";
          s_b <= "0000000000000001";
          s_c <= "0000000000000011";
          s_d <= "0000000000000111";
          s_e <= "0000000000001111";
          s_f <= "0000000000011111";
          
          s_sel <= "1111";
          WAIT FOR 10 ns;
          
          s_sel <= "0011";
          WAIT FOR 10 ns;
          
          s_sel <= "0100";
          WAIT FOR 10 ns;
          
          s_sel <= "0101";
          WAIT FOR 10 ns;
          
          s_sel <= "0110";
          WAIT FOR 10 ns;
          
          s_sel <= "0111";
          WAIT FOR 10 ns;
          
          s_sel <= "1000";
          WAIT FOR 10 ns;

          
          WAIT;
        END PROCESS ProcessSimulation;
      END Test;
          
