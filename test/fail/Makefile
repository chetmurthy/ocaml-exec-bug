
all:

test::
	ocamlfind fmt/NONEXISTENT && false
	TOP=../.. ../../src/LAUNCH -- ocamlfind fmt/NONEXISTENT && false
	TOP=../.. ../../src/LAUNCH -- ocamlfind camlp5-buildscripts/LAUNCH -- echo foo && false

clean::
