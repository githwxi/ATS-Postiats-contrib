(*
** For writing ATS code
** that translates into Python3
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2016-11:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2pypre_"
#define
ATS_STATIC_PREFIX "_ats2pypre_string_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./../basics_py.sats"
//
(* ****** ****** *)
//
staload "./../SATS/integer.sats"
//
(* ****** ****** *)

staload "./../SATS/string.sats"
staload "./../SATS/PYlist.sats"

(* ****** ****** *)
//
%{^
######
from ats2pypre_basics_cats import *
######
from ats2pypre_integer_cats import *
######
from ats2pypre_bool_cats import *
######
from ats2pypre_string_cats import *
######
%} // end of [%{^]
//
(* ****** ****** *)

implement
string_fset_at
  {n}{i}
(
  str0, i0, c0
) = let
//
val n0 = string_length(str0)
val f0 = string_substring_beg_end(str0, 0, i0)
val r0 = string_substring_beg_end(str0, i0+1, n0)
//
in
  $UN.cast{string(n)}(string_append_3(f0, c0, r0))
end // end of [string_fset_at]

(* ****** ****** *)

(* end of [string.dats] *)
