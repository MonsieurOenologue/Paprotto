LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY faG IS
  GENERIC(N : POSITIVE := 8);
  PORT(
    A,B : IN std_logic_vector(N-1 DOWNTO 0);
    Cin : IN std_logic;
    S : OUT std_logic_vector(N-1 DOWNTO 0);
    Cout : OUT std_logic
    );
  END ENTITY faG;
  
  ARCHITECTURE behavior OF faG IS
    COMPONENT fa IS
      PORT(
        a,b,Cin : IN std_logic;
        S,Cout : OUT std_logic
      );
    END COMPONENT;
    SIGNAL Cout_b : std_logic_vector(N-2 DOWNTO 0);
    BEGIN
      fa_array : for i IN 0 TO N-1 GENERATE
        first_cell : IF i = 0 GENERATE
          fa0 : fa PORT MAP(a=>A(0), b=>B(0), Cin=>Cin, S=>S(0),Cout=>Cout_b(0));
        END GENERATE first_cell;
        int_cell : IF i>0 AND i < N-1 GENERATE
          fai : fa PORT MAP(a=>A(i), b=>B(i), Cin=>Cout_b(i-1), S=>S(i), Cout=> Cout_b(i));
        END GENERATE int_cell;
        last_cell : IF i=N-1 GENERATE
          faN : fa PORT MAP(a=>A(i),b=>B(i), Cin=>Cout_b(i-1), S=>S(i), Cout=>Cout);
        END GENERATE last_cell;
      END GENERATE fa_array;
    END ARCHITECTURE behavior;