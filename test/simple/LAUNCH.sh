#!/bin/bash

echo "================"
../../src/LAUNCH echo foo

echo "================"
env TOP=../.. ../../src/LAUNCH echo foo

echo "================"
env TOP=../.. ../../src/LAUNCH -- ocamlfind camlp5-buildscripts/LAUNCH${EXE} -- echo bar
