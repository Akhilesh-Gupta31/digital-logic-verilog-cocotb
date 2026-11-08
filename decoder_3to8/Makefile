SIM ?= icarus
TOPLEVEL_LANG = verilog
VERILOG_SOURCES = $(PWD)/decoder_3to8.v

# cocotb 2.x names
COCOTB_TOPLEVEL = decoder_3to8
COCOTB_TEST_MODULES = test_decoder
# cocotb 1.x names (harmless on 2.x)
TOPLEVEL = decoder_3to8
MODULE = test_decoder

include $(shell cocotb-config --makefiles)/Makefile.sim
