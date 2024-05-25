
PYTHON_SRC := https://github.com/python/cpython/archive/refs/tags/v3.12.3.tar.gz

PYTHON_DEPS := lib/ncurses lib/readline lib/gdbm \
	lib/openssl lib/libexpat lib/libuuid \
	lib/certs cosmo-repo/compress cosmo-repo/base

$(eval $(call DOWNLOAD_SOURCE,lang/python,$(PYTHON_SRC)))
$(eval $(call SPECIFY_DEPS,lang/python,$(PYTHON_DEPS)))

o/lang/python/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/lang/python/config-wrapper
o/lang/python/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/lang/python/config-wrapper

# o/lang/python/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
# o/lang/python/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

# o/lang/python/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
# o/lang/python/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/lang/python/built.fat: FATTEN_COMMAND = $(BASELOC)/lang/python/fatten
