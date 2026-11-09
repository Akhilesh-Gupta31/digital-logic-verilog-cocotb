SIM ?= icarus
TOPLEVEL_LANG = verilog
VERILOG_SOURCES = $(PWD)/priority_encoder.v $(PWD)/dump.v
COMPILE_ARGS += -s dump

COCOTB_TOPLEVEL = priority_encoder
COCOTB_TEST_MODULES = test_priority_encoder
TOPLEVEL = priority_encoder
MODULE = test_priority_encoder

include $(shell cocotb-config --makefiles)/Makefile.sim
