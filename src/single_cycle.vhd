library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SingleCycle is
    Port (
        CLK : in STD_LOGIC := '0'
    );
end SingleCycle;

architecture Behavioral of SingleCycle is

    -- Component declarations
    component PC is
        Port (
            PCin  : in  STD_LOGIC_VECTOR(31 downto 0);
            CLK   : in  STD_LOGIC;
            PCout : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    component Adder is
        Port (
            A   : in  STD_LOGIC_VECTOR(31 downto 0);
            B   : in  STD_LOGIC_VECTOR(31 downto 0);
            Sum : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    component InstructionMemory is
        Port (
            Address     : in  STD_LOGIC_VECTOR(31 downto 0);
            Instruction : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    component ControlUnit is
        Port (
            Opcode   : in  STD_LOGIC_VECTOR(5 downto 0);
            RegDst   : out STD_LOGIC;
            ALUSrc   : out STD_LOGIC;
            MemToReg : out STD_LOGIC;
            RegWrite : out STD_LOGIC;
            MemWrite : out STD_LOGIC;
            MemRead  : out STD_LOGIC;
            Branch   : out STD_LOGIC;
            ALUOp    : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    component RegisterFile is
        Port (
            CLK       : in  STD_LOGIC;
            RegWrite  : in  STD_LOGIC;
            ReadReg1  : in  STD_LOGIC_VECTOR(4 downto 0);
            ReadReg2  : in  STD_LOGIC_VECTOR(4 downto 0);
            WriteReg  : in  STD_LOGIC_VECTOR(4 downto 0);
            WriteData : in  STD_LOGIC_VECTOR(31 downto 0);
            ReadData1 : out STD_LOGIC_VECTOR(31 downto 0);
            ReadData2 : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    component ALU is
        Port (
            A          : in  STD_LOGIC_VECTOR(31 downto 0);
            B          : in  STD_LOGIC_VECTOR(31 downto 0);
            ALUControl : in  STD_LOGIC_VECTOR(3 downto 0);
            Result     : out STD_LOGIC_VECTOR(31 downto 0);
            Zero       : out STD_LOGIC
        );
    end component;

    component ALUControl is
        Port (
            ALUOp         : in  STD_LOGIC_VECTOR(1 downto 0);
            FunctionField : in  STD_LOGIC_VECTOR(5 downto 0);
            Operation     : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component SignExtend is
        Port (
            input  : in  STD_LOGIC_VECTOR(15 downto 0);
            output : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    component ShiftLeft2 is
        Port (
            input  : in  STD_LOGIC_VECTOR(31 downto 0);
            output : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    component Mux2to1_32bit is
        Port (
            a      : in  STD_LOGIC_VECTOR(31 downto 0);
            b      : in  STD_LOGIC_VECTOR(31 downto 0);
            sel    : in  STD_LOGIC;
            output : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    component Mux2to1_5bit is
        Port (
            a      : in  STD_LOGIC_VECTOR(4 downto 0);
            b      : in  STD_LOGIC_VECTOR(4 downto 0);
            sel    : in  STD_LOGIC;
            output : out STD_LOGIC_VECTOR(4 downto 0)
        );
    end component;

    component DataMemory is
        Port (
            CLK       : in  STD_LOGIC;
            MemRead   : in  STD_LOGIC;
            MemWrite  : in  STD_LOGIC;
            Address   : in  STD_LOGIC_VECTOR(31 downto 0);
            WriteData : in  STD_LOGIC_VECTOR(31 downto 0);
            ReadData  : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    -- Internal signals
    signal pc_in, pc_out          : STD_LOGIC_VECTOR(31 downto 0);
    signal pc_plus_4              : STD_LOGIC_VECTOR(31 downto 0);
    signal branch_target          : STD_LOGIC_VECTOR(31 downto 0);
    signal instruction            : STD_LOGIC_VECTOR(31 downto 0);

    signal reg_dst_sig            : STD_LOGIC;
    signal alu_src_sig            : STD_LOGIC;
    signal mem_to_reg_sig         : STD_LOGIC;
    signal reg_write_sig          : STD_LOGIC;
    signal mem_write_sig          : STD_LOGIC;
    signal mem_read_sig           : STD_LOGIC;
    signal branch_sig             : STD_LOGIC;
    signal alu_op_sig             : STD_LOGIC_VECTOR(1 downto 0);

    signal write_reg              : STD_LOGIC_VECTOR(4 downto 0);
    signal write_data             : STD_LOGIC_VECTOR(31 downto 0);
    signal read_data1             : STD_LOGIC_VECTOR(31 downto 0);
    signal read_data2             : STD_LOGIC_VECTOR(31 downto 0);

    signal sign_extended          : STD_LOGIC_VECTOR(31 downto 0);
    signal shifted                : STD_LOGIC_VECTOR(31 downto 0);

    signal alu_input2             : STD_LOGIC_VECTOR(31 downto 0);
    signal alu_result             : STD_LOGIC_VECTOR(31 downto 0);
    signal alu_zero               : STD_LOGIC;
    signal alu_control_sig        : STD_LOGIC_VECTOR(3 downto 0);

    signal mem_read_data          : STD_LOGIC_VECTOR(31 downto 0);
    signal branch_mux_sel         : STD_LOGIC;

begin

    -- PC
    PC_inst : PC port map (
        PCin  => pc_in,
        CLK   => CLK,
        PCout => pc_out
    );

    -- PC + 4
    PCAdder_inst : Adder port map (
        A   => pc_out,
        B   => x"00000004",
        Sum => pc_plus_4
    );

    -- Branch adder
    BranchAdder_inst : Adder port map (
        A   => pc_plus_4,
        B   => shifted,
        Sum => branch_target
    );

    -- Instruction memory
    IMem_inst : InstructionMemory port map (
        Address     => pc_out,
        Instruction => instruction
    );

    -- Control unit
    Ctrl_inst : ControlUnit port map (
        Opcode   => instruction(31 downto 26),
        RegDst   => reg_dst_sig,
        ALUSrc   => alu_src_sig,
        MemToReg => mem_to_reg_sig,
        RegWrite => reg_write_sig,
        MemWrite => mem_write_sig,
        MemRead  => mem_read_sig,
        Branch   => branch_sig,
        ALUOp    => alu_op_sig
    );

    -- Register destination mux
    RegDstMux_inst : Mux2to1_5bit port map (
        a      => instruction(20 downto 16),
        b      => instruction(15 downto 11),
        sel    => reg_dst_sig,
        output => write_reg
    );

    -- Register file
    RegFile_inst : RegisterFile port map (
        CLK       => CLK,
        RegWrite  => reg_write_sig,
        ReadReg1  => instruction(25 downto 21),
        ReadReg2  => instruction(20 downto 16),
        WriteReg  => write_reg,
        WriteData => write_data,
        ReadData1 => read_data1,
        ReadData2 => read_data2
    );

    -- Sign extend
    SignExt_inst : SignExtend port map (
        input  => instruction(15 downto 0),
        output => sign_extended
    );

    -- Shift left 2
    Shift_inst : ShiftLeft2 port map (
        input  => sign_extended,
        output => shifted
    );

    -- ALU source mux
    ALUSrcMux_inst : Mux2to1_32bit port map (
        a      => read_data2,
        b      => sign_extended,
        sel    => alu_src_sig,
        output => alu_input2
    );

    -- ALU control
    ALUCtrl_inst : ALUControl port map (
        ALUOp         => alu_op_sig,
        FunctionField => instruction(5 downto 0),
        Operation     => alu_control_sig
    );

    -- ALU
    ALU_inst : ALU port map (
        A          => read_data1,
        B          => alu_input2,
        ALUControl => alu_control_sig,
        Result     => alu_result,
        Zero       => alu_zero
    );

    -- Data memory
    DMem_inst : DataMemory port map (
        CLK       => CLK,
        MemRead   => mem_read_sig,
        MemWrite  => mem_write_sig,
        Address   => alu_result,
        WriteData => read_data2,
        ReadData  => mem_read_data
    );

    -- Memory-to-register mux
    MemToRegMux_inst : Mux2to1_32bit port map (
        a      => alu_result,
        b      => mem_read_data,
        sel    => mem_to_reg_sig,
        output => write_data
    );

    -- Branch mux
    branch_mux_sel <= branch_sig and alu_zero;

    BranchMux_inst : Mux2to1_32bit port map (
        a      => pc_plus_4,
        b      => branch_target,
        sel    => branch_mux_sel,
        output => pc_in
    );

end Behavioral;
