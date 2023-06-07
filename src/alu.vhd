-- alu.vhd
-- MIPS Single-Cycle Processor
-- Computer Architecture, AAST 2021
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        A          : in  STD_LOGIC_VECTOR(31 downto 0);
        B          : in  STD_LOGIC_VECTOR(31 downto 0);
        ALUControl : in  STD_LOGIC_VECTOR(3 downto 0);
        Result     : out STD_LOGIC_VECTOR(31 downto 0);
        Zero       : out STD_LOGIC
    );
end ALU;

architecture Behavioral of ALU is
    signal alu_result : STD_LOGIC_VECTOR(31 downto 0);
begin

    process(ALUControl, A, B)
    begin
        case ALUControl is
            when "0000" => alu_result <= A and B;
            when "0001" => alu_result <= A or B;
            when "0010" => alu_result <= A + B;
            when "0110" => alu_result <= A - B;
            when "0111" =>
                if A < B then
                    alu_result <= (others => '1');
                else
                    alu_result <= (others => '0');
                end if;
            when "1100" => alu_result <= A nor B;
            when others => alu_result <= (others => '0');
        end case;
    end process;

    Result <= alu_result;
    -- Zero flag: combinational compare
    Zero <= '1' when A = B else '0';

end Behavioral;
