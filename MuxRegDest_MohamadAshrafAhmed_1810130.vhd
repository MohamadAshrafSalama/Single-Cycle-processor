----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:37:58 06/08/2021 
-- Design Name: 
-- Module Name:    MuxRegDest_MohamadAshrafAhmed_1810130 - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MuxRegDest_MohamadAshrafAhmed_1810130 is
 port (a : in  STD_LOGIC_VECTOR (4 downto 0);
           b : in  STD_LOGIC_VECTOR (4 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (4 downto 0));
end MuxRegDest_MohamadAshrafAhmed_1810130;

architecture Behavioral of MuxRegDest_MohamadAshrafAhmed_1810130 is

begin

process(a,b,sel)
begin
if(sel = '0') then
output <= a;
else
output <= b;
end if;
end process;


end Behavioral;

