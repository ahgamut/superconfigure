
PYPACK1_DEPS := lib/ncurses lib/readline lib/gdbm \
				  lib/openssl lib/libexpat lib/libuuid \
				  lib/libyaml lib/certs cosmo-repo/compress \
				  cosmo-repo/base\
				  compress/lz4

$(eval $(call SPECIFY_DEPS,python/cpy311-pypack1,$(PYPACK1_DEPS)))

o/python/cpy311-pypack1/downloaded: \
	DL_COMMAND = rm -rf ./pypack1 && \
		git clone --quiet --depth=1 --branch=pypack1 https://github.com/ahgamut/cpython pypack1

o/python/cpy311-pypack1/patched: \
	PATCH_COMMAND = $(DUMMYLINK0)

o/python/cpy311-pypack1/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-pypack1/config-wrapper
o/python/cpy311-pypack1/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-pypack1/config-wrapper

o/python/cpy311-pypack1/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/python/cpy311-pypack1/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/python/cpy311-pypack1/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/python/cpy311-pypack1/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/python/cpy311-pypack1/built.fat: FATTEN_COMMAND = $(BASELOC)/python/cpy311-pypack1/fatten

pypack1: o/python/cpy311-pypack1/built.fat
.PHONY: pypack1
