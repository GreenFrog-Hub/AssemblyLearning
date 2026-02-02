#!/bin/bash

nasm -f elf Adding.asm
ld -m elf_i386 -s -o Adding Adding.o
bash -c ./Adding
