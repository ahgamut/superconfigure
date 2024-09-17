
BINUTILS_SRC := https://ftp.gnu.org/gnu/binutils/binutils-2.42.tar.gz

o/compiler/binutils/configured.x86_64: CONFIG_COMMAND = $(DUMMYLINK0)
o/compiler/binutils/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/compiler/binutils/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)

o/compiler/binutils/configured.aarch64: CONFIG_COMMAND = $(DUMMYLINK0)
o/compiler/binutils/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)
o/compiler/binutils/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/compiler/binutils/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)

$(eval $(call DOWNLOAD_SOURCE,compiler/binutils,$(BINUTILS_SRC)))

# x86_64-binutils

o/compiler/x86_64-binutils/downloaded: DL_COMMAND = $(DUMMYLINK0)
o/compiler/x86_64-binutils/checked: CHECK_COMMAND = $(DUMMYLINK0)
o/compiler/x86_64-binutils/patched: PATCH_COMMAND = $(DUMMYLINK0)
o/compiler/x86_64-binutils/configured.x86_64: \
	CONFIG_COMMAND = export TARGET_ARCH=x86_64 && $(BASELOC)/compiler/binutils/config-wrapper
o/compiler/x86_64-binutils/configured.aarch64: \
	CONFIG_COMMAND = export TARGET_ARCH=x86_64 && $(BASELOC)/compiler/binutils/config-wrapper

$(eval $(call SPECIFY_DEPS,compiler/x86_64-binutils,lib/gmp lib/mpfr lib/isl lib/mpc compiler/binutils))

o/compiler/x86_64-binutils/built.fat: \
	FATTEN_COMMAND = export TARGET_ARCH=x86_64 && $(BASELOC)/compiler/binutils/fatten

x86_64-binutils: o/compiler/x86_64-binutils/built.fat
.PHONY: x86_64-binutils

# aarch64-binutils

o/compiler/aarch64-binutils/downloaded: DL_COMMAND = $(DUMMYLINK0)
o/compiler/aarch64-binutils/checked: CHECK_COMMAND = $(DUMMYLINK0)
o/compiler/aarch64-binutils/patched: PATCH_COMMAND = $(DUMMYLINK0)
o/compiler/aarch64-binutils/configured.x86_64: \
	CONFIG_COMMAND = export TARGET_ARCH=aarch64 && $(BASELOC)/compiler/binutils/config-wrapper
o/compiler/aarch64-binutils/configured.aarch64: \
	CONFIG_COMMAND = export TARGET_ARCH=aarch64 && $(BASELOC)/compiler/binutils/config-wrapper

$(eval $(call SPECIFY_DEPS,compiler/aarch64-binutils,lib/gmp lib/mpfr lib/isl lib/mpc compiler/binutils))

o/compiler/aarch64-binutils/built.fat: \
	FATTEN_COMMAND = export TARGET_ARCH=aarch64 && $(BASELOC)/compiler/binutils/fatten

aarch64-binutils: o/compiler/aarch64-binutils/built.fat
.PHONY: aarch64-binutils
