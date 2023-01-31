
OCAMLFIND=ocamlfind
PACKAGES=re,fmt,unix

EXE=ya-wrap-ocamlfind fixin

all: $(EXE)

ya-wrap-ocamlfind: ya_wrap_ocamlfind.ml
	$(OCAMLFIND) ocamlc -linkpkg -linkall -package $(PACKAGES) $< -o $@

fixin: fixin.ml
	$(OCAMLFIND) ocamlc -linkpkg -linkall -package $(PACKAGES) $< -o $@

clean::
	rm -f *.cm* $(EXE)
