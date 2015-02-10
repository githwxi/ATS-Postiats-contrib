(* ****** ****** *)
//
// HX-2014-11-15:
// adapted from ATSPRE
//
(* ****** ****** *)

extern
fun{a:vt0p}
list_vt_mergesort$cmp
(
  x1: &a, x2: &a, n1: intGte(0), n2: intGte(0)
) :<> int // end of [list_vt_mergesort$cmp]

(* ****** ****** *)
  
fun
{a:vt0p}
list_vt_merge
  {n1,n2:nat} .<n1+n2>.
(
  xs1: list_vt (a, n1), n1: int(n1)
, xs2: list_vt (a, n2), n2: int(n2)
, res: &List_vt a? >> list_vt (a, n1+n2)
) :<!wrt> void = let
in
//
case+ xs1 of
| @list_vt_cons
    (x1, xs11) => (
    case+ xs2 of
    | @list_vt_cons
        (x2, xs21) => let
        val sgn =
          list_vt_mergesort$cmp<a> (x1, x2, n1, n2)
        // end of [val]
      in
        if sgn <= 0 then let
          prval () = fold@{a}(xs2)
          val () = list_vt_merge (xs11, n1-1, xs2, n2, xs11)
          prval () = fold@{a}(xs1)
        in
          res := xs1
        end else let
          prval () = fold@{a}(xs1)
          val () = list_vt_merge (xs1, n1, xs21, n2-1, xs21)
          prval () = fold@{a}(xs2)
        in
          res := xs2
        end // end of [if]
      end // end of [list_vt_cons]
    | ~list_vt_nil () => (fold@ (xs1); res := xs1)
  ) // end of [list_vt_cons]
| ~list_vt_nil () => (res := xs2)
//
end // end of [list_vt_merge]
  
(* ****** ****** *)

fun
{a:vt0p}
list_vt_split
{n,n1:int |
 n >= n1; n1 >= 0} .<n1>.
(
  xs: &list_vt (a, n) >> list_vt (a, n1)
, n1: int n1, res: &List_vt a? >> list_vt (a, n-n1)
) :<!wrt> void = let
in
//
if n1 > 0 then let
  val+@list_vt_cons (_, xs1) = xs
  val () = list_vt_split (xs1, n1-1, res)
in
  fold@ (xs)
end else let
  val () = res := xs
  val () = xs := list_vt_nil ()
in
  // nothing
end // end of [if]
//
end // end of [list_vt_split]

(* ****** ****** *)

fun
{a:vt0p}
list_vt_msort
{n:nat} .<n>.
(
  xs: list_vt(a, n), n: int(n)
) :<!wrt> list_vt(a, n) =
(
if
n >= 2
then let
  val n1 = half(n+1)
  val+@list_vt_cons (_, xs1) = xs
  var res: List_vt a? // uninitialized
  val () = list_vt_split<a> (xs1, n1-1, res)
  prval () = fold@ (xs)
  val xs1 = list_vt_msort<a> (xs, n1)
  and xs2 = list_vt_msort<a> (res, n-n1)
  val () = list_vt_merge<a> (xs1, n1, xs2, n-n1, res)
in
  res
end // end of [then]
else (xs) // end of [else]
//
) (* end of [list_vt_msort] *)

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_mergesort
  {n} (xs) = let
//
val n = list_vt_length<a> (xs)
prval () = lemma_list_vt_param (xs)
//
in
  list_vt_msort (xs, n)
end // end of [list_vt_mergesort]

(* ****** ****** *)

(* end of [list_vt_mergesort.dats] *)
