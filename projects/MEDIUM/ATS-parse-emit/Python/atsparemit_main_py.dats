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
staload "./atsparemit_emit.sats"

(* ****** ****** *)
//
dynload "./atsparemit.sats"
dynload "./atsparemit_syntax.sats"
dynload "./atsparemit_parsing.sats"
dynload "./atsparemit_emit.sats"
//
(* ****** ****** *)
//
dynload "./atsparemit_mylib.dats"
//
(* ****** ****** *)
//
dynload "./atsparemit_error.dats"
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
dynload "./atsparemit_syntax.dats"
//
dynload "./atsparemit_lexerr.dats"
dynload "./atsparemit_lexbuf.dats"
dynload "./atsparemit_lexing.dats"
//
dynload "./atsparemit_tokbuf.dats"
//
dynload "./atsparemit_parerr.dats"
dynload "./atsparemit_parsing.dats"
dynload "./atsparemit_parsing_d0exp.dats"
dynload "./atsparemit_parsing_d0ecl.dats"
dynload "./atsparemit_parsing_instr.dats"
//
(* ****** ****** *)

dynload "./atsparemit_topenv.dats"

(* ****** ****** *)

dynload "./atsparemit_emit_py.dats"
dynload "./atsparemit_emit2_py.dats"

(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val d0cs = parse_from_fileref (stdin_ref)
(*
val () = fprint! (stdout_ref, "d0cs =\n", d0cs)
*)
//
val () =
prerrln!
(
  "Hello from ATS-parse-emit-python!"
) (* end of [val] *)
//
val () = emit_toplevel (stdout_ref, d0cs)
//
val () =
prerrln!
(
  "Good-bye from ATS-parse-emit-python!"
) (* end of [val] *)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [atsparemit_main_py.dats] *)
