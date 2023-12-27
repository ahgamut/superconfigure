
UTIL_MACROS_SRC := https://www.x.org/archive/individual/util/util-macros-1.20.0.tar.gz 
UTIL_MACROS_CONFIG_ARGS = --prefix="$$(COSMOS)" CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,gui/util-macros,$(UTIL_MACROS_SRC)))
$(eval $(call AUTOTOOLS_BUILD,gui/util-macros,$(UTIL_MACROS_CONFIG_ARGS),$(UTIL_MACROS_CONFIG_ARGS)))

o/gui/util-macros/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
