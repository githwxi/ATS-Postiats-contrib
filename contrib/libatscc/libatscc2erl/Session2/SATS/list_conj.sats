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
abstype list_conj(a:vt@ype)
//
(* ****** ****** *)
//
datatype
chanpos_sslist
  (a:vt@ype, type) =
| chanpos_sslist_nil(a, chnil) of ()
| chanpos_sslist_cons(a, chsnd(a)::list_conj(a)) of ()
//
(* ****** ****** *)
//
fun
chanpos_sslist{a:vt0p}
(
  !chanpos(list_conj(a)) >> chanpos(ss)
) : #[ss:type] chanpos_sslist(a, ss) = "mac#%"
//
(* ****** ****** *)
//
fun
channeg_sslist_nil
  {a:vt0p}
(
  !channeg(list_conj(a)) >> channeg(chnil)
) : void = "mac#%" // end-of-function
fun
channeg_sslist_cons
  {a:vt0p}
(
  !channeg(list_conj(a)) >> channeg(chsnd(a)::list_conj(a))
) : void = "mac#%" // end-of-function
//
(* ****** ****** *)

fun
channeg_sslist_nil_close{a:vt0p}(channeg(list_conj(a))): void

(* ****** ****** *)

(* end of [list_conj.sats] *)
