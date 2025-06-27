PROJECT=zynq_sdram

ROOT = $(abspath $(dir $(firstword $(MAKEFILE_LIST))))
BUILD = $(ROOT)/build
ZYNQ_COMMON = $(ROOT)/zynq_common

# PL hdl firmware
SYN_FILES =  $(ROOT)/hdl/top.sv
SYN_FILES += $(ROOT)/hdl/sdram_axi_core.v
SYN_FILES += $(ROOT)/hdl/sdram_axi_pmem.v
SYN_FILES += $(ROOT)/hdl/sdram_axi.v
SYN_FILES += $(ROOT)/hdl/sdram_io.sv
FPGA_TOP = zynq_sdram

# constraints
XDC_FILES = $(ZYNQ_COMMON)/artyz7.xdc

# PS software
IP_TCL_FILES = $(ZYNQ_COMMON)/zynq_ps.tcl
PS_SOURCE = $(ROOT)/ps_src/main.c

include $(ZYNQ_COMMON)/vivado.mk
include $(ZYNQ_COMMON)/zynq.mk

TTY_DEV = /dev/ttyUSB1
tty:
	sudo screen $(TTY_DEV) 115200