----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:50:57 06/08/2021 
-- Design Name: 
-- Module Name:    shiftLeft_MohamadAshraf_1810303 - Behavioral 
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

entity shiftLeft_MohamadAshraf_1810303 is
Port ( Shift_Left_2_in : in  STD_LOGIC_VECTOR (31 downto 0);
           Shift_Left_2_out : out  STD_LOGIC_VECTOR (31 downto 0));

end shiftLeft_MohamadAshraf_1810303;

architecture Behavioral of shiftLeft_MohamadAshraf_1810303 is

begin
Shift_Left_2_out <= STD_LOGIC_VECTOR(shift_left(unsigned(Shift_Left_2_in),2));
end Behavioral;

