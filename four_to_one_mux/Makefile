# Compiler and simulator setup
COMPILER = iverilog
SIMULATOR = vvp
TARGET = sim.vvp

# Source files
SRCS = four_X_one.v four_X_one_case.v tb_compare_mux.v

# Targets
all: compile run

compile:
	   $(COMPILER) -o $(TARGET) $(SRCS)

run:
	   $(SIMULATOR) $(TARGET)

wave:
	   gtkwave dump_mux_compare.vcd &

clean:
	   rm -f $(TARGET) dump_mux_compare.vcd
