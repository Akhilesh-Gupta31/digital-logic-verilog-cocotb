# Digital Logic Design in Verilog

RTL designs and testbenches for fundamental digital logic modules, simulated using Icarus Verilog and verified visually using GTKWave.

## Tools Used
- **Icarus Verilog** — RTL simulation
- **GTKWave** — waveform analysis
- **WSL2 (Ubuntu)** — development environment

## Modules

| Module | Description | Folder |
|---|---|---|
| Full Adder | 1-bit full adder with carry-in/out | [`full_adder/`](full_adder) |
| Ripple Carry Adder | Multi-bit adder built from full adders | [`ripple_carry_adder/`](ripple_carry_adder) |
| BCD Converter | Binary to BCD conversion logic | [`bcd_converter/`](bcd_converter) |
| 2-bit Comparator | Compares two 2-bit inputs | [`two_bit_comparator/`](two_bit_comparator) |
| 4-to-1 Multiplexer | 4-input mux with 2-bit select line | [`four_to_one_mux/`](four_to_one_mux) |

## How to Run
```bash
iverilog -o sim design.v tb_design.v
vvp sim
gtkwave dump.vcd
```

---
Waveform screenshots to be added soon. Sequential logic (flip-flops, counters, FSMs) and Python/cocotb-based verification are planned as next steps once Python is learned.
