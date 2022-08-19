----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:31:41 06/08/2021 
-- Design Name: 
-- Module Name:    controlunit_MohamadAshraf_18101303 - Behavioral 
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

entity controlunit_MohamadAshraf_18101303 is
Port ( OP : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           MemToReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUop : out  STD_LOGIC_VECTOR (1 downto 0));
end controlunit_MohamadAshraf_18101303;

architecture Behavioral of controlunit_MohamadAshraf_18101303 is

begin
process(OP)
begin
if OP = "000000" then
RegDst <= '1';
ALUSrc <= '0';
MemToReg <= '0';
RegWrite <= '1';
MemRead <= '0';
MemWrite <= '0';
Branch <= '0';
ALUop <= "10";
elsif OP = "100011" then
RegDst <= '0';
ALUSrc <= '1';
MemToReg <= '1';
RegWrite <= '1';
MemRead <= '1';
MemWrite <= '0';
Branch <= '0';
ALUop <= "00";
elsif OP = "101011" then
ALUSrc <= '1';
RegWrite <= '0';
MemRead <= '0';
MemWrite <= '1';
Branch <= '0';
ALUop <= "00";
elsif OP = "000100" then
ALUSrc <= '0';
RegWrite <= '0';
MemRead <= '0';
MemWrite <= '0';
Branch <= '1';
ALUop <= "01";
elsif OP = "001000" then 
RegDst <= '0';
ALUSrc <= '1';
RegWrite <= '1';
MemRead <= '0';
MemToReg <= '0';
MemWrite <= '0';
Branch <= '0';
ALUop <= "00";

end if;

end process;

end Behavioral;