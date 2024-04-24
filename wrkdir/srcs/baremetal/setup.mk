ifeq ($(NAME),)
$(error NAME not defined)
endif

SRC_DIRS:=
INC_DIRS:=
C_SRC:=
ASM_SRC:=

ifneq ($(MAKECMDGOALS), clean)
ifeq ($(PLATFORM),)
$(error Undefined platform)
endif
endif

# 定义一个函数,获取当前Makefile所在目录的绝对路径
define cur_dir
	$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
endef

current_dir:=$(cur_dir)
ROOT_DIR?=$(current_dir)
# baremetal 的源代码位置
BUILD_DIR?=$(current_dir)/build/$(PLATFORM)
# build/qemu-riscv64-virt
src_dir:=$(current_dir)/src
# src
core_dir:=$(src_dir)/core
# src/core
platform_dir:=$(src_dir)/platform/$(PLATFORM)
# src/platform/qemu-riscv64-virt
drivers_dir:=$(src_dir)/drivers
# src/drivers
src_dirs+=$(src_dir) $(core_dir) $(platform_dir)
SRC_DIRS+=$(src_dirs)
# src  <- 这里面放着main.c
# src/core
# src/platform/qemu-riscv64-virt
INC_DIRS+=$(addsuffix /inc, $(src_dirs))
# src
# src/core
# src/platform/qemu-riscv64-virt
ifeq ($(wildcard $(platform_dir)),)
$(error unsupported platform $(PLATFORM))
endif

-include $(core_dir)/sources.mk
# core_c_srcs:=irq.c retarget.c
C_SRC+=$(addprefix $(core_dir)/, $(core_c_srcs))

-include $(platform_dir)/plat.mk
#ARCH:=riscv
#drivers:=8250_uart
-include $(platform_dir)/sources.mk
#plat_c_srcs:=virt.c
#plat_s_srcs:=
C_SRC+=$(addprefix $(platform_dir)/, $(plat_c_srcs))
ASM_SRC+=$(addprefix $(platform_dir)/, $(plat_s_srcs))

SRC_DIRS+= $(foreach driver, $(drivers), $(drivers_dir)/$(driver))
INC_DIRS+= $(foreach driver, $(drivers), $(drivers_dir)/$(driver)/inc)
-include $(foreach driver, $(drivers), $(drivers_dir)/$(driver)/sources.mk)
C_SRC+=$(addprefix $(drivers_dir)/, $(driver_c_srcs))
ASM_SRC+=$(addprefix $(drivers_dir)/, $(driver_s_srcs))

arch_dir:=$(src_dir)/arch/$(ARCH)
SRC_DIRS+=$(arch_dir)
INC_DIRS+=$(arch_dir)/inc
-include $(arch_dir)/arch.mk
-include $(arch_dir)/sources.mk
C_SRC+=$(addprefix $(arch_dir)/, $(arch_c_srcs))
ASM_SRC+=$(addprefix $(arch_dir)/, $(arch_s_srcs))

LD_FILE:=$(src_dir)/linker.ld
