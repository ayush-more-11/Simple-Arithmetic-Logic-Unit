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

## Module Specifications

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

## Testbench (`ALU_tb.v`)

The testbench (`ALU_tb.v`) provides comprehensive testing of all ALU operations:

### Test Setup
- **Operand A**: `4'b0110` (6 in decimal)
- **Operand B**: `4'b0010` (2 in decimal)
- **Test Cases**: All 8 operations tested sequentially

## Key Design Characteristics

1. **Combinational Design**: The ALU operates combinatorially without clock dependency, making it suitable for use as a building block in larger digital systems

2. **Modular Architecture**: Clean port interface makes it easy to integrate into microprocessor or RISC designs

3. **Extensibility**: Can be extended to support:
   - Larger bit widths (8-bit, 16-bit, 32-bit)
   - Additional operations (multiply, divide, shift, etc.)
   - Enhanced condition flags (zero flag, sign flag, overflow flag)


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

