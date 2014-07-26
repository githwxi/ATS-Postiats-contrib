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

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_syntax.sats"

(* ****** ****** *)

implement
synent_null{a} () = $UN.cast{a}(the_null_ptr)

(* ****** ****** *)
//
implement
synent_is_null (ent) = iseqz ($UN.cast2ptr(ent))
implement
synent_isnot_null (ent) = isneqz ($UN.cast2ptr(ent))
//
(* ****** ****** *)

(* end of [atsparemit_syntax.dats] *)
