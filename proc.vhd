ENTITY proc IS
end proc;

ARCHITECTURE Behavior OF proc IS
  COMPONENT faG IS
	GENERIC(N : POSITIVE := 8);
	PORT(
	A,B : IN std_logic_vector(N-1 DOWNTO 0);
	Cin : IN std_logic;
	S : OUT std_logic_vector(N-1 DOWNTO 0);
	Cout : OUT std_logic
);
END COMPONENT;
  SIGNAL A,B, Cin, S, Cout : STD_LOGIC_VECTOR (8 DOWNTO 0);
  BEGIN
    A <= "0000001" after 10 ns;
    B <= "0000010" after 2 ns;
    add1 : faG GENERIC MAP(8) PORT MAP(A, B, '0', S, Cout);
      ASSERT(S = "00000011") report "ERROR";
END ARCHITECTURE Behavior;
