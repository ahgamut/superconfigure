
o/compiler/gcc-12.3-patched/downloaded:\
	DL_COMMAND = test -d gcc || git clone --depth=1 --branch=portcosmo-12.3 https://github.com/ahgamut/gcc gcc

o/compiler/gcc-12.3-patched/checked: CHECK_COMMAND = $(DUMMYLINK0)
o/compiler/gcc-12.3-patched/patched: PATCH_COMMAND = $(DUMMYLINK0)

o/compiler/gcc-12.3-patched/configured.x86_64: CONFIG_COMMAND = $(DUMMYLINK0)
o/compiler/gcc-12.3-patched/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/compiler/gcc-12.3-patched/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)

o/compiler/gcc-12.3-patched/configured.aarch64: CONFIG_COMMAND = $(DUMMYLINK0)
o/compiler/gcc-12.3-patched/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)
o/compiler/gcc-12.3-patched/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/compiler/gcc-12.3-patched/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)

# x86_64-gcc

o/compiler/x86_64-gcc/downloaded: DL_COMMAND = $(DUMMYLINK0)
o/compiler/x86_64-gcc/patched: PATCH_COMMAND = $(DUMMYLINK0)
o/compiler/x86_64-gcc/configured.x86_64: \
	CONFIG_COMMAND = export TARGET_ARCH=x86_64 && $(BASELOC)/compiler/gcc-12.3-patched/config-wrapper
o/compiler/x86_64-gcc/configured.aarch64: \
	CONFIG_COMMAND = export TARGET_ARCH=x86_64 && $(BASELOC)/compiler/gcc-12.3-patched/config-wrapper
o/compiler/x86_64-gcc/built.x86_64: \
	BUILD_COMMAND = make all-gcc -j$(MAXPROC)
o/compiler/x86_64-gcc/installed.x86_64: \
	INSTALL_COMMAND = make -i -s install
o/compiler/x86_64-gcc/built.aarch64: \
	BUILD_COMMAND = make all-gcc -j$(MAXPROC)
o/compiler/x86_64-gcc/installed.aarch64: \
	INSTALL_COMMAND = make -i -s install

$(eval $(call SPECIFY_DEPS,compiler/x86_64-gcc,compiler/x86_64-binutils compiler/gcc-12.3-patched))

o/compiler/x86_64-gcc/built.fat: \
	FATTEN_COMMAND = export TARGET_ARCH=x86_64 && $(BASELOC)/compiler/gcc-12.3-patched/fatten

x86_64-gcc: \
	o/compiler/x86_64-binutils/built.fat \
	o/compiler/x86_64-gcc/built.fat
.PHONY: x86_64-gcc

# aarch64-gcc

o/compiler/aarch64-gcc/downloaded: DL_COMMAND = $(DUMMYLINK0)
o/compiler/aarch64-gcc/patched: PATCH_COMMAND = $(DUMMYLINK0)
o/compiler/aarch64-gcc/configured.x86_64: \
	CONFIG_COMMAND = export TARGET_ARCH=aarch64 && $(BASELOC)/compiler/gcc-12.3-patched/config-wrapper
o/compiler/aarch64-gcc/configured.aarch64: \
	CONFIG_COMMAND = export TARGET_ARCH=aarch64 && $(BASELOC)/compiler/gcc-12.3-patched/config-wrapper
o/compiler/aarch64-gcc/built.x86_64: \
	BUILD_COMMAND = make all-gcc -j$(MAXPROC)
o/compiler/aarch64-gcc/installed.x86_64: \
	INSTALL_COMMAND = make -i -s install
o/compiler/aarch64-gcc/built.aarch64: \
	BUILD_COMMAND = make all-gcc -j$(MAXPROC)
o/compiler/aarch64-gcc/installed.aarch64: \
	INSTALL_COMMAND = make -i -s install

$(eval $(call SPECIFY_DEPS,compiler/aarch64-gcc,compiler/aarch64-binutils compiler/gcc-12.3-patched))

o/compiler/aarch64-gcc/built.fat: \
	FATTEN_COMMAND = export TARGET_ARCH=aarch64 && $(BASELOC)/compiler/gcc-12.3-patched/fatten

aarch64-gcc: \
	o/compiler/aarch64-binutils/built.fat \
	o/compiler/aarch64-gcc/built.fat
.PHONY: aarch64-gcc
