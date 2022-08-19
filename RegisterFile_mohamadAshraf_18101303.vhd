----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:47:25 06/08/2021 
-- Design Name: 
-- Module Name:    RegisterFile_mohamadAshraf_18101303 - Behavioral 
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

entity RegisterFile_mohamadAshraf_18101303 is
Port (RegWrite : in STD_LOGIC;
           rs : in  STD_LOGIC_VECTOR (4 downto 0);
           rt : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
			  CLK: in STD_LOGIC;
			  ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile_mohamadAshraf_18101303;

architecture Behavioral of RegisterFile_mohamadAshraf_18101303 is

type Register_File is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
signal reg: Register_File:= (5=>x"0000003C", Others=>x"00000000");


begin
process(CLK,RegWrite)
begin

ReadData1 <= reg(to_integer(unsigned(rs)));
ReadData2  <= reg(to_integer(unsigned(rt)));

if( RegWrite = '1' and rising_edge(CLk) )
 then reg(to_integer(unsigned(rd))) <= WriteData; 
end if;
end process;
end Behavioral;

