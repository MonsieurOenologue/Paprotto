LIBRARY ieee.std_logic;
USE ieee.std_logic_1164.all;

ENTITY fsm IS
  PORT(
    run : IN std_logic;
    reset : IN std_logic;
    clk : IN std_logic;
    IR : IN std_logic_vector(9 DOWNTO 0);
    
    done : OUT std_logic;
    sel : OUT std_logic_vector(3 DOWNTO 0);
    R0 : OUT std_logic;
    R1 : OUT std_logic;
    R2 : OUT std_logic;
    R3 : OUT std_logic;
    R4 : OUT std_logic;
    R5 : OUT std_logic;
    R6 : OUT std_logic;
    R7 : OUT std_logic;
    IRSet : OUT std_logic
  );
END ENTITY fsm;

ARCHITECTURE behavior OF fsm IS
  TYPE fsm_states IS (ST0,ST1,ST2,ST3,ST4,ST5,ST6,ST7,ST8,ST9,ST10,ST11,ST12,ST13,ST14);
  SIGNAL state:fsm_states;
  SIGNAL CODOP : std_logic_vector(3 DOWNTO 0);
  SIGNAL bit4a6 : std_logic_vector(2 DOWNTO 0);
  SIGNAL bit7a9 : std_logic_vector(2 DOWNTO 0);
BEGIN
  RST : PROCESS(reset)
  BEGIN
    if reset='1' then
      --Mettre le code du reset ici
    END IF;
  END PROCESS RST;
  RUN : PROCESS(run, clk)
  BEGIN
    IF run = '1' THEN
      IRSet <= '1';
      CODOP <= IR(3 DOWNTO 0);
      bit4a6 <= IR(6 DOWNTO 4);
      bit7a9 <= IR(9 DOWNTO 7);
      state <= ST0;
      CASE state IS
        WHEN STO=>
        IRSet <= 1;
          CASE CODOP IS
          WHEN '0000'=>
            state <= ST1; -- MVI
          WHEN '0001'=>
            state <= ST2; -- MV
          WHEN '0010'=>
            state <= ST3; -- ADD
          WHEN '0011'=> 
            state <= ST3; -- SUB
          WHEN '0100'=>
            state <= ST3; -- MULT
          WHEN OTHER => 
            state <= ST7; -- DONE
      END IF;
    END PROCESS RUN;
    
    FSM : PROCESS(state)
    BEGIN
      CASE state IS
        WHEN ST1=> -- MVI
          sel <= CODOP;
          CASE bit4a6 IS
          WHEN '000'=>
            R7 <= '1';
          WHEN '001' =>
            R6 <= '1';
          WHEN '010' =>
            R5 <= '1';
          WHEN '011' =>
            R4 <= '1';
          WHEN '100' =>
            R3 <= '1';
          WHEN '101" =>
            R2 <= '1';
          WHEN '110' =>
            R1 <= '1';
          WHEN '111' =>
            R0 <= '1';
          state <= ST7;
        WHEN ST2=> -- MV
          CASE state IS
        WHEN ST1=> -- MVI
          sel <= CODOP;
          CASE bit4a6 IS
          WHEN '000'=>
            R7 <= '1';
          WHEN '001' =>
            R6 <= '1';
          WHEN '010' =>
            R5 <= '1';
          WHEN '011' =>
            R4 <= '1';
          WHEN '100' =>
            R3 <= '1';
          WHEN '101" =>
            R2 <= '1';
          WHEN '110' =>
            R1 <= '1';
          WHEN '111' =>
            R0 <= '1';
            
          state <= ST7;
        WHEN ST3=> -- ADD/SUB/MULT
          
          state <= ST4; 
        WHEN ST4=> -- ADD/SUB/MULT
          
          state <= ST5;
        WHEN ST5=> -- ADD/SUB/MULT
          
          state <= ST7;
        WHEN ST6=> -- MAUVAIS CALCUL DE MA PART
        WHEN ST7=> --DONE
          run <= '0';
          done <= '1';
    
    END PROCESS FSM;
  
  
END ARCHITECTURE behavior;