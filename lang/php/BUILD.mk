
o/lang/php/downloaded: \
	DL_COMMAND = rm -rf php && git clone --quiet --depth=1 --branch=php-8.3.6 https://github.com/php/php-src php

o/lang/php/checked: CHECK_COMMAND = $(DUMMYLINK0)
o/lang/php/patched: PATCH_COMMAND = $(DUMMYLINK0)
o/lang/php/setup:  o/lang/php/patched
	cd $(BASELOC)/o/lang/php/php && ./buildconf --force
	touch $@

PHP_DEPS := lib/libxml2 cosmo-repo/base lib/openssl
PHP_CONFIG_ARGS = --prefix=$$(COSMOS) --disable-shared \
				  --enable-static --disable-all \
				  --disable-fiber-asm --without-pic

$(eval $(call SPECIFY_DEPS,lang/php,$(PHP_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,lang/php,$(PHP_CONFIG_ARGS),$(PHP_CONFIG_ARGS)))

o/lang/php/configured.x86_64: o/lang/php/setup
o/lang/php/configured.aarch64: o/lang/php/setup

o/lang/php/built.fat: \
	BINS = php
