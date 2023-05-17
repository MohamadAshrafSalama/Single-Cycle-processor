library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DataMemory is
    Port (
        CLK      : in  STD_LOGIC;
        MemRead  : in  STD_LOGIC;
        MemWrite : in  STD_LOGIC;
        Address  : in  STD_LOGIC_VECTOR(31 downto 0);
        WriteData: in  STD_LOGIC_VECTOR(31 downto 0);
        ReadData : out STD_LOGIC_VECTOR(31 downto 0)
    );
end DataMemory;

architecture Behavioral of DataMemory is
    type mem_array is array(0 to 127) of STD_LOGIC_VECTOR(7 downto 0);

    -- Pre-loaded data: "Computer Architecture 2021!!"
    signal mem : mem_array := (
        x"43", x"6F", x"6D", x"70",
        x"75", x"74", x"65", x"72",
        x"20", x"41", x"72", x"63",
        x"68", x"69", x"74", x"65",
        x"63", x"74", x"75", x"72",
        x"65", x"20", x"32", x"30",
        x"32", x"31", x"21", x"21",
        x"32", x"31", x"21", x"21",
        x"00", x"00", x"00", x"00",
        others => x"00"
    );
begin

    process(CLK)
    begin
        if falling_edge(CLK) and MemRead = '1' and MemWrite = '0' then
            ReadData <= mem(to_integer(unsigned(Address)))
                      & mem(to_integer(unsigned(Address)) + 1)
                      & mem(to_integer(unsigned(Address)) + 2)
                      & mem(to_integer(unsigned(Address)) + 3);
        end if;

        if rising_edge(CLK) and MemRead = '0' and MemWrite = '1' then
            mem(to_integer(unsigned(Address)))     <= WriteData(31 downto 24);
            mem(to_integer(unsigned(Address)) + 1) <= WriteData(23 downto 16);
            mem(to_integer(unsigned(Address)) + 2) <= WriteData(15 downto 8);
            mem(to_integer(unsigned(Address)) + 3) <= WriteData(7 downto 0);
        end if;
    end process;

end Behavioral;
