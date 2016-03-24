LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY topLevel IS
	PORT(
			clk : IN STD_LOGIC;
			reset : IN std_logic;
			run : IN std_logic; 
			code : IN std_logic_vector(15 DOWNTO 0);

			done : out std_logic
		);
END ENTITY topLevel;

ARCHITECTURE behavior OF topLevel IS
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
				Aset : OUT std_logic;
				Gset : OUT std_logic;
				ALU : OUT std_logic_vector(3 DOWNTO 0);
				IRSet : OUT std_logic
			);
	END COMPONENT;
	-- Component full Adder Generic that we will use in the ALU
	COMPONENT faG IS
		GENERIC(N : POSITIVE := 8);
		PORT(
		A,B : IN std_logic_vector(N-1 DOWNTO 0);
		Cin : IN std_logic;
		S : OUT std_logic_vector(N-1 DOWNTO 0);
		Cout : OUT std_logic
	);
	END COMPONENT;
	--mult 
	COMPONENT mult IS
		GENERIC(N:POSITIVE := 8);
		PORT(
		a,b : IN std_logic_vector(N-1 DOWNTO 0);
		S : OUT std_logic_vector((2*N)-1 DOWNTO 0)
	);
	END COMPONENT;
	--Just think, it'll be useless, we put there in ALU

	SIGNAL R0s : std_logic;
	SIGNAL R1s : std_logic;
	SIGNAL R2s : std_logic;
	SIGNAL R3s : std_logic;
	SIGNAL R4s : std_logic;
	SIGNAL R5s : std_logic;
	SIGNAL R6s : std_logic;
	SIGNAL R7s : std_logic;

	SIGNAL ALUs : std_logic_vector(3 DOWNTO 0);
	SIGNAL Gs : std_logic_vector(15 DOWNTO 0);
	--SIGNAL StorageDatas : std_logic_vector(15 DOWNTO 0);
	SIGNAL IRSets : std_logic
	SIGNAL multSel : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
	fsm : FSM port map(run, reset, clk,code(9 DOWNTO 0), done, multSel,R0,R1,R2,R3,R4,R5,R6,R7,As,Gs, ALUs,IRSets);	
END ARCHITECTURE behavior;
