
LLVM_SRC := https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-19.1.0-rc3.tar.gz
LLVM_DEPS := cosmo-repo/base
LLVM_BINS := clang-19 clang-tidy clangd clang-format \
			 clang-apply-replacements clang-check clang-doc \
			 clang-include-fixer clang-linker-wrapper \
			 clang-offload-packager clang-refactor clang-rename clang-tblgen  \
			 llvm-cxxfilt \
			 llvm-ar llvm-nm llvm-objcopy llvm-objdump \
			 llvm-readobj llvm-size llvm-split \
			 llvm-symbolizer llvm-stress llvm-strings llvm-tblgen

$(eval $(call DOWNLOAD_SOURCE,compiler/llvm,$(LLVM_SRC)))
$(eval $(call SPECIFY_DEPS,compiler/llvm,$(LLVM_DEPS)))

o/compiler/llvm/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/compiler/llvm/config-wrapper
o/compiler/llvm/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/compiler/llvm/config-wrapper

o/compiler/llvm/built.x86_64: BUILD_COMMAND = ninja -j$(MAXPROC)
o/compiler/llvm/built.aarch64: BUILD_COMMAND = ninja -j$(MAXPROC)

o/compiler/llvm/installed.x86_64: INSTALL_COMMAND = ninja install && ninja clean
o/compiler/llvm/installed.aarch64: INSTALL_COMMAND = ninja install && ninja clean

o/compiler/llvm/built.fat: BINS = $(LLVM_BINS)

llvm: o/compiler/llvm/built.fat
.PHONY: llvm
