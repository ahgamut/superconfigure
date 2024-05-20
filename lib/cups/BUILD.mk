
CUPS_SRC := https://github.com/OpenPrinting/cups/archive/refs/tags/v2.4.8.tar.gz

CUPS_CONFIG_ARGS = --prefix=$(COSMOS) --enable-static \
				   --disable-shared --disable-mallinfo \
				   --disable-libpaper --disable-libusb \
				   --disable-dbus --disable-tcp-wrappers \
				   --disable-pam --disable-largefile \
				   --with-components=libcupslite \
				   --disable-relro --disable-debug \
				   --disable-debug-guards --disable-debug-printfs \
				   --disable-default-shared --disable-raw-printing \
				   --libdir=$(COSMOS)/lib CFLAGS="-fno-stack-protector"

$(eval $(call DOWNLOAD_SOURCE,lib/cups,$(CUPS_SRC)))
$(eval $(call SPECIFY_DEPS,lib/cups,lib/openssl))

# $(eval $(call AUTOTOOLS_BUILD,lib/cups,$(CUPS_CONFIG_ARGS),$(CUPS_CONFIG_ARGS)))

o/lib/cups/configured.x86_64: \
	CONFIG_COMMAND = cp -r $(BASELOC)/o/lib/cups/cups-2.4.8/* . && ./configure $(CUPS_CONFIG_ARGS)

o/lib/cups/configured.aarch64: \
	CONFIG_COMMAND = cp -r $(BASELOC)/o/lib/cups/cups-2.4.8/* . && ./configure $(CUPS_CONFIG_ARGS)

o/lib/cups/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
