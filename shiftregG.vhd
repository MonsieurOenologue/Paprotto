LIBRARY ieee;
USE ieee.std_logic_1162.all;

ENTITY shiftregG IS
	GENERIC(N : POSITIVE := 8);
	PORT(
	clk,rst,set : IN STD_LOGIC;
	d : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END ENTITY shiftregG;
Architecture behavior OF shiftregG IS
	COMPONENT shiftreg IS
		PORT(
		clk, din, rst : IN std_logic; 
		dout : OUT std_logic
	);
	END COMPONENT;
	SIGNAL qint : STD_LOGIC_VECTOR(
BEGIN
	IF set = '1' THEN
		cell_array: FOR i 1 TO N GENERATE
			dff : dff port map(clk, d(i-1), rst, q(i-1));
		END GENERATE cell_array;
END ARCHITECTURE behavior;
