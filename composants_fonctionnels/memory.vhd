LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY memory IS
  GENERIC(N : POSITIVE := 8);
  PORT(
    clk, rst, R0s, R1s, R2s, R3s, R4s, R5s, R6s, R7s : STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
    R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
  );
    
END ENTITY memory;

Architecture Behavior OF memory IS
  COMPONENT shiftregG IS
	GENERIC(N : POSITIVE := 8);
	PORT(
	 clk,rst,set : IN STD_LOGIC;
	 din : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	 dout : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
  );
  END COMPONENT;
BEGIN
    shift0 : shiftregG GENERIC MAP(N) PORT MAP(clk, rst, R0s, din, R0out);
    shift1 : shiftregG GENERIC MAP(N) PORT MAP(clk, rst, R1s, din, R1out);
    shift2 : shiftregG GENERIC MAP(N) PORT MAP(clk, rst, R2s, din, R2out);
    shift3 : shiftregG GENERIC MAP(N) PORT MAP(clk, rst, R3s, din, R3out);
    shift4 : shiftregG GENERIC MAP(N) PORT MAP(clk, rst, R4s, din, R4out);
    shift5 : shiftregG GENERIC MAP(N) PORT MAP(clk, rst, R5s, din, R5out);
    shift6 : shiftregG GENERIC MAP(N) PORT MAP(clk, rst, R6s, din, R6out);
    shift7 : shiftregG GENERIC MAP(N) PORT MAP(clk, rst, R7s, din, R7out);
      
END Architecture Behavior;
