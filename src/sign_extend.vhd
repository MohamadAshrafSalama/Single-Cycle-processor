library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SignExtend is
    Port (
        input  : in  STD_LOGIC_VECTOR(15 downto 0);
        output : out STD_LOGIC_VECTOR(31 downto 0)
    );
end SignExtend;

architecture Behavioral of SignExtend is
begin

    process(input)
    begin
        if input(15) = '0' then
            output <= x"0000" & input;
        else
            output <= x"FFFF" & input;
        end if;
    end process;

end Behavioral;
