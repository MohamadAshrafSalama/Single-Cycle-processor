----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:52:07 06/08/2021 
-- Design Name: 
-- Module Name:    ALUControl_MohamadAshraf18101303 - Behavioral 
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

entity ALUControl_MohamadAshraf18101303 is
Port ( ALU_OP : in  STD_LOGIC_VECTOR (1 downto 0);
           Function_Field : in  STD_LOGIC_VECTOR (5 downto 0);
           operation : out  STD_LOGIC_VECTOR (3 downto 0)
			  );

end ALUControl_MohamadAshraf18101303;

architecture Behavioral of ALUControl_MohamadAshraf18101303 is

begin
process(ALU_OP,Function_Field)
begin

if(ALU_OP = "00")
then operation <="0010";
 
elsif (ALU_OP = "01")
then operation <="0110";

elsif (ALU_OP = "10")
  then if( Function_Field(3 DOWNTO 0) = "0000" )
   then  operation <="0010";
 elsif( Function_Field (3 DOWNTO 0) = "0100" ) 
    then  operation <="0000";
 elsif( Function_Field (3 DOWNTO 0) = "0101" )
    then  operation <="0001";
	 elsif(Function_Field (3 DOWNTO 0) = "0010" )
     then  operation <="0110";
	 elsif(Function_Field (3 DOWNTO 0) = "1010" )
	  then operation <= "0111";
 end if;
 
elsif (ALU_OP = "11")
     then if(Function_Field (3 DOWNTO 0) = "0010" )
     then  operation <="0110";
	 elsif(Function_Field (3 DOWNTO 0) = "1010" )
	  then operation <= "0111";
     end if;
	  
end if;	  
end process;
end Behavioral;


