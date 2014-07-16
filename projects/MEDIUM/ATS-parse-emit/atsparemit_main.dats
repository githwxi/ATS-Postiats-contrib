(* ****** ****** *)
//
// ATS-parsemit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)

staload "./atsparemit.sats"

(* ****** ****** *)

dynload "./atsparemit.sats"

(* ****** ****** *)

dynload "./atsparemit_mylib.dats"

(* ****** ****** *)

dynload "./atsparemit_print.dats"
dynload "./atsparemit_fname.dats"
dynload "./atsparemit_posloc.dats"
dynload "./atsparemit_global.dats"
dynload "./atsparemit_lexbuf.dats"
dynload "./atsparemit_lexing.dats"

(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val () =
println! ("Hello from ATS-atsparemit!")
//
val () = fprintln! (stdout_ref, location_dummy)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [atsparemit_main.dats] *)
