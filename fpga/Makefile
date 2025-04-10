# SPDX-License-Identifier: MIT
#
# Copyright (c) 2025 FPGA Ninja, LLC
#
# Authors:
# - Alex Forencich
#

PROJECT=zynq_sdram

# FPGA settings
FPGA_PART = xc7z020clg400-1
FPGA_TOP = zynq_sdram
FPGA_ARCH = zynq7

BOARD_PATH = ../board

# ps config
ZYNQPS_YML = $(BOARD_PATH)/artyz7.yml
IP_TCL_FILES = zynqps.tcl

PS_SOURCE = ./ps_src/main.c

# Files for synthesis
SYN_FILES = ../hdl/top.sv
SYN_FILES += ../core_sdram_axi4/src_v/sdram_axi_core.v
SYN_FILES += ../core_sdram_axi4/src_v/sdram_axi_pmem.v
SYN_FILES += ../core_sdram_axi4/src_v/sdram_axi.v

# SYN_FILES = ../rtl/fpga.sv
# SYN_FILES += ../rtl/fpga_core.sv
# SYN_FILES += ../lib/taxi/rtl/eth/taxi_eth_mac_mii_fifo.f
# SYN_FILES += ../lib/taxi/rtl/lss/taxi_uart.f
# SYN_FILES += ../lib/taxi/rtl/sync/taxi_sync_reset.sv
# SYN_FILES += ../lib/taxi/rtl/sync/taxi_sync_signal.sv
# SYN_FILES += ../lib/taxi/rtl/io/taxi_debounce_switch.sv

# XDC files
XDC_FILES = $(BOARD_PATH)/artyz7.xdc
# XDC_FILES = ../fpga.xdc
# XDC_FILES += ../lib/taxi/syn/vivado/taxi_eth_mac_fifo.tcl
# XDC_FILES += ../lib/taxi/syn/vivado/taxi_axis_async_fifo.tcl
# XDC_FILES += ../lib/taxi/syn/vivado/taxi_sync_reset.tcl
# XDC_FILES += ../lib/taxi/syn/vivado/taxi_sync_signal.tcl


include ../common/vivado.mk
include ../common/zynq.mk



