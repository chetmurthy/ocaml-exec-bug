let cmd = ref []
let _ =
  Arg.
  (parse
    ["--", Rest (fun s -> cmd := !cmd @ [s]), "the command"]
    (fun s -> cmd := !cmd @ [s]) "LAUNCH [-v] [--] <cmd>")

let main () =
  match !cmd with
    exe :: _ ->
     Fmt.
     (pf stderr "LAUNCH: command %a\n%!"
        (list ~sep:(const string " ") Dump.string) !cmd);
     Unix.execvp exe (Array.of_list !cmd)
  | _ ->
     failwith "LAUNCH: at least one argument (the command-name) must be provided"

let _ =
  try main () with
    exc -> Fmt.(pf stderr "%a\n%!" exn exc); exit 1
