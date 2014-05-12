(*
** Some basic tests for
** the API of Z3 Library in ATS
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./../SATS/z3.sats"

(* ****** ****** *)

val () =
{
//
val cfg = Z3_mk_config ()
val ctx = Z3_mk_context_rc (cfg)
val ((*unref*)) = Z3_del_config (cfg)
val ((*unref*)) = Z3_del_context (ctx)
//
} (* end of [val] *)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [test00.dats] *)
