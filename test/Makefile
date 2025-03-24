
all:

test::
	../src/LAUNCH2 -- echo it-actually-calls-the-argument
	rm -f FAILED
	../src/LAUNCH2 -- false || touch FAILED
	if [ ! -f FAILED ] ; then false; fi
	rm -f FAILED
	echo "==== ALL PASSED ===="

clean::
