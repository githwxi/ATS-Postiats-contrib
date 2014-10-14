(* ****** ****** *)
//
// HX-2014-01-25:
// stampseq-indexed lists
//
(* ****** ****** *)

staload "contrib/libats-/wdblair/patsolve/SATS/stampseq.sats"

(* ****** ****** *)
//
abst@ype T(a:t@ype, x:stamp) = a
//
(* ****** ****** *)
//
fun {a:t@ype} lt_T_T
  {x1,x2:stamp} (T(a, x1), T(a, x2)): bool (x1 < x2)
fun {a:t@ype} lte_T_T
  {x1,x2:stamp} (T(a, x1), T(a, x2)): bool (x1 <= x2)
fun {a:t@ype} gt_T_T
  {x1,x2:stamp} (T(a, x1), T(a, x2)): bool (x1 > x2)
fun {a:t@ype} gte_T_T
  {x1,x2:stamp} (T(a, x1), T(a, x2)): bool (x1 >= x2)
fun {a:t@ype} compare_T_T
  {x1,x2:stamp} (T(a, x1), T(a, x2)): int (sgn(x1-x2))
//
overload < with lt_T_T
overload <= with lte_T_T
overload > with gt_T_T
overload >= with gte_T_T
//
overload compare with compare_T_T
//
(* ****** ****** *)
//
datavtype
list_vt (a:t@ype, stmsq, int) =
  | list_vt_nil (a, nil, 0)
  | {xs:stmsq}{x:stamp}{n:nat}
    list_vt_cons (a, cons (x, xs), n+1) of (T(a, x), list_vt (a, xs, n))
//
(* ****** ****** *)

fun {a:t@ype} list_vt_nth
  {xs:stmsq}{n:int}{i:nat | i < n}
  (xs: !list_vt (a, xs, n), i: int (i)): T (a, select(xs, i))
// end of [list_vt_nth]

(* ****** ****** *)

fun {a:t@ype} list_vt_append
  {xs,ys:stmsq}{m,n:nat}
  (list_vt (a, xs, m), list_vt (a, ys, n)) : list_vt (a, append(xs, m, ys, n), m+n)

(* ****** ****** *)

(* end of [list_vt.sats] *)
