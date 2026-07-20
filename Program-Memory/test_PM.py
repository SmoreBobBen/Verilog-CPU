# test mem2vga module

import cocotb # type: ignore
from cocotb.triggers import FallingEdge, Timer, RisingEdge, First # type: ignore
import logging

logger = logging.getLogger("test_ALU")
logger.setLevel(logging.DEBUG)

# Opcodes:
OPCODE_ADD  = 0b001
OPCODE_SUB  = 0b010
OPCODE_MULT = 0b011

# helpers =====================================================================
async def generate_clock(dut, NUMCYCLES=200):
    # generate 25MHz clk

    for _ in range(NUMCYCLES):
        dut.clk.value = 0
        await Timer(20, unit="ns")
        dut.clk.value = 1
        await Timer(20, unit="ns")

async def generate_clk_and_reset(dut, NUMCYCLES=200, BEFORE=2, DURING=3):
    # generate a reset signal
    # parameters are for total clock cycles, number of cycles before and during reset
    
    cocotb.start_soon(generate_clock(dut, NUMCYCLES))

    dut.reset.value = 0
    for _ in range(BEFORE):
        await FallingEdge(dut.clk)
    dut.reset.value = 1
    for _ in range(DURING):
        await FallingEdge(dut.clk)
    dut.reset.value = 0

# tests ===================================================
@cocotb.test()
async def basic_test(dut):

    cocotb.start_soon(generate_clk_and_reset(dut, 900000))

    # set values to zero
    dut.opcode_i.value = 0
    dut.A_i.value = 0
    dut.B_i.value = 0

    await FallingEdge(dut.clk)
    await FallingEdge(dut.reset)

    # ===============================================================
    logger.info(" +++ Testing Addition +++ ")

    await FallingEdge(dut.clk)
    dut.opcode_i.value = OPCODE_ADD
    dut.A_i.value = 2
    dut.B_i.value = 2
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    logger.info(f"{int(dut.A_i.value)} + {int(dut.B_i.value)} = {int(dut.result_o.value)}")
    assert dut.result_o.value == 4, "2 + 2 should be four!"

    await FallingEdge(dut.clk)
    dut.opcode_i.value = OPCODE_ADD
    dut.A_i.value = 1389476
    dut.B_i.value = 4378265
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    logger.info(f"{int(dut.A_i.value)} + {int(dut.B_i.value)} = {int(dut.result_o.value)}")
    assert dut.result_o.value == 1389476 + 4378265, "big addition failed!"

    logger.info(" +++ Passed Addition +++ ")

    # ===============================================================
    logger.info(" --- Testing Subtraction --- ")
    dut.opcode_i.value = 1

    await FallingEdge(dut.clk)
    dut.opcode_i.value = OPCODE_SUB
    dut.A_i.value = 4378265
    dut.B_i.value = 1389476
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    logger.info(f"{int(dut.A_i.value)} - {int(dut.B_i.value)} = {int(dut.result_o.value)}")
    assert dut.result_o.value == 4378265 - 1389476, "big subtraction failed!"

    logger.info(f" --- Passed Subtraction --- ")

    # ===============================================================
    logger.info(" --- Testing Multiplication --- ")
    dut.opcode_i.value = 1

    await FallingEdge(dut.clk)
    dut.opcode_i.value = OPCODE_MULT
    dut.A_i.value = 6
    dut.B_i.value = 12
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    logger.info(f"{int(dut.A_i.value)} - {int(dut.B_i.value)} = {int(dut.result_o.value)}")
    assert dut.result_o.value == 6*12, "multiplication failed!"

    logger.info(f" --- Passed Multiplication --- ")