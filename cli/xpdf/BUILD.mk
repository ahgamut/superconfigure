XPDF_SRC := https://dl.xpdfreader.com/xpdf-4.05.tar.gz
XPDF_DEPS := lib/libpng lib/freetype

XPDF_CONFIG_ARGS = -DCMAKE_BUILD_SHARED=OFF\
    -DCMAKE_BUILD_STATIC=ON\
	-DCMAKE_CXX_FLAGS="-std=c++20"\
	-DC_INCLUDE_DIRS="$$(COSMOS)/include"\
	-DCMAKE_INSTALL_OLDINCLUDEDIR="$$(COSMOS)/include"\
	-DZLIB_INCLUDE_DIR="$$(COSMOS)/include"\
    -DCMAKE_INSTALL_PREFIX="$$(COSMOS)"

$(eval $(call DOWNLOAD_SOURCE,cli/xpdf,$(XPDF_SRC)))
$(eval $(call SPECIFY_DEPS,cli/xpdf,$(XPDF_DEPS)))
$(eval $(call CMAKE_BUILD,cli/xpdf,$(XPDF_CONFIG_ARGS),$(XPDF_CONFIG_ARGS)))

o/cli/xpdf/built.fat: \
	BINS = pdfdetach pdffonts pdfimages pdfinfo pdftohtml pdftopng pdftoppm pdftops pdftotext 
