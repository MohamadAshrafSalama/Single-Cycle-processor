----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:26:50 06/08/2021 
-- Design Name: 
-- Module Name:    BranchAdder_MohamadAshraf18101303 - Behavioral 
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

entity BranchAdder_MohamadAshraf18101303 is
Port ( Adder_in_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Adder_in_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Adder_out : out  STD_LOGIC_VECTOR (31 downto 0));

end BranchAdder_MohamadAshraf18101303;

architecture Behavioral of BranchAdder_MohamadAshraf18101303 is

begin
Adder_out <=STD_LOGIC_VECTOR(to_unsigned((to_integer(unsigned(Adder_in_1))+to_integer(unsigned(Adder_in_2))), 32));
end Behavioral;

