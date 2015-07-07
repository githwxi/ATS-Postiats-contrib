(*
** Atscc2erl:
** Basis for session-types
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
//
abstype chsnd (a:vt@ype)
abstype chrcv (a:vt@ype)
//
(* ****** ****** *)

abstype chnil
abstype chcons (a:type, ss:type)

(* ****** ****** *)
//
stadef nil = chnil
//
stadef :: = chcons
stadef cons = chcons
//
(* ****** ****** *)

absvtype chanpos (type) = ptr
absvtype channeg (type) = ptr

(* ****** ****** *)
//
fun
chanpos_send
  {a:vt0p}{ss:type}
(
  chp: !chanpos(chsnd(a)::ss) >> chanpos(ss), x: a
) : void = "mac#%" // end-of-function
//
fun
channeg_recv
  {a:vt0p}{ss:type}
(
  chn: !channeg(chrcv(a)::ss) >> channeg(ss), x: a
) : void = "mac#%" // end-of-function
//
(* ****** ****** *)
//
fun
chanpos_recv
  {a:vt0p}{ss:type}
  (!chanpos(chrcv(a)::ss) >> chanpos(ss)): a = "mac#%"
//
fun
channeg_send
  {a:vt0p}{ss:type}
  (!channeg(chsnd(a)::ss) >> channeg(ss)): a = "mac#%"
//
(* ****** ****** *)
//
fun chanpos_nil_wait (chp: chanpos(nil)): void = "mac#%"
fun channeg_nil_close (chn: channeg(nil)): void = "mac#%"
//
(* ****** ****** *)
//
fun
chanposneg_link
  {ss:type}(chp: chanpos(ss), chn: channeg(ss)): void = "mac#%"
//
(* ****** ****** *)
//
fun
channeg_create{ss:type}
  (fserv: chanpos(ss) -<lincloptr1> void): channeg(ss) = "mac#%"
//
(* ****** ****** *)

(* end of [basis.sats] *)
