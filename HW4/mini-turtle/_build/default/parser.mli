
(* The type of tokens. *)

type token = 
  | TURNRIGHT
  | TURNLEFT
  | TIMES
  | REPEAT
  | RBRACE
  | PLUS
  | PENUP
  | PENDOWN
  | MINUS
  | LBRACE
  | INT of (int)
  | IF
  | FORWARD
  | EOF
  | ELSE
  | DIVIDE
  | COLOR_NAME of (string)
  | COLOR

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)
