LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shiftreg IS
  PORT(
    clk, din, rst : IN std_logic; 
    dout : OUT std_logic
  );
END ENTITY shiftreg;

ARCHITECTURE behavior OF shiftreg IS
  SIGNAL sint: std_logic;
  BEGIN
  PROCESS (clk, rst)
  BEGIN
    if rst='1' THEN
      dout <= '0';
      sint <= '0';
    elsif clk = '1' AND clk'EVENT THEN
      sint <= din;
      dout <= sint;
    end if; 
  END PROCESS;
END behavior;