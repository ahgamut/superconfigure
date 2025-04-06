
GDB_SRC := https://ftp.gnu.org/gnu/gdb/gdb-16.2.tar.gz

$(eval $(call DOWNLOAD_SOURCE,compiler/gdb,$(GDB_SRC)))

$(eval $(call SPECIFY_DEPS,compiler/gdb,lib/readline lib/gmp lib/mpfr lib/isl lib/mpc cosmo-repo/compress))

o/compiler/gdb/configured.x86_64: \
	CONFIG_COMMAND = export TARGET_ARCH=x86_64 && $(BASELOC)/compiler/gdb/config-wrapper
o/compiler/gdb/configured.aarch64: \
	CONFIG_COMMAND = export TARGET_ARCH=x86_64 && $(BASELOC)/compiler/gdb/config-wrapper

o/compiler/gdb/built.fat: FATTEN_COMMAND = $(BASELOC)/config/apelink_folder.sh
o/compiler/gdb/built.fat: BINS = x86_64-linux-cosmo-gdb share/terminfo
