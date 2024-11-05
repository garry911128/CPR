
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
  /* To be completed */ EOF
    { { defs = []; main = Sblock [] } (* To be modified *) }
;


