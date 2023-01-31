WD=$(shell pwd)
TOP=..

NOT_OCAMLFIND=not-ocamlfind
OCAMLFIND=ocamlfind
PACKAGES=re,fmt,unix,bos

EXE=ya-wrap-ocamlfind fixin join_meta

all: $(EXE)
	$(MAKE) DESTDIR=$(WD)/$(TOP)/local-install/ install

ya-wrap-ocamlfind: ya_wrap_ocamlfind.ml
	$(OCAMLFIND) ocamlc -linkpkg -linkall -package $(PACKAGES) $< -o $@

join_meta: join_meta.ml
	$(OCAMLFIND) ocamlc -linkpkg -linkall -package $(PACKAGES) $< -o $@

fixin: fixin.ml
	$(OCAMLFIND) ocamlc -linkpkg -linkall -package $(PACKAGES) $< -o $@

install::
	mkdir -p $(DESTDIR)/lib
	touch META
	$(NOT_OCAMLFIND) reinstall-if-diff camlp5-buildscripts -destdir $(DESTDIR)/lib META $(EXE)
	rm -f META

clean::
	rm -f *.cm* $(EXE)
