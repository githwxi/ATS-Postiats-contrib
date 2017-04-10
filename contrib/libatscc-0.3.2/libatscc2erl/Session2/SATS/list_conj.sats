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
list (a:vt@ype) =
| list_nil of (chnil)
| list_cons of
    (chsnd(a)::ssconj(list(a)))
  // list_cons
*)
//
abstype
list_conj(a:vt@ype) // = ssconj(list(a))
//
(* ****** ****** *)
//
datatype
chanpos_list
  (a:vt@ype, type) =
| chanpos_list_nil(a, chnil) of ()
| chanpos_list_cons(a, chsnd(a)::list_conj(a)) of ()
//
(* ****** ****** *)
//
fun
chanpos_list{a:vt0p}
(
  !chanpos(list_conj(a)) >> chanpos(ss)
) : #[ss:type] chanpos_list(a, ss) = "mac#%"
//
(* ****** ****** *)
//
fun
channeg_list_nil
  {a:vt0p}
(
  !channeg(list_conj(a)) >> channeg(chnil)
) : void = "mac#%" // end-of-function
fun
channeg_list_cons
  {a:vt0p}
(
  !channeg(list_conj(a)) >> channeg(chsnd(a)::list_conj(a))
) : void = "mac#%" // end-of-function
//
(* ****** ****** *)

fun
channeg_list_nil_close{a:vt0p}(channeg(list_conj(a))): void

(* ****** ****** *)

(* end of [list_conj.sats] *)
