
PYPACK2_DEPS := lib/ncurses lib/readline lib/gdbm \
				  lib/openssl lib/libexpat lib/libuuid \
				  lib/libyaml lib/certs cosmo-repo/compress \
				  cosmo-repo/base

$(eval $(call SPECIFY_DEPS,python/cpy311-pypack2,$(PYPACK2_DEPS)))

o/python/cpy311-pypack2/downloaded: \
	DL_COMMAND = rm -rf ./pypack2 && \
		git clone --quiet --depth=1 --branch=pypack2 https://github.com/ahgamut/cpython pypack2

o/python/cpy311-pypack2/checked: \
	CHECK_COMMAND = $(DUMMYLINK0)

o/python/cpy311-pypack2/patched: \
	PATCH_COMMAND = $(DUMMYLINK0)

o/python/cpy311-pypack2/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-pypack2/config-wrapper
o/python/cpy311-pypack2/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-pypack2/config-wrapper

o/python/cpy311-pypack2/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/python/cpy311-pypack2/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/python/cpy311-pypack2/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/python/cpy311-pypack2/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/python/cpy311-pypack2/built.fat: FATTEN_COMMAND = $(BASELOC)/python/cpy311-pypack2/fatten

pypack2: o/python/cpy311-pypack2/built.fat
.PHONY: pypack2
