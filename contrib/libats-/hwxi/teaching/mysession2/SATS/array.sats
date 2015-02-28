(*
** Session List
*)

(* ****** ****** *)

staload "./basis.sats"

(* ****** ****** *)
//
abstype
ssarrsz(a:vt@ype)
abstype
ssarray(a:vt@ype, n:int)
//
(* ****** ****** *)
//
fun{}
chanpos_arrsz
  {a:vt@ype}{n:nat}
  (!chanpos(ssarrsz(a)) >> chanpos(ssarray(a, n)), int(n)): void
//
fun{}
channeg_arrsz
  {a:vt@ype}
  (!channeg(ssarrsz(a)) >> channeg(ssarray(a, n))): #[n:nat] int(n)
//
(* ****** ****** *)
//
prfun
chanpos_array_nil
  {a:vt@ype}
  (!chanpos(ssarray(a, 0)) >> chanpos(nil)): void
prfun
chanpos_array_cons
  {a:vt@ype}{n:pos}
  (!chanpos(ssarray(a, n)) >> chanpos(chsnd(a)::ssarray(a,n-1))): void
//
(* ****** ****** *)
//
prfun
channeg_array_nil
  {a:vt@ype}
  (!channeg(ssarray(a, 0)) >> channeg(nil)): void
prfun
channeg_array_cons
  {a:vt@ype}{n:pos}
  (!channeg(ssarray(a, n)) >> channeg(chrcv(a)::ssarray(a,n-1))): void
//
(* ****** ****** *)

(* end of [array.sats] *)
