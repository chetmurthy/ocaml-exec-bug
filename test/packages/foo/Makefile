TOP=../../..

include $(TOP)/test/Makefile.config

test:

all: install

install: foo.cmo
	$(OCAMLFIND) install -destdir $(TOP)/local-install/lib foo META foo.cmo foo.cmi || true

uninstall::
	$(OCAMLFIND) remove -destdir $(TOP)/local-install/lib foo || true

foo.cmi foo.cmo:
	$(OCAMLFIND) ocamlc -c foo.ml

clean:: uninstall
	rm -f *.cm*
