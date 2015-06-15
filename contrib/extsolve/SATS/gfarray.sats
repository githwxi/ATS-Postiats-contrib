(* ****** ****** *)
//
// HX-2015-06:
// [gflist]:
// fully indexed generic lists
//
(* ****** ****** *)

staload "./ilist.sats"

(* ****** ****** *)

dataview
gfarray_v
(
  a:vt@ype+, addr, ilist
) =
  | {l:addr}
    gfarray_v_nil (a, l, ilist_nil) of ()
  | {x:int}{xs:ilist}{l:addr}
    gfarray_v_cons (a, l, ilist_cons (x, xs)) of
      (stamped_vt (a, x) @ l, gfarray_v (a, l+sizeof(a), xs))
    // end of [gfarray_v_cons]
// end of [gfarray_v]

(* ****** ****** *)
//
fun
{a:t@ype}
gfarray_get_at
{l:addr}
{xs:ilist}
{i:nat | i < length(xs)}
  (pf: !gfarray_v(a, l, xs) | p: ptr(l), i: size_t(i)): stamped_t(a, get_at(xs, i))
//
fun
{a:t@ype}
gfarray_set_at
{l:addr}
{xs:ilist}{x0:elt}
{i:nat | i < length(xs)}
(
  pf: !gfarray_v(a, l, xs) >> gfarray_v(a, l, set_at(xs, i, x0)) | p: ptr(l), i: size_t(i), x0: stamped_t(a, x0)
) : void // end of [gfarray_set_at]
//
(* ****** ****** *)

(* end of [gfarray.sats] *)
