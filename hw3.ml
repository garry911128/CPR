(* 定義正則表達式的類型 *)
type ichar = char * int

type regexp =
  | Epsilon
  | Character of ichar
  | Union of regexp * regexp
  | Concat of regexp * regexp
  | Star of regexp

(* 定義null函數來判斷是否能接受空字 *)
let rec null r =
  match r with
  | Epsilon -> true
  | Character _ -> false
  | Union (r1, r2) -> (null r1) || (null r2)
  | Concat (r1, r2) -> (null r1) && (null r2)
  | Star _ -> true

(* 測試函數 *)
let test_null () =
  let a = Character ('a', 0) in
  let r1 = Star a in
  let r2 = Concat (Epsilon, Star Epsilon) in
  let r3 = Union (Epsilon, a) in
  let r4 = Concat (a, Star a) in

  print_endline (string_of_bool (null a));         (* 預期輸出: false *)
  print_endline (string_of_bool (null r1));        (* 預期輸出: true *)
  print_endline (string_of_bool (null r2));        (* 預期輸出: true *)
  print_endline (string_of_bool (null r3));        (* 預期輸出: true *)
  print_endline (string_of_bool (null r4));;        (* 預期輸出: false *)

module Cset = Set.Make(struct
  type t = char * int
  let compare = Stdlib.compare
end)

let rec first r =
  match r with
  | Epsilon -> Cset.empty
  | Character c -> Cset.singleton c
  | Union (r1, r2) -> Cset.union (first r1) (first r2)
  | Concat (r1, r2) ->
      if null r1 then Cset.union (first r1) (first r2)
      else first r1
  | Star r -> first r

let rec last r =
  match r with
  | Epsilon -> Cset.empty
  | Character c -> Cset.singleton c
  | Union (r1, r2) -> Cset.union (last r1) (last r2)
  | Concat (r1, r2) ->
      if null r2 then Cset.union (last r1) (last r2)
      else last r2
  | Star r -> last r

let print_cset cset =
  Cset.iter (fun (c, i) ->
    Printf.printf "(%c, %d) " c i) cset;
  Printf.printf "\n"

let test_first_last () =
  let ca = ('a', 0) and cb = ('b', 0) in
  let a = Character ca and b = Character cb in
  let ab = Concat (a, b) in
  let eq = Cset.equal in
  assert (eq (first a) (Cset.singleton ca));
  assert (eq (first ab) (Cset.singleton ca));
  assert (eq (first (Star ab)) (Cset.singleton ca));
  assert (eq (last b) (Cset.singleton cb));
  assert (eq (last ab) (Cset.singleton cb));
  assert (Cset.cardinal (first (Union (a, b))) = 2);
  assert (Cset.cardinal (first (Concat (Star a, b))) = 2);
  assert (Cset.cardinal (last (Concat (a, Star b))) = 2);
  Printf.printf "first a: ";
  print_cset (first a);

  Printf.printf "first ab: ";
  print_cset (first ab);

  Printf.printf "first (Star ab): ";
  print_cset (first (Star ab));

  Printf.printf "last b: ";
  print_cset (last b);

  Printf.printf "last ab: ";
  print_cset (last ab);

  Printf.printf "first (Union (a, b)): ";
  print_cset (first (Union (a, b)));

  Printf.printf "first (Concat (Star a, b)): ";
  print_cset (first (Concat (Star a, b)));

  Printf.printf "last (Concat (a, Star b)): ";
  print_cset (last (Concat (a, Star b)))
  
let rec follow c r =
  match r with
  | Epsilon -> Cset.empty
  | Character _ -> Cset.empty
  | Union (r1, r2) -> Cset.union (follow c r1) (follow c r2)
  | Concat (r1, r2) ->
      let f1 = if Cset.mem c (last r1) then first r2 else Cset.empty in
      Cset.union f1 (Cset.union (follow c r1) (follow c r2))
  | Star r ->
      let f1 = if Cset.mem c (last r) then first r else Cset.empty in
      Cset.union f1 (follow c r)
  

      
let test_follow () =
  let ca = ('a', 0) and cb = ('b', 0) in
  let a = Character ca and b = Character cb in
  let ab = Concat (a, b) in
  
  (* 測試 follow ca ab *)
  let result1 = follow ca ab in
  Printf.printf "follow ('a', 0) in ab: ";
  print_cset result1;
  
  (* 測試 follow cb ab *)
  let result2 = follow cb ab in
  Printf.printf "follow ('b', 0) in ab: ";
  print_cset result2;
  
  (* 測試 follow ca r *)
  let r = Star (Union (a, b)) in
  let result3 = follow ca r in
  Printf.printf "follow ('a', 0) in (a|b)*: ";
  print_cset result3;
  
  (* 測試 follow cb r *)
  let result4 = follow cb r in
  Printf.printf "follow ('b', 0) in (a|b)*: ";
  print_cset result4;
  
  (* 測試 follow cb r2 *)
  let r2 = Star (Concat (a, Star b)) in
  let result5 = follow cb r2 in
  Printf.printf "follow ('b', 0) in (ab*)*: ";
  print_cset result5;
  
  (* 測試 follow ca r3 *)
  let r3 = Concat (Star a, b) in
  let result6 = follow ca r3 in
  Printf.printf "follow ('a', 0) in a*b: ";
  print_cset result6;

  let r4 = Concat (Star a, Star b) in
  let result7 = follow cb r4 in
  Printf.printf "follow ('a', 0) in a*b*: ";
  print_cset result7

  
let () = 
  test_null ();
  test_first_last ();
  test_follow();