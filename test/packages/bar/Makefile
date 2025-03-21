TOP=../../..

LAUNCH=TOP=$(TOP) $(TOP)/src/LAUNCH
OCAMLFIND=$(LAUNCH) -- ocamlfind 

test:

all: install

install: bar.cmo buzz.cmi
	$(OCAMLFIND) install -destdir $(TOP)/local-install/lib bar META bar.cmo bar.cmi buzz.cmo buzz.cmi || true

uninstall::
	$(OCAMLFIND) remove -destdir $(TOP)/local-install/lib bar || true

bar.cmi bar.cmo:
	$(OCAMLFIND) ocamlc -package foo -c bar.ml

buzz.cmi buzz.cmo:
	$(OCAMLFIND) ocamlc -package foo -c buzz.ml

clean:: uninstall
	rm -f *.cm*
