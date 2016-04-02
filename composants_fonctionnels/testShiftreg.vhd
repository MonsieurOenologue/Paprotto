LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY testShiftreg IS
END testShiftreg;

Architecture Test OF testShiftreg IS
  COMPONENT shiftregG IS
	GENERIC(N : POSITIVE := 8);
	PORT(
	 clk,rst,set : IN STD_LOGIC;
	 din : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	 dout : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
  );
  END COMPONENT;
  
  SIGNAL s_clk, s_rst, s_set : STD_LOGIC;
  SIGNAL s_din : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL s_dout : STD_LOGIC_VECTOR(15 DOWNTO 0);
  BEGIN
  testShift : shiftregG GENERIC MAP(16) PORT MAP(s_clk, s_rst, s_set, s_din, s_dout);
  ProcessSimulation : PROCESS
  BEGIN
    s_clk <= '0';
    s_rst <= '1';
    s_set <= '0';
    s_din <= "0000000000000000";
    
    WAIT FOR 10 ns;
    
    s_clk <= '1';
    WAIT FOR 10 ns;
    s_clk <= '0';
    s_rst <= '0';
    s_set <= '1';
    s_din <= "0001001001001001";
    WAIT FOR 10 ns;
    s_clk <= '1';
    WAIT FOR 10 ns;
    s_clk <= '0';
    s_set <= '0';
    WAIT FOR 10 ns;
    s_clk <= '1';
    WAIT FOR 10 ns;
    s_clk <= '0';
    s_rst <= '1';
    s_set <= '1';
    WAIT FOR 10 ns;
    s_clk<= '1';
    WAIT FOR 10 ns;
    s_clk <= '0';
    s_rst <= '0';
    WAIT FOR 10 ns;
    
    
    WAIT;
  END PROCESS ProcessSimulation;
END Architecture;
      