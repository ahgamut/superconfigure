
LLVM_SRC := https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-18.1.8.tar.gz
LLVM_DEPS := cosmo-repo/base
LLVM_BINS := clang-18 clang-apply-replacements clang-change-namespace \
    clang-check clang-doc clang-extdef-mapping clang-format clang-include-cleaner \
    clang-include-fixer clang-linker-wrapper clang-move clang-offload-bundler \
    clang-offload-packager clang-pseudo clang-query clang-refactor clang-rename \
    clang-reorder-fields clang-repl clang-scan-deps clang-tblgen clang-tidy clangd \
    llvm-ar llvm-tblgen

$(eval $(call DOWNLOAD_SOURCE,compiler/llvm,$(LLVM_SRC)))
$(eval $(call SPECIFY_DEPS,compiler/llvm,$(LLVM_DEPS)))

o/compiler/llvm/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/compiler/llvm/config-wrapper
o/compiler/llvm/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/compiler/llvm/config-wrapper

o/compiler/llvm/built.x86_64: BUILD_COMMAND = ninja -j$(MAXPROC)
o/compiler/llvm/built.aarch64: BUILD_COMMAND = ninja -j$(MAXPROC)

o/compiler/llvm/installed.x86_64: INSTALL_COMMAND = ninja install
o/compiler/llvm/installed.aarch64: INSTALL_COMMAND = ninja install

o/compiler/llvm/built.fat: BINS = $(LLVM_BINS)

llvm: o/compiler/llvm/built.fat
.PHONY: llvm
