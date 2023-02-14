```sh
$ ../src/ya-wrap-ocamlfind echo t/ya-wrap-ocamlfind/simple.ml
```

```sh
$ PAPACKAGES=foo,bar ../src/ya-wrap-ocamlfind echo t/ya-wrap-ocamlfind/after-cppo.ml
```

```sh
$ rm -rf _build && mkdir -p _build
$ cppo -D PAPPX t/ya-wrap-ocamlfind/before-cppo.ml > _build/cppo.pappx.ml
$ PAPACKAGES=foo,bar ../src/ya-wrap-ocamlfind echo _build/cppo.pappx.ml
$ cat _build/cppo.pappx.ml
```

```sh
$ rm -rf _build && mkdir -p _build
$ cppo -U PAPPX t/ya-wrap-ocamlfind/before-cppo.ml > _build/cppo.ppx.ml
$ PAPACKAGES=foo,bar ../src/ya-wrap-ocamlfind echo _build/cppo.ppx.ml
$ cat _build/cppo.ppx.ml
```
