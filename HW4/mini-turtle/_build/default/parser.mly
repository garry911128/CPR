
/* Parsing for mini-Turtle */

%{
  open Ast

%}

/* Declaration of tokens */
%token <int> INT
%token PLUS MINUS TIMES DIV
%token forward
%token EOF
/* To be completed */

/* Priorities and associativity of tokens */
%left PLUS MINUS
%left TIMES DIV
/* To be completed */

/* Axiom of the grammar */
%start prog

/* Type of values ​​returned by the parser */
%type <Ast.program> prog

%%
/* Production rules of the grammar */

prog:
  defs main_block EOF
    { { defs = $1; main = $2 } }
;

defs:
  | defs def
    { $1 @ [$2] }         /* 將新的定義添加到現有的定義列表中 */
  | /* empty */
    { [] }                /* 沒有定義時返回空列表 */

def:
  | ID ASSIGN expr SEMI
    { Dvar ($1, $3) }    /* 生成變量定義的 AST 節點 */

main_block:
  | BEGIN stmts END
    { $2 }                /* 返回語句列表作為主塊 */

stmts:
  | stmts stmt
    { $1 @ [$2] }        /* 將新的語句添加到語句列表中 */
  | /* empty */
    { [] }               /* 沒有語句時返回空列表 */

stmt:
  | forward expr SEMI
    { Sforward $2 }      /* 處理 forward 語句 */
  | left expr SEMI
    { Sleft $2 }         /* 處理 left 語句 */
  | right expr SEMI
    { Sright $2 }        /* 處理 right 語句 */

expr:
  | INT
    { Eint $1 }          /* 整數值的 AST 節點 */
  | expr PLUS expr
    { Ebinop (Add, $1, $3) } /* 加法運算的 AST 節點 */
  | expr MINUS expr
    { Ebinop (Sub, $1, $3) } /* 減法運算的 AST 節點 */
  | expr TIMES expr
    { Ebinop (Mul, $1, $3) } /* 乘法運算的 AST 節點 */
  | expr DIV expr
    { Ebinop (Div, $1, $3) }  /* 除法運算的 AST 節點 */
  | ID
    { Evar $1 }          /* 變量的 AST 節點 */
  | '(' expr ')'
    { $2 }               /* 括號包住的表達式 */

