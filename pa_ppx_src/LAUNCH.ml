
open Rresult
open Bos
open Fpath

let ( let* ) x f = Rresult.(>>=) x f

let top =
  match OS.Env.var "TOP" with
    Some v -> v
  | None -> failwith "LAUNCH: environment variable TOP *must* be set to use this wrapper" in
let* path = OS.Env.req_var "PATH" in
let* () = OS.Env.set_var "PATH" (Some [%pattern {|${top}/local-install/bin:${path}|}]) in
let* () = OS.Env.set_var "OCAMLPATH" (Some [%pattern {|${top}/local-install/lib:|}]) in
let args = Sys.argv |> Array.to_list |> List.tl in
match args with
  cmd::args -> Ok (Unix.execvp cmd (Array.of_list args))
| _ -> Error (`Msg "LAUNCH: at least one argument (the command-name) must be provided")
