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
  SIGNAL sint: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  BEGIN
  shift : PROCESS (clk, rst, set)
  BEGIN
  IF rising_edge(clk) THEN
    IF rst='1' THEN
		  sint <= (others=>'0');
		ELSE
		  IF set = '1' THEN
        sint <= din;
      END IF;
    END IF;
  END IF;
  END PROCESS shift;
  dout <= sint;
END ARCHITECTURE behavior;
