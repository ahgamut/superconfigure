
LLVM_SRC := https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-15.0.7.tar.gz 
LLVM_DEPS := cosmo-repo/base
LLVM_BINS := clang-15 clang-ast-dump clang-check clang-diff clang-extdef-mapping \
	clang-format clang-fuzzer-dictionary clang-linker-wrapper \
	clang-nvlink-wrapper clang-offload-bundler clang-offload-packager \
	clang-offload-wrapper clang-refactor clang-rename clang-scan-deps \
	clang-tblgen dsymutil llc llvm-PerfectShuffle llvm-ar \
	llvm-as llvm-bcanalyzer llvm-cat llvm-cfi-verify llvm-config \
	llvm-cov llvm-cvtres llvm-cxxdump llvm-cxxfilt llvm-cxxmap llvm-diff \
	llvm-dis llvm-dlang-demangle-fuzzer llvm-dwarfdump llvm-dwarfutil \
	llvm-dwp llvm-extract llvm-gsymutil llvm-ifs llvm-isel-fuzzer \
	llvm-itanium-demangle-fuzzer llvm-libtool-darwin llvm-link llvm-lipo \
	llvm-lto llvm-lto2 llvm-mc llvm-mca llvm-microsoft-demangle-fuzzer \
	llvm-ml llvm-modextract llvm-mt llvm-nm llvm-objcopy llvm-objdump \
	llvm-opt-fuzzer llvm-opt-report llvm-pdbutil llvm-profdata llvm-profgen \
	llvm-rc llvm-reduce llvm-remark-size-diff llvm-rust-demangle-fuzzer \
	llvm-sim llvm-size llvm-special-case-list-fuzzer llvm-split llvm-stress \
	llvm-strings llvm-tapi-diff llvm-tblgen llvm-tli-checker llvm-undname \
	llvm-xray llvm-yaml-numeric-parser-fuzzer llvm-yaml-parser-fuzzer not \
	obj2yaml opt split-file yaml-bench yaml2obj

$(eval $(call DOWNLOAD_SOURCE,compiler/llvm,$(LLVM_SRC)))
$(eval $(call SPECIFY_DEPS,compiler/llvm,$(LLVM_DEPS)))

o/compiler/llvm/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/compiler/llvm/config-wrapper
o/compiler/llvm/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/compiler/llvm/config-wrapper

o/compiler/llvm/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/compiler/llvm/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/compiler/llvm/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/compiler/llvm/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/compiler/llvm/built.fat: BINS = $(LLVM_BINS)

llvm: o/compiler/llvm/built.fat
.PHONY: llvm
