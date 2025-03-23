```sh
$ ../../src/LAUNCH echo foo
Failure("LAUNCH: environment variable TOP *must* be set to use this wrapper")
```

```sh
$ env TOP=../.. ../../src/LAUNCH echo foo
foo
```

```sh
$ env TOP=../.. ../../src/LAUNCH -vv -- ocamlfind camlp5-buildscripts/LAUNCH -vv -- echo bar
bar
```
