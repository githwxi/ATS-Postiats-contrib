(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_parsing.sats"

(* ****** ****** *)
//
dynload "./atsparemit.sats"
dynload "./atsparemit_parsing.sats"
//
(* ****** ****** *)
//
dynload "./atsparemit_mylib.dats"
//
(* ****** ****** *)
//
dynload "./atsparemit_print.dats"
//
dynload "./atsparemit_symbol.dats"
//
dynload "./atsparemit_fname.dats"
dynload "./atsparemit_posloc.dats"
//
dynload "./atsparemit_global.dats"
//
dynload "./atsparemit_lexerr.dats"
dynload "./atsparemit_lexbuf.dats"
dynload "./atsparemit_lexing.dats"
//
dynload "./atsparemit_tokbuf.dats"
//
dynload "./atsparemit_parerr.dats"
dynload "./atsparemit_parsing.dats"
//
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
val () =
  the_filename_push (filename_stdin)
//
val () = parse_from_fileref (stdin_ref)
//
val _(*fil*) = the_filename_pop ((*void*))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [atsparemit_main.dats] *)
