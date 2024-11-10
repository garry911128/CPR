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
  stmts EOF
    { { defs = []; main = Sblock $1 } }
;

stmts:
  | stmt stmts         { $1 :: $2 }
  | /* empty */        { [] }

stmt:
  | FORWARD expr           { Sforward $2 }
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
      | "white" -> Scolor Turtle.white (* 如果Graphics支持yellow的话 *)
      | _        -> Scolor Turtle.black  (* 默认为黑色 *)
    }
  | IF expr stmt ELSE stmt      { Sif ($2, $3, $5) }    (* if-else 语句 *)
  | IF expr stmt                { Sif ($2, $3, Sblock []) }  (* if 语句，没有 else 部分 *)
  | REPEAT expr stmt            { Srepeat ($2, $3) }     (* repeat 语句 *)
  | LBRACE stmts RBRACE         { Sblock $2 }            (* 代码块语句 *)
  | DEF IDENT LPAREN RPAREN LBRACE stmts RBRACE { Sdef ($2, $6) } (* function definition *)
  | IDENT LPAREN args RPAREN    { Scall ($1, $3)}             (* function call *)
  ;

args:
  {[ ]}
  | arg_list 
    { $1 }
;

arg_list:
  expr
    { [$1] }
  | arg_list COMMA expr
    { $1 @ [$3] }
;

expr:
  | INT                     { Econst $1 }
  | expr PLUS expr          { Ebinop (Add, $1, $3) }
  | expr MINUS expr         { Ebinop (Sub, $1, $3) }
  | expr TIMES expr         { Ebinop (Mul, $1, $3) }
  | expr DIVIDE expr        { Ebinop (Div, $1, $3) }
