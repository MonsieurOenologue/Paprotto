--Libraries imports
library ieee;
use ieee.std_logic_1164.all;

--Entity declaration
ENTITY IRegister IS
  generic (N:integer := 16); --16 for a 16bits processor
  PORT (
	    clk : IN std_logic;
	    IRSet : IN std_logic;
	    D : IN std_logic_vector(9 downto 0);
    	Q : OUT std_logic_vector(9 downto 0)
  );
END IRegister;


--Architecture behavior
ARCHITECTURE behavior OF IRegister IS
BEGIN
	
-- Just a register without the clock part
PROCESS(IRset, Q)
	BEGIN
		if IRset = '1' then Q <= D;
		end if;
	END PROCESS;

END ARCHITECTURE;

