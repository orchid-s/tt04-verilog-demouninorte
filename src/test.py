import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles


segments = [ 7'b0100100, 7'b1001100, 7'b0001111, 7'b0100000, 7'b1001100, 7'b1001100, 7'b0100000, 7'b1001100 ]

@cocotb.test()
async def test_7seg(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # reset
    dut._log.info("reset")
    dut.rst_n.value = 0
    # set the compare value
    dut.ui_in.value = 1
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    # the compare value is shifted 10 bits inside the design to allow slower counting
    max_count = 0x7F
    dut._log.info(f"check all segments with MAX_COUNT set to {max_count}")
    # check all segments and roll over
    for i in range(15):
        dut._log.info("check segment {}".format(i))
        await ClockCycles(dut.clk, max_count)
        assert int(dut.segments.value) == segments[i % 10]

        # all bidirectionals are set to input
        assert dut.uio_oe == 0x00

    # reset
    dut.rst_n.value = 0
    # set a different compare value
    dut.ui_in.value = 3
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    max_count = dut.ui_in.value << 10
    dut._log.info(f"check all segments with MAX_COUNT set to {max_count}")
    # check all segments and roll over
    for i in range(15):
        dut._log.info("check segment {}".format(i))
        await ClockCycles(dut.clk, max_count)
        assert int(dut.segments.value) == segments[i % 10]

