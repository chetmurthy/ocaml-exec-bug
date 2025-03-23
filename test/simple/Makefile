
TESTS=LAUNCH join_meta ya-wrap-ocamlfind

all:

test: $(TESTS)
	./LAUNCH.sh > LAUNCH.sh.output 2>&1
	diff -Bwiu t/LAUNCH/LAUNCH.sh.expected LAUNCH.sh.output

%: %.md
	rm -f $<.corrected
	ocaml-mdx test $<
	test '!' -f $<.corrected || diff -I '```' -Bwiu $< $<.corrected

clean::
	rm -f *.corrected *.output
