LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shiftreg IS
  PORT(
    clk, din : in std_logic_vector; 
    dout : OUT std_logic_vector
  );
END ENTITY shiftreg;

ARCHITECTURE behavior OF shiftreg IS
  SIGNAL sint: std_logic_vector;
  PROCESS
  BEGIN
    wait until clk = '1';
    sint <= din;
    dout <= sint;
  END PROCESS;
END behavior;