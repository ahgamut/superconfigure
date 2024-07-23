
include compiler/binutils/BUILD.mk
include compiler/gcc-14.1-patched/BUILD.mk
include compiler/llvm/BUILD.mk

cosmocc: x86_64-gcc aarch64-gcc
.PHONY: cosmocc
