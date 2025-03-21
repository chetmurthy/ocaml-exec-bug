
SYSDIRS= src
TESTDIRS= test
OCAMLFIND=ocamlfind

all: sys
	set -e; for i in $(TESTDIRS); do cd $$i; $(MAKE) all; cd ..; done

sys:
	set -e; for i in $(SYSDIRS); do cd $$i; $(MAKE) all; cd ..; done

test: all
	set -e; for i in $(TESTDIRS); do cd $$i; $(MAKE) test; cd ..; done

bootstrap:
	$(MAKE) -C pa_ppx_src bootstrap

install: sys
	$(OCAMLFIND) remove camlp5-buildscripts || true
	$(OCAMLFIND) install camlp5-buildscripts local-install/lib/camlp5-buildscripts/*

uninstall:
	$(OCAMLFIND) remove camlp5-buildscripts || true

clean::
	set -e; for i in $(SYSDIRS) $(TESTDIRS); do cd $$i; $(MAKE) clean; cd ..; done
	rm -rf docs local-install
