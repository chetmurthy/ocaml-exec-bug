
all:

test::
	TOP=../.. ../../src/LAUNCH -- ocamlfind camlp5-buildscripts/LAUNCH -- echo foo || echo not-expecting-this
#	ocamlfind fmt/NONEXISTENT || echo expecting-this
	false

clean::
