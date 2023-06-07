-- alu_control.vhd
-- MIPS Single-Cycle Processor
-- Computer Architecture, AAST 2021
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUControl is
    Port (
        ALUOp         : in  STD_LOGIC_VECTOR(1 downto 0);
        FunctionField : in  STD_LOGIC_VECTOR(5 downto 0);
        Operation     : out STD_LOGIC_VECTOR(3 downto 0)
    );
end ALUControl;

architecture Behavioral of ALUControl is
begin

    process(ALUOp, FunctionField)
    begin
        if ALUOp = "00" then
            -- lw / sw: add
            Operation <= "0010";

        elsif ALUOp = "01" then
            -- beq: subtract
            Operation <= "0110";

        elsif ALUOp = "10" then
            -- R-type: decode function field
            case FunctionField(3 downto 0) is
                when "0000" => Operation <= "0010"; -- add
                when "0010" => Operation <= "0110"; -- sub
                when "0100" => Operation <= "0000"; -- and
                when "0101" => Operation <= "0001"; -- or
                when "1010" => Operation <= "0111"; -- slt
                when others => Operation <= "0000";
            end case;

        else
            Operation <= "0000";
        end if;
    end process;

end Behavioral;
