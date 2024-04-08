
DATASETTE_DEPS := lib/ncurses lib/readline lib/gdbm \
				  lib/openssl lib/libexpat lib/libuuid \
				  lib/libyaml lib/certs cosmo-repo/compress \
				  cosmo-repo/base

$(eval $(call SPECIFY_DEPS,python/cpy311-datasette,$(DATASETTE_DEPS)))

o/python/cpy311-datasette/downloaded: \
	DL_COMMAND = rm -rf ./datasette && \
		git clone --quiet --depth=1 --branch=datasette https://github.com/ahgamut/cpython datasette

o/python/cpy311-datasette/patched: \
	PATCH_COMMAND = $(DUMMYLINK0)

o/python/cpy311-datasette/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-datasette/config-wrapper
o/python/cpy311-datasette/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-datasette/config-wrapper

o/python/cpy311-datasette/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/python/cpy311-datasette/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/python/cpy311-datasette/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/python/cpy311-datasette/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/python/cpy311-datasette/built.fat: FATTEN_COMMAND = $(BASELOC)/python/cpy311-datasette/fatten

datasette: o/python/cpy311-datasette/built.fat
.PHONY: datasette
