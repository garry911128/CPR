/* Parsing for mini-Turtle */

%{
  open Ast

%}

/* Declaration of tokens */
%token <int> INT
%token PLUS MINUS TIMES DIVIDE
%token FORWARD
%token EOF
/* To be completed */

/* Priorities and associativity of tokens */
%left PLUS MINUS
%left TIMES DIVIDE
/* To be completed */

/* Axiom of the grammar */
%start prog

/* Type of values ​​returned by the parser */
%type <Ast.program> prog

%%
/* Production rules of the grammar */

prog:
  stmts EOF
    { { defs = []; main = Sblock $1 } (* To be modified *) }
;

stmts:
  | stmt stmts            { $1 :: $2 }
  | /* empty */            { [] }          /* 允許空語句列表 */

stmt:
  | FORWARD expr       { Sforward $2}

expr:
  | INT                  { Econst $1 }
  | expr PLUS expr       { Ebinop (Add, $1, $3) }
  | expr MINUS expr      { Ebinop (Sub, $1, $3) }
  | expr TIMES expr      { Ebinop (Mul, $1, $3) }
  | expr DIVIDE expr     { Ebinop (Div, $1, $3) }