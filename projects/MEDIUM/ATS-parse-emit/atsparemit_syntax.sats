(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./atsparemit.sats"

(* ****** ****** *)
//
castfn
synent_encode {a:type} (x: a): synent
castfn
synent_decode {a:type} (x: synent): (a)
//
(* ****** ****** *)
//
fun synent_null {a:type} (): a // = null
//
fun synent_is_null {a:type} (x: a):<> bool
fun synent_isnot_null {a:type} (x: a):<> bool
//
(* ****** ****** *)

fun s0exp_i0de (_: i0de): s0exp

(* ****** ****** *)

(* end of [atsparemit_syntax.sats] *)
