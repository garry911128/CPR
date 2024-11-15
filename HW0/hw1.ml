let rec fact n = 
  if n = 0 then 1
  else n * fact (n-1)

let rec nb_bit_pos n =
  let remainder = n mod 2 in
  let quotient = n / 2 in
  if n = 0 then 0
  else (remainder:int) + (nb_bit_pos quotient)

let ans1 = 
  let ans1_1 = fact 5 in
  let ans1_2 = nb_bit_pos 100 in
  Printf.printf "%s%d\n" "1.1 " ans1_1;
  Printf.printf "%s%d\n" "1.2 " ans1_2;;

let fab n =
  let rec aux n a b =
    if n = 0 then a
    else aux (n-1) b (a+b)
  in
  aux n 0 1

let ans2 = 
  let ans = fab 5 in
  Printf.printf "%s%d\n" "2. " ans;;


let palindrome m = 
  let len = String.length m in
  let rec check i =
    if i >= len/2 then true
    else if String.get m i <> String.get m (len - i - 1) then false
    else check (i+1)
  in
  check 0

let compare m1 m2 =
  let len1 = String.length m1 in
  let len2 = String.length m2 in
  let rec check i =
    if i >= len1 || i >= len2 then len1 < len2
    else if String.get m1 i < String.get m2 i then true
    else if String.get m1 i > String.get m2 i then false
    else check (i+1)
  in
  check 0

let factor m1 m2 =
  let len1 = String.length m1 in
  let len2 = String.length m2 in
  let check i =
    let rec aux j =
      if j = len1 then true
      else if String.get m1 j <> String.get m2 (i+j) then false
      else aux ( j + 1 )
    in
    aux 0
  in
  let rec find i =
    if i + len1 > len2 then false
    else if (check i) then true 
    else find (i+1)
  in
  find 0

let ans3 = 
  let ans3_1 = palindrome "madam" in
  (* let ans3_1 = palindrome "hello" in *)
  Printf.printf "%s%B\n" "3.1 " ans3_1;
  (* let ans3_2 = compare "apple" "banana" in *)
  (* let ans3_2 = compare "orange" "apple" in *)
  let ans3_2 = compare "apple" "applee" in
  Printf.printf "%s%B\n" "3.2 " ans3_2;
  (* let ans3_3 = factor "stra" "string" in *)
  let ans3_3 = factor "stri" "string" in
  Printf.printf "%s%B\n" "3.3 " ans3_3;;

let print_int_list lst =
  List.iter (fun x -> Printf.printf "%d " x) lst;
  Printf.printf "\n";;


let merge_sort l = 
  let rec split l =
    match l with
    | [] -> ([], [])
    | [first] -> ([first], [])
    | first::second::rest ->
      let (list1, list2) = split rest in
      (first::list1, second::list2)
  in
  let rec merge l1 l2 =
    match l1, l2 with
    | [], _ -> (l2)
    | _, [] -> (l1)
    | x1::x_rest, y1::y_rest ->
      if x1 <= y1 then
        x1 :: merge x_rest l2
      else 
        y1 :: merge l1 y_rest
  in
  let rec sort l =
    match l with
    | [] -> []
    | [x] -> [x]
    | _ ->
      let (l1, l2) = split l in
      merge (sort l1) (sort l2)
  in
  sort l

let ans4 = 
  let list = [2;5;6;8;1;7;3;4] in
  let ans4 = merge_sort list in
  Printf.printf "4. ";
  print_int_list ans4

let square_sum_1 l =
  let rec iter list acc = 
    match list with
    | [] -> acc
    | x::rest ->
      iter rest ( acc + x*x )
    in
  iter l 0

let square_sum_2 l =
  List.fold_left (fun acc x -> acc + (x * x)) 0 l  

  

let ans5 =
  let list1 = [1;2;3;4;5] in
  let ans5_1_1 = square_sum_1 list1 in
  let ans5_1_2 = square_sum_2 list1 in
  Printf.printf "%s%d\n" "5.1_1 " ans5_1_1;
  Printf.printf "%s%d\n" "5.1_2 " ans5_1_2;;

let rev lst =
  let rec aux acc lst =
    match lst with
    | [] -> acc
    | x :: xs -> aux (x :: acc) xs
  in
  aux [] lst

let map_tailrec f lst =
  let rec aux f lst acc =
    match lst with
    | [] -> List.rev acc
    | x :: xs -> aux f xs (f x :: acc)
  in
  aux f lst []

  
let ans6 = 
  let l = List.init 1000001 (fun x -> x) in
  let ans6_1 = rev l in
  let function_of_6_2 x = x*2 in
  let ans6_2 = map_tailrec function_of_6_2 l in
  Printf.printf "6.1 answer too long, ingore it\n";
  Printf.printf "6.2 answer too long, ingore it\n";

