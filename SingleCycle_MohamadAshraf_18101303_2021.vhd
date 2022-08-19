----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:13:52 06/06/2021 
-- Design Name: 
-- Module Name:    MipsSingleCycle_MohamadAshraf_18101303 
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

entity MipsSingleCycle_MohamadAshraf_18101303 is
 Port ( CLK_Main : in  STD_LOGIC:= '0');
end MipsSingleCycle_MohamadAshraf_18101303;

architecture Behavioral of MipsSingleCycle_MohamadAshraf_18101303 is

component ALUControl_MohamadAshraf18101303 is
    Port ( ALU_OP : in  STD_LOGIC_VECTOR (1 downto 0);
           Function_Field : in  STD_LOGIC_VECTOR (5 downto 0);
           operation : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
	
component ALU_MohamadAshraf_18101303 is
    Port (A : in  STD_LOGIC_VECTOR (31 downto 0);
          B : in  STD_LOGIC_VECTOR (31 downto 0);
          ALUControl : in  STD_LOGIC_VECTOR (3 downto 0);
          Output : out  STD_LOGIC_VECTOR (31 downto 0);
          Zero : out  STD_LOGIC);
end component;
	
component ADDER_MohamadAshraf_18101303 is
    Port ( Adder_in_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Adder_in_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Adder_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

	
component controlunit_MohamadAshraf_18101303 is
    Port ( OP : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           MemToReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUop : out  STD_LOGIC_VECTOR (1 downto 0));
end component;
	
component Memoryunitmail_MohamadAshraf_18101303 is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
        	  memread : in  STD_LOGIC;
           memwrite : in  STD_LOGIC;
			  CLK : in STD_LOGIC :='0';
           Wdata : in  STD_LOGIC_VECTOR (31 downto 0);
           Rdata : out  STD_LOGIC_VECTOR (31 downto 0));
   end component;	
	
	
component InstructionMemory_MohamadAshra_18101303 is
    Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);
           instruct : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
	
component Mux2t01_32bit_MohamadAshraf_18101303 is
	Port(	a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);
		sel : IN std_logic;          
		output : OUT std_logic_vector(31 downto 0)
		);
	end component;
	
component MUX2to1_5Bit_MohamadAshraf_18101303 is
	Port(
		a : IN std_logic_vector(4 downto 0);
		b : IN std_logic_vector(4 downto 0);
		sel : IN std_logic;          
		output : OUT std_logic_vector(4 downto 0)
		);
	end component;
	
