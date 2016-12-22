(*
** Session Co-List
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
chanpos_list(a:vt@ype) =
| chanpos_list_nil of
    (chanpos(nil))
| chanpos_list_cons of
    (chanpos(chsnd(a)::sslist(a)))
//
(* ****** ****** *)
//
fun{}
chanpos_list
  {a:vt@ype}
  (chp: chanpos(sslist(a))): chanpos_list(a)
//
(* ****** ****** *)
//
fun{}
channeg_list_nil
  {a:vt@ype}
  (!channeg(sslist(a)) >> channeg(nil)): void
fun{}
channeg_list_cons
  {a:vt@ype}
  (!channeg(sslist(a)) >> channeg(chsnd(a)::sslist(a))): void
//
(* ****** ****** *)

(* end of [co-list.sats] *)
