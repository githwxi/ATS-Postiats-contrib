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
//
absvtype chanpos() = ptr
absvtype channeg() = ptr
//
(* ****** ****** *)
//
extern
fun
chanpos0_send
  {a:vt0p}(chpos: !chanpos(), x: a): void = "mac#%"
and
channeg0_recv
  {a:vt0p}(chneg: !channeg(), x: a): void = "mac#%"
//
(* ****** ****** *)
//
extern
fun
chanpos0_recv{a:vt0p}(chpos: !chanpos()): (a) = "mac#%"
and
channeg0_send{a:vt0p}(chneg: !channeg()): (a) = "mac#%"
//
(* ****** ****** *)

(* end of [basis_chan0.dats] *)