component PC_MohamadAshraf_18101303 is
 Port ( PCin : in  STD_LOGIC_VECTOR (31 downto 0);
        CLK : in  STD_LOGIC;
        PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
	
component RegisterFile_mohamadAshraf_18101303 is
    Port (RegWrite : in STD_LOGIC;
           rs : in  STD_LOGIC_VECTOR (4 downto 0);
           rt : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
			  CLK: in STD_LOGIC;
			  ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
	
component shiftLeft_MohamadAshraf_1810303 is
    Port ( Shift_Left_2_in : in  STD_LOGIC_VECTOR (31 downto 0);
           Shift_Left_2_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
	
component sighEx_MohamadAshraf_18101303 is
    Port ( SignExtend_in : in  STD_LOGIC_VECTOR (15 downto 0);
           SignExtend_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
	
	signal ALUinput1: std_logic_vector(31 downto 0);
	signal ALUinput2: std_logic_vector(31 downto 0);
	signal ALUoutput: std_logic_vector(31 downto 0);
	signal ALUzeroFlag: std_logic;
	signal ALUselect: std_logic_vector(3 downto 0);
	
	signal PCoutput: std_logic_vector(31 downto 0);
	signal PCinput: std_logic_vector (31 downto 0);
	signal AdderOut: std_logic_vector (31 downto 0);
	
	signal inputInstruction: std_logic_vector (31 downto 0);
	signal readData2: std_logic_vector (31 downto 0);
	signal dataMemoryOut: std_logic_vector (31 downto 0);
	signal writeDataIn: std_logic_vector (31 downto 0);
	signal MUXregDstOut:std_logic_vector (4 downto 0);
	
	signal regDst: std_logic;
	signal branch: std_logic;
	signal memRead: std_logic;
	signal memToReg: std_logic;
	signal ALUopControl: std_logic_vector (1 downto 0);
	signal memWrite: std_logic;
	signal ALUSrc: std_logic;
	signal RegWrite: std_logic;
	
	signal signExtend: std_logic_vector (31 downto 0);
	signal shiftLeft2: std_logic_vector (31 downto 0);
	
	signal ALUoutputToPCMUX: std_logic_vector (31 downto 0);
	signal PCMUXcontrol: std_logic;
	
begin

	PCMain:PC_MohamadAshraf_18101303 PORT MAP(
		CLK => CLK_Main,
		PCin => PCinput,
		PCout => PCoutput 
	);
	
	PCAdder: ADDER_MohamadAshraf_18101303 PORT MAP(
		Adder_in_1 => PCoutput,
		Adder_in_2 => "00000000000000000000000000000100",
		Adder_out => AdderOut
	);
	
	
	BranchAdder: ADDER_MohamadAshraf_18101303 PORT MAP(
		Adder_in_1 => AdderOut,
		Adder_in_2 => shiftLeft2,
		Adder_out => ALUoutputToPCMUX
	);
	
	InstructionMemoryMain: InstructionMemory_MohamadAshra_18101303 PORT MAP(
		PC => PCoutput,
		instruct => inputInstruction
	);
	
	ControlUnitMain: controlunit_MohamadAshraf_18101303 PORT MAP(
		OP => inputInstruction (31 downto 26),
		RegDst => regDst,
		ALUSrc => ALUSrc,
		MemToReg => memToReg,
		RegWrite => RegWrite,
		MemRead => memRead,
		MemWrite => memWrite,
		Branch => branch,
		ALUop => ALUopControl
	);
	
	MUXRegDst: MUX2to1_5Bit_MohamadAshraf_18101303 PORT MAP(
		a => inputInstruction (20 downto 16),
		b => inputInstruction (15 downto 11),
		sel => regDst,
		output => MUXregDstOut 
	);
	
		MemoryMUX: Mux2t01_32bit_MohamadAshraf_18101303 PORT MAP(
		a => ALUoutput,
		b => dataMemoryOut,
		sel => memToReg,
		output => writeDataIn
	);
	
	ALUMUX: Mux2t01_32bit_MohamadAshraf_18101303 PORT MAP(
		a => readData2,
		b => signExtend,
		sel => ALUSrc,
		output => ALUinput2 
	);
	
		PCMUXcontrol <= (branch AND ALUzeroFlag);
	
	PCMUX: Mux2t01_32bit_MohamadAshraf_18101303 PORT MAP(
		a => AdderOut,
		b => ALUoutputToPCMUX,
		sel => PCMUXcontrol,
		output => PCinput
	);
	
	RegisterFileMain: RegisterFile_mohamadAshraf_18101303 PORT MAP(
		ReadData1 => ALUinput1,
		ReadData2 => readData2,
		rs => inputInstruction (25 downto 21),
		rt => inputInstruction (20 downto 16),
		rd => MUXregDstOut,
		WriteData => writeDataIn,
		RegWrite => RegWrite,
      CLK => CLK_Main		
	);
	
	SignExtendMain: sighEx_MohamadAshraf_18101303 PORT MAP(
		SignExtend_in => inputInstruction (15 downto 0),
		SignExtend_out => signExtend
	);
	
	ShiftLeft2Main: shiftLeft_MohamadAshraf_1810303 PORT MAP(
		Shift_Left_2_in => signExtend,
		Shift_Left_2_out => shiftLeft2
	);
	


	ALUControlMain: ALUControl_MohamadAshraf18101303 PORT MAP(
		Function_Field => inputInstruction (5 downto 0),
		ALU_OP => ALUopControl,
		operation => ALUselect
	);
	
	
	ALU: ALU_MohamadAshraf_18101303 PORT MAP(
		A => ALUinput1,
		B => ALUinput2,
		ALUControl => ALUselect,
		Output => ALUoutput,
		Zero => ALUzeroFlag
	);
	
	
	   MemoryUnitMain:  Memoryunitmail_MohamadAshraf_18101303 PORT MAP(
		memread => memRead,
		memwrite => memWrite,
		Wdata => readData2,
		address => ALUoutput,
		Rdata => dataMemoryOut,
		CLK => CLK_Main	
	);
	


end Behavioral;



