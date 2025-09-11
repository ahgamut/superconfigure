
GPERF_SRC := http://mirrors.ocf.berkeley.edu/gnu/gperf/gperf-3.1.tar.gz

GPERF_CONFIG_ARGS = --prefix="$$(COSMOS)"\
					CFLAGS="-Os"


$(eval $(call DOWNLOAD_SOURCE,cli/gperf,$(GPERF_SRC)))
$(eval $(call AUTOTOOLS_BUILD,cli/gperf,$(GPERF_CONFIG_ARGS),$(GPERF_CONFIG_ARGS)))

o/cli/gperf/built.fat: BINS = gperf
