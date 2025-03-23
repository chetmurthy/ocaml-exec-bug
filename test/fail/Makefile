
all:

test::
	ocamlfind fmt/NONEXISTENT || echo expecting-this
	TOP=../.. ../../src/LAUNCH -- ocamlfind fmt/NONEXISTENT || echo expecting-this-2
	TOP=../.. ../../src/LAUNCH -- ocamlfind camlp5-buildscripts/LAUNCH -- echo foo || echo expecting-this-3
	false

clean::
