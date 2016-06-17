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
print_list (xs) = fprint_list<a> (stdout, xs)
implement
{a}(*tmp*)
print_list_sep
  (xs, sep) = fprint_list_sep<a> (stdout, xs, sep)
//
(* ****** ****** *)

implement
{}(*tmp*)
PYlist_oflist{a}(xs) = let
//
fun
aux
(
  xs: List0(a), res: PYlist(a)
) : PYlist(a) =
  case+ xs of
  | list_nil() => res
  | list_cons(x, xs) =>
      let val () =
        PYlist_append(res, x) in aux(xs, res)
      end // end of [list_cons]
//
in
  aux(xs, PYlist_nil())
end // end of [PYlist_oflist]

implement
{}(*tmp*)
PYlist_oflist_rev{a}(xs) = let
//
fun
aux
(
  xs: List0(a), res: PYlist(a)
) : PYlist(a) =
  case+ xs of
  | list_nil() => res
  | list_cons(x, xs) => let
      val () = PYlist_cons(x, res) in aux(xs, res)
    end // end of [list_cons]
//
in
  aux(xs, PYlist_nil())
end // end of [PYlist_oflist_rev]

(* ****** ****** *)

(* end of [list.dats] *)
