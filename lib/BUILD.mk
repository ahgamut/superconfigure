
include lib/alsa/BUILD.mk
include lib/certs/BUILD.mk
include lib/cups/BUILD.mk
include lib/fontconfig/BUILD.mk
include lib/freetype/BUILD.mk
include lib/fribidi/BUILD.mk
include lib/gdbm/BUILD.mk
include lib/giflib/BUILD.mk
include lib/gmp/BUILD.mk
include lib/gnutls/BUILD.mk
include lib/isl/BUILD.mk
include lib/jansson/BUILD.mk
include lib/libevent/BUILD.mk
include lib/libexpat/BUILD.mk
include lib/libffi/BUILD.mk
include lib/libgc/BUILD.mk
include lib/libjpeg/BUILD.mk
include lib/libpng/BUILD.mk
include lib/libssh2/BUILD.mk
include lib/libtiff/BUILD.mk
include lib/libunistring/BUILD.mk
include lib/libuuid/BUILD.mk
include lib/libwebp/BUILD.mk
include lib/libxml2/BUILD.mk
include lib/libxslt/BUILD.mk
include lib/libyaml/BUILD.mk
include lib/mpc/BUILD.mk
include lib/mpfr/BUILD.mk
include lib/ncurses/BUILD.mk
include lib/nettle/BUILD.mk
include lib/oniguruma/BUILD.mk
include lib/openssl/BUILD.mk
include lib/pcre/BUILD.mk
include lib/readline/BUILD.mk

lib:\
	o/lib/freetype/built.fat\
	o/lib/fribidi/built.fat\
	o/lib/gdbm/built.fat\
	o/lib/giflib/built.fat\
	o/lib/gmp/built.fat\
	o/lib/gnutls/built.fat\
	o/lib/isl/built.fat\
	o/lib/jansson/built.fat\
	o/lib/libevent/built.fat\
	o/lib/libexpat/built.fat\
	o/lib/libgc/built.fat\
	o/lib/libjpeg/built.fat\
	o/lib/libpng/built.fat\
	o/lib/libssh2/built.fat\
	o/lib/libtiff/built.fat\
	o/lib/libunistring/built.fat\
	o/lib/libuuid/built.fat\
	o/lib/libwebp/built.fat\
	o/lib/libxml2/built.fat\
	o/lib/libxslt/built.fat\
	o/lib/libyaml/built.fat\
	o/lib/mpc/built.fat\
	o/lib/mpfr/built.fat\
	o/lib/ncurses/built.fat\
	o/lib/nettle/built.fat\
	o/lib/openssl/built.fat\
	o/lib/pcre/built.fat\
	o/lib/readline/built.fat

# o/lib/libffi/built.fat

.PHONY: lib
