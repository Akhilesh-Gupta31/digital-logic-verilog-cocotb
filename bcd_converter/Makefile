SIM_SRC = bcd.v tb_bcd.v ../ripple_carry_adder/ripple_carry_adder.v ../ripple_carry_adder/full_adder.v

all: compile run

compile:
	iverilog -o bcd.vvp $(SIM_SRC)

run:
	vvp bcd.vvp

clean:
	rm -f bcd.vvp dump.vcd

