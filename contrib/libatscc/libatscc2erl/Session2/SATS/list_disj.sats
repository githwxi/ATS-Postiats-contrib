(*
** Session-List (Dyadic)
*)

(* ****** ****** *)
//
// HX-2015-07:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "libats2erl_session_"
//
(* ****** ****** *)

staload "./basis.sats"

(* ****** ****** *)
//
(*
datatype
list (a:vt@ype) =
| list_nil of (nil)
| list_cons of (chsnd(a)::ssdisj(list(a)))
*)
//
abstype list_disj(a:vt@ype)
//
(* ****** ****** *)
//
datatype
channeg_sslist
  (a:vt@ype, type) =
| channeg_sslist_nil(a, chnil) of ()
| channeg_sslist_cons(a, chsnd(a)::list_disj(a)) of ()
//
(* ****** ****** *)
//
fun
chanpos_sslist_nil
  {a:vt0p}
(
  !chanpos(list_disj(a)) >> chanpos(chnil)
) : void = "mac#%" // end of [chanpos_sslist_nil]
fun
chanpos_sslist_cons
  {a:vt0p}
(
  !chanpos(list_disj(a)) >> chanpos(chsnd(a)::list_disj(a))
) : void = "mac#%" // end of [chanpos_sslist_cons]
//
(* ****** ****** *)
//
fun
chanpos_sslist_nil_wait{a:vt0p}(chp: chanpos(list_disj(a))): void
//
(* ****** ****** *)
//
fun
channeg_sslist{a:vt0p}
  (!channeg(list_disj(a)) >> channeg(ss)): #[ss:type] channeg_sslist(a, ss) = "mac#%"
//
(* ****** ****** *)
//
fun
list2sslist{a:t0p}(xs: List(a)): channeg(list_disj(a))
fun
sslist2list{a:t0p}(chn: channeg(list_disj(a))): List0(a)
//
fun
list2sslist_vt{a:vt0p}(xs: List_vt(a)): channeg(list_disj(a))
fun
sslist2list_vt{a:vt0p}(chn: channeg(list_disj(a))): List0_vt(a)
//
(* ****** ****** *)

(* end of [list_disj.sats] *)
