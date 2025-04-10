# SPDX-License-Identifier: MIT
###################################################################
#
# Xilinx Vivado FPGA Makefile
#
# Copyright (c) 2016-2025 Alex Forencich
#
###################################################################
#
# Parameters:
# FPGA_TOP - Top module name
# FPGA_FAMILY - FPGA family (e.g. VirtexUltrascale)
# FPGA_DEVICE - FPGA device (e.g. xcvu095-ffva2104-2-e)
# SYN_FILES - list of source files
# INC_FILES - list of include files
# XDC_FILES - list of timing constraint files
# XCI_FILES - list of IP XCI files
# IP_TCL_FILES - list of IP TCL files (sourced during project creation)
# CONFIG_TCL_FILES - list of config TCL files (sourced before each build)
#
# Note: both SYN_FILES and INC_FILES support file list files.  File list
# files are files with a .f extension that contain a list of additional
# files to include, one path relative to the .f file location per line.
# The .f files are processed recursively, and then the complete file list
# is de-duplicated, with later files in the list taking precedence.
#
# Example:
#
# FPGA_TOP = fpga
# FPGA_FAMILY = VirtexUltrascale
# FPGA_DEVICE = xcvu095-ffva2104-2-e
# SYN_FILES = rtl/fpga.v
# XDC_FILES = fpga.xdc
# XCI_FILES = ip/pcspma.xci
# include ../common/vivado.mk
#
###################################################################

# phony targets
.PHONY: fpga vivado program flash tmpclean clean distclean

# prevent make from deleting intermediate files and reports
.PRECIOUS: %.xpr %.bit %.bin %.ltx %.xsa %.mcs %.prm
.SECONDARY:

SRC_PATH ?= ../ps_src
VPATH = src:$(SRC_PATH)

BUILD_PATH ?= ./build
PS_SRC = $(wildcard $(SRC_PATH)/*.c)
PS_OBJS = $(patsubst $(SRC_PATH)/%.c, $(BUILD_PATH)/%.o,$(PS_SRC))

CONFIG ?= config.mk
-include $(CONFIG)

ZYNQPS_YML ?= zynqps_config.yml
PLATFORM ?= zynq_ps

WORKSPACE ?= ./workspace
TARGET = $(PROJECT).elf

BSP = $(WORKSPACE)/$(PLATFORM)/ps7_cortexa9_0/A9_Standalone/bsp/
BSP_LIBPATH = $(BSP)/ps7_cortexa9_0/lib
BSP_INCPATH = $(BSP)/ps7_cortexa9_0/include

FSBL ?= $(WORKSPACE)/zynq_fsbl/Debug/zynq_fsbl.elf
BITFILE ?= $(PROJECT).bit

GCC_FLAGS ?= -Wall -O0 -g3 -c -fmessage-length=0 -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I$(BSP_INCPATH)
LINKER_FLAGS += -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard
LINKER_FLAGS += -Wl,-build-id=none -Wl,-T -Wl,$(WORKSPACE)/zynq_fsbl/src/lscript.ld
LINKER_FLAGS += -L$(BSP_LIBPATH)

LIBS += -Wl,--start-group,-lxil,-lgcc,-lc,--end-group -Wl,--start-group,-lxilffs,-lxil,-lgcc,-lc,--end-group

TOOL = arm-none-eabi
TOOL_PATH = /tools/Xilinx/Vitis/2024.2/gnu/aarch32/lin/gcc-$(TOOL)/bin/
GCC = $(TOOL_PATH)/$(TOOL)-gcc

$(BUILD_PATH)/%.o: $(SRC_PATH)/%.c
	-@mkdir $(BUILD_PATH)
	$(GCC) -c -o $@ $(GCC_FLAGS) $<

zynqps.tcl: $(ZYNQPS_YML)
	python3 ../fuse-zynq/sw/generate.py $^ $@

zynq_fsbl.tcl: $(PROJECT).xsa
	echo "setws $(WORKSPACE)" > $@
	echo "platform create -name $(PLATFORM) -hw $< -no-boot-bsp" >> $@
	echo "domain create -name A9_Standalone -os standalone -proc ps7_cortexa9_0" >> $@
	echo "domain active A9_Standalone" >> $@
	echo "bsp setlib -name xilffs" >> $@
	echo "platform generate" >> $@
	echo "app create -name zynq_fsbl -platform $(PLATFORM) -template \"Zynq FSBL\" -domain A9_Standalone -lang c" >> $@
	echo "app build -name zynq_fsbl" >> $@

output.bif: $(TARGET) $(BITFILE) $(FSBL)
	echo "the_ROM_image:" > $@
	echo "{" >> $@
	echo "[bootloader]$(FSBL)" >> $@
	echo $(BITFILE) >> $@
	echo $(TARGET) >> $@
	echo "}" >> $@

BOOT.bin: output.bif
	bootgen -image $< -arch zynq -o $@ -w

$(FSBL): zynq_fsbl.tcl
	xsct $<

$(TARGET): $(FSBL) $(PS_OBJS)
	$(GCC) $(LINKER_FLAGS) -o $@ $(PS_OBJS) $(LIBS)

target: $(TARGET)

flash: BOOT.bin 
	program_flash -f BOOT.bin -offset 0 -flash_type qspi-x4-single -fsbl $(FSBL) -url TCP:127.0.0.1:3121 

HW_SERVER = 192.168.1.168
flash_remote: BOOT.bin 
	program_flash -f BOOT.bin -offset 0 -flash_type qspi-x4-single -fsbl $(FSBL) -url TCP:$(HW_SERVER):3121 

clean:: 
	-rm -rf zynqps.tcl zynq_fsbl.tcl
	-rm -rf $(WORKSPACE)
	-rm -rf $(BUILD_PATH)
	-rm $(TARGET)
	