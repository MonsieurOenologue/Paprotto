--Libraries imports
library ieee;
use ieee.std_logic_1164.all;

--Entity declaration
ENTITY topLevel IS
	PORT(
		BT : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		SW : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		LEDG : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		LEDR : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END;

--Architecture behavior
ARCHITECTURE behavior OF topLevel IS
	
	COMPONENT Paprotto IS
		GENERIC(
			N : IN NATURAL := 16
		);
		
		PORT(
			clk : IN STD_LOGIC;
			reset : IN std_logic;
			run : IN std_logic; 
			code : IN std_logic_vector(15 DOWNTO 0);
			done : OUT std_logic;
			overflow : OUT std_logic
		);
	END COMPONENT;

	SIGNAL databus : STD_LOGIC_VECTOR(15 DOWNTO 0); 

BEGIN
	databus <= (OTHERS => '0');
	LEDG(0) <= BT(0);
	CPU : Paprotto GENERIC MAP (16) PORT MAP(BT(2), BT(1), BT(0), SW, databus, LEDG(1));
	
END;
