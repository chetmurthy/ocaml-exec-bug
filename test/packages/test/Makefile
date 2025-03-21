TOP=../../..

LAUNCH=TOP=$(TOP) $(TOP)/src/LAUNCH
OCAMLFIND=$(LAUNCH) -- ocamlfind 

test all: justfoo foobar andbuzz

foobar:
	$(OCAMLFIND) ocamlc -package bar -linkall -linkpkg foobar.ml -o foobar

andbuzz:
	$(OCAMLFIND) ocamlc -package bar -linkall -linkpkg buzz.cmo andbuzz.ml -o andbuzz

justfoo:
	$(OCAMLFIND) ocamlc -package foo -linkall -linkpkg justfoo.ml -o justfoo

clean::
	rm -f *.cm* foobar justfoo
