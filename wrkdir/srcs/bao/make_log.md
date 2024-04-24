echo "Creating directory	 build/qemu-riscv64-virt/baremetal/arch/riscv/inc"
Creating directory	 build/qemu-riscv64-virt/baremetal/arch/riscv/inc
mkdir -p /Users/orange/code/bao-demos/wrkdir/srcs/bao/build/qemu-riscv64-virt/baremetal/arch/riscv/inc
echo "Generating header	 build/qemu-riscv64-virt/baremetal/arch/riscv/inc/asm_defs.h"
Generating header	 build/qemu-riscv64-virt/baremetal/arch/riscv/inc/asm_defs.h
/opt/homebrew/bin/riscv64-unknown-elf-gcc -S -O2 -Wall -Werror -ffreestanding -std=gnu11 -fno-pic -mcmodel=medany -march=rv64g -mstrict-align  -DBAO_DEMOS_WRKDIR_IMGS=/Users/orange/code/bao-demos/wrkdir/imgs/qemu-riscv64-virt/baremetal -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/arch/riscv/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/lib/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/core/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/core/mmu/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/platform/qemu-riscv64-virt/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/platform/drivers/sbi_uart/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/build/qemu-riscv64-virt/baremetal/arch/riscv/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/build/qemu-riscv64-virt/baremetal/config -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/build/qemu-riscv64-virt/baremetal/platform    -DMEM_PROT_MMU -g -DGENERATING_DEFS /Users/orange/code/bao-demos/wrkdir/srcs/bao/src/arch/riscv/asm_defs.c -o - \
		| awk '($1 == "->") \
			{ gsub("#", "", $3); print "#define " $2 " " $3 }' > /Users/orange/code/bao-demos/wrkdir/srcs/bao/build/qemu-riscv64-virt/baremetal/arch/riscv/inc/asm_defs.h
echo "Creating directory	 build/qemu-riscv64-virt/baremetal/scripts"
Creating directory	 build/qemu-riscv64-virt/baremetal/scripts
mkdir -p /Users/orange/code/bao-demos/wrkdir/srcs/bao/build/qemu-riscv64-virt/baremetal/scripts
echo "Compiling generator	 build/qemu-riscv64-virt/baremetal/scripts/config_defs_gen"
Compiling generator	 build/qemu-riscv64-virt/baremetal/scripts/config_defs_gen
gcc /Users/orange/code/bao-demos/wrkdir/srcs/bao/scripts/config_defs_gen.c /Users/orange/code/bao-demos/wrkdir/imgs/qemu-riscv64-virt/baremetal/config/baremetal.c  -DMEM_PROT_MMU -DBAO_DEMOS_WRKDIR_IMGS=/Users/orange/code/bao-demos/wrkdir/imgs/qemu-riscv64-virt/baremetal -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/arch/riscv/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/lib/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/core/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/core/mmu/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/platform/qemu-riscv64-virt/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/platform/drivers/sbi_uart/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/build/qemu-riscv64-virt/baremetal/arch/riscv/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/build/qemu-riscv64-virt/baremetal/config -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/build/qemu-riscv64-virt/baremetal/platform    -DMEM_PROT_MMU -DGENERATING_DEFS \
		-I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/arch/riscv/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/lib/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/core/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/core/mmu/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/platform/qemu-riscv64-virt/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/src/platform/drivers/sbi_uart/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/build/qemu-riscv64-virt/baremetal/arch/riscv/inc -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/build/qemu-riscv64-virt/baremetal/config -I/Users/orange/code/bao-demos/wrkdir/srcs/bao/build/qemu-riscv64-virt/baremetal/platform -o /Users/orange/code/bao-demos/wrkdir/srcs/bao/build/qemu-riscv64-virt/baremetal/scripts/config_defs_gen