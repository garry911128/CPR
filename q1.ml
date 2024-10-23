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

(* 執行測試函數 *)
let () = test_null ()