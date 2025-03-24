ifeq ($(OS),Windows_NT)
WD=$(shell cygpath --absolute --windows .)
EXE=.exe
else
WD=$(shell pwd)
EXE=
endif
TOP=..

OCAMLFIND=ocamlfind

BIN=LAUNCH2$(EXE)

all: $(BIN)

LAUNCH2$(EXE): LAUNCH2.ml
	$(OCAMLFIND) ocamlc -linkpkg -linkall -package fmt,unix $< -o $@

clean::
	rm -f *.bak *.cm* $(BIN) META
