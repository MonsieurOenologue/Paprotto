LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mult IS
  GENERIC(N:POSITIVE := 8)
  PORT(
    a,b : IN std_logic_vector(N DOWNTO 0);
    S : OUT std_logic_vector((2*N)+1 DOWNTO 0)
  );
END mult;

ARCHITECTURE behavior OF mult IS
  TYPE mem_ET IS array(0 TO N) OF std_logic(N DOWNTO 0);
  TYPE mem_S IS ARRAY(0 TO N) OF std_logic(N+1 DOWNTO 0);
  TYPE mem_C IS ARRAY(0 TO N) OF std_logic(N+1 DOWNTO 0);
  SIGNAL memS : mem_S;
  SIGNAL memET : mem_ET;
  SIGNAL memC : mem_C;
  COMPONENT fa IS
    PORT(
    a,b,Cin : IN std_logic;
    S,Cout : OUT std_logic
    );
  END COMPONENT;
BEGIN
  ligne : for i in 0 TO N GENERATE
    memC(i)(0) <= '0';
    colonne : for j IN 0 TO N GENERATE
      memET(i)(j) <= (a(j) AND b(i))
      prem_1 : IF i=0 GENERATE
        memS(0)(j) <= memET(0)(j);
        memC(0)(4) <= '0';
      END GENERATE prem_1;
      prem_2 : IF i>0 GENERATE
        addN : fa(portmap(a=>memS(i-1)(j), s=>memS(i)(j),b=>memET(i)(j),Cin=>memC(i)(j),Cout=>memC(i)(j+1));
      END GENERATE prem_2;
    END GENERATE colonne;
    memS(i)(4) <= memC(i)(4);
  END GENERATE ligne;
  FOR i in 0 TO N LOOP
    S(i) <= memS(i)(0);
  END loop;
  FOR j IN 1 TO N+1 LOOP
    S(N+j) <= memS(N)(j);
  END LOOP;
END ARCHITECTURE;