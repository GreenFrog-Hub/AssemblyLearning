#!/bin/bash
nasm -f elf AddressingModes.asm
ld -m elf_i386 -s -o AddressingModes AddressingModes.o
