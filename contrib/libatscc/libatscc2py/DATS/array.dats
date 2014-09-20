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
#define
ATS_STATIC_PREFIX "_ats2pypre_array_"
//
(* ****** ****** *)
//
staload UN =
  "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./../basics_py.sats"
staload "./../SATS/PYlist.sats"
staload "./../SATS/array.sats"
//
(* ****** ****** *)
//
(*
assume array(a, n) = PYlist(a)
*)
//
(* ****** ****** *)
//
implement
array_make_elt
  {a}{n}(asz, x0) =
  $UN.cast{array(a,n)}(PYlist_make_elt (asz, x0))
//
(* ****** ****** *)

implement
array_get_at{a}(A, i) = let
  val A = $UN.cast{PYlist(a)}(A) in PYlist_get_at(A, i)
end // end of [array_get_at]

(* ****** ****** *)

implement
array_set_at{a}(A, i, x) = let
  val A = $UN.cast{PYlist(a)}(A) in PYlist_set_at(A, i, x)
end // end of [array_set_at]

(* ****** ****** *)

%{^
######
#
from ats2pypre_basics_cats import *
#
from ats2pypre_PYlist_cats import *
#
######
%} // end of [%{^]

(* ****** ****** *)

(* end of [array.dats] *)
