NAME:=baremetal
SRC_DIRS:=
INC_DIRS:=
C_SRC:=
ASM_SRC:=

PLATFORM:=qemu-riscv64-virt
# guestOS 源代码位置
current_dir:=/Users/orange/code/bao-demos/wrkdir/srcs/baremetal
current_dir:=$(realpath .)
ROOT_DIR?=$(current_dir)
BUILD_DIR?=$(current_dir)/build/qemu-riscv64-virt
src_dir:=$(current_dir)/src
# src 目录下的三个源代码位置
# src 本身也存放着main.c, 一共有4个文件夹下放着源代码
core_dir:=$(src_dir)/core
platform_dir:=$(src_dir)/platform/qemu-riscv64-virt
drivers_dir:=$(src_dir)/drivers

# 首先将三个源代码文件夹放入 SRC_DIRS
src_dirs+=$(src_dir) $(core_dir) $(platform_dir)
SRC_DIRS+=$(src_dirs)
# 再将这个三个文件夹下的inc文件夹放入 INC_DIRS
INC_DIRS+=$(addsuffix /inc, $(src_dirs))

# 这是core文件夹下所有的源代码
core_c_srcs:=irq.c retarget.c
# 这些源代码最终要被编译,放入C_SRC
C_SRC+=$(addprefix $(core_dir)/, $(core_c_srcs))

# 这是platform_dir 中定义的一些内容
# 指令集,已经用到的芯片
ARCH:=riscv
drivers:=8250_uart
# 这是platform_dir 文件夹中的源代码
plat_c_srcs:=virt.c
plat_s_srcs:=

# 将platform_dir 中的源文件加入 C_SRC
C_SRC+=$(addprefix $(platform_dir)/, $(plat_c_srcs))
ASM_SRC+=$(addprefix $(platform_dir)/, $(plat_s_srcs))

# dirvers 指明当前程序只用到了8250_uart
# uart8250 是一个古老的串口通信芯片
# drivers_dir 文件夹中放着各种芯片的驱动程序
# 每个实验平台用到的外设芯片不同,所以在platform_dir文件夹
# 中定义所需的芯片,现在将所有需要的芯片驱动添加到编译列表
SRC_DIRS+= $(foreach driver, $(drivers), $(drivers_dir)/$(driver))
INC_DIRS+= $(foreach driver, $(drivers), $(drivers_dir)/$(driver)/inc)

# 这是8250_uart的驱动程序
driver_c_srcs+=8250_uart/8250_uart.c
driver_s_srcs+=
C_SRC+=$(addprefix $(drivers_dir)/, $(driver_c_srcs))
ASM_SRC+=$(addprefix $(drivers_dir)/, $(driver_s_srcs))

# 开始处理arch相关的代码
arch_dir:=$(src_dir)/arch/$(ARCH)
SRC_DIRS+=$(arch_dir)
INC_DIRS+=$(arch_dir)/inc

# 指明平台相关的编译链工具,
CROSS_COMPILE ?= riscv64-unknown-elf-
ARCH_GENERIC_FLAGS = -mcmodel=medany -march=rv64imac -mabi=lp64
ARCH_ASFLAGS = 
ARCH_CFLAGS = 
ARCH_CPPFLAGS =	
ARCH_LDFLAGS = --specs=nano.specs

# arch文件夹下有哪些源文件
arch_c_srcs:= init.c plic.c sbi.c exceptions.c irq.c timer.c
arch_s_srcs:= start.S
# 将arch文件夹下的源文件添加编译列表
C_SRC+=$(addprefix $(arch_dir)/, $(arch_c_srcs))
ASM_SRC+=$(addprefix $(arch_dir)/, $(arch_s_srcs))


LD_FILE:=$(src_dir)/linker.ld

# 添加main源文件到编译列表
app_src_dir:=$(ROOT_DIR)/src
src_c_srcs:= main.c
C_SRC+=$(addprefix $(app_src_dir)/, $(src_c_srcs))


include $(ROOT_DIR)/build.mk
