PROJECT=zynq_sdram

# FPGA settings
FPGA_PART = xc7z020clg400-1
FPGA_TOP = zynq_sdram
FPGA_ARCH = zynq7

ROOT = $(abspath $(dir $(firstword $(MAKEFILE_LIST))))
BUILD = $(ROOT)/build
BOARD_PATH = $(ROOT)/board

# ps config
IP_TCL_FILES = $(ROOT)/common/zynq_ps.tcl

PS_SOURCE = $(ROOT)/ps_src/main.c

# Files for synthesis
SYN_FILES =  $(ROOT)/hdl/top.sv
SYN_FILES += $(ROOT)/hdl/sdram_axi_core.v
SYN_FILES += $(ROOT)/hdl/sdram_axi_pmem.v
SYN_FILES += $(ROOT)/hdl/sdram_axi.v
SYN_FILES += $(ROOT)/hdl/sdram_io.v

# XDC files
XDC_FILES = $(BOARD_PATH)/artyz7.xdc
XDC_FILES += $(BOARD_PATH)/debug.xdc


include $(ROOT)/common/vivado.mk
include $(ROOT)/common/zynq.mk



