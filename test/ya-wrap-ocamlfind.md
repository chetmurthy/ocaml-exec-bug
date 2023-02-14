```sh
$ ../src/ya-wrap-ocamlfind echo t/ya-wrap-ocamlfind/simple.ml
'echo'  -syntax goober  t/ya-wrap-ocamlfind/simple.ml
-syntax goober t/ya-wrap-ocamlfind/simple.ml
```

```sh
$ PAPACKAGES=foo,bar ../src/ya-wrap-ocamlfind echo t/ya-wrap-ocamlfind/after-cppo.ml
'echo'  -syntax camlp5o -package foo,bar  t/ya-wrap-ocamlfind/after-cppo.ml
-syntax camlp5o -package foo,bar t/ya-wrap-ocamlfind/after-cppo.ml
```

```sh
$ rm -rf _build && mkdir -p _build
```

```sh
$ cppo -D PAPPX t/ya-wrap-ocamlfind/before-cppo.ml > _build/cppo.pappx.ml
$ PAPACKAGES=foo,bar PPXPACKAGES=buzz,fuzz ../src/ya-wrap-ocamlfind echo _build/cppo.pappx.ml
'echo'  -syntax camlp5o -package foo,bar  _build/cppo.pappx.ml
-syntax camlp5o -package foo,bar _build/cppo.pappx.ml
$ cat _build/cppo.pappx.ml
# 2 "t/ya-wrap-ocamlfind/before-cppo.ml"
(** -syntax camlp5o -package $(PAPACKAGES) *)
# 6 "t/ya-wrap-ocamlfind/before-cppo.ml"
(* Copyright 2019 Chetan Murthy, All rights reserved. *)
```

```sh
$ cppo -U PAPPX t/ya-wrap-ocamlfind/before-cppo.ml > _build/cppo.ppx.ml
$ PAPACKAGES=foo,bar PPXPACKAGES=buzz,fuzz ../src/ya-wrap-ocamlfind echo _build/cppo.ppx.ml
'echo'  -package buzz,fuzz  _build/cppo.ppx.ml
-package buzz,fuzz _build/cppo.ppx.ml
$ cat _build/cppo.ppx.ml
# 4 "t/ya-wrap-ocamlfind/before-cppo.ml"
(** -package $(PPXPACKAGES) *)
# 6 "t/ya-wrap-ocamlfind/before-cppo.ml"
(* Copyright 2019 Chetan Murthy, All rights reserved. *)
```
