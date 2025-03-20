
TESTS=shell LAUNCH join_meta ya-wrap-ocamlfind

all:

test: $(TESTS)

%: %.md
	rm -f $<.corrected
	ocaml-mdx test $<
	test '!' -f $<.corrected || diff -I '```' -Bwiu $< $<.corrected

clean::
	rm -f *.corrected
