import cocotb
from cocotb.triggers import Timer


def model(din):
    if din == 0:
        return 0, 0
    return din.bit_length() - 1, 1   # index of highest set bit


@cocotb.test()
async def exhaustive_test(dut):
    """All 256 input values."""
    for din in range(256):
        dut.din.value = din
        await Timer(1, "ns")
        exp_out, exp_valid = model(din)
        assert int(dut.valid.value) == exp_valid, f"din={din:08b}: valid wrong"
        assert int(dut.dout.value) == exp_out, \
            f"din={din:08b}: expected {exp_out}, got {int(dut.dout.value)}"
