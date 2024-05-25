
JQ_SRC := https://github.com/jqlang/jq/archive/refs/tags/jq-1.7.1.tar.gz

JQ_DEPS := lib/oniguruma

JQ_CONFIG_ARGS = --prefix="$$(COSMOS)"\
    CFLAGS="-Os" --disable-shared --enable-static

$(eval $(call DOWNLOAD_SOURCE,cli/jq,$(JQ_SRC)))
$(eval $(call SPECIFY_DEPS,cli/jq,$(JQ_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,cli/jq,$(JQ_CONFIG_ARGS),$(JQ_CONFIG_ARGS)))

o/cli/jq/setup: o/cli/jq/patched
	cd $(BASELOC)/o/cli/jq/jq* && autoreconf -fi
	touch $@

o/cli/jq/configured.x86_64: o/cli/jq/setup
o/cli/jq/configured.aarch64: o/cli/jq/setup

o/cli/jq/built.fat: BINS = jq
