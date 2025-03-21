TOP=../../..

LAUNCH=TOP=$(TOP) $(TOP)/src/LAUNCH
OCAMLFIND=$(LAUNCH) -- ocamlfind 

test all: install

install: bar.cmo
	$(OCAMLFIND) install -destdir $(TOP)/local-install/lib bar META bar.cmo bar.cmi || /bin/true

uninstall::
	$(OCAMLFIND) remove -destdir $(TOP)/local-install/lib bar

bar.cmi bar.cmo:
	$(OCAMLFIND) ocamlc -package foo -c bar.ml

clean:: uninstall
	rm -f *.cm*
