----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:53:53 06/08/2021 
-- Design Name: 
-- Module Name:    ALU_MohamadAshraf_18101303 - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_MohamadAshraf_18101303 is
Port (A : in  STD_LOGIC_VECTOR (31 downto 0);
          B : in  STD_LOGIC_VECTOR (31 downto 0);
          ALUControl : in  STD_LOGIC_VECTOR (3 downto 0);
          Output : out  STD_LOGIC_VECTOR (31 downto 0);
          Zero : out  STD_LOGIC);

end ALU_MohamadAshraf_18101303;

architecture Behavioral of ALU_MohamadAshraf_18101303 is

signal ALU_RESULT : STD_LOGIC_VECTOR (31 downto 0);

begin
process(ALUControl,A,B,ALU_RESULT)
begin
  if(A=B)
   then ZERO <= '1';
	else
	 ZERO <= '0';
	 end if;
case(ALUControl) is

 when "0000" => ALU_RESULT <= A AND B;
 when "0001" => ALU_RESULT <= A OR B; 
 when "0010" => ALU_RESULT <= A + B;
 when "0110" => ALU_RESULT <= A - B;
 when "0111" =>
    if(A<B)
      then ALU_RESULT <= (others =>'1');
     else
        ALU_RESULT <= (others =>'0');
      end if;		 
 when "1100" => ALU_RESULT <= A nor B;
  When others => ALU_RESULT <= (others =>'0');
  end case;
 
END process;
 Output <= ALU_RESULT;
end Behavioral;
