(*
** co-Session-List (Dyadic)
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
| sslist_nil of (chnil)
| sslist_cons of (chsnd(a)::ssconj(sslist(a)))
*)
//
abstype sslist(a:vt@ype)
//
(* ****** ****** *)
//
datatype
chanpos_sslist
  (a:vt@ype, type) =
| chanpos_sslist_nil(a, chnil) of ()
| chanpos_sslist_cons(a, chsnd(a)::ssconj(sslist(a))) of ()
//
(* ****** ****** *)
//
fun
chanpos_sslist{a:vt0p}
(
  !chanpos(ssconj(sslist(a))) >> chanpos(ss)
) : #[ss:type] chanpos_sslist(a, ss) = "mac#%"
//
(* ****** ****** *)
//
fun
channeg_sslist_nil
  {a:vt0p}
(
  !channeg(ssconj(sslist(a))) >> channeg(chnil)
) : void = "mac#%" // end-of-function
fun
channeg_sslist_cons
  {a:vt0p}
(
  !channeg(ssconj(sslist(a))) >> channeg(chsnd(a)::ssconj(sslist(a)))
) : void = "mac#%" // end-of-function
//
(* ****** ****** *)

fun
channeg_sslist_nil_close{a:vt0p}(channeg(ssconj(sslist(a)))): void

(* ****** ****** *)

(* end of [co-sslist.sats] *)
