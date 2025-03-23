
all:

test::
	rm -f FAILED
	if [ -f FAILED ] ; then false; fi
	ocamlfind fmt/NONEXISTENT || touch FAILED
	if [ ! -f FAILED ] ; then false; fi
	rm -f FAILED
	TOP=../.. ../../src/LAUNCH -- ocamlfind fmt/NONEXISTENT || touch FAILED
	if [ ! -f FAILED ] ; then false; fi
	rm -f FAILED
ifeq ($(OS),Windows_NT)
	TOP=../.. ../../src/LAUNCH -- ocamlfind camlp5-buildscripts/LAUNCH -- echo foo || touch FAILED
	if [ ! -f FAILED ] ; then false; fi
	rm -f FAILED
endif
	echo "==== ALL PASSED ===="

clean::
