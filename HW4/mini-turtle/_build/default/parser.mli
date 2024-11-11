
(* The type of tokens. *)

type token = 
  | TURNRIGHT
  | TURNLEFT
  | TIMES
  | RPAREN
  | REPEAT
  | RBRACE
  | PLUS
  | PENUP
  | PENDOWN
  | MINUS
  | LPAREN
  | LBRACE
  | INT of (int)
  | IF
  | IDENT of (string)
  | FORWARD
  | EOF
  | ELSE
  | DIVIDE
  | DEF
  | COMMA
  | COLOR_NAME of (string)
  | COLOR

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)
