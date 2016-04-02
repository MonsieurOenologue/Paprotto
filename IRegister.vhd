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
ARCHITECTURE behavior OF mult IS
	SIGNAL CODOP : std_logic_vector(3 DOWNTO 0);
	SIGNAL Rx : std_logic_vector(3 DOWNTO 0);
	SIGNAL Ry : std_logic_vector(3 DOWNTO 0);
	
	-- xxxx yyy zzzzz aaaae
	-- x bits CODOP
	-- y choix du registre pour stocker Z
	-- a choix du z registre pour le z opérations
	
	
	BEGIN

END ARCHITECTURE;

