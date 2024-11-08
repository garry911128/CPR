
(* The type of tokens. *)

type token = 
  | TIMES
  | PLUS
  | MINUS
  | INT of (int)
  | FORWARD
  | EOF
  | DIVIDE

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)
