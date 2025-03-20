
open Rresult
open Bos
open Fpath

let push l x = l := x :: !l

let verbose = ref false
let veryverbose = ref false
let cmd = ref []
let _ =
  Arg.
  (parse
    ["-v", Set verbose, "verbose output";
     "-vv", Set veryverbose, "very verbose output";
     "--", Rest (fun s -> cmd := !cmd @ [s]), "the command"]
    (fun s -> cmd := !cmd @ [s]) "LAUNCH [-v] [--] <cmd>")

let ( let* ) x f = Rresult.(>>=) x f

let main () =
  let* top =
    match OS.Env.var "TOP" with
      Some v -> Ok v
    | None ->
        Error
          (`Msg
             "LAUNCH: environment variable TOP *must* be set to use this wrapper")
  in
  let path_var_separator =
    match Sys.os_type with
      "Unix" -> ":"
    | _ -> ";"
  in
  let* path = OS.Env.req_var "PATH" in
  let newpath =
    String.concat "" [top; "/local-install/bin"; path_var_separator; ""; path]
  in
  let* () = OS.Env.set_var "PATH" (Some newpath) in
  let newcamlpath =
    String.concat "" [top; "/local-install/lib"; path_var_separator]
  in
  let* () = OS.Env.set_var "OCAMLPATH" (Some newcamlpath) in
  match !cmd with
    exe :: _ ->
      if !verbose then
        Fmt.
        (pf stderr "LAUNCH: command %a\n%!"
          (list ~sep:(const string " ") Dump.string) !cmd);
      if !veryverbose then
        Fmt.
        (pf stderr "LAUNCH: env PATH=%a OCAMLPATH=%a %a\n%!" Dump.string
          newpath Dump.string newcamlpath
          (list ~sep:(const string " ") Dump.string) !cmd);
      Ok (Unix.execvp exe (Array.of_list !cmd))
  | _ ->
      Error
        (`Msg
           "LAUNCH: at least one argument (the command-name) must be provided")

let _ =
  try R.failwith_error_msg (main ()) with
    exc -> Fmt.(pf stderr "%a\n%!" exn exc)
