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

fun emit_ENDL : FILEref -> void
fun emit_SPACE : FILEref -> void
fun emit_SHARP : FILEref -> void

(* ****** ****** *)

fun emit_LPAREN : FILEref -> void
fun emit_RPAREN : FILEref -> void

(* ****** ****** *)

fun emit_LBRACKET : FILEref -> void
fun emit_RBRACKET : FILEref -> void

(* ****** ****** *)

fun emit_flush : FILEref -> void
fun emit_newline : FILEref -> void

(* ****** ****** *)

fun emit_int : emit_type (int)

(* ****** ****** *)

fun emit_text : emit_type (string)

(* ****** ****** *)

fun emit_symbol : emit_type (symbol)

(* ****** ****** *)
//
fun emit_PMVint : emit_type (i0nt)
fun emit_PMVi0nt : emit_type (i0nt)
//
fun emit_PMVbool : emit_type (bool)
//
fun emit_PMVstring : emit_type (s0tring)
//
fun emit_PMVf0loat : emit_type (i0nt)
//
(* ****** ****** *)

fun emit_i0de : emit_type (i0de)
fun emit_label : emit_type (label)

(* ****** ****** *)

fun emit_d0exp : emit_type (d0exp)
fun emit_d0explst : emit_type (d0explst)
fun emit_d0explst_1 : emit_type (d0explst)

(* ****** ****** *)

fun emit_SELcon : emit_type (d0exp)
fun emit_SELboxrec : emit_type (d0exp)

(* ****** ****** *)

fun emit_d0ecl : emit_type (d0ecl)

(* ****** ****** *)

fun emit_instr : emit_type (instr)

(* ****** ****** *)

fun emit_tmpdec : emit_type (tmpdec)

(* ****** ****** *)

fun emit_f0decl : emit_type (f0decl)

(* ****** ****** *)

fun emit_toplevel : emit_type (d0eclist)

(* ****** ****** *)

(* end of [atsparemit_emit.dats] *)
