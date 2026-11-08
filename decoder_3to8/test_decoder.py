import cocotb
from cocotb.triggers import Timer


def model(din, en):
    return (1 << din) if en else 0


@cocotb.test()
async def exhaustive_test(dut):
    """Try every combination of din and en (16 total)."""
    for en in (0, 1):
        for din in range(8):
            dut.din.value = din
            dut.en.value = en
            await Timer(1, "ns")
            expected = model(din, en)
            got = int(dut.dout.value)
            assert got == expected, \
                f"en={en} din={din}: expected {expected:08b}, got {got:08b}"
