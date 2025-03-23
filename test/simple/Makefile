
export EXE=$(shell ocamlc -config-var ext_exe)
TESTS=LAUNCH join_meta ya-wrap-ocamlfind

all:

test: $(TESTS)
	./LAUNCH.sh > LAUNCH.sh.output 2>&1
ifneq ($(OS),Windows_NT)
	diff -Bwiu t/LAUNCH/LAUNCH.sh.expected LAUNCH.sh.output
endif

%: %.md
	rm -f $<.corrected
	ocaml-mdx test $<
	test '!' -f $<.corrected || diff -I '```' -Bwiu $< $<.corrected

clean::
	rm -f *.corrected *.output
