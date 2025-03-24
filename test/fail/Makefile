
all:

test::
	rm -f FAILED
	if [ -f FAILED ] ; then false; fi
	ocamlfind fmt/NONEXISTENT || touch FAILED
	if [ ! -f FAILED ] ; then false; fi
	rm -f FAILED
	TOP=../.. ../../src/LAUNCH2 -- ocamlfind fmt/NONEXISTENT || touch FAILED
	if [ ! -f FAILED ] ; then false; fi
	rm -f FAILED
ifeq ($(OS),Windows_NT)
	TOP=../.. ../../src/LAUNCH2 -- ocamlfind camlp5-buildscripts/LAUNCH2 -- echo foo || touch FAILED
	if [ ! -f FAILED ] ; then false; fi
	rm -f FAILED
endif
	echo "==== ALL PASSED ===="

clean::
