
ONIGURUMA_SRC := https://github.com/kkos/oniguruma/archive/refs/tags/v6.9.9.tar.gz

ONIGURUMA_CONFIG_ARGS = --prefix="$$(COSMOS)" --disable-shared --enable-static

$(eval $(call DOWNLOAD_SOURCE,lib/oniguruma,$(ONIGURUMA_SRC)))
$(eval $(call AUTOTOOLS_BUILD,lib/oniguruma,$(ONIGURUMA_CONFIG_ARGS),$(ONIGURUMA_CONFIG_ARGS)))

o/lib/oniguruma/setup: o/lib/oniguruma/patched
	cd $(BASELOC)/o/lib/oniguruma/oniguruma* && autoreconf -fi
	touch $@

o/lib/oniguruma/configured.x86_64: o/lib/oniguruma/setup
o/lib/oniguruma/configured.aarch64: o/lib/oniguruma/setup

o/lib/oniguruma/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
