
(* Lexical analyser for mini-Turtle *)

{
  open Lexing
  open Parser

  (* raise exception to report a lexical error *)
  exception Lexing_error of string

  (* note : remember to call the Lexing.new_line function
at each carriage return ('\n' character) *)

}

rule token = parse
  | [' ' '\t' '\n']       { token lexbuf }       (* 忽略空白字元 *)
  | "//" [^ '\n']* '\n'   { token lexbuf }       (* 行註解: 忽略到行尾 *)
  | "(*"                  { comment lexbuf }     (* 進入塊註解模式 *)
  | eof                   { EOF }                (* 文件結尾時返回 EOF *)
  | _                     { failwith "Unrecognized token" }

and comment = parse
  | "*)"                  { token lexbuf }       (* 結束塊註解並返回主分析 *)
  | eof                   { failwith "Unterminated comment" } (* 錯誤：未結束的註解 *)
  | _                     { comment lexbuf }     (* 繼續處理塊註解內容 *)