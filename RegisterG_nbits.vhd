--Libraries imports
library ieee;
use ieee.std_logic_1164.all;

--Entity declaration
ENTITY registerG_nbits IS
  generic (N:integer := 16); --16 for a 16bits processor
  PORT (
    set : in std_logic;
    clk : in std_logic;
    reset_n : in std_logic;
    D : in std_logic_vector(N-1 downto 0);
    Q : out std_logic_vector(N-1 downto 0)
  );
END registerG_nbits;

--Register declaration
ARCHITECTURE registerG OF registerG_nbits IS
BEGIN
  PROCESS (clk, reset_n)

  BEGIN
    if reset_n = '1' then
        Q <= (others => '0');
      elsif clk'event and clk = '1' then
        if set = '1' then
          Q <= D;
        end if;
      end if;

  END PROCESS;

END registerG;
