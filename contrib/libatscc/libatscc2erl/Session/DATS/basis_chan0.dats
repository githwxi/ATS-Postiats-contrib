(* ****** ****** *)
//
// HX:
// For internal use:
// Un-session-typed channels
//
(* ****** ****** *)
//
// HX-2015-07:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "libats2erl_session_"
//
(* ****** ****** *)

absvtype chanpos0 = ptr
absvtype channeg0 = ptr

(* ****** ****** *)
//
extern
fun
chanpos0_send
  {a:vt0p}(chpos: !chanpos0, x: a): void = "mac#%"
and
channeg0_recv
  {a:vt0p}(chneg: !channeg0, x: a): void = "mac#%"
//
(* ****** ****** *)
//
extern
fun
chanpos0_recv{a:vt0p}(chpos: !chanpos0): (a) = "mac#%"
and
channeg0_send{a:vt0p}(chneg: !channeg0): (a) = "mac#%"
//
(* ****** ****** *)

(* end of [basis_chan0.dats] *)
