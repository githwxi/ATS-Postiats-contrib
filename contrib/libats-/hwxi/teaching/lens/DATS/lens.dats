(* ****** ****** *)
(*
Inspired by August Alm:
https://github.com/August-Alm/ATS-Experiments/blob/master/lens.dats
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)
//
abstype
lens_type(a: t0ype, b: t0ype)
//
typedef
lens(a: t0ype, b: t0ype) = lens_type(a, b)
//
(* ****** ****** *)
//
extern
fun
{a
,b:t@ype}
lens_get(lens(a, b), a): b
extern
fun
{a
,b:t@ype}
lens_set(lens(a, b), a, b): a
//
overload .get with lens_get
overload .set with lens_set
//
(* ****** ****** *)
//
extern
fun
{a
,b:t@ype}
lens_make_get_set
  (get: cfun(a, b), set: cfun(a, b, a)): lens(a,b)
//
(* ****** ****** *)

local
//
assume
lens_type
(a:t0ype, b:t0ype) =
$tup(cfun(a, b), cfun(a, b, a))
//
in (* in-of-local *)
//
implement
{a,b}
lens_get(lns, x) = lns.0(x)
implement
{a,b}
lens_set(lns, x, y) = lns.1(x, y)
//
implement
{a,b}
lens_make_get_set(get, set) = $tup(get, set)
//
end // end of [local]

(* ****** ****** *)
//
extern
fun
{a
,b:t@ype}
lens_over(lens(a, b), cfun(b, b)): cfun(a, a)
extern
fun
{a
,b:t@ype}
lens_over2(lens(a, b), x: a, f: cfun(b, b)): (a)
//
overload .over with lens_over
overload .over2 with lens_over2
//
(* ****** ****** *)
//
extern
fun
{a
,b
,c:t@ype}
lens_compose(lens(a, b), lens(b, c)): lens(a, c)
//
overload compose with lens_compose
overload .compose with lens_compose
//
(* ****** ****** *)
//
implement
{a,b}(*tmp*)
lens_over(lns, fopr) =
  lam(x) => lns.set(x, fopr(lns.get(x)))
implement
{a,b}(*tmp*)
lens_over2(lns, x, fopr) = lns.set(x, fopr(lns.get(x)))
//
(* ****** ****** *)
//
implement
{a,b,c}
lens_compose
(
  lns1, lns2
) =
lens_make_get_set<a,c>
(
lam(x) => lns2.get(lns1.get(x))
,
lam(x, z) => lns1.set(x, lns2.set(lns1.get(x), z))
)
//
(* ****** ****** *)

(* end of [lens.dats] *)
