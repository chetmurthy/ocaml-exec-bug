
TESTS=LAUNCH join_meta

all:

test: $(TESTS)

%: %.md
	rm -f $<.corrected
	ocaml-mdx test $< && test '!' -f $<.corrected
