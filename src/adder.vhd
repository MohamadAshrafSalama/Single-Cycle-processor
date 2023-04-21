library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder is
    Port (
        A   : in  STD_LOGIC_VECTOR(31 downto 0);
        B   : in  STD_LOGIC_VECTOR(31 downto 0);
        Sum : out STD_LOGIC_VECTOR(31 downto 0)
    );
end Adder;

architecture Behavioral of Adder is
begin
    Sum <= STD_LOGIC_VECTOR(
        to_unsigned(
            to_integer(unsigned(A)) + to_integer(unsigned(B)),
            32
        )
    );
end Behavioral;
