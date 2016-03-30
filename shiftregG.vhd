LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shiftregG IS
	GENERIC(N : POSITIVE := 8);
	PORT(
	clk,rst,set : IN STD_LOGIC;
	din : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	dout : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END ENTITY shiftregG;
Architecture behavior OF shiftregG IS
  SIGNAL sint: std_logic_vector(N-1 DOWNTO 0);
  BEGIN
  PROCESS (clk, rst)
  BEGIN
    if rst='1' THEN
		  dout <= (others=>'0');
    elsif clk = '1' AND clk'EVENT THEN
      sint <= din;
      dout <= sint;
    end if; 
  END PROCESS;
END ARCHITECTURE behavior;
