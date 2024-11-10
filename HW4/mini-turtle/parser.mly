%{
  open Ast
%}

/* Declaration of tokens */
%token <int> INT
%token PLUS MINUS TIMES DIVIDE
%token FORWARD PENUP PENDOWN TURNLEFT TURNRIGHT COLOR
%token <string> COLOR_NAME
%token EOF SEMI
%token IF ELSE REPEAT
%token LBRACE RBRACE  (* 添加 { 和 } 标记 *)

/* Priorities and associativity of tokens */
%left PLUS MINUS
%left TIMES DIVIDE

/* Axiom of the grammar */
%start prog
%type <Ast.program> prog

%%

/* Production rules of the grammar */

prog:
  stmts EOF
    { { defs = []; main = Sblock $1 } }
;

stmts:
  | stmt stmts         { $1 :: $2 }
  | /* empty */        { [] }

stmt:
  | FORWARD expr SEMI           { Sforward $2 }
  | PENUP SEMI                  { Spenup }
  | PENDOWN SEMI                { Spendown }
  | TURNLEFT expr SEMI          { Sturn $2 }            (* 左转，使用正值 *)
  | TURNRIGHT expr SEMI         { Sturn (Ebinop (Sub, Econst 0, $2)) } (* 右转，使用负值 *)
  | COLOR COLOR_NAME SEMI
    {
      match $2 with
      | "red"    -> Scolor Turtle.red
      | "blue"   -> Scolor Turtle.blue
      | "green"  -> Scolor Turtle.green
      | "white" -> Scolor Turtle.white (* 如果Graphics支持yellow的话 *)
      | _        -> Scolor Turtle.black  (* 默认为黑色 *)
    }
  | IF expr stmt ELSE stmt      { Sif ($2, $3, $5) }    (* if-else 语句 *)
  | IF expr stmt                { Sif ($2, $3, Sblock []) }  (* if 语句，没有 else 部分 *)
  | REPEAT expr stmt            { Srepeat ($2, $3) }     (* repeat 语句 *)
  | LBRACE stmts RBRACE         { Sblock $2 }            (* 代码块语句 *)
  ;


expr:
  | INT                     { Econst $1 }
  | expr PLUS expr          { Ebinop (Add, $1, $3) }
  | expr MINUS expr         { Ebinop (Sub, $1, $3) }
  | expr TIMES expr         { Ebinop (Mul, $1, $3) }
  | expr DIVIDE expr        { Ebinop (Div, $1, $3) }
