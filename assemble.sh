#!/bin/bash

set -euxo pipefail

crate=riscv

# remove existing blobs because otherwise this will append object files to the old blobs
rm -f bin/*.a

riscv64-unknown-elf-gcc -c -mabi=ilp32 -march=rv32imac asm.S -o bin/$crate.o
riscv64-unknown-elf-gcc -c -mabi=ilp32 -march=rv32imac asm32.S -o bin/$crate-32.o
ar crs bin/riscv32imac-unknown-none-elf.a bin/$crate.o bin/$crate-32.o
cp bin/riscv32imac-unknown-none-elf.a bin/riscv32imc-unknown-none-elf.a

rm bin/$crate.o
rm bin/$crate-32.o
