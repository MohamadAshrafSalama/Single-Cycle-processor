library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RegisterFile is
    Port (
        CLK       : in  STD_LOGIC;
        RegWrite  : in  STD_LOGIC;
        ReadReg1  : in  STD_LOGIC_VECTOR(4 downto 0);
        ReadReg2  : in  STD_LOGIC_VECTOR(4 downto 0);
        WriteReg  : in  STD_LOGIC_VECTOR(4 downto 0);
        WriteData : in  STD_LOGIC_VECTOR(31 downto 0);
        ReadData1 : out STD_LOGIC_VECTOR(31 downto 0);
        ReadData2 : out STD_LOGIC_VECTOR(31 downto 0)
    );
end RegisterFile;

architecture Behavioral of RegisterFile is
    type reg_array is array(0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
    signal regs : reg_array := (0 => x"00000000", others => x"00000000");
begin

    process(CLK, RegWrite)
    begin
        -- combinational read
        ReadData1 <= regs(to_integer(unsigned(ReadReg1)));
        ReadData2 <= regs(to_integer(unsigned(ReadReg2)));

        -- synchronous write
        if RegWrite = '1' and rising_edge(CLK) then
            regs(to_integer(unsigned(WriteReg))) <= WriteData;
        end if;
    end process;

end Behavioral;
