(*
** Channel pairs
*)

(* ****** ****** *)
//
staload
"./../SATS/basis.sats"
staload
"./../SATS/intset.sats"
//
staload "./basis_uchan.dats"
//
(* ****** ****** *)
//
absvtype
channel0_vtype(a:vt@ype, n:int)
//
stadef channel0 = channel0_vtype
//
extern
praxi
lemma_channel0_param
  {a:vt0p}{n:int}(!channel0(a, n)): [n >= 0] void
//
(* ****** ****** *)
//
extern
fun
{a:vt0p}
channel0_make_pair
  {n:nat}
(
  n: int(n), capacity: intGt(0)
) : (channel0(a, n), channel0(a, n))
//
(* ****** ****** *)
//
extern
fun
{a:vt0p}
channel0_free
  {n:int}(chan0: channel0(a, n)): void
//
(* ****** ****** *)
//
extern
fun{a:vt0p}
channel0_send
  {n:int}
(
  !channel0(a, n)
, i: natLt(n), j: natLt(n), x: a
) : void // end-of-function
//
extern
fun{a:vt0p}
channel0_recv
  {n:int}
(
  !channel0(a, n)
, i: natLt(n), j: natLt(n), x: &a? >> a
) : void // end-of-function
extern
fun{a:vt0p}
channel0_recv_val
  {n:int}
(
  !channel0(a, n), i: natLt(n), j: natLt(n)
) : (a) // end of [channel0_recv_val]
//
(* ****** ****** *)
//
datavtype
channel0_
(
  a:vt@ype, n:int
) =
CHANNEL0 of
(
  int(n), intset(n), matrixptr(uchan(a), n, n)
) (* end of [channel0_] *)
//
(* ****** ****** *)
//
assume
channel0_vtype
  (a:vt0p, n:int) = channel0_(a, n)
//
(* ****** ****** *)

implement
{a}(*tmp*)
channel0_free
  (chan0) = let
//
val () =
lemma_channel0_param(chan0)
//
val
~CHANNEL0(n, G, chmat) = chan0
//
implement
(elt:vtype)
matrix_uninitize$clear<elt>
  (i, j, x) = let
//
val x = $UN.castvwtp0{ptr}(x)
//
in
//
if
isneqz(x)
then (
  uchan_unref($UN.castvwtp0{uchan(a)}(x))
) (* end of [if] *)
//
end // end of [matrix_uninitize$clear]
//
val n = i2sz(n)
//
val () = matrixptr_freelin(chmat, n, n)
//
in
  // nothing
end // end of [channel0_free]

(* ****** ****** *)

implement
{a}(*tmp*)
channel0_send
  (chan0, i, j, x0) =
{
//
val+CHANNEL0(n, G, chmat) = chan0
//
val p0 = ptrcast(chmat)
//
val uch =
  $UN.ptr0_get_at<uchan(a)>(p0, i*n+j)
//
val ((*void*)) = uchan_insert<a> (uch, x0)
//
val ((*returned*)) = $UN.cast2void(uch)
//
} (* end of [channel0_send] *)

(* ****** ****** *)

implement
{a}(*tmp*)
channel0_recv
  (chan0, i, j, x0) = let
//
val+CHANNEL0(n, G, chmat) = chan0
//
val p0 = ptrcast(chmat)
//
val p_ij =
  ptr_add<uchan(a)>(p0, i*n+j)
//
val (pf, fpf | p_ij) =
  $UN.ptr_vtake{uchan(a)}(p_ij)
//
val () = (x0 := uchan_remove<a> (!p_ij))
//
prval ((*returned*)) = fpf(pf)
//
in
  // nothing
end // end of [channel0_recv]

(* ****** ****** *)

implement
{a}(*tmp*)
channel0_recv_val
  (chan0, i, j) = x0 where
{
//
var x0: a // uninitized
//
val () = channel0_recv(chan0, i, j, x0)
//
} (* end of [channel0_recv_val] *)

(* ****** ****** *)

(* end of [basic_channel0.dats] *)
