LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY fsm IS
	PORT(
		clk, reset, run : IN STD_LOGIC;
		IR : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	
		R0, R1, R2, R3, R4, R5, R6, R7, Aset, Gset, done : OUT STD_LOGIC;
		multSel : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "ZZZZ";
		aluSel : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "ZZZZ"
		);
END ENTITY fsm;

ARCHITECTURE Behavior OF fsm IS
	TYPE fsm_states IS (ST0, ST1, ST2, ST3, ST4, ST5, ST6);
	SIGNAL current_state, next_state : fsm_states;
	SIGNAL mults, CODOP, mults2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL RegChoice : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
	CODOP <= IR(15 DOWNTO 12);
	RegChoice <= IR(11 DOWNTO 9); 
	mults <= IR(8 DOWNTO 5);
  mults2 <= IR(4 DOWNTO 1);
  
	NSL : process(current_state, run, CODOP)
	BEGIN
		next_state <= current_state;
		CASE current_state IS
			WHEN ST0 =>
				IF run = '1' THEN
					CASE CODOP IS
						WHEN "0000" =>
							next_state <= ST1;
						WHEN "0001" =>
							next_state <= ST2;
						when "0010" =>
							next_state <= ST3;
						WHEN "0011" =>
							next_state <= ST3;
						WHEN "0100" =>
							next_state <= ST3;
						WHEN others =>
							next_state <= ST0;
					END CASE;
				END IF;
			WHEN ST1 =>
				next_state <= ST6;
			WHEN ST2 =>
				next_state <= ST6;
			WHEN ST3 =>
				next_state <= ST4;
			WHEN ST4 =>
				next_state <= ST5;
			WHEN ST5 =>
				next_state <= ST6;
			WHEN ST6 =>
				next_state <= ST0;
		END CASE;
	END PROCESS NSL;

	OL : PROCESS(current_state, run, RegChoice)
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
		multSel <= "0000";
		aluSel <= "0000";
		CASE current_state IS
			WHEN ST0 =>
			  IF run = '1' THEN
			   done <= '0';
			  END IF;
			WHEN ST1 =>
				multSel <= "0000";
				CASE RegChoice IS
					WHEN "000" =>
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
					WHEN others =>
				END CASE;
			WHEN ST2 =>
				multSel <= mults;
				CASE RegChoice IS
					WHEN "000" =>
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
					WHEN others =>
				END CASE;
			WHEN ST3 =>
			  multSel <= mults;
			  Aset <= '1';
			WHEN ST4 =>
			  multSel <= mults2;
			  aluSel <= CODOP;
			  Gset <= '1';
			WHEN ST5 =>
			  multSel <= "1001";
			  CASE RegChoice IS
					WHEN "000" =>
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
					WHEN others =>
				END CASE;
			WHEN ST6 =>
				done <= '1';
		END CASE;
	END PROCESS OL;

	SM : PROCESS
	BEGIN 
	WAIT UNTIL rising_edge(clk);
		IF reset = '1' THEN
			current_state <= ST6;
		--	done <= '1';
		ELSE
			CODOP <= IR(15 DOWNTO 12);
			RegChoice <= IR(11 DOWNTO 9);
			mults <= IR(8 DOWNTO 5);
			mults2 <= IR(4 DOWNTO 1);
			current_state <= next_state;
		END IF;
	END PROCESS SM;
END Behavior;
