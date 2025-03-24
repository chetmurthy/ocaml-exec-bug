
all:

test::
	rm -f FAILED
	if [ -f FAILED ] ; then false; fi
	ocamlfind fmt/NONEXISTENT || touch FAILED
	if [ ! -f FAILED ] ; then false; fi
	rm -f FAILED
	../../src/LAUNCH2 -- false || touch FAILED
	if [ ! -f FAILED ] ; then false; fi
	rm -f FAILED
	echo "==== ALL PASSED ===="

clean::
