open Printf
let usage = "fixin [-s] [files]"

let absdirs =
  Sys.getenv "PATH"
  |> String.split_on_char ':'
  |> List.filter (fun p -> p.[0] == '/') 
  |> List.rev

exception NotProcessed of string

let find_executable ~verbose executable =
  let f found dir =
    let path = sprintf "%s/%s" dir executable in
    if Sys.file_exists path then (
      if verbose && found <> "" then
        eprintf "Ignoring %s\n" path;
      path)
    else found in
  ListLabels.fold_left ~init:"" absdirs ~f

let parse_shebang line =
  let open StringLabels in
  if not (starts_with ~prefix:"#!" line) then
    raise (NotProcessed "doesn't start with shebang");
  let cmd = sub line ~pos:2 ~len:(length line - 2) |> trim in
  match split_on_char ~sep:' ' cmd with
  | [] -> failwith "unreachable branch"
  | cmd :: args ->
    cmd, concat ~sep:" " args

let generate_shebang ~verbose line =
  let cmd, args = parse_shebang line in
  let executable_name = Filename.basename(cmd) in
  let found = find_executable ~verbose executable_name in
  if found == "" then
    raise (NotProcessed (sprintf "unchanged. Can't find %s in PATH" executable_name));
  sprintf "#!%s %s" found args |> String.trim
  
let writefile ~shebang ~filename ~in_channel =
  Sys.rename filename (filename ^ ".bak");
  let out_channel = if in_channel == stdin then
      stdout
    else
      let dev = (Unix.stat filename).st_dev in
      let mode = if dev = 0 then 0 else 0o755 in
      Unix.chmod filename mode;
      open_out filename
  in
  fprintf out_channel "%s\n" shebang;
  let rec loop () =
    try
      output_string out_channel (input_line in_channel);
      loop ()
    with End_of_file -> ()
  in loop ()
  
let process_file ~verbose ~filename in_channel =
  try
    let shebang = generate_shebang ~verbose (input_line in_channel) in
    if verbose then
      eprintf "Changing shebang of %s to %s" filename shebang;
    writefile ~shebang ~filename ~in_channel
  with
  | Sys_error msg -> eprintf "%s\n" msg
  | End_of_file -> eprintf "%s is empty.\n" filename
  | NotProcessed msg -> eprintf "%s %s\n" filename msg
  | exn -> raise exn

let () =
  let rec loop ~verbose = function
    | "-s" :: files -> loop ~verbose:false files
    | [] ->
      if Unix.isatty Unix.stdin then
        let filename = "<STDIN>" in
        process_file ~verbose ~filename stdin
      else
        failwith ("Usage: " ^ usage)
    | files ->
      ListLabels.iter files
        ~f:(fun filename ->
            process_file ~verbose ~filename (open_in filename))
  in loop ~verbose:true (Array.to_list Sys.argv |> List.tl)
