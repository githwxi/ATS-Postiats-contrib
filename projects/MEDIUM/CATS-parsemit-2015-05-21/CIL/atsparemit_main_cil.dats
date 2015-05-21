(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// AS-2014-08-17: start
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
STDIO = 
"{$PATSLIBC}/SATS/stdio.sats"
//
(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_cil.sats"
staload "./atsparemit_parsing.sats"
staload "./atsparemit_emit.sats"

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

dynload "./atsparemit_typedef.dats"
dynload "./atsparemit_typedef_cil.dats"

(* ****** ****** *)

dynload "./atsparemit_syntax_cil.dats"

(* ****** ****** *)

dynload "./atsparemit_emit_cil.dats"

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
  | WTKnamesp of () // -n / --namespace
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
, ncomarg= int // number of command-line arguments
, waitkind= waitkind
, namesp= string // CLI namespace for generated code
// number of processed input files
, ninputfile= int // waiting for STDIN if it is 0
, outchan= OUTCHAN // current output channel
, nerror= int // number of accumulated errors
} (* end of [cmdstate] *)

(* ****** ****** *)

fun
cmdstate_set_outchan
(
  state: &cmdstate >> _, chan_new: OUTCHAN
) : void = let
//
val chan_old = state.outchan
val ((*void*)) = state.outchan := chan_new
//
in
//
case+
chan_old of
| OUTCHANref (filr) => ()
| OUTCHANptr (filp) => let
    val err = $STDIO.fclose0 (filp) in (*nothing*)
  end // end of [OUTCHANptr]
//
end // end of [cmdstate_set_outchan]

(* ****** ****** *)
//
extern
fun
atscc2cil_fileref
  (state: &cmdstate >> _, filr: FILEref, fname: string): void
//
implement
atscc2cil_fileref
  (state, inp, fname) = let
//
val out =
  outchan_get_fileref (state.outchan)
//
val d0cs = parse_from_fileref (inp)
//
val namesp = state.namesp
//
val ((*void*)) = emit2_toplevel (out, d0cs, fname, namesp)
//
in
  // nothing
end // end of [atscc2cil_fileref]

(* ****** ****** *)
//
extern
fun
atscc2cil_basename
  (state: &cmdstate >> _, fname: string): void
//
implement
atscc2cil_basename
  (state, fname) = let
//
val inp =
  $STDIO.fopen (fname, file_mode_r)
val p_inp = $STDIO.ptrcast(inp)
//
in
//
if
p_inp > 0
then let
//
val inp =
$UNSAFE.castvwtp0{FILEref}(inp)
//
in
  atscc2cil_fileref (state, inp, fname)
end // end of [then]
else let
//
prval
(
// freed
) = $STDIO.FILEptr_free_null (inp)
val ((*void*)) = state.nerror := state.nerror + 1
//
in
  // nothing
end // end of [else]
//
end // end of [atscc2cil_basename]

(* ****** ****** *)

fun
cmdstate_set_outchan_basename
(
  state: &cmdstate >> _, basename: string
) : void = let
//
val filp =
  $STDIO.fopen (basename, file_mode_w)
val p0 = $STDIO.ptrcast(filp)
//
(*
val () = println! ("cmdstate_set_outchan_basename: p0 = ", p0)
*)
//
in
//
if
p0 > 0
then let
  val filp = $UNSAFE.castvwtp0{FILEref}(filp)
in
  cmdstate_set_outchan (state, OUTCHANptr (filp))
end // end of [then]
else let
  prval
  ( // freed
  ) = $STDIO.FILEptr_free_null (filp)
  val ((*void*)) = state.nerror := state.nerror + 1
in
  cmdstate_set_outchan (state, OUTCHANref (stderr_ref))
end // end of [else]
//
end // end of [cmdstate_set_outchan_basename]

(* ****** ****** *)

fun
cmdstate_set_namesp
(
  state: &cmdstate >> _, namespace: string
) : void = {
  val () = state.namesp := namespace
} (* end of [cmdstate_set_namesp] *)

(* ****** ****** *)
//
fn isinwait
  (state: cmdstate): bool =
(
  case+ state.waitkind of WTKinput () => true | _ => false
) (* end of [isinwait] *)
//
fn isoutwait
  (state: cmdstate): bool =
(
  case+ state.waitkind of WTKoutput () => true | _ => false
) (* end of [isoutwait] *)
//
fn isnspwait
  (state: cmdstate): bool =
(
  case+ state.waitkind of WTKnamesp () => true | _ => false
) (* end of [isnspwait] *)
//
(* ****** ****** *)
//
extern
fun
comarg_warning (string): void
//
implement
comarg_warning (str) = {
  val () = prerr ("warning(ATS)")
  val () = prerr (": unrecognized command line argument [")
  val () = prerr (str)
  val () = prerr ("] is ignored.")
  val () = prerr_newline ()
} (* end of [comarg_warning] *)
//
(* ****** ****** *)

fun
atscc2cil_usage
  (cmd: string): void = {
//
val () =
println!
(
  "Usage: ", cmd, " <command> ... <command>\n"
)
val () =
println!
(
  "where each <command> is of one of the following forms:\n"
)
//
val () =
println! ("  -i <filename> : for processing <filename>")
val () =
println! ("  --input <filename> : for processing <filename>")
//
val () =
println! ("  -o <filename> : output into <filename>")
val () =
println! ("  --output <filename> : output into <filename>")
//
val () =
println! ("  -h : for printing out this help usage")
val () =
println! ("  --help : for printing out this help usage")
//
} (* end of [atscc2cil_usage] *)

(* ****** ****** *)

fun
process_cmdline
(
  state: &cmdstate, arglst: comarglst
) : void = let
in
//
case+ arglst of
//
| list_nil () => let
    val nif = state.ninputfile
    val wait0 =
    (
      case+ 0 of
      | _ when nif < 0 => true
      | _ when nif = 0 => isinwait (state)
      | _ (* nif > 0 *) => false
    ) : bool // end of [val]

  in
    if wait0 then (
      if state.ncomarg = 0
        then atscc2cil_usage ("atscc2cil")
        else atscc2cil_fileref (state, stdin_ref, "STDIN")
    ) (* end of [if] *)
  end // end of [list_nil]
//
| list_cons
    (arg, arglst) => let
    val () =
      state.ncomarg := state.ncomarg + 1
    // end of [val]
  in
    process_cmdline2 (state, arg, arglst)
  end // end of [list_cons]
//
end // end of [process_cmdline]

and
process_cmdline2
(
  state: &cmdstate, arg: comarg, arglst: comarglst
) : void = let
in
//
case+ arg of
//
| _ when
    isinwait(state) => let
    val nif = state.ninputfile
  in
    case+ arg of
    | COMARGkey (1, key) when nif > 0 =>
        process_cmdline2_COMARGkey1 (state, arglst, key)
    | COMARGkey (2, key) when nif > 0 =>
        process_cmdline2_COMARGkey2 (state, arglst, key)
    | COMARGkey (_, fname) => let
        val () = state.ninputfile := nif + 1
        val () = atscc2cil_basename (state, fname(*input*))
      in
        process_cmdline (state, arglst)
      end // end of [COMARGkey]
  end // end of [_ when isinpwait]
//
| _ when
    isoutwait(state) => let
//
    val COMARGkey (_, fname) = arg
//
    val () = cmdstate_set_outchan_basename (state, fname)
//
    val () = state.waitkind := WTKnone ()
//
  in
    process_cmdline (state, arglst)
  end // end of [_ when isoutwait]
//
| _ when
    isnspwait(state) => let
//
    val COMARGkey (_, namesp) = arg
//
    val () = cmdstate_set_namesp (state, namesp)
//
    val () = state.waitkind := WTKnone ()
//
  in
    process_cmdline (state, arglst)
  end // end of [_ when isnspwait]
//
| COMARGkey (1, key) =>
    process_cmdline2_COMARGkey1 (state, arglst, key)
| COMARGkey (2, key) =>
    process_cmdline2_COMARGkey2 (state, arglst, key)
//
| COMARGkey (_, key) => let
    val () = comarg_warning (key)
    val () = state.waitkind := WTKnone ()
  in
    process_cmdline (state, arglst)
  end // end of [COMARGkey]
//
end // end of [process_cmdline2]

and
process_cmdline2_COMARGkey1
(
  state: &cmdstate >> _, arglst: comarglst, key: string
) : void = let
//
val () = (
//
case+ key of
//
| "-i" => {
    val () = state.ninputfile := 0
    val () = state.waitkind := WTKinput()
  } (* end of [-i] *)
//
| "-o" => {
    val () = state.waitkind := WTKoutput ()
  } (* end of [-o] *)
//
| "-n" => {
    val () = state.waitkind := WTKnamesp ()
  } (* end of [-n] *)
//
| "-h" => {
    val () = atscc2cil_usage ("atscc2cil")
    val () = state.waitkind := WTKnone(*void*)
    val () = if state.ninputfile < 0 then state.ninputfile := 0
  } (* end of [-h] *)
//
| _ (*unrecognized*) => comarg_warning (key)
//
) : void // end of [val]
//
in
  process_cmdline (state, arglst)
end // end of [process_cmdline2_COMARGkey1]

and
process_cmdline2_COMARGkey2
(
  state: &cmdstate >> _, arglst: comarglst, key: string
) : void = let
//
val () = state.waitkind := WTKnone ()
//
val () = (
//
case+ key of
//
| "--input" => {
    val () = state.ninputfile := 0
    val () = state.waitkind := WTKinput()
  } (* end of [--input] *)
//
| "--output" => {
    val () = state.waitkind := WTKoutput ()
  } (* end of [--output] *)
//
| "--namespace" => {
    val () = state.waitkind := WTKnamesp ()
  } (* end of [--namespace] *)
//
| "--help" => {
    val () = atscc2cil_usage ("atscc2cil")
    val () = state.waitkind := WTKnone(*void*)
  } (* end of [--help] *)
//
| _ (*unrecognized*) => comarg_warning (key)
//
) : void // end of [val]
//
in
  process_cmdline (state, arglst)
end // end of [process_cmdline2_COMARGkey2]

(* ****** ****** *)
//
extern
fun
comarg_parse (string):<> comarg
//
extern
fun
comarglst_parse{n:nat}
  (argc: int n, argv: !argv(n)): list (comarg, n)
// end of [comarglst_parse]
//
(* ****** ****** *)

implement
comarg_parse
  (str) = let
//
fun
loop
  {n,i:nat | i <= n} .<n-i>.
(
  str: string n, n: int n, i: int i
) :<> comarg = 
(
  if i < n
    then (
    if (str[i] != '-')
      then COMARGkey (i, str) else loop (str, n, i+1)
    ) else COMARGkey (n, str)
) (* end of [if] *)  
// end of [loop]
//
val str = g1ofg0(str)
val len = string_length (str)
//
in
  loop (str, sz2i(len), 0)
end // end of [comarg_parse]

(* ****** ****** *)

implement
comarglst_parse
  {n}(argc, argv) = let
//
fun
loop
  {i,j:nat | i <= n} .<n-i>.
(
  argv: !argv(n), i: int(i), res: list_vt(comarg, j)
) : list_vt (comarg, n-i+j) =
(
if i < argc
  then let
    val res = list_vt_cons (comarg_parse (argv[i]), res)
  in
    loop (argv, i+1, res)
  end // end of [then]
  else res // end of [else]
// end of [if]
) (* end of [loop] *)
//
val res =
  loop (argv, 0, list_vt_nil())
//
in
  list_vt2t (list_vt_reverse (res))
end // end of [comarglst_parse]

(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val () =
prerrln!
(
  "Hello from atscc2cil!"
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
, ncomarg= 0 // counting from 0
, waitkind= WTKnone ()
, namesp= "Postiats"
// number processed
, ninputfile= ~1 // input files
, outchan= OUTCHANref (stdout_ref)
, nerror= 0 // number of accumulated errors
} : cmdstate // end of [var]
//
val () = process_cmdline (state, arglst)
//
val () =
if
state.nerror = 1
then let
  val () = println! ("atscc2cil: there is a reported error.")
in
  // nothing
end // end of [then]
else if
state.nerror >= 2
then let
  val () = println! ("atscc2cil: there are multiple reported errors.")
in
  // nothing
end // end of [then]
else () // end of [else]
//
(*
val () =
prerrln! ("Good-bye from atscc2cil!")
*)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [atsparemit_main_cil.dats] *)
