# Bao Makefile

> 不要被敌人的气势汹汹所吓到，不要被尚能忍耐的困难所沮丧，
> 不要被一时的挫折所灰心。道路是曲折的，前途是光明的，
> 黑暗即将过去，曙光就在眼前，
> 有力的条件和主动的恢复，产生于再坚持一下的努力之中

# tips
1. virt_desc.c 描述virt
2. scripts 中的文件生成编译机可以运行的程序
    生成的内容放在 config/config_defs_gen.h 
	plattform/platform_defs_gen.h

# todo
- [ ] config_defs_gen.c  依赖什么
- [ ] platform_defs_gen.c  依赖什么

                     .
                    ├──  build
                    │  └──  qemu-riscv64-virt
                    │     └──  baremetal
                    ├──  configs
                    │  └──  example
                    │     └──  config.c
# scripts_dir       ├──  scripts
                    │  ├──  config_defs_gen.c
                    │  └──  platform_defs_gen.c
# src_dir           └──  src								    
                       ├──  arch               
# cpu_arch_dir         │  └──  riscv
# core_dir             ├──  core
                       │  ├──  cache.c
                       │  ├──  config.c
                       │  ├──  console.c
                       │  ├──  cpu.c
                       │  ├──  hypercall.c
                       │  ├──  inc
                       │  ├──  init.c
                       │  ├──  interrupts.c
                       │  ├──  ipc.c
                       │  ├──  mem.c
                       │  ├──  mmu                    mmu 
                       │  ├──  mpu                   ├──  inc
                       │  ├──  objects.mk            │  └──  mem_prot
                       │  ├──  objpool.c             │     ├──  io.h
                       │  ├──  vm.c                  │     ├──  mem.h
                       │  └──  vmm.c                 │     └──  vmm.h
# lib_dir              ├──  lib                      ├──  io.c
                       │  ├──  bitmap.c              ├──  mem.c
                       │  ├──  inc                   ├──  objects.mk
                       │  ├──  objects.mk            ├──  vm.c
                       │  ├──  printk.c              └──  vmm.c      
                       │  └──  string.c
                       ├──  linker.ld
                       └──  platform
# drivers_dir             ├──  drivers                 drivers              
# platform_dir            └──  qemu-riscv64-virt      └──  sbi_uart
                                                          ├──  inc
                                                          │  └──  drivers
                                                          │     └──  sbi_uart.h
                                                          ├──  objects.mk
                                                          └──  sbi_uart.c

 src/core/mmu
├──  inc
│  └──  mem_prot
│     ├──  io.h
│     ├──  mem.h
│     └──  vmm.h
├──  io.c
├──  mem.c
├──  objects.mk
├──  vm.c
└──  vmm.c         



# AB
                         .
                        ├──  bin
                        │  └──  qemu-riscv64-virt
# bin_dir               │     └──  baremetal
                        ├──  build
                        │  └──  qemu-riscv64-virt
# build_dir             │     └──  baremetal
                        ├──  compile_commands.json
# config_build_dir      ├──  configs
                        │  └──  example
                        │     └──  config.c
                        ├──  CONTRIBUTORS
                        ├──  LICENSE
                        ├──  make_log.md
                        ├──  Makefile
                        ├──  README.md
# scripts_build_dir     ├──  scripts
                        │  ├──  config_defs_gen.c
                        │  └──  platform_defs_gen.c
                        └──  src
                           ├──  arch
                           │  └──  riscv
                           ├──  core
                           │  ├──  cache.c
                           │  ├──  config.c
                           │  ├──  console.c
                           │  ├──  cpu.c
                           │  ├──  hypercall.c
                           │  ├──  inc
                           │  ├──  init.c
                           │  ├──  interrupts.c
                           │  ├──  ipc.c
                           │  ├──  mem.c
                           │  ├──  mmu
                           │  ├──  mpu
                           │  ├──  objects.mk
                           │  ├──  objpool.c
                           │  ├──  vm.c
                           │  └──  vmm.c
                           ├──  lib
                           │  ├──  bitmap.c
                           │  ├──  inc
                           │  ├──  objects.mk
                           │  ├──  printk.c
                           │  └──  string.c
                           ├──  linker.ld
                           └──  platform
                              ├──  drivers
                              └──  qemu-riscv64-virt

