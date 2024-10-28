type buffer = { text: string; mutable current: int; mutable last: int }
let next_char b =
  if b.current = String.length b.text then raise End_of_file;
  let c = b.text.[b.current] in
  b.current <- b.current + 1;
  c

let rec let state0 b =
  try
    let nc = next_char b in
    match nc with
    | _ -> failwith "lexical error"
  with End_of_file -> raise End_of_file

and let state1 b =
  b.last <- b.current;
  if b.current = String.length b.text then raise End_of_file else ();
  try
    let nc = next_char b in
    match nc with
    | '#' -> state0 b
    | _ -> raise End_of_file
  with End_of_file -> raise End_of_file

and let state2 b =
  try
    let nc = next_char b in
    match nc with
    | 'a' -> state2 b
    | 'b' -> state1 b
    | _ -> failwith "lexical error"
  with End_of_file -> raise End_of_file

let start = state2