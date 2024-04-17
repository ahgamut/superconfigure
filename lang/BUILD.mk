
include lang/berry/BUILD.mk
include lang/janet/BUILD.mk
include lang/lua/BUILD.mk
include lang/php/BUILD.mk

lang: \
	o/lang/berry/built.fat \
	o/lang/janet/built.fat \
	o/lang/lua/built.fat \
	o/lang/php/built.fat

.PHONY: lang
