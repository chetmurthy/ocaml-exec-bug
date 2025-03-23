
all:

test::
	TOP=../.. ../../src/LAUNCH -- ocamlfind fmt/NONEXISTENT || echo expecting-this
	TOP=../.. ../../src/LAUNCH -- ocamlfind camlp5-buildscripts/LAUNCH -- echo foo || echo expecting-this-too
	false

clean::
