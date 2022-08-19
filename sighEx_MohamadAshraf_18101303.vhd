----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:49:15 06/08/2021 
-- Design Name: 
-- Module Name:    sighEx_MohamadAshraf_18101303 - Behavioral 
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

entity sighEx_MohamadAshraf_18101303 is
Port ( SignExtend_in : in  STD_LOGIC_VECTOR (15 downto 0);
           SignExtend_out : out  STD_LOGIC_VECTOR (31 downto 0));
end sighEx_MohamadAshraf_18101303;

architecture Behavioral of sighEx_MohamadAshraf_18101303 is

begin

process(SignExtend_in)
begin

if (SignExtend_in(15) = '0')
then
SignExtend_out <= x"0000" & SignExtend_in ;
else
SignExtend_out <= x"FFFF" & SignExtend_in ;
end if;

end process;

end Behavioral;



