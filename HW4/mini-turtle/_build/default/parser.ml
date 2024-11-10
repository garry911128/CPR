
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | TURNRIGHT
    | TURNLEFT
    | TIMES
    | SEMI
    | REPEAT
    | RBRACE
    | PLUS
    | PENUP
    | PENDOWN
    | MINUS
    | LBRACE
    | INT of (
# 6 "parser.mly"
       (int)
# 26 "parser.ml"
  )
    | IF
    | FORWARD
    | EOF
    | ELSE
    | DIVIDE
    | COLOR_NAME of (
# 9 "parser.mly"
       (string)
# 36 "parser.ml"
  )
    | COLOR
  
end

include MenhirBasics

# 1 "parser.mly"
  
  open Ast

# 48 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState01 : (('s, _menhir_box_prog) _menhir_cell1_TURNRIGHT, _menhir_box_prog) _menhir_state
    (** State 01.
        Stack shape : TURNRIGHT.
        Start symbol: prog. *)

  | MenhirState03 : ((('s, _menhir_box_prog) _menhir_cell1_TURNRIGHT, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 03.
        Stack shape : TURNRIGHT expr.
        Start symbol: prog. *)

  | MenhirState04 : ((('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_TIMES, _menhir_box_prog) _menhir_state
    (** State 04.
        Stack shape : expr TIMES.
        Start symbol: prog. *)

  | MenhirState07 : ((('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_PLUS, _menhir_box_prog) _menhir_state
    (** State 07.
        Stack shape : expr PLUS.
        Start symbol: prog. *)

  | MenhirState08 : (((('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_PLUS, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 08.
        Stack shape : expr PLUS expr.
        Start symbol: prog. *)

  | MenhirState09 : ((('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_DIVIDE, _menhir_box_prog) _menhir_state
    (** State 09.
        Stack shape : expr DIVIDE.
        Start symbol: prog. *)

  | MenhirState11 : ((('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_MINUS, _menhir_box_prog) _menhir_state
    (** State 11.
        Stack shape : expr MINUS.
        Start symbol: prog. *)

  | MenhirState12 : (((('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_MINUS, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 12.
        Stack shape : expr MINUS expr.
        Start symbol: prog. *)

  | MenhirState13 : (('s, _menhir_box_prog) _menhir_cell1_TURNLEFT, _menhir_box_prog) _menhir_state
    (** State 13.
        Stack shape : TURNLEFT.
        Start symbol: prog. *)

  | MenhirState14 : ((('s, _menhir_box_prog) _menhir_cell1_TURNLEFT, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 14.
        Stack shape : TURNLEFT expr.
        Start symbol: prog. *)

  | MenhirState16 : (('s, _menhir_box_prog) _menhir_cell1_REPEAT, _menhir_box_prog) _menhir_state
    (** State 16.
        Stack shape : REPEAT.
        Start symbol: prog. *)

  | MenhirState17 : ((('s, _menhir_box_prog) _menhir_cell1_REPEAT, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 17.
        Stack shape : REPEAT expr.
        Start symbol: prog. *)

  | MenhirState22 : (('s, _menhir_box_prog) _menhir_cell1_LBRACE, _menhir_box_prog) _menhir_state
    (** State 22.
        Stack shape : LBRACE.
        Start symbol: prog. *)

  | MenhirState23 : (('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_state
    (** State 23.
        Stack shape : IF.
        Start symbol: prog. *)

  | MenhirState24 : ((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 24.
        Stack shape : IF expr.
        Start symbol: prog. *)

  | MenhirState25 : (('s, _menhir_box_prog) _menhir_cell1_FORWARD, _menhir_box_prog) _menhir_state
    (** State 25.
        Stack shape : FORWARD.
        Start symbol: prog. *)

  | MenhirState26 : ((('s, _menhir_box_prog) _menhir_cell1_FORWARD, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 26.
        Stack shape : FORWARD expr.
        Start symbol: prog. *)

  | MenhirState32 : (((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_stmt, _menhir_box_prog) _menhir_state
    (** State 32.
        Stack shape : IF expr stmt.
        Start symbol: prog. *)

  | MenhirState36 : (('s, _menhir_box_prog) _menhir_cell1_stmt, _menhir_box_prog) _menhir_state
    (** State 36.
        Stack shape : stmt.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Ast.expr)

and ('s, 'r) _menhir_cell1_stmt = 
  | MenhirCell1_stmt of 's * ('s, 'r) _menhir_state * (Ast.stmt)

and ('s, 'r) _menhir_cell1_DIVIDE = 
  | MenhirCell1_DIVIDE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_FORWARD = 
  | MenhirCell1_FORWARD of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LBRACE = 
  | MenhirCell1_LBRACE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MINUS = 
  | MenhirCell1_MINUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PLUS = 
  | MenhirCell1_PLUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_REPEAT = 
  | MenhirCell1_REPEAT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TIMES = 
  | MenhirCell1_TIMES of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TURNLEFT = 
  | MenhirCell1_TURNLEFT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TURNRIGHT = 
  | MenhirCell1_TURNRIGHT of 's * ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (Ast.program) [@@unboxed]

let _menhir_action_01 =
  fun _1 ->
    (
# 58 "parser.mly"
                            ( Econst _1 )
# 196 "parser.ml"
     : (Ast.expr))

let _menhir_action_02 =
  fun _1 _3 ->
    (
# 59 "parser.mly"
                            ( Ebinop (Add, _1, _3) )
# 204 "parser.ml"
     : (Ast.expr))

let _menhir_action_03 =
  fun _1 _3 ->
    (
# 60 "parser.mly"
                            ( Ebinop (Sub, _1, _3) )
# 212 "parser.ml"
     : (Ast.expr))

let _menhir_action_04 =
  fun _1 _3 ->
    (
# 61 "parser.mly"
                            ( Ebinop (Mul, _1, _3) )
# 220 "parser.ml"
     : (Ast.expr))

let _menhir_action_05 =
  fun _1 _3 ->
    (
# 62 "parser.mly"
                            ( Ebinop (Div, _1, _3) )
# 228 "parser.ml"
     : (Ast.expr))

let _menhir_action_06 =
  fun _1 ->
    (
# 28 "parser.mly"
    ( { defs = []; main = Sblock _1 } )
# 236 "parser.ml"
     : (Ast.program))

let _menhir_action_07 =
  fun _2 ->
    (
# 36 "parser.mly"
                                ( Sforward _2 )
# 244 "parser.ml"
     : (Ast.stmt))

let _menhir_action_08 =
  fun () ->
    (
# 37 "parser.mly"
                                ( Spenup )
# 252 "parser.ml"
     : (Ast.stmt))

let _menhir_action_09 =
  fun () ->
    (
# 38 "parser.mly"
                                ( Spendown )
# 260 "parser.ml"
     : (Ast.stmt))

let _menhir_action_10 =
  fun _2 ->
    (
# 39 "parser.mly"
                                ( Sturn _2 )
# 268 "parser.ml"
     : (Ast.stmt))

let _menhir_action_11 =
  fun _2 ->
    (
# 40 "parser.mly"
                                ( Sturn (Ebinop (Sub, Econst 0, _2)) )
# 276 "parser.ml"
     : (Ast.stmt))

let _menhir_action_12 =
  fun _2 ->
    (
# 42 "parser.mly"
    (
      match _2 with
      | "red"    -> Scolor Turtle.red
      | "blue"   -> Scolor Turtle.blue
      | "green"  -> Scolor Turtle.green
      | "white" -> Scolor Turtle.white (* 如果Graphics支持yellow的话 *)
      | _        -> Scolor Turtle.black  (* 默认为黑色 *)
    )
# 291 "parser.ml"
     : (Ast.stmt))

let _menhir_action_13 =
  fun _2 _3 _5 ->
    (
# 50 "parser.mly"
                                ( Sif (_2, _3, _5) )
# 299 "parser.ml"
     : (Ast.stmt))

let _menhir_action_14 =
  fun _2 _3 ->
    (
# 51 "parser.mly"
                                ( Sif (_2, _3, Sblock []) )
# 307 "parser.ml"
     : (Ast.stmt))

let _menhir_action_15 =
  fun _2 _3 ->
    (
# 52 "parser.mly"
                                ( Srepeat (_2, _3) )
# 315 "parser.ml"
     : (Ast.stmt))

let _menhir_action_16 =
  fun _2 ->
    (
# 53 "parser.mly"
                                ( Sblock _2 )
# 323 "parser.ml"
     : (Ast.stmt))

let _menhir_action_17 =
  fun _1 _2 ->
    (
# 32 "parser.mly"
                       ( _1 :: _2 )
# 331 "parser.ml"
     : (Ast.stmt list))

let _menhir_action_18 =
  fun () ->
    (
# 33 "parser.mly"
                       ( [] )
# 339 "parser.ml"
     : (Ast.stmt list))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | COLOR ->
        "COLOR"
    | COLOR_NAME _ ->
        "COLOR_NAME"
    | DIVIDE ->
        "DIVIDE"
    | ELSE ->
        "ELSE"
    | EOF ->
        "EOF"
    | FORWARD ->
        "FORWARD"
    | IF ->
        "IF"
    | INT _ ->
        "INT"
    | LBRACE ->
        "LBRACE"
    | MINUS ->
        "MINUS"
    | PENDOWN ->
        "PENDOWN"
    | PENUP ->
        "PENUP"
    | PLUS ->
        "PLUS"
    | RBRACE ->
        "RBRACE"
    | REPEAT ->
        "REPEAT"
    | SEMI ->
        "SEMI"
    | TIMES ->
        "TIMES"
    | TURNLEFT ->
        "TURNLEFT"
    | TURNRIGHT ->
        "TURNRIGHT"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_39 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let _1 = _v in
          let _v = _menhir_action_06 _1 in
          MenhirBox_prog _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TURNRIGHT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState01 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState25 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState23 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState11 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState07 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState04 ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState01 ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_26 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_FORWARD as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_FORWARD (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_07 _2 in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | DIVIDE ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TIMES (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState04 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_stmt : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState17 ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState36 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState32 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState24 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_38 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_REPEAT, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_REPEAT (_menhir_stack, _menhir_s) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_15 _2 _3 in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_36 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TURNRIGHT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | TURNLEFT ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | REPEAT ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | PENUP ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | PENDOWN ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | LBRACE ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | IF ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | FORWARD ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | COLOR ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | EOF | RBRACE ->
          let _v_0 = _menhir_action_18 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TURNLEFT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState13 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_REPEAT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState16 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_08 () in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_09 () in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LBRACE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TURNRIGHT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | TURNLEFT ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | REPEAT ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | PENUP ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | PENDOWN ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | LBRACE ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | IF ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | FORWARD ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | COLOR ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | RBRACE ->
          let _v = _menhir_action_18 () in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_23 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState23 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FORWARD (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState25 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_28 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLOR_NAME _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SEMI ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _2 = _v in
              let _v = _menhir_action_12 _2 in
              _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_34 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LBRACE -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LBRACE (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_16 _2 in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_37 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_stmt -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_stmt (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_17 _1 _2 in
      _menhir_goto_stmts _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_stmts : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_39 _menhir_stack _v _tok
      | MenhirState36 ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState22 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_33 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_stmt -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_stmt (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_expr (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let _5 = _v in
      let _v = _menhir_action_13 _2 _3 _5 in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_31 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState32 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TURNRIGHT ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TURNLEFT ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REPEAT ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PENUP ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | PENDOWN ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACE ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FORWARD ->
              _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | COLOR ->
              _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | COLOR | EOF | FORWARD | IF | LBRACE | PENDOWN | PENUP | RBRACE | REPEAT | TURNLEFT | TURNRIGHT ->
          let MenhirCell1_expr (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_14 _2 _3 in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PLUS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState07 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState11 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DIVIDE (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState09 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TURNRIGHT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | TURNLEFT ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | TIMES ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | REPEAT ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | PLUS ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | PENUP ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | PENDOWN ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | MINUS ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | LBRACE ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | IF ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | FORWARD ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | DIVIDE ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | COLOR ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_REPEAT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TURNRIGHT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | TURNLEFT ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | TIMES ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | REPEAT ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | PLUS ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | PENUP ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | PENDOWN ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | MINUS ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | LBRACE ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | IF ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | FORWARD ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | DIVIDE ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | COLOR ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_TURNLEFT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_TURNLEFT (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_10 _2 in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | DIVIDE ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | _ ->
          _eRR ()
  
  and _menhir_run_12 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_MINUS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
      | DIVIDE ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
      | COLOR | FORWARD | IF | LBRACE | MINUS | PENDOWN | PENUP | PLUS | REPEAT | SEMI | TURNLEFT | TURNRIGHT ->
          let MenhirCell1_MINUS (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_03 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_DIVIDE -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_DIVIDE (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_05 _1 _3 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_08 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_PLUS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | DIVIDE ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | COLOR | FORWARD | IF | LBRACE | MINUS | PENDOWN | PENUP | PLUS | REPEAT | SEMI | TURNLEFT | TURNRIGHT ->
          let MenhirCell1_PLUS (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_02 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_TIMES -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_TIMES (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_04 _1 _3 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_03 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_TURNRIGHT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_TURNRIGHT (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_11 _2 in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | DIVIDE ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | _ ->
          _eRR ()
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TURNRIGHT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | TURNLEFT ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | REPEAT ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | PENUP ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | PENDOWN ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LBRACE ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IF ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | FORWARD ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | COLOR ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | EOF ->
          let _v = _menhir_action_18 () in
          _menhir_run_39 _menhir_stack _v _tok
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
