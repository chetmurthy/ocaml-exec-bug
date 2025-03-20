
TESTS=shell LAUNCH join_meta ya-wrap-ocamlfind

all:

test: $(TESTS)

%: %.md
	rm -f $<.corrected
	ocaml-mdx test $<
	test '!' -f $<.corrected || diff -Bwiu $< $<.corrected

clean::
	rm -f *.corrected
