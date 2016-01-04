(* ****** ****** *)
//
// ATS-unjsonize-2
//
(* ****** ****** *)
//
(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
** HX-2015-08-06: start
*)
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./patsunj2_commarg.sats"

(* ****** ****** *)
//
(*
dynload "patsunj2_synent2.dats"
*)
val () =
patsunj2_synent2__dynload() where
{
  extern fun patsunj2_synent2__dynload(): void = "ext#"
}
//
(* ****** ****** *)
//
(*
dynload "patsunj2_parsing.dats"
*)
val () =
patsunj2_parsing__dynload() where
{
  extern fun patsunj2_parsing__dynload(): void = "ext#"
}
//
(* ****** ****** *)
//
(*
dynload "patsunj2_commarg.dats"
*)
val () =
patsunj2_commarg__dynload() where
{
  extern fun patsunj2_commarg__dynload(): void = "ext#"
}
//
(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val () =
println! ("Hello from [patsunj2]!")
//
val arglst =
  patsunj2_cmdline (argc, argv)
//
// HX: skipping argv[0]
//
val-~list_vt_cons(arg, arglst) = arglst
//
val ((*void*)) = patsunj2_commarglst (arglst)
//
} (* end of [main] *)

(* ****** ****** *)

(* end of [patsunj2_main.dats] *)
