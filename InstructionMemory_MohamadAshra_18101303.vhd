----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:28:32 06/08/2021 
-- Design Name: 
-- Module Name:    InstructionMemory_MohamadAshra_18101303 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstructionMemory_MohamadAshra_18101303 is
Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);
           instruct : out  STD_LOGIC_VECTOR (31 downto 0));

end InstructionMemory_MohamadAshra_18101303;

architecture Behavioral of InstructionMemory_MohamadAshra_18101303 is

type A is array(0 to 127) of STD_LOGIC_VECTOR (7 downto 0);
signal mem: A:=
(x"20",x"02",x"00",x"00",
x"20",x"08",x"00",x"04",
x"20",x"86",x"00",x"00",
x"20",x"A7",x"00",x"00",
x"20",x"09",x"00",x"01",
x"8C",x"C3",x"00",x"00",
x"20",x"42",x"00",x"01",
x"AC",x"E3",x"00",x"00",
x"00",x"C8",x"30",x"20",
x"00",x"E8",x"38",x"20",
x"00",x"69",x"50",x"2A",
x"11",x"40",x"FF",x"F9",
x"00",x"49",x"10",x"22",
others=>x"00");

begin


    instruct<=mem(to_integer(unsigned(PC)))&
            mem(to_integer(unsigned(PC))+1)&
            mem(to_integer(unsigned(PC))+2)&
            mem(to_integer(unsigned(PC))+3);

end Behavioral;




