(*
** For writing ATS code
** that translates into Clojure
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2cljpre_"
#define
ATS_STATIC_PREFIX "_ats2cljpre_list_"
//
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
//
staload "./../basics_clj.sats"
//
(* ****** ****** *)
//
staload "./../SATS/integer.sats"
//
(* ****** ****** *)
//
staload "./../SATS/print.sats"
//
(* ****** ****** *)
//
staload "./../SATS/list.sats"
//
staload "./../SATS/stream_vt.sats"
staload _ = "./../DATS/stream.dats"
//
staload "./../SATS/stream_vt.sats"
staload _ = "./../DATS/stream_vt.dats"
//
(* ****** ****** *)
//
staload "./../SATS/CLJlist.sats"
//
(* ****** ****** *)
//
#define ATSCC_STREAM 1
#define ATSCC_STREAM_VT 1
//
(* ****** ****** *)
//
#include "{$LIBATSCC}/DATS/list.dats"
//
(* ****** ****** *)

implement
CLJlist_oflist_rev{a}(xs) = let
//
fun
aux
(
  xs: List(a), res: CLJlist(a)
) : CLJlist(a) =
  case+ xs of
  | list_nil() => res
  | list_cons(x, xs) => let
      val res = CLJlist_cons(x, res) in aux(xs, res)
    end // end of [list_cons]
//
in
  aux(xs, CLJlist_nil())
end // end of [CLJlist_oflist_rev]

(* ****** ****** *)
//
implement
list_sort_2
  {a}{n}(xs, cmp) = let
//
val xs = CLJlist_oflist_rev{a}(xs)
val ys = CLJlist_sort_2{a}(xs, lam(x1, x2) => ~cmp(x1, x2))
//
in
  $UN.cast{list(a,n)}(CLJlist2list_rev(ys))
end // end of [list_sort_2]
//
(* ****** ****** *)

(* end of [list.dats] *)
