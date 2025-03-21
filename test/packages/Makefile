
TESTDIRS=foo bar test

all: test

test::
	set -e; for i in $(TESTDIRS); do cd $$i; $(MAKE) test; cd ..; done

clean::
	set -e; for i in $(TESTDIRS); do cd $$i; $(MAKE) clean; cd ..; done
