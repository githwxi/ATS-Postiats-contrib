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
sslist (a:vt@ype) =
| sslist_nil of (nil)
| sslist_cons of (chsnd(a)::ssdisj(sslist(a)))
*)
//
abstype sslist(a:vt@ype)
//
(* ****** ****** *)
//
datatype
channeg_sslist
  (a:vt@ype, type) =
| channeg_sslist_nil(a, chnil) of ()
| channeg_sslist_cons(a, chsnd(a)::ssdisj(sslist(a))) of ()
//
(* ****** ****** *)
//
fun
chanpos_sslist_nil
  {a:vt0p}
(
  !chanpos(ssdisj(sslist(a))) >> chanpos(chnil)
) : void = "mac#%" // end of [chanpos_sslist_nil]
fun
chanpos_sslist_cons
  {a:vt0p}
(
  !chanpos(ssdisj(sslist(a))) >> chanpos(chsnd(a)::ssdisj(sslist(a)))
) : void = "mac#%" // end of [chanpos_sslist_cons]
//
(* ****** ****** *)
//
fun
chanpos_sslist_nil_wait{a:vt0p}(chp: chanpos(ssdisj(sslist(a)))): void
//
(* ****** ****** *)
//
fun
channeg_sslist{a:vt0p}
  (!channeg(ssdisj(sslist(a))) >> channeg(ss)): #[ss:type] channeg_sslist(a, ss) = "mac#%"
//
(* ****** ****** *)
//
fun
list2sslist{a:t0p}(xs: List(a)): channeg(ssdisj(sslist(a)))
fun
sslist2list{a:t0p}(chn: channeg(ssdisj(sslist(a)))): List0(a)
//
fun
list2sslist_vt{a:vt0p}(xs: List_vt(a)): channeg(ssdisj(sslist(a)))
fun
sslist2list_vt{a:vt0p}(chn: channeg(ssdisj(sslist(a)))): List0_vt(a)
//
(* ****** ****** *)

(* end of [sslist.sats] *)
