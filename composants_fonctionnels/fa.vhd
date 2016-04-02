LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fa IS
  PORT(
    a,b,Cin : IN std_logic;
    S,Cout : OUT std_logic
    );
  END ENTITY;
  ARCHITECTURE behavior OF fa IS
    BEGIN
      S <= a XOR b XOR Cin;
      Cout <= (a AND b) OR ((a XOR b) AND Cin);
    END ARCHITECTURE behavior;
