
GDB_SRC := https://mirrors.ocf.berkeley.edu/gnu/gdb/gdb-16.2.tar.gz

o/compiler/gdb/configured.x86_64: CONFIG_COMMAND = $(DUMMYLINK0)
o/compiler/gdb/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/compiler/gdb/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)

o/compiler/gdb/configured.aarch64: CONFIG_COMMAND = $(DUMMYLINK0)
o/compiler/gdb/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)
o/compiler/gdb/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/compiler/gdb/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)

$(eval $(call DOWNLOAD_SOURCE,compiler/gdb,$(GDB_SRC)))

# x86_64-gdb

$(eval $(call SPECIFY_DEPS,compiler/x86_64-gdb,compiler/gdb lib/readline lib/gmp lib/mpfr lib/isl lib/mpc cosmo-repo/compress))

o/compiler/x86_64-gdb/downloaded: DL_COMMAND = $(DUMMYLINK0)
o/compiler/x86_64-gdb/checked: CHECK_COMMAND = $(DUMMYLINK0)
o/compiler/x86_64-gdb/patched: PATCH_COMMAND = $(DUMMYLINK0)

o/compiler/x86_64-gdb/configured.x86_64: \
	CONFIG_COMMAND = export TARGET_ARCH=x86_64 && $(BASELOC)/compiler/x86_64-gdb/config-wrapper
o/compiler/x86_64-gdb/configured.aarch64: \
	CONFIG_COMMAND = export TARGET_ARCH=x86_64 && $(BASELOC)/compiler/x86_64-gdb/config-wrapper

o/compiler/x86_64-gdb/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/compiler/x86_64-gdb/built.fat: BINS = x86_64-linux-cosmo-gdb share/terminfo

x86_64-gdb: o/compiler/x86_64-gdb/built.fat
.PHONY: x86_64-gdb

# aarch64-gdb

$(eval $(call SPECIFY_DEPS,compiler/aarch64-gdb,compiler/gdb lib/readline lib/gmp lib/mpfr lib/isl lib/mpc cosmo-repo/compress))

o/compiler/aarch64-gdb/downloaded: DL_COMMAND = $(DUMMYLINK0)
o/compiler/aarch64-gdb/checked: CHECK_COMMAND = $(DUMMYLINK0)
o/compiler/aarch64-gdb/patched: PATCH_COMMAND = $(DUMMYLINK0)

o/compiler/aarch64-gdb/configured.x86_64: \
	CONFIG_COMMAND = export TARGET_ARCH=aarch64 && $(BASELOC)/compiler/aarch64-gdb/config-wrapper
o/compiler/aarch64-gdb/configured.aarch64: \
	CONFIG_COMMAND = export TARGET_ARCH=aarch64 && $(BASELOC)/compiler/aarch64-gdb/config-wrapper

o/compiler/aarch64-gdb/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/compiler/aarch64-gdb/built.fat: BINS = aarch64-linux-cosmo-gdb share/terminfo

aarch64-gdb: o/compiler/aarch64-gdb/built.fat
.PHONY: aarch64-gdb
