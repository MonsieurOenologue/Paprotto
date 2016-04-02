LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testFSM IS
END testFSM;

Architecture Test of testFSM IS
COMPONENT fsm IS
	PORT(
		clk, reset, run : IN STD_LOGIC;
		IR : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	
		R0, R1, R2, R3, R4, R5, R6, R7, Aset, Gset,IRSet, done : OUT STD_LOGIC;
		multSel : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		aluSel : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
END COMPONENT;

COMPONENT Instruction_register IS
	GENERIC(N : POSITIVE := 8);
	PORT(
	clk,rst,set : IN STD_LOGIC;
	din : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	dout : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END COMPONENT;

SIGNAL s_clk, s_set, s_IRset : STD_LOGIC := '0';
SIGNAL s_reset, s_run : STD_LOGIC;
SIGNAL s_IR : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL s_fromIR : STD_LOGIC_VECTOR(15 DOWNTO 0);

SIGNAL s_R : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s_Aset, s_Gset, s_done : STD_LOGIC;
SIGNAL s_multSel, s_aluSel : STD_LOGIC_VECTOR(3 DOWNTO 0);

Begin
  testIR : Instruction_register GENERIC MAP(16) PORT MAP(s_clk, s_reset, s_IRset, s_IR, s_fromIR);
  testFSM : fsm PORT MAP(s_clk, s_reset, s_run, s_fromIR, s_R(0), s_R(1), s_R(2), s_R(3), s_R(4), s_R(5), s_R(6), s_R(7), s_Aset, s_Gset, s_IRset, s_done, s_multSel, s_aluSel);
     ProcessSimulation : PROCESS
     BEGIN
        WAIT FOR 10 ns;
        s_reset <= '1';
        
        WAIT FOR 10 ns;
        s_clk <= '1';
        
        WAIT FOR 10 ns;
        s_clk <= '0';
        
        s_IR <= "0001010001001100";
        s_reset <= '0';
        
        WAIT FOR 10 ns;
        s_clk <= '1';
        WAIT FOR 10 ns;
        s_clk <= '0';
        
        s_run <= '1';
        
        WAIT FOR 10 ns;
        s_clk <= '1';
        WAIT FOR 10 ns;
        s_clk <= '0';
        
                s_run <= '0';
                
        s_clk <= '1';
        WAIT FOR 10 ns;
        s_clk <= '0';
        WAIT FOR 10 ns;
         
        s_clk <= '1';
        WAIT FOR 10 ns;
        s_clk <= '0';
        
        s_clk <= '1';
        WAIT FOR 10 ns;
        s_clk <= '0';
        WAIT FOR 10 ns;
 
         s_clk <= '1';
        WAIT FOR 10 ns;
        s_clk <= '0';
        WAIT FOR 10 ns;
        
        s_clk <= '1';
        WAIT FOR 10 ns;
        s_clk <= '0';
        WAIT FOR 10 ns;
        
        s_clk <= '1';
        WAIT FOR 10 ns;
        s_clk <= '0';
        WAIT FOR 10 ns;
        
        s_IR <= "0011111001001100";
        
        s_run <= '1';
        
        WAIT FOR 10 ns;
        s_clk <= '1';
        WAIT FOR 10 ns;
        s_clk <= '0';
        
        s_run <= '0';
                
        s_clk <= '1';
        WAIT FOR 10 ns;
        s_clk <= '0';
        WAIT FOR 10 ns;
        
        s_clk <= '1';
        WAIT FOR 10 ns;
        s_clk <= '0';
        WAIT FOR 10 ns;        
         
        s_clk <= '1';
        WAIT FOR 10 ns;
        s_clk <= '0';
        
        s_clk <= '1';
        WAIT FOR 10 ns;
        s_clk <= '0';
        WAIT FOR 10 ns;
 
         s_clk <= '1';
        WAIT FOR 10 ns;
        s_clk <= '0';
        WAIT FOR 10 ns;
        
        s_clk <= '1';
        WAIT FOR 10 ns;
        s_clk <= '0';
        WAIT FOR 10 ns;
            
        WAIT;
      END PROCESS ProcessSimulation;
    END Test;
    