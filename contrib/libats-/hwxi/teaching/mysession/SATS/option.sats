(*
** Session Option
*)

(* ****** ****** *)

staload "./basis.sats"

(* ****** ****** *)
//
(*
datatype
ssopt (a:vt@ype) =
| ssopt_none of (nil)
| ssopt_some of (chsnd(a) :: nil)
*)
//
abstype ssopt(a:vt@ype)
//
(* ****** ****** *)
//
datavtype
channeg_opt (a:vt@ype) =
| channeg_opt_none of (channeg(nil))
| channeg_opt_some of (channeg(chsnd(a) :: nil))
//
(* ****** ****** *)
//
fun{}
chanpos_opt_none
  {a:vt@ype}
  (!chanpos(ssopt(a)) >> chanpos(nil)): void
fun{}
chanpos_opt_some
  {a:vt@ype}
  (!chanpos(ssopt(a)) >> chanpos(chsnd(a)::nil)): void
//
(* ****** ****** *)
//
fun{}
channeg_opt
  {a:vt@ype}(channeg(ssopt(a))): channeg_opt(a)
//
(* ****** ****** *)

(* end of [option.sats] *)
