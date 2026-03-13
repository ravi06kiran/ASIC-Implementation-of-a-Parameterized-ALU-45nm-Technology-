# 🚀 Parameterized ALU ASIC Implementation (RTL → Synthesis Flow)

# 📌 Project Overview

This project implements a **parameterized Arithmetic Logic Unit (ALU)** using Verilog and demonstrates a simplified **ASIC design flow from RTL design to gate-level synthesis**.

The design supports multiple arithmetic operations and is implemented as a **synchronous sequential circuit using a clock and active-low reset** to ensure stable and glitch-free operation.

Functional verification is performed using a **custom Verilog testbench and waveform analysis**, followed by **logic synthesis using Cadence Genus targeting the 45nm generic standard cell library (gpdk45)**.

This project demonstrates the **fundamental front-end ASIC design workflow used in the semiconductor industry.**

---

# 🧠 ASIC Design Flow

```
RTL Design (Verilog)
        │
        ▼
Functional Verification
(Testbench + Simulation)
        │
        ▼
Waveform Analysis
(EPWave / GTKWave)
        │
        ▼
Logic Synthesis
(Cadence Genus)
        │
        ▼
Gate-Level Netlist
+ PPA Reports
        │
        ▼
Ready for Physical Design
(Cadence Innovus)
```

---

# ⚙️ Design Features

- Parameterized ALU architecture
- Scalable bit-width using Verilog parameters
- Synchronous sequential design
- Active-low reset for proper initialization
- Supports multiple arithmetic operations
- Synthesizable ASIC-ready RTL

---

# 🧮 Supported Operations

| Opcode | Operation | Description |
|------|------|------|
| `00` | Addition | Computes A + B |
| `01` | Subtraction | Computes A − B |
| `10` | Multiplication | Computes A × B |
| `11` | Division | Computes A ÷ B |

---

# 🏗️ Design Architecture

The calculator is implemented as a **clocked sequential module**.

### Inputs

| Signal | Description |
|------|------|
| `clk` | System clock |
| `rst_n` | Active-low reset |
| `A [N-1:0]` | Operand A |
| `B [N-1:0]` | Operand B |
| `Operation [1:0]` | Operation selector |

### Output

| Signal | Description |
|------|------|
| `Result [(2*N)-1:0]` | Arithmetic result |

The **parameter `N` controls the bit width**, allowing the design to scale to different architectures:

```
4-bit
8-bit
16-bit
32-bit
```

without modifying the RTL logic.

---

# 🧪 Verification Strategy

Functional verification is performed using a **custom Verilog testbench**.

Verification includes:

- Reset behavior validation
- Clock synchronized stimulus
- Arithmetic operation testing
- Randomized input generation using `$random`

Simulation waveforms were analyzed to verify:

- clock behavior
- reset functionality
- correct arithmetic results

---

---

# 🛠️ Tools & Technologies

| Category | Tool |
|------|------|
| Hardware Description Language | Verilog |
| Simulation | Icarus Verilog |
| Waveform Viewer | GTKWave / EPWave |
| Logic Synthesis | Cadence Genus |
| Standard Cell Library | gpdk45 |
| Physical Design (Target) | Cadence Innovus |

---

---
# ▶️ Running Simulation

Compile the design and testbench:

```bash
iverilog -o alu_sim rtl/Calculator.v tb/Calc_tb.v
```

Run the simulation:

```bash
vvp alu_sim
```

View the waveform:

```bash
gtkwave dump.vcd
```

---

# 📈 Synthesis Flow (Cadence Genus)

The RTL design can be synthesized using **Cadence Genus**.

Typical synthesis steps:

1. Read RTL design
2. Load standard cell library (`gpdk45`)
3. Apply timing constraints using **SDC**
4. Run synthesis optimization
5. Generate reports

Outputs generated after synthesis:

- Gate-level netlist
- Area report
- Timing report
- Power report

---


# 🎯 Learning Outcomes

This project demonstrates understanding of:

- RTL hardware design using Verilog
- Sequential logic with clock and reset
- Functional verification using testbenches
- ASIC synthesis using industry EDA tools
- Generation of gate-level netlists and PPA reports

---
