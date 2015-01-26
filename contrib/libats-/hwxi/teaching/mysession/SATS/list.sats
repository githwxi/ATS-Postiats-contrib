(*
** Session List
*)

(* ****** ****** *)

staload "./basis.sats"

(* ****** ****** *)
//
(*
datatype
sslist (a:vt@ype) =
| sslist_nil of (nil)
| sslist_cons of (chsnd(a) :: sslist(a))
*)
//
abstype sslist(a:vt@ype)
//
(* ****** ****** *)
//
datavtype
channeg_list (a:vt@ype) =
| channeg_list_nil of (channeg(nil))
| channeg_list_cons of (channeg(chsnd(a) :: sslist(a)))
//
(* ****** ****** *)
//
fun{}
chanpos_list_nil
  {a:vt@ype}
  (!chanpos(sslist(a)) >> chanpos(nil)): void
fun{}
chanpos_list_cons
  {a:vt@ype}
  (!chanpos(sslist(a)) >> chanpos(chsnd(a)::sslist(a))): void
//
(* ****** ****** *)
//
fun{}
channeg_list
  {a:vt@ype}(channeg(sslist(a))): channeg_list(a)
//
(* ****** ****** *)

(* end of [list.sats] *)
