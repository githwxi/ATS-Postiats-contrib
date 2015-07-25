(* ****** ****** *)
//
// HX-2015-06:
// [gflist]:
// fully indexed generic lists
//
(* ****** ****** *)

staload "./ilist.sats"

(* ****** ****** *)

datatype
gflist (
  a:t@ype+, ilist(*ind*)
) =
  | gflist_nil
      (a, ilist_nil) of ()
    // end of [gflist_nil]
  | {x:int}
    {xs:ilist}
    gflist_cons
      (a, ilist_cons (x, xs)) of (stamped_t (a, x), gflist (a, xs))
    // end of [gflist_cons]
// end of [gflist]

(* ****** ****** *)
//
fun
{a:t@ype}
gflist_head
  {xs:ilist1}
  (gflist(a, xs)): stamped_t(a, head(xs))
//
fun
{a:t@ype}
gflist_tail
  {xs:ilist1}
  (xs: gflist(a, xs)): gflist(a, tail(xs))
//
(* ****** ****** *)

fun
{a:t@ype}
gflist_length
  {xs:ilist}(xs: gflist(a, xs)): int(length(xs))

(* ****** ****** *)
//
fun
{a:t@ype}
gflist_get_at
{xs:ilist}
{i:nat | i < length(xs)}
  (xs: gflist(a, xs), int(i)): stamped_t(a, get_at(xs, i))
//
(* ****** ****** *)

(* end of [gflist.sats] *)
