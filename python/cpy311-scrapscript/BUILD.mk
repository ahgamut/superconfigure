
SCRAPSCRIPT_DEPS := lib/ncurses lib/readline lib/gdbm \
				  lib/libexpat lib/libuuid \
				  cosmo-repo/compress cosmo-repo/base

$(eval $(call SPECIFY_DEPS,python/cpy311-scrapscript,$(SCRAPSCRIPT_DEPS)))

o/python/cpy311-scrapscript/downloaded: \
	DL_COMMAND = rm -rf ./scrapscript && \
		git clone --quiet --depth=1 --branch=scrapscript https://github.com/ahgamut/cpython scrapscript

o/python/cpy311-scrapscript/checked: \
	CHECK_COMMAND = $(DUMMYLINK0)

o/python/cpy311-scrapscript/patched: \
	PATCH_COMMAND = $(DUMMYLINK0)

o/python/cpy311-scrapscript/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-scrapscript/config-wrapper
o/python/cpy311-scrapscript/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/python/cpy311-scrapscript/config-wrapper

o/python/cpy311-scrapscript/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/python/cpy311-scrapscript/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/python/cpy311-scrapscript/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/python/cpy311-scrapscript/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/python/cpy311-scrapscript/built.fat: FATTEN_COMMAND = $(BASELOC)/python/cpy311-scrapscript/fatten

scrapscript: o/python/cpy311-scrapscript/built.fat
.PHONY: scrapscript
