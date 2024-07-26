
include lang/berry/BUILD.mk
include lang/janet/BUILD.mk
include lang/lua/BUILD.mk
include lang/php/BUILD.mk
include lang/python/BUILD.mk
include lang/tcl/BUILD.mk

lang: \
	o/lang/berry/built.fat \
	o/lang/janet/built.fat \
	o/lang/lua/built.fat \
	o/lang/php/built.fat \
	o/lang/python/built.fat \
	o/lang/tcl/built.fat

.PHONY: lang
