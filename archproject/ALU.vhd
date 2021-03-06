LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
--------------------------------------------------
entity ALU is
Port(	F: out std_logic_vector(15 downto 0);
	A,B:in std_logic_vector(15 downto 0);     		
     	Cin:in std_logic;
	AluSelect: in std_logic_vector(4 downto 0);
	cout:out std_logic
);
         --flag:out std_logic_vector(15 downto 0));
end entity ALU;
---------------------------------------------------
architecture AluBehavioral of ALU is---------------
---------------------------------------------------
signal outAdd: std_logic_vector(15 downto 0);
signal carryadd :std_logic ;
---------------------------------------------------
begin----------------------------------------------
---------------------------------------------------
u3: entity work.AddOperations PORT MAP (A,B,CIN,AluSelect(0),AluSelect(1),AluSelect(2),outAdd,carryadd);
F <= A and B when AluSelect = "00000"
else A or B when AluSelect ="00001"
else A xnor B when AluSelect = "00010"
else not A when AluSelect = "00011"
---
else  '0' & A(15 downto 1) when AluSelect="00100"
else A(0) &  A(15 downto 1) when AluSelect="00101"
else Cin & A(15 downto 1) when AluSelect="00110"
else A(15) & A(15 downto 1)when AluSelect="00111"
---
else A(14 downto 0) &  '0' when AluSelect="01000"
else A(14 downto 0) & A(15) when AluSelect ="01001"
else A(14 downto 0) & CIN when AluSelect="01010"
else A when AluSelect="01011"
else B when AluSelect="01100"
else "0000000000000000" when AluSelect="01101"
else outAdd when  AluSelect(4)='1';	
---
Cout<=A(0) when AluSelect="00110"
else A(15) when AluSelect="01010"
else carryadd when AluSelect(4)='1'
else Cin;
---





----------------------------------------------------------------------------------------------
    end  AluBehavioral ;