
include web/wget/BUILD.mk
include web/curl/BUILD.mk
include web/links/BUILD.mk
include web/openssh/BUILD.mk
include web/git/BUILD.mk
include web/rsync/BUILD.mk

web:\
	o/web/wget/built.fat \
	o/web/curl/built.fat \
	o/web/links/built.fat \
	o/web/git/built.fat \
	o/web/openssh/built.fat \
	o/web/rsync/built.fat

.PHONY: web
