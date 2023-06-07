-- control_unit.vhd
-- MIPS Single-Cycle Processor
-- Computer Architecture, AAST 2021
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ControlUnit is
    Port (
        Opcode   : in  STD_LOGIC_VECTOR(5 downto 0);
        RegDst   : out STD_LOGIC;
        ALUSrc   : out STD_LOGIC;
        MemToReg : out STD_LOGIC;
        RegWrite : out STD_LOGIC;
        MemWrite : out STD_LOGIC;
        MemRead  : out STD_LOGIC;
        Branch   : out STD_LOGIC;
        ALUOp    : out STD_LOGIC_VECTOR(1 downto 0)
    );
end ControlUnit;

architecture Behavioral of ControlUnit is
begin

    process(Opcode)
    begin
        -- Default all control signals to 0
        RegDst   <= '0';
        ALUSrc   <= '0';
        MemToReg <= '0';
        RegWrite <= '0';
        MemWrite <= '0';
        MemRead  <= '0';
        Branch   <= '0';
        ALUOp    <= "00";

        case Opcode is
            when "000000" =>
                -- R-type
                RegDst   <= '1';
                ALUSrc   <= '0';
                MemToReg <= '0';
                RegWrite <= '1';
                MemRead  <= '0';
                MemWrite <= '0';
                Branch   <= '0';
                ALUOp    <= "10";

            when "100011" =>
                -- lw
                RegDst   <= '0';
                ALUSrc   <= '1';
                MemToReg <= '1';
                RegWrite <= '1';
                MemRead  <= '1';
                MemWrite <= '0';
                Branch   <= '0';
                ALUOp    <= "00";

            when "101011" =>
                -- sw
                ALUSrc   <= '1';
                RegWrite <= '0';
                MemRead  <= '0';
                MemWrite <= '1';
                Branch   <= '0';
                ALUOp    <= "00";

            when "000100" =>
                -- beq
                ALUSrc   <= '0';
                RegWrite <= '0';
                MemRead  <= '0';
                MemWrite <= '0';
                Branch   <= '1';
                ALUOp    <= "01";

            when "001000" =>
                -- addi
                RegDst   <= '0';
                ALUSrc   <= '1';
                MemToReg <= '0';
                RegWrite <= '1';
                MemRead  <= '0';
                MemWrite <= '0';
                Branch   <= '0';
                ALUOp    <= "00";

            when others =>
                null;
        end case;
    end process;

end Behavioral;
