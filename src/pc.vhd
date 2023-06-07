-- pc.vhd
-- MIPS Single-Cycle Processor
-- Computer Architecture, AAST 2021
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    Port (
        PCin  : in  STD_LOGIC_VECTOR(31 downto 0);
        CLK   : in  STD_LOGIC;
        PCout : out STD_LOGIC_VECTOR(31 downto 0)
    );
end PC;

architecture Behavioral of PC is
    signal pc_reg : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            PCout <= pc_reg;
        end if;

        if falling_edge(CLK) then
            pc_reg <= PCin;
        end if;
    end process;

end Behavioral;
