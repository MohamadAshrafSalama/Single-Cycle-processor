# MIPS Single-Cycle Processor

A VHDL implementation of a single-cycle MIPS processor, designed as part of the Computer Architecture course at the Arab Academy for Science, Technology and Maritime Transport (AAST), 2021.

The design follows the standard single-cycle datapath from Patterson & Hennessy's "Computer Organization and Design."

## Supported Instructions

| Type   | Instruction | Opcode/Function | Description                 |
|--------|-------------|------------------|-----------------------------|
| R-type | add         | funct 100000     | rd = rs + rt                |
| R-type | sub         | funct 100010     | rd = rs - rt                |
| R-type | and         | funct 100100     | rd = rs AND rt              |
| R-type | or          | funct 100101     | rd = rs OR rt               |
| R-type | slt         | funct 101010     | rd = (rs < rt) ? 1 : 0     |
| I-type | lw          | 100011           | rt = Memory[rs + imm]       |
| I-type | sw          | 101011           | Memory[rs + imm] = rt       |
| I-type | beq         | 000100           | if (rs == rt) PC += offset  |
| I-type | addi        | 001000           | rt = rs + imm               |

## Datapath Overview

```
                    +-----+
        +---------->| PC  |---+------------------+
        |           +-----+   |                  |
        |                     v                  |
        |              +-------------+           |
        |              | Instruction |           |
        |              |   Memory    |           |
        |              +-------------+           |
        |                     |                  |
        |                     v                  |
        |              +-----------+    +------+ |
        |              |  Control  |--->| PC+4 | |
        |              |   Unit    |    |Adder | |
        |              +-----------+    +------+ |
        |                     |           |      |
        |                     v           v      |
        |  +---------+  +-----------+  +-------+ |
        |  | RegDst  |->| Register  |  |Branch | |
        |  |  Mux    |  |   File    |  | Adder | |
        |  +---------+  +-----------+  +-------+ |
        |                  |    |          |      |
        |                  v    v          |      |
        |               +--------+        |      |
        |  +----------->|  ALU   |        |      |
        |  | ALUSrc Mux |        |        |      |
        |  +----------->+--------+        |      |
        |                  |    |         |      |
        |                  v    v         |      |
        |              +--------+ +------+|      |
        |              |  Data  | |Branch||      |
        |              | Memory | | Mux  |-------+
        |              +--------+ +------+
        |                  |
        |  +-----------+   |
        +--| MemToReg  |<--+
           |    Mux    |
           +-----------+
```

## Project Structure

```
src/                    -- VHDL source files
  pc.vhd               -- Program Counter
  adder.vhd            -- 32-bit Adder (PC+4 and branch)
  instruction_memory.vhd-- Instruction Memory (ROM)
  control_unit.vhd     -- Main Control Unit
  register_file.vhd    -- 32x32 Register File
  alu.vhd              -- Arithmetic Logic Unit
  alu_control.vhd      -- ALU Control decoder
  data_memory.vhd      -- Data Memory (RAM)
  sign_extend.vhd      -- 16-to-32 bit Sign Extension
  shift_left_2.vhd     -- Shift Left 2 for branch offset
  mux2to1_32bit.vhd    -- 32-bit 2-to-1 Multiplexer
  mux2to1_5bit.vhd     -- 5-bit 2-to-1 Multiplexer
  single_cycle.vhd     -- Top-level entity
testbench/
  single_cycle_tb.vhd  -- Testbench
docs/
  datapath.txt          -- Datapath description
```

## Simulation

The testbench can be run using any VHDL simulator (ModelSim, GHDL, Xilinx ISim, etc.).

### Using GHDL

```bash
# Analyze all source files
ghdl -a src/pc.vhd src/adder.vhd src/sign_extend.vhd src/shift_left_2.vhd \
     src/mux2to1_32bit.vhd src/mux2to1_5bit.vhd src/alu.vhd \
     src/alu_control.vhd src/control_unit.vhd src/register_file.vhd \
     src/instruction_memory.vhd src/data_memory.vhd src/single_cycle.vhd \
     testbench/single_cycle_tb.vhd

# Elaborate
ghdl -e SingleCycle_tb

# Run
ghdl -r SingleCycle_tb --vcd=output.vcd --stop-time=5000ns
```

### Using Xilinx ISE / ISim

1. Create a new project and add all files from `src/` and `testbench/`
2. Set `SingleCycle_tb` as the top-level simulation module
3. Run behavioral simulation

## Test Program

The instruction memory comes pre-loaded with a program that demonstrates the supported instructions. It performs a memory copy loop using `lw`, `sw`, `addi`, `add`, `slt`, and `beq`, then finishes with a `sub` instruction.