# AC
 .
├──  bin
│  └──  qemu-riscv64-virt
│     └──  baremetal
│        ├──  bao.asm
│        ├──  bao.bin
│        ├──  bao.elf
│        └──  bao.elf.txt
├──  build
│  └──  qemu-riscv64-virt
│     └──  baremetal
│        ├──  arch
│        │  └──  riscv
│        │     ├──  boot.d
│        │     ├──  boot.o
│        │     ├──  cache.d
│        │     ├──  cache.o
│        │     ├──  cpu.d
│        │     ├──  cpu.o
│        │     ├──  exceptions.d
│        │     ├──  exceptions.o
│        │     ├──  inc
│        │     │  ├──  asm_defs.h
│        │     │  └──  asm_defs.h.d
│        │     ├──  interrupts.d
│        │     ├──  interrupts.o
│        │     ├──  iommu.d
│        │     ├──  iommu.o
│        │     ├──  mem.d
│        │     ├──  mem.o
│        │     ├──  page_table.d
│        │     ├──  page_table.o
│        │     ├──  plic.d
│        │     ├──  plic.o
│        │     ├──  relocate.d
│        │     ├──  relocate.o
│        │     ├──  root_pt.d
│        │     ├──  root_pt.o
│        │     ├──  sbi.d
│        │     ├──  sbi.o
│        │     ├──  sync_exceptions.d
│        │     ├──  sync_exceptions.o
│        │     ├──  vm.d
│        │     ├──  vm.o
│        │     ├──  vmm.d
│        │     ├──  vmm.o
│        │     ├──  vplic.d
│        │     └──  vplic.o
│        ├──  config
│        │  ├──  baremetal.d
│        │  ├──  baremetal.o
│        │  └──  config_defs_gen.h
│        ├──  core
│        │  ├──  cache.d
│        │  ├──  cache.o
│        │  ├──  config.d
│        │  ├──  config.o
│        │  ├──  console.d
│        │  ├──  console.o
│        │  ├──  cpu.d
│        │  ├──  cpu.o
│        │  ├──  hypercall.d
│        │  ├──  hypercall.o
│        │  ├──  init.d
│        │  ├──  init.o
│        │  ├──  interrupts.d
│        │  ├──  interrupts.o
│        │  ├──  ipc.d
│        │  ├──  ipc.o
│        │  ├──  mem.d
│        │  ├──  mem.o
│        │  ├──  mmu
│        │  │  ├──  io.d
│        │  │  ├──  io.o
│        │  │  ├──  mem.d
│        │  │  ├──  mem.o
│        │  │  ├──  vm.d
│        │  │  ├──  vm.o
│        │  │  ├──  vmm.d
│        │  │  └──  vmm.o
│        │  ├──  objpool.d
│        │  ├──  objpool.o
│        │  ├──  vm.d
│        │  ├──  vm.o
│        │  ├──  vmm.d
│        │  └──  vmm.o
│        ├──  lib
│        │  ├──  bitmap.d
│        │  ├──  bitmap.o
│        │  ├──  printk.d
│        │  ├──  printk.o
│        │  ├──  string.d
│        │  └──  string.o
│        ├──  linker_temp.ld
│        ├──  linker_temp.ld.d
│        ├──  platform
│        │  ├──  drivers
│        │  │  └──  sbi_uart
│        │  │     ├──  sbi_uart.d
│        │  │     └──  sbi_uart.o
│        │  ├──  platform_defs_gen.h
│        │  └──  qemu-riscv64-virt
│        │     ├──  virt_desc.d
│        │     └──  virt_desc.o
│        └──  scripts
│           ├──  config_defs_gen
│           └──  platform_defs_gen



