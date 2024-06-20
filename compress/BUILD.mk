
include compress/brotli/BUILD.mk
include compress/gzip/BUILD.mk
include compress/lunzip/BUILD.mk
include compress/lz4/BUILD.mk
include compress/lzlib/BUILD.mk
include compress/lzip/BUILD.mk
include compress/pigz/BUILD.mk
include compress/tar/BUILD.mk

compress: \
	o/cosmo-repo/compress/built.fat\
	o/compress/brotli/built.fat\
	o/compress/gzip/built.fat\
	o/compress/lz4/built.fat\
	o/compress/lzip/built.fat\
	o/compress/pigz/built.fat\
	o/compress/tar/built.fat

# tar build doesn't work for some reason

.PHONY: compress
