import random
import cocotb
from cocotb.triggers import Timer


def model(a, b, op):
    if   op == 0: t = a + b
    elif op == 1: t = a - b
    elif op == 2: t = a & b
    elif op == 3: t = a | b
    elif op == 4: t = a ^ b
    elif op == 5: t = ~a & 0xF
    elif op == 6: t = a << 1
    else:         t = ((a & 1) << 4) | (a >> 1)
    t &= 0x1F
    result = t & 0xF
    carry = (t >> 4) & 1
    zero = 1 if result == 0 else 0
    return result, carry, zero


async def check(dut, a, b, op):
    dut.a.value = a
    dut.b.value = b
    dut.op.value = op
    await Timer(1, "ns")
    exp = model(a, b, op)
    got = (int(dut.result.value), int(dut.carry.value), int(dut.zero.value))
    assert got == exp, f"a={a} b={b} op={op}: expected {exp}, got {got}"


@cocotb.test()
async def exhaustive_test(dut):
    """All 16 x 16 x 8 = 2048 combinations."""
    for op in range(8):
        for a in range(16):
            for b in range(16):
                await check(dut, a, b, op)


@cocotb.test()
async def random_test(dut):
    """Practice random stimulus against the reference model."""
    for _ in range(1000):
        await check(dut, random.randint(0, 15), random.randint(0, 15), random.randint(0, 7))
