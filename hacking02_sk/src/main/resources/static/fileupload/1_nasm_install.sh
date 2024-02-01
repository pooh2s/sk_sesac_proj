#!/bin/bash

apt-get install -f nasm
apt-get install -f gcc-multilib
apt -fix-broken install
apt-get install qt4-default

# nasm -g -f elf64 file.asm -o file.o
# ld --dynamic-linker /lib64/ld-linux-x86-64.so.2 executeable_file file.o     or   =>   gcc file.o -o executeable_file -m64
