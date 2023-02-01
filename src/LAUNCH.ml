
open Rresult
open Bos
open Fpath

let push l x = l := x :: !l

let verbose = ref false
let cmd = ref []
let _ =
  Arg.
  (parse
    ["-v", Set verbose, "verbose output";
     "--", Rest_all (fun l -> cmd := l), "the command"]
    (fun s -> cmd := !cmd @ [s]) "LAUNCH [-v] [--] <cmd>")

let ( let* ) x f = Rresult.(>>=) x f

let _ =
  let top =
    match OS.Env.var "TOP" with
      Some v -> v
    | None ->
        failwith
          "LAUNCH: environment variable TOP *must* be set to use this wrapper"
  in
  let* path = OS.Env.req_var "PATH" in
  let* () =
    OS.Env.set_var "PATH"
      (Some (String.concat "" [top; "/local-install/bin:"; path]))
  in
  let* () =
    OS.Env.set_var "OCAMLPATH"
      (Some (String.concat "" [top; "/local-install/lib:"]))
  in
  match !cmd with
    exe :: _ ->
      if !verbose then
        Fmt.
        (pf stderr "LAUNCH: command %a\n%!"
          (list ~sep:(const string " ") Dump.string) !cmd);
      Ok (Unix.execvp exe (Array.of_list !cmd))
  | _ ->
      Error
        (`Msg
           "LAUNCH: at least one argument (the command-name) must be provided")
