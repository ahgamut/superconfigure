
include lang/berry/BUILD.mk
include lang/lua/BUILD.mk

lang: \
	o/lang/berry/built.fat \
	o/lang/lua/built.fat
	echo "nothing here yet"

.PHONY: lang
