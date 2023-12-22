
include compress/brotli/BUILD.mk
include compress/gzip/BUILD.mk
include compress/lz4/BUILD.mk
include compress/pigz/BUILD.mk
include compress/tar/BUILD.mk
include compress/xz/BUILD.mk
include compress/zlib/BUILD.mk

compress: \
	o/compress/brotli/.built.fat\
	o/compress/gzip/.built.fat\
	o/compress/lz4/.built.fat\
	o/compress/pigz/.built.fat\
	o/compress/tar/.built.fat\
	o/compress/xz/.built.fat\
	o/compress/zlib/.built.fat

.PHONY: compress
