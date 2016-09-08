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
ATS_STATIC_PREFIX "_ats2pypre_list_"
//
(* ****** ****** *)

%{^
######
from ats2pypre_basics_cats import *
######
from ats2pypre_integer_cats import *
from ats2pypre_bool_cats import *
######
%} // end of [%{^]

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

staload "./../basics_py.sats"

(* ****** ****** *)
//
staload "./../SATS/integer.sats"
//
(* ****** ****** *)
//
staload "./../SATS/print.sats"
staload "./../SATS/filebas.sats"
//
(* ****** ****** *)

staload "./../SATS/list.sats"
staload "./../SATS/PYlist.sats"

(* ****** ****** *)
//
#include "{$LIBATSCC}/DATS/list.dats"
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
print_list(xs) = fprint_list<a> (stdout, xs)
implement
{a}(*tmp*)
print_list_sep
  (xs, sep) = fprint_list_sep<a> (stdout, xs, sep)
//
(* ****** ****** *)

implement
list_sort_2
  {a}{n}(xs, cmp) = let
//
val xs =
  PYlist_oflist{a}(xs)
val () =
  PYlist_sort_2(xs, cmp)
//
val asz = PYlist_length(xs)
//
fun
loop (
  i0: int, res: List0(a)
) : List0(a) =
(
//
if
(i0 < asz)
then (
  loop(i0+1, list_cons(xs.pop(), res))
) else res
// end of [if]
//
) (* end of [loop] *)
//
in
  $UN.cast{list(a,n)}(loop(0, list_nil(*void*)))
end // end of [list_sort_2]

(* ****** ****** *)

(* end of [list.dats] *)
