(* ****** ****** *)
//
// ATS-emitparse
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)

staload "./emitparse.sats"

(* ****** ****** *)

dynload "./emitparse.sats"

(* ****** ****** *)

dynload "./emitparse_print.dats"
dynload "./emitparse_fname.dats"
dynload "./emitparse_posloc.dats"
dynload "./emitparse_global.dats"
dynload "./emitparse_lexing.dats"

(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val () =
println! ("Hello from ATS-emitparse!")
//
val () = fprintln! (stdout_ref, location_dummy)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [emitparse_main.dats] *)
