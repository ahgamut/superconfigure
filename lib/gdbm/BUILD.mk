

GDBM_SRC := https://ftp.gnu.org/gnu/gdbm/gdbm-1.23.tar.gz 

$(eval $(call DOWNLOAD_SOURCE,lib/gdbm,$(GDBM_SRC)))

o/lib/gdbm/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/lib/gdbm/config-wrapper
o/lib/gdbm/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/lib/gdbm/config-wrapper

o/lib/gdbm/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
