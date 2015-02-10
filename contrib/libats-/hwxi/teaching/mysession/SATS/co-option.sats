(*
** Session Co-Option
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
chanpos_opt (a:vt@ype) =
| chanpos_opt_none of (chanpos(nil))
| chanpos_opt_some of (chanpos(chsnd(a)::nil))
//
(* ****** ****** *)
//
fun{}
chanpos_opt
  {a:vt@ype}(chanpos(ssopt(a))): chanpos_opt(a)
//
(* ****** ****** *)
//
fun{}
channeg_opt_none
  {a:vt@ype}
  (!channeg(ssopt(a)) >> channeg(nil)): void
fun{}
channeg_opt_some
  {a:vt@ype}
  (!channeg(ssopt(a)) >> channeg(chsnd(a)::nil)): void
//
(* ****** ****** *)

(* end of [co-option.sats] *)
