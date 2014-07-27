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
synent_decode2{a}
  (x) = let
  val res = synent_decode{a}(x)
  prval ((*void*)) = topize (x) in res
end // end of [synent_decode2]

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
//
implement
i0de_make_sym
  (loc, sym) = '{ i0de_loc= loc, i0de_sym= sym }
//
implement
i0de_make_string
  (loc, name) = let
  val sym = symbol_make (name) in i0de_make_sym (loc, sym)
end // end of [i0de_make_string]
//
(* ****** ****** *)
//
fun
s0exp_make_node
  (loc, node) = '{ s0exp_loc=loc, s0exp_node=node }
//
(* ****** ****** *)
//
implement
s0exp_ide (loc, id) =
  s0exp_make_node (loc, S0Eide (id.i0de_sym))
//
implement
s0exp_list (loc, s0es) = s0exp_make_node (loc, S0Elist (s0es))
//
implement
s0exp_appid (loc, id, s0es) =
  s0exp_make_node (loc, S0Eappid (id.i0de_sym, s0es))
//
(* ****** ****** *)

(* end of [atsparemit_syntax.dats] *)
