
include editor/emacs/BUILD.mk
include editor/vim/BUILD.mk
include editor/nano/BUILD.mk

editor: \
	o/editor/emacs/built.fat \
	o/editor/vim/built.fat \
	o/editor/nano/built.fat

.PHONY: editor
