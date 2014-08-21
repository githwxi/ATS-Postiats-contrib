(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
STDIO = "{$PATSLIBC}/SATS/stdio.sats"

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

dynload "./atsparemit_emit.dats"
dynload "./atsparemit_typedef.dats"

(* ****** ****** *)

dynload "./atsparemit_emit_py.dats"
dynload "./atsparemit_emit2_py.dats"

(* ****** ****** *)
//
datatype
comarg =
COMARGkey of (int, string)
//
typedef comarglst = List0 (comarg)
//
(* ****** ****** *)

datatype
waitkind =
  | WTKnone of ()
  | WTKinput of ()
  | WTKoutput of () // -o / --output
// end of [waitkind]

(* ****** ****** *)

datatype OUTCHAN =
  | OUTCHANref of (FILEref) | OUTCHANptr of (FILEref)
// end of [OUTCHAN]

fun
outchan_get_fileref
  (x: OUTCHAN): FILEref =
(
//
case+ x of
| OUTCHANref (filr) => filr | OUTCHANptr (filp) => filp
//
) (* end of [outchan_get_fileref] *)

(* ****** ****** *)

typedef
cmdstate = @{
  comarg0= comarg
, waitkind= waitkind
// number of processed input files;
, ninputfile= int // waiting for STDIN if it is 0
, outchan= OUTCHAN // current output channel
, standalone= bool (* output is a stand-alone file *)
, nerror= int // number of accumulated errors
} (* end of [cmdstate] *)

(* ****** ****** *)

fun
cmdstate_set_outchan
(
  state: &cmdstate, chan_new: OUTCHAN
) : void = let
//
val chan_old = state.outchan
val ((*void*)) = state.outchan := chan_new
//
in
  case+ chan_old of
  | OUTCHANref (filr) => ()
  | OUTCHANptr (filp) => let
      val err = $STDIO.fclose0 (filp) in (*nothing*)
    end // end of [OUTCHANptr]
end // end of [cmdstate_set_outchan]

(* ****** ****** *)

fun
process_cmdline
(
  state: &cmdstate, arglst: comarglst
) : void = let
in
//
case+ arglst of
| list_nil () => ()
| list_cons (arg, args) =>
    process_cmdline2 (state, arg, arglst)
//
end // end of [process_cmdline]

and
process_cmdline2
(
  state: &cmdstate, arg: comarg, arglst: comarglst
) : void = let
in
end // end of [process_cmdline2]

(* ****** ****** *)
//
extern
fun
comarg_parse (s: string):<> comarg
//
extern
fun
comarglst_parse{n:nat}
  (argc: int n, argv: !argv(n)):<> list (comarg, n)
// end of [comarglst_parse]
//
(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val () =
prerrln!
(
  "Hello from ATS-parse-emit-python!"
) (* end of [val] *)
//
//
val arglst =
  comarglst_parse (argc, argv)
//
val+list_cons (arg0, arglst) = arglst
//
var
state = @{
  comarg0= arg0
, waitkind= WTKnone ()
// number of prcessed
, ninputfile= 0 // input files
, outchan= OUTCHANref (stdout_ref)
, standalone= true (* standalone output *)
, nerror= 0 // number of accumulated errors
} : cmdstate // end of [var]
//
val () = process_cmdline (state, arglst)
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
