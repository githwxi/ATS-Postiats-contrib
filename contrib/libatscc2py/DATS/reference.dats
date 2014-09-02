(*
** For writing ATS code
** that translates into Python
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2pypre_"
//
(* ****** ****** *)
//
staload UN =
  "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

staload "./../basics_py.sats"

(* ****** ****** *)
//
staload "./../SATS/PYlist.sats"
//
(* ****** ****** *)
//
staload "./../SATS/reference.sats"
//
(* ****** ****** *)
//
(*
assume
ref_vt0ype_type(a:t@ype) = PYlist(a)
*)
//
(* ****** ****** *)
//
implement
ref (x) = ref_make_elt (x)
//
implement
ref_make_elt{a}(x) = $UN.cast{ref(a)}(PYlist_sing(x))
//
(* ****** ****** *)

implement
ref_get_elt{a}(r) = let
  val r = $UN.cast{PYlist(a)}(r) in PYlist_get_at(r, 0)
end // end of [ref_get_elt]

(* ****** ****** *)

implement
ref_set_elt{a}(r, x) = let
  val r = $UN.cast{PYlist(a)}(r) in PYlist_set_at(r, 0, x)
end // end of [ref_set_elt]

(* ****** ****** *)

%{^
######
from prelude_basics_cats import *
#
from prelude_PYlist_cats import *
#
######
%} // end of [%{^]

(* ****** ****** *)

(* end of [reference.dats] *)
