LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Instruction_register IS
	GENERIC(N : POSITIVE := 8);
	PORT(
	clk,rst,set : IN STD_LOGIC;
	din : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	dout : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END ENTITY Instruction_register;
Architecture behavior OF Instruction_register IS
  SIGNAL sint: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  BEGIN
  shift : PROCESS (clk, rst, set)
  BEGIN
  IF clk'EVENT AND clk = '1' THEN
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