type 'a seq =
  | Elt of 'a         
  | Seq of 'a seq * 'a seq  

let rec print_seq s =
  match s with
  | Elt x -> Printf.printf "%d " x
  | Seq (s1, s2) -> 
      print_seq s1;
      print_seq s2

let (@@) x y = Seq(x, y)

let rec hd seq =
  match seq with
  | Elt x -> x
  | Seq (left, right) -> hd left

let rec tl seq =
  match seq with
  | Elt _ -> failwith "No tail for a single element"
  | Seq (Elt _, right) -> right
  | Seq (left, right) -> Seq (tl left, right)
  

let rec mem seq target =
  match seq with
  | Elt x -> if x = target then true else false
  | Seq (left, right) -> mem left target || mem right target

let rec rev_seq seq =
  match seq with
  | Elt x -> Elt x
  | Seq (left, right) -> Seq(rev_seq right, rev_seq left)


let rec map_seq seq f =
  match seq with
  | Elt x -> Elt (f x)
  | Seq (left, right) -> Seq (map_seq left f, map_seq right f)


let rec fold_left_seq f acc seq =
  match seq with
  | Elt x -> f acc x
  | Seq (left, right) -> 
    let acc' = fold_left_seq f acc left in
    fold_left_seq f acc' right    

let rec fold_right_seq f seq acc =
  match seq with
  | Elt x -> f x acc
  | Seq (left, right) ->
    let acc' = fold_right_seq f right acc in
    fold_right_seq f left acc'
    
let rec seq2list seq = 
  let rec append l1 l2 =
    match  l1 with
    | [] -> l2
    | first::rest -> first::(append rest l2)
  in
  match seq with
  | Elt x -> [x]
  | Seq (left, right) -> 
    append (seq2list left) (seq2list right)
    
let rec seq_length seq =
  match seq with
  | Elt _ -> 1
  | Seq (left, right) -> seq_length left + seq_length right

let rec find_opt x seq =
  let rec find_aux seq current_index = 
    match seq with
    | Elt y -> 
      if x = y then Some current_index
      else None
    | Seq(left, right) ->
      match find_aux left current_index with
      | Some i -> Some i
      | None -> find_aux right (current_index + seq_length left)  
  in
  find_aux seq 0
  
let rec nth seq n =
  match seq with
  | Elt x -> 
      if n = 0 then x
      else failwith "Index out of bounds"
  | Seq (left, right) ->
      let left_len = seq_length left in
      if n < left_len then
        nth left n
      else
        nth right (n - left_len)

let ans7 =
  let seq1 = Elt 1 @@ Elt 2 in
  let seq2 = Elt 2 @@ Elt 1 in

  let concatenated_seq = seq2 @@ seq1 @@ seq2 in
  
  Printf.printf "The original sequence: ";
  print_seq concatenated_seq;
  Printf.printf "\n";
  
  let head = hd concatenated_seq in
  Printf.printf "7.a1(hd): %d\n" head;
  
  let tail = tl concatenated_seq in
  Printf.printf "7.a2(tl): ";
  print_seq tail;
  Printf.printf "\n";
  
  Printf.printf "7.a3(mem): %B\n" (mem concatenated_seq 3);
  
  let seq_before_rev = Elt 1 @@ (Elt 2 @@ (Elt 3 @@ Elt 4)) in
  let reversed_seq = rev_seq seq_before_rev in
  Printf.printf "7.a4(rev): ";
  print_seq reversed_seq;
  Printf.printf "\n";
  
  let square_func x = x * x in
  let squared_seq = map_seq reversed_seq square_func in
  Printf.printf "7.a5(map): ";
  print_seq squared_seq;
  Printf.printf "\n";
  
  let sum = fold_left_seq (fun acc x -> acc + x) 0 squared_seq in
  Printf.printf "7.a6(fold_left): %d\n" sum;
  
  let product = fold_right_seq (fun x acc -> acc * x) squared_seq 1 in
  Printf.printf "7.a7(fold_right): %d\n" product;
  
  let list_from_seq = seq2list concatenated_seq in
  Printf.printf "7.b(seq2list): ";
  List.iter (Printf.printf "%d ") list_from_seq;
  Printf.printf "\n";
  
  let index_of_two = find_opt 1 concatenated_seq in
  Printf.printf "7.c(find_opt): %s\n" 
    (match index_of_two with Some i -> string_of_int i | None -> "Not found");
  
  let third_elem = nth concatenated_seq 2 in
  Printf.printf "7.d(nth): %d\n" third_elem
;;
        

let ()=
  ans1;
  ans2;
  ans3;
  ans4;
  ans5;
  ans6;
  ans7;