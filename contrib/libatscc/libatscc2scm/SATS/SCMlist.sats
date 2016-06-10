(*
** For writing ATS code
** that translates into Scheme
*)

(* ****** ****** *)
//
// HX-2016-06:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2scmpre_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)

staload "./../basics_scm.sats"

(* ****** ****** *)
//
fun
SCMlist_nil
  {a:vt0p} (): SCMlist(a) = "mac#"
//
fun
SCMlist_sing
  {a:vt0p} (x: a): SCMlist(a) = "mac#"
//
fun
SCMlist_pair
  {a:vt0p} (x1: a, x2: a): SCMlist(a) = "mac#"
//
(* ****** ****** *)
//
fun
SCMlist_cons
  {a:vt0p} (x0: a, xs: SCMlist(a)): void = "mac#"
//
(* ****** ****** *)
//
fun
SCMlist_make_elt
  {a:t0p}{n:nat}(n: int(n), x0: a): SCMlist(a) = "mac#"
//
(* ****** ****** *)
//
fun
SCMlist_is_nil
  {a:vt0p} (xs: SCMlist(a)): bool = "mac#"
//
fun
SCMlist_is_cons
  {a:vt0p} (xs: SCMlist(a)): bool = "mac#"
//
fun
SCMlist_isnot_nil
  {a:vt0p} (xs: SCMlist(a)): bool = "mac#"
//
(* ****** ****** *)
//
fun
SCMlist_length{a:vt0p}(SCMlist(a)): int = "mac#"
//
(* ****** ****** *)
//
fun
SCMlist_get_at
  {a:t0p}(xs: SCMlist(a), i: int): a = "mac#"
fun
SCMlist_set_at
  {a:t0p}(xs: SCMlist(a), i: int, x0: a): void = "mac#"
//
fun
SCMlist_exch_at
  {a:vt0p}(xs: SCMlist(a), i: int, x0: a): (a) = "mac#"
//
(* ****** ****** *)

(* end of [SCMlist.sats] *)
