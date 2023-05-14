library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity InstructionMemory is
    Port (
        Address     : in  STD_LOGIC_VECTOR(31 downto 0);
        Instruction : out STD_LOGIC_VECTOR(31 downto 0)
    );
end InstructionMemory;

architecture Behavioral of InstructionMemory is
    type mem_array is array(0 to 127) of STD_LOGIC_VECTOR(7 downto 0);

    -- Test program:
    --   addi $v0, $zero, 0       # counter = 0
    --   addi $t0, $zero, 4       # limit = 4
    --   addi $a2, $a0, 0         # src pointer
    --   addi $a3, $a1, 0         # dst pointer
    --   addi $t1, $zero, 1       # increment
    --   lw   $v1, 0($a2)         # load word from src
    --   addi $v0, $v0, 1         # counter++
    --   sw   $v1, 0($a3)         # store word to dst
    --   add  $a2, $a2, $t0       # src += 4
    --   add  $a3, $a3, $t0       # dst += 4
    --   slt  $t2, $v1, $t1       # t2 = (v1 < 1)?
    --   beq  $t2, $zero, -7      # if t2==0 loop back
    --   sub  $v0, $v0, $t1       # adjust counter
    signal mem : mem_array := (
        x"20", x"02", x"00", x"00",
        x"20", x"08", x"00", x"04",
        x"20", x"86", x"00", x"00",
        x"20", x"A7", x"00", x"00",
        x"20", x"09", x"00", x"01",
        x"8C", x"C3", x"00", x"00",
        x"20", x"42", x"00", x"01",
        x"AC", x"E3", x"00", x"00",
        x"00", x"C8", x"30", x"20",
        x"00", x"E8", x"38", x"20",
        x"00", x"69", x"50", x"2A",
        x"11", x"40", x"FF", x"F9",
        x"00", x"49", x"10", x"22",
        others => x"00"
    );
begin

    Instruction <= mem(to_integer(unsigned(Address)))
                 & mem(to_integer(unsigned(Address)) + 1)
                 & mem(to_integer(unsigned(Address)) + 2)
                 & mem(to_integer(unsigned(Address)) + 3);

end Behavioral;
