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
  | "forward"            { FORWARD }
  | ['0'-'9']+ as int    { INT (int_of_string int) }
  | '+'                  { PLUS }
  | '-'                  { MINUS }
  | '*'                  { TIMES }
  | '/'                  { DIVIDE }
  | eof                  { EOF }
  | "\n"                 { token lexbuf }       (* 忽略換行符 *)
  | [' ' '\t']          { token lexbuf }       (* 忽略空白字元 *)

  | "//" [^ '\n']* '\n' { token lexbuf }       (* 行註解: 忽略到行尾 *)
  | "(*"                { comment lexbuf }     (* 進入塊註解模式 *)

and comment = parse
  | "*)"                { token lexbuf }       (* 結束塊註解並返回主分析 *)
  | _                   { comment lexbuf }     (* 忽略塊註解中的所有字符 *)