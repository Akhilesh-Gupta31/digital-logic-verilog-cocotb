SIM_SRC = bcd.v tb_bcd.v ../adders/ripple_carry_adder.v ../adders/full_adder.v

all: compile run

compile:
	iverilog -o bcd.vvp $(SIM_SRC)

run:
	vvp bcd.vvp

clean:
	rm -f bcd.vvp dump.vcd

