DISABLE_RAR=1
DISABLE_RAR_COMPRESS=1

# include ../../var_gcc.mak
PLATFORM=cosmo
O=b/g
IS_X64=
IS_X86=
IS_ARM64=
CROSS_COMPILE=
MY_ARCH=
USE_ASM=
CC=$(COSMO)/cosmocc/bin/$(ARCH)-unknown-cosmo-cc
CXX=$(COSMO)/cosmocc/bin/$(ARCH)-unknown-cosmo-c++

# include ../../warn_gcc.mak
CFLAGS_WARN_GCC_4_8 = \
  -Waddress \
  -Waggressive-loop-optimizations \
  -Wattributes \
  -Wcast-align \
  -Wcomment \
  -Wdiv-by-zero \
  -Wformat-contains-nul \
  -Winit-self

CFLAGS_WARN_GCC_5 = $(CFLAGS_WARN_GCC_4_8)\
  -Wbool-compare

CFLAGS_WARN_GCC_6 = $(CFLAGS_WARN_GCC_5)\
  -Wduplicated-cond

#  -Wno-strict-aliasing

CFLAGS_WARN_GCC_7 = $(CFLAGS_WARN_GCC_6)\
  -Wbool-operation \
  -Wdangling-else \
  -Wduplicated-branches \
  -Wimplicit-fallthrough=5 \
  -Wint-in-bool-context \
  -Wmisleading-indentation

CFLAGS_WARN_GCC_8 = $(CFLAGS_WARN_GCC_7)\
  -Wcast-align=strict \
  -Wmissing-attributes

CFLAGS_WARN_GCC_9 = $(CFLAGS_WARN_GCC_8)\
  -Waddress-of-packed-member

CFLAGS_WARN_GCC_PPMD_UNALIGNED = \
  -Wno-strict-aliasing

CFLAGS_WARN = $(CFLAGS_WARN_GCC_4_8)
CFLAGS_WARN = $(CFLAGS_WARN_GCC_5)
CFLAGS_WARN = $(CFLAGS_WARN_GCC_6)
CFLAGS_WARN = $(CFLAGS_WARN_GCC_7)
CFLAGS_WARN = $(CFLAGS_WARN_GCC_8)
CFLAGS_WARN = $(CFLAGS_WARN_GCC_9)

CXX_STD_FLAGS = -std=c++11
# CXX_STD_FLAGS =

include makefile.gcc
