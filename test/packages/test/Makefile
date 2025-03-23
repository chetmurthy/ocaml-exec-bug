TOP=../../..

include $(TOP)/test/Makefile.config

all test: justfoo foobar andbuzz

foobar:
	$(OCAMLFIND) ocamlc -verbose -package bar -linkall -linkpkg foobar.ml -o foobar

andbuzz:
	$(OCAMLFIND) ocamlc -verbose -package bar -linkall -linkpkg buzz.cmo andbuzz.ml -o andbuzz

justfoo:
	$(OCAMLFIND) ocamlc -verbose -package foo -linkall -linkpkg justfoo.ml -o justfoo

clean::
	rm -f *.cm* foobar justfoo andbuzz
