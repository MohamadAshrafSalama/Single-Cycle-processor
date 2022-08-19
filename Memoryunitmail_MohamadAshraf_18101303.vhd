----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:56:04 06/08/2021 
-- Design Name: 
-- Module Name:    Memoryunitmail_MohamadAshraf_18101303 - Behavioral 
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

entity Memoryunitmail_MohamadAshraf_18101303 is
Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
        	  memread : in  STD_LOGIC;
           memwrite : in  STD_LOGIC;
			  CLK : in STD_LOGIC :='0';
           Wdata : in  STD_LOGIC_VECTOR (31 downto 0);
           Rdata : out  STD_LOGIC_VECTOR (31 downto 0)
			   );

end Memoryunitmail_MohamadAshraf_18101303;

architecture Behavioral of Memoryunitmail_MohamadAshraf_18101303 is

type A is array(0 to 127) of STD_LOGIC_VECTOR (7 downto 0);
signal mem: A :=(
x"43",x"6F",x"6D",x"70",
x"75",x"74",x"65",x"72",
x"20",x"41",x"72",x"63",
x"68",x"69",x"74",x"65",
x"63",x"74",x"75",x"72",
x"65",x"20",x"32",x"30",
x"32",x"31",x"21",x"21",
x"32",x"31",x"21",x"21",
x"00",x"00",x"00",x"00",
others => x"00");

begin

process(memread, memwrite, CLK)

begin

if(falling_edge(CLK) and memread = '1' and memwrite = '0') then
 Rdata <= mem(to_integer(unsigned(address)))&
              mem(to_integer(unsigned(address))+1)&
				  mem(to_integer(unsigned(address))+2)&
				  mem(to_integer(unsigned(address))+3);
end if;

if(rising_edge(CLK) and memread = '0' and memwrite = '1') then
	mem(to_integer(unsigned(address))) <= Wdata(31 downto 24);
	mem(to_integer(unsigned(address))+1) <= Wdata(23 downto 16);
	mem(to_integer(unsigned(address))+2) <= Wdata(15 downto 8);
	mem(to_integer(unsigned(address))+3) <= Wdata(7 downto 0);
end if;

end process;

end Behavioral;
