LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Paprotto IS
	PORT(
			clk : IN STD_LOGIC;
			reset : IN std_logic;
			run : IN std_logic; 
			code : IN std_logic_vector(15 DOWNTO 0);

			done : OUT std_logic;
			overflow : OUT std_logic
		);
END ENTITY Paprotto;

ARCHITECTURE behavior OF Paprotto IS
	--Component controler
	COMPONENT fsm IS
		PORT(
				run : IN std_logic;
				reset : IN std_logic;
				clk : IN std_logic;
				IR : IN std_logic_vector(9 DOWNTO 0);

				done : OUT std_logic;
				multSel : OUT std_logic_vector(3 DOWNTO 0);
				R0 : OUT std_logic;
				R1 : OUT std_logic;
				R2 : OUT std_logic;
				R3 : OUT std_logic;
				R4 : OUT std_logic;
				R5 : OUT std_logic;
				R6 : OUT std_logic;
				R7 : OUT std_logic;
				Aset : OUT std_logic_vector(15 DOWNTO 0);
				Gset : OUT std_logic_vector(15 DOWNTO 0);
				ALU : OUT std_logic_vector(3 DOWNTO 0);
				IRSet : OUT std_logic
			);
	END COMPONENT;

	COMPONENT alu IS
		GENERIC(N:POSITIVE := 8);
		PORT(
			clk : IN std_logic;
			sel : IN std_logic_vector(3 DOWNTO 0);
			A, B : IN std_logic_vector(N-1 DOWNTO 0);
			Q : OUT std_logic_vector(N-1 DOWNTO 0);
			Cout : OUT std_logic
	);
	END COMPONENT;

	--Memory generic
	COMPONENT shiftregG IS
		GENERIC(N : POSITIVE := 8);
		PORT(
			clk,rst,set : IN STD_LOGIC;
			d : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	);
	END COMPONENT;

	-- Selectors for memorys
	SIGNAL Rs : std_logic_vector(7 DOWNTO 0);
	SIGNAL Routs : std_logic_vector(15 DOWNTO 0);

	SIGNAL ALUs : std_logic_vector(3 DOWNTO 0);
	SIGNAL Gs : std_logic_vector(15 DOWNTO 0);
	SIGNAL goToGs : std_logic_vector(15 DOWNTO 0);
	--SIGNAL StorageDatas : std_logic_vector(15 DOWNTO 0);
	SIGNAL IRSets : std_logic;
	--multSel : select which value will be take
	SIGNAL multSel : STD_LOGIC_VECTOR(3 DOWNTO 0);
	-- mults is the exit of the multiplexer
	SIGNAL mults : STD_LOGIC_VECTOR(15 DOWNTO 0);
	--As is the exit of A register
	SIGNAL As : std_logic_vector(15 DOWNTO 0);
	
BEGIN
	fsme : fsm PORT MAP(run, reset, clk, code(9 DOWNTO 0), done, multSel, Rs(0),Rs(1),Rs(2),Rs(3),Rs(4),Rs(5),Rs(6),Rs(7), As, Gs, ALUs, IRSets); -- Problem : Duplicate declaration	
	alue : alu PORT MAP(clk, ALUs, As , multSel, goToGs, overflow); -- Problem : Duplicate declaration
	memory : for i in 0 to 7 GENERATE
		shiftregG : shiftregG (Generic : 15) PORT MAP(clk, rst, Rs(i), multSel, Routs(i));
	END GENERATE memory;
END ARCHITECTURE behavior;

