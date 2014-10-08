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
datatype
list (a:t@ype, stmsq, int) =
  | list_nil (a, nil, 0)
  | {xs:stmsq}{x:stamp}{n:nat}
    list_cons (a, cons (x, xs), n+1) of (T(a, x), list (a, xs, n))
//
(* ****** ****** *)

(**
  Two convenience functions to work with lists obtained from
  the standard prelude. This allows us to refine lists for 
  "critical" functionality where extra automated reasoning is 
  desired, but also provide flexibility for the user.
*)
castfn 
list_stampseq_of_list {a:t@ype}{n:int} (
  xs: list (a, n)
): [xs:stampseq] list (a, xs, n)

castfn 
list_of_list_stampseq {a:t@ype}{xs:stampseq}{n:int} (
  xs: list (a, xs, n)
): list (a, n)

(* ****** ****** *)

fun {a:t@ype} list_nth
  {xs:stmsq}{n:int}{i:nat | i < n}
  (xs: list (a, xs, n), i: int (i)): T (a, select(xs, i))
// end of [list_nth]

(* ****** ****** *)

fun {a:t@ype} list_append
  {xs,ys:stmsq}{m,n:nat}
  (list (a, xs, m), list (a, ys, n)) : list (a, append(xs, m, ys, n), m+n)
  
(* ****** ****** *)

fun {a:t@ype} list_revapp
  {xs,ys:stmsq}{m,n:nat}
  (list (a, xs, m), list (a, ys, n)) : list (a, revapp(xs, m, ys, n), m+n)
  
(* ****** ****** *)

(* end of [list.sats] *)
