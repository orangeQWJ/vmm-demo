gen_ld_file:=$(BUILD_DIR)/linker.ld

# 将ROOT_DIR 替换为 BUILD_DIR,中间路径不变
objs:=$(C_SRC:$(ROOT_DIR)/%.c=$(BUILD_DIR)/%.o) \
	$(ASM_SRC:$(ROOT_DIR)/%.S=$(BUILD_DIR)/%.o)
deps:=$(objs:%=%.d) $(gen_ld_file).d
dirs:=$(sort $(dir $(objs) $(deps)))

cc=$(CROSS_COMPILE)gcc
objcopy=$(CROSS_COMPILE)objcopy
objdump=$(CROSS_COMPILE)objdump

OPT_LEVEL = 2
DEBUG_LEVEL = 3

#debug_flags:= -g$(DEBUG_LEVEL) $(arch_debug_flags) $(platform_debug_flags)
debug_flags:= -g$(DEBUG_LEVEL) 
GENERIC_FLAGS = $(ARCH_GENERIC_FLAGS) -O$(OPT_LEVEL) $(debug_flags) -static
CPPFLAGS += $(ARCH_CPPFLAGS) $(addprefix -I, $(INC_DIRS)) -MD -MF $@.d
#ifneq ($(STD_ADDR_SPACE),)
#CPPFLAGS+=-DSTD_ADDR_SPACE
#endif
#ifneq ($(MPU),)
#CPPFLAGS+=-DMPU
#endif
#ifneq ($(MEM_BASE),)
#CPPFLAGS+=-DMEM_BASE=$(MEM_BASE)
#endif
#ifneq ($(MEM_SIZE),)
#CPPFLAGS+=-DMEM_SIZE=$(MEM_SIZE)
#endif
#ifneq ($(SINGLE_CORE),)
#CPPFLAGS+=-DSINGLE_CORE=y
#endif
#ifneq ($(NO_FIRMWARE),)
#CPPFLAGS+=-DNO_FIRMWARE=y
#endif

# 为编译C源码准备的参数
ASFLAGS += $(GENERIC_FLAGS) $(CPPFLAGS) $(ARCH_ASFLAGS) 
# 为编译汇编代码准备的参数
CFLAGS += $(GENERIC_FLAGS) $(CPPFLAGS) $(ARCH_CFLAGS) 
# 为链接阶段准备的参数
LDFLAGS += $(GENERIC_FLAGS) $(ARCH_LDFLAGS) -nostartfiles
# -nostartfiles 选项告诉 GCC 在链接时不要包含标准启动文件
#  从而允许程序员自定义程序的启动过程和初始化流程。

# build/qemu-riscv64-virt/baremetal
target:=$(BUILD_DIR)/$(NAME)
# build/qemu-riscv64-virt/baremetal.bin
all: $(target).bin

ifneq ($(MAKECMDGOALS), clean)
-include $(deps)
endif

$(target).bin: $(target).elf
	$(objcopy) -O binary $< $@

$(target).elf: $(objs) $(gen_ld_file)
	$(cc) $(LDFLAGS) -T$(gen_ld_file) $(objs) -o $@
	$(objdump) -S $@ > $(target).asm
	$(objdump) -x -d --wide $@ > $(target).lst

$(BUILD_DIR):
	mkdir -p $@

$(objs): | $(BUILD_DIR)

$(BUILD_DIR)/%.o: $(ROOT_DIR)/%.c
	@echo $@
	$(cc) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: $(ROOT_DIR)/%.S
	@echo $@
	@$(cc) $(ASFLAGS) -c $< -o $@

$(gen_ld_file): $(LD_FILE)
	@$(cc) $(CPPFLAGS) -E -x assembler-with-cpp $< | grep "^[^#;]" > $@

# -x assembler-with-cpp 告诉编译器后续的输入文件当作带有C预处理器指令的
#  汇编语言源代码，这意味这文件中可以包含像C语言那样的预处理指令。
#  例如 #define，#if， #include
#@$(cc) $(CPPFLAGS) -E -x assembler-with-cpp $< | grep "^[^#;]" > $@

.SECONDEXPANSION:

$(objs) $(deps): | $$(@D)/

$(dirs):
	mkdir -p $@

clean:
	@rm -rf $(BUILD_DIR)

.PHONY: all clean
