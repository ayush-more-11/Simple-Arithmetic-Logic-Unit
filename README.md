# Simple ALU (Arithmetic Logic Unit)

A simple 4-bit Arithmetic Logic Unit (ALU) implementation in Verilog with support for basic arithmetic and logical operations.

## 📋 Overview

This project implements a basic 4-bit ALU that performs eight different operations (add, subtract, AND, OR, XOR, NOT, increment, and decrement) based on a 3-bit operation selector. The ALU also generates a carry-out signal for overflow detection in arithmetic operations.

## 🔧 Features

- **4-bit operands** (A and B)
- **8 selectable operations** via 3-bit control signal
- **Carry-out flag** for overflow detection in arithmetic operations
- **Combinational logic** implementation (no clock required)
- **Complete testbench** for simulation and verification

## 📁 Project Structure

```
Simple-ALU/
├── src/
│   ├── ALU.v          # Main ALU module
│   └── ALU_tb.v       # Testbench for simulation
├── results/           # Simulation results directory
├── LICENSE            # MIT License
└── README.md          # This file
```

## 🛠️ Module Specifications

### ALU Module (`ALU.v`)

#### Ports

| Port Name | Direction | Width | Description |
|-----------|-----------|-------|-------------|
| `A` | Input | 4-bit | First operand |
| `B` | Input | 4-bit | Second operand |
| `ALU_sel` | Input | 3-bit | Operation selector |
| `ALU_out` | Output | 4-bit | Result output |
| `Carryout` | Output | 1-bit | Carry-out flag |

#### Operations

| ALU_sel | Operation | Description | Carry-out |
|---------|-----------|-------------|-----------|
| `000` | A + B | Addition | Used (5-bit result split) |
| `001` | A - B | Subtraction | Used (5-bit result split) |
| `010` | A & B | Bitwise AND | Always 0 |
| `011` | A \| B | Bitwise OR | Always 0 |
| `100` | A ^ B | Bitwise XOR | Always 0 |
| `101` | ~A | Bitwise NOT (inverts A) | Always 0 |
| `110` | A + 1 | Increment A | Always 0 |
| `111` | A - 1 | Decrement A | Always 0 |

### Implementation Details

- **Design Type**: Combinational logic (combinatorial circuit)
- **Timing**: Propagation delay only, no clock dependency
- **Operation**: Uses `always@(*)` block for asynchronous operation
- **Word Size**: 4-bit for operands, 4-bit for output
- **Overflow Handling**: Carry-out flag captures overflow in arithmetic operations

## 🧪 Testbench (`ALU_tb.v`)

The testbench (`ALU_tb.v`) provides comprehensive testing of all ALU operations:

### Test Setup
- **Operand A**: `4'b0110` (6 in decimal)
- **Operand B**: `4'b0010` (2 in decimal)
- **Test Cases**: All 8 operations tested sequentially

### Expected Results

| Operation | Inputs | Expected Output | Carryout | Notes |
|-----------|--------|-----------------|----------|-------|
| ADD (000) | 6 + 2 | 1000 (8) | 0 | No overflow |
| SUB (001) | 6 - 2 | 0100 (4) | 0 | Positive result |
| AND (010) | 0110 & 0010 | 0010 (2) | 0 | Bitwise AND |
| OR (011) | 0110 \| 0010 | 0110 (6) | 0 | Bitwise OR |
| XOR (100) | 0110 ^ 0010 | 0100 (4) | 0 | Bitwise XOR |
| NOT (101) | ~0110 | 1001 (9) | 0 | Inverts all bits of A |
| INC (110) | 6 + 1 | 0111 (7) | 0 | Increment A |
| DEC (111) | 6 - 1 | 0101 (5) | 0 | Decrement A |

### Monitoring
The testbench uses `$monitor` to display:
- Current simulation time
- Input values (A and B) in both binary and decimal
- Operation selector (ALU_sel)
- Output value (ALU_out) in both binary and decimal
- Carry-out flag status

## 🚀 Simulation

### Prerequisites
- Verilog simulator (ModelSim, Vivado, or open-source alternatives like Icarus Verilog)
- No external dependencies

### Running the Simulation

**Using Icarus Verilog:**
```bash
# Compile
iverilog -o alu_sim src/ALU.v src/ALU_tb.v

# Run
vvp alu_sim
```

**Using ModelSim:**
```bash
vlog src/ALU.v src/ALU_tb.v
vsim ALU_tb
run -all
```

**Using Vivado:**
1. Create a new Vivado project
2. Add `src/ALU.v` as design source
3. Add `src/ALU_tb.v` as simulation source
4. Run simulation

## 📊 Sample Output

```
Time = 0 | A = 0110 (6) | B = 0010 (2) | ALU_sel = 000 | ALU_out = 1000 (8) | Carryout = 0
Time = 10 | A = 0110 (6) | B = 0010 (2) | ALU_sel = 001 | ALU_out = 0100 (4) | Carryout = 0
Time = 20 | A = 0110 (6) | B = 0010 (2) | ALU_sel = 010 | ALU_out = 0010 (2) | Carryout = 0
Time = 30 | A = 0110 (6) | B = 0010 (2) | ALU_sel = 011 | ALU_out = 0110 (6) | Carryout = 0
Time = 40 | A = 0110 (6) | B = 0010 (2) | ALU_sel = 100 | ALU_out = 0100 (4) | Carryout = 0
Time = 50 | A = 0110 (6) | B = 0010 (2) | ALU_sel = 101 | ALU_out = 1001 (9) | Carryout = 0
Time = 60 | A = 0110 (6) | B = 0010 (2) | ALU_sel = 110 | ALU_out = 0111 (7) | Carryout = 0
Time = 70 | A = 0110 (6) | B = 0010 (2) | ALU_sel = 111 | ALU_out = 0101 (5) | Carryout = 0
```

## 💡 Key Design Characteristics

1. **Combinational Design**: The ALU operates combinatorially without clock dependency, making it suitable for use as a building block in larger digital systems

2. **Modular Architecture**: Clean port interface makes it easy to integrate into microprocessor or RISC designs

3. **Extensibility**: Can be extended to support:
   - Larger bit widths (8-bit, 16-bit, 32-bit)
   - Additional operations (multiply, divide, shift, etc.)
   - Enhanced condition flags (zero flag, sign flag, overflow flag)

4. **Synthesis**: The design is synthesizable and can be implemented on FPGAs (Xilinx, Altera) or ASICs

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🎓 Educational Value

This ALU implementation is ideal for:
- Learning digital logic design fundamentals
- Understanding hardware description languages (Verilog/VHDL)
- Studying combinational logic circuits
- Building a foundation for processor design
- FPGA prototyping and verification

## 🔗 Related Concepts

- **Digital Logic**: Combinational vs Sequential circuits
- **Verilog Fundamentals**: Modules, always blocks, case statements
- **Processor Design**: Core component of CPU/ALU blocks
- **HDL Simulation**: Testbench design and verification

---

**Author**: ayush-more-11  
**Created**: September 2025  
**Project Status**: Educational Implementation
