
(* The type of tokens. *)

type token = 
  | TURNRIGHT
  | TURNLEFT
  | TIMES
  | SEMI
  | PLUS
  | PENUP
  | PENDOWN
  | MINUS
  | INT of (int)
  | FORWARD
  | EOF
  | DIVIDE
  | COLOR_NAME of (string)
  | COLOR

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)
