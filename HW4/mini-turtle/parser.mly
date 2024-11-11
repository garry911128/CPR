%{
  open Ast
%}

/* Declaration of tokens */
%token <int> INT
%token PLUS MINUS TIMES DIVIDE
%token DEF
%token FORWARD PENUP PENDOWN TURNLEFT TURNRIGHT COLOR
%token <string> COLOR_NAME
%token IF ELSE REPEAT
%token <string> IDENT
%token LBRACE RBRACE LPAREN RPAREN COMMA
%token EOF

/* Priorities and associativity of tokens */
%left PLUS MINUS
%left TIMES DIVIDE

/* Axiom of the grammar */
%start prog
%type <Ast.program> prog

%%

/* Production rules of the grammar */

prog:
  defs stmts EOF
    { { defs = $1; main = Sblock $2 } }
;

defs:
    { [] } 
  | defs def
    { $1 @ [$2] }
;

def:
// def asd (a,b,...) { stmts }
  DEF IDENT LPAREN params RPAREN LBRACE stmts RBRACE
    { { name = $2; formals = $4; body = Sblock $7 } }  (* 函数定义，包括参数和函数体 *)
// def asd (a,b,..) ..
  | DEF IDENT LPAREN params RPAREN stmt
    { { name = $2; formals = $4; body = $6 } }  (* 函数定义，没有函数体 *)
;

params:
    { [] }
  | param_list
    { $1 }
;

param_list:
  IDENT
    { [$1] }
  | param_list COMMA IDENT
    { $1 @ [$3] }
;

args:
    { [] }
  | arg_list 
    { $1 }
;

arg_list:
  expr
    { [$1] }
  | arg_list COMMA expr
    { $1 @ [$3] }
;

stmts:
    { [] }
  | stmts stmt
    { $1 @ [$2] }
;

stmt:
  FORWARD expr           { Sforward $2 }
  | PENUP                  { Spenup }
  | PENDOWN                { Spendown }
  | TURNLEFT expr          { Sturn $2 }            (* 左转，使用正值 *)
  | TURNRIGHT expr         { Sturn (Ebinop (Sub, Econst 0, $2)) } (* 右转，使用负值 *)
  | COLOR COLOR_NAME
    {
      match $2 with
      | "red"    -> Scolor Turtle.red
      | "blue"   -> Scolor Turtle.blue
      | "green"  -> Scolor Turtle.green
      | "white" -> Scolor Turtle.white
      | _        -> Scolor Turtle.black
    }
  | IF expr stmt ELSE stmt      { Sif ($2, $3, $5) }    (* if-else 语句 *)
  | IF expr stmt                { Sif ($2, $3, Sblock []) }  (* if 语句，没有 else 部分 *)
  | REPEAT expr stmt            { Srepeat ($2, $3) }     (* repeat 语句 *)
  | LBRACE stmts RBRACE         { Sblock $2 }            (* 代码块语句 *)
  | IDENT LPAREN args RPAREN    { print_endline ("Call: " ^ $1); Scall ($1, $3) }
;

expr:
  INT                     
    { Econst $1 }
  | MINUS expr %prec MINUS
    { Ebinop (Sub, Econst 0, $2) }
  | expr PLUS expr          
    { Ebinop (Add, $1, $3) }
  | expr MINUS expr         
    { Ebinop (Sub, $1, $3) }
  | expr TIMES expr         
    { Ebinop (Mul, $1, $3) }
  | expr DIVIDE expr        
    { Ebinop (Div, $1, $3) }
  | LPAREN expr RPAREN
    { $2 }
  | IDENT
    { Evar $1 }
;
