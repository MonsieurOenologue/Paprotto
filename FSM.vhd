LIBRARY ieee;
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
    Aset : OUT std_logic;
    Gset : OUT std_logic;
    ALU : OUT std_logic_vector(3 DOWNTO 0);
    IRSet : OUT std_logic
  );
END ENTITY fsm;

ARCHITECTURE behavior OF fsm IS
  TYPE fsm_states IS (ST0,ST1,ST2,ST3,ST4,ST5,ST6,ST7);
  SIGNAL state : fsm_states;
  SIGNAL nextState : fsm_states;
  SIGNAL CODOP : std_logic_vector(3 DOWNTO 0);
  SIGNAL bit4a6 : std_logic_vector(2 DOWNTO 0);
  SIGNAL bit7a10 : std_logic_vector(3 DOWNTO 0);
BEGIN
  RST : PROCESS(reset)
  BEGIN
    if reset='1' then
      --Mettre le code du reset ici
    END IF;
  END PROCESS RST;

  
    FSM : PROCESS(state, CODOP, bit4a6, run)
    BEGIN
          R0 <= '0';
          R1 <= '0';
          R2 <= '0';
          R3 <= '0';
          R4 <= '0';
          R5 <= '0';
          R6 <= '0';
          R7 <= '0';
          Aset <= '0';
          Gset <= '0';
          IRSet <= '0';
      CASE state IS
        WHEN ST0 =>
          IF (run = '1') THEN
            CASE CODOP IS
            WHEN "0000"=>
              nextState <= ST1; -- MVI
            WHEN "0001"=>
              nextState <= ST2; -- MV
            WHEN "0010"=>
             nextState <= ST3; -- ADD
            WHEN "0011"=> 
              nextState <= ST3; -- SUB
            WHEN "0100"=>
              nextState <= ST3; -- MULT
            WHEN OTHERS => 
              nextState <= ST7; -- DONE
            END CASE;
          ELSE
          nextState <= ST0;
          END IF;

        WHEN ST1=> -- MVI
          sel <= CODOP;

            CASE bit4a6 IS
              WHEN "000"=>
                R7 <= '1';
              WHEN "001" =>
                R6 <= '1';
              WHEN "010" =>
                R5 <= '1';
              WHEN "011" =>
                R4 <= '1';
              WHEN "100" =>
                R3 <= '1';
              WHEN "101" =>
                R2 <= '1';
              WHEN "110" =>
                R1 <= '1';
              WHEN "111" =>
                R0 <= '1';
              WHEN OTHERS=>
                
            END CASE;
            
            --Remise a  0 
          nextState <= ST7;
          --END OF ST1
          
        WHEN ST2=> -- MV
          sel <= CODOP;
          
          CASE bit4a6 IS
          WHEN "000"=>
            R7 <= '1';
          WHEN "001" =>
            R6 <= '1';
          WHEN "010" =>
            R5 <= '1';
          WHEN "011" =>
            R4 <= '1';
          WHEN "100" =>
            R3 <= '1';
          WHEN "101" =>
            R2 <= '1';
          WHEN "110" =>
            R1 <= '1';
          WHEN "111" =>
            R0 <= '1';
          WHEN OTHERS =>
          END CASE;
            
          --REMISE A L'ETAT "0" DES SETTERS Ri/A/G
          nextState <= ST7;
          --END OF ST2
          
        WHEN ST3=> -- ADD/SUB/MULT
          sel <= CODOP;
          Aset <= '1';
          nextState <= ST4;
           
        WHEN ST4=> -- ADD/SUB/MULT
          Aset <= '0';
          ALU <= CODOP;
          Gset <= '1';
          sel <= bit7a10;
          nextState <= ST5;
          
        WHEN ST5=> -- ADD/SUB/MULT
          Gset <= '0';
          CASE bit4a6 IS
          WHEN "000"=>
            R7 <= '1';
          WHEN "001" =>
            R6 <= '1';
          WHEN "010" =>
            R5 <= '1';
          WHEN "011" =>
            R4 <= '1';
          WHEN "100" =>
            R3 <= '1';
          WHEN "101" =>
            R2 <= '1';
          WHEN "110" =>
            R1 <= '1';
          WHEN "111" =>
            R0 <= '1';
          WHEN OTHERS =>
          END CASE;
          nextState <= ST7;
        WHEN ST6=> -- MAUVAIS CALCUL DE MA PART
          
        WHEN ST7=> --DONE
          sel <= "0000";
          done <= '1';
           END CASE;
    END PROCESS FSM;
    
    NS : PROCESS(nextState)
    BEGIN
        state <= nextState;
    END PROCESS NS;
  
  
END ARCHITECTURE behavior;