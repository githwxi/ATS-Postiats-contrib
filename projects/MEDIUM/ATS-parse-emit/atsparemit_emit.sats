(* ****** ****** *)
//
// ATS-parse-emit-python
//
(* ****** ****** *)
//
// HX-2014-08-04: start
//
(* ****** ****** *)

staload "./atsparemit.sats"

(* ****** ****** *)
//
typedef
emit_type
  (a:t@ype) = (FILEref, a) -> void
//
(* ****** ****** *)

fun emit_LPAREN : FILEref -> void
fun emit_RPAREN : FILEref -> void

(* ****** ****** *)

fun emit_text : emit_type (string)

(* ****** ****** *)

fun emit_symbol : emit_type (symbol)

(* ****** ****** *)

fun emit_i0nt : emit_type (i0nt)
fun emit_f0loat : emit_type (f0loat)
fun emit_s0tring : emit_type (s0tring)

(* ****** ****** *)

fun emit_i0de : emit_type (i0de)

(* ****** ****** *)

fun emit_d0exp : emit_type (d0exp)
fun emit_d0explst : emit_type (d0explst)

(* ****** ****** *)

fun emit_d0ecl : emit_type (d0ecl)

(* ****** ****** *)

fun emit_instr : emit_type (instr)

(* ****** ****** *)

fun emit_fundecl : emit_type (f0decl)

(* ****** ****** *)

(* end of [atsparemit_emit.dats] *)
