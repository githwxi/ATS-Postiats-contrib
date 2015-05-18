(*
** ATS-extsolve:
** For solving ATS-constraints
** with external SMT-solvers
*)

(* ****** ****** *)

(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./patsolve_main.sats"

(* ****** ****** *)

implement
fprint_commarg
  (out, ca) =
(
case+ ca of
| CAhelp(str) => fprint! (out, "CAhelp(", str, ")")
| CAgitem(str) => fprint! (out, "CAgitem(", str, ")")
| CAinput(str) => fprint! (out, "CAinput(", str, ")")
| CAoutput(str) => fprint! (out, "CAoutput(", str, ")")
| CAscript(str) => fprint! (out, "CAscript(", str, ")")
)

(* ****** ****** *)

fun{
} argv_getopt_at
  {n:int}{i:nat}
(
  n: int n, argv: !argv(n), i: int i
) : stropt =
(
//
if i < n
  then stropt_some (argv[i]) else stropt_none ()
// end of [if]
//
) (* end of [argv_getopt_at] *)

(* ****** ****** *)

implement
patsolve_cmdline
  (argc, argv) = let
//
vtypedef
res_vt = commarglst_vt
//
fun
aux
{n:int}
{i:nat | i <= n}
(
  argc: int n
, argv: !argv(n)
, i: int i, res0: res_vt
) : res_vt = let
in
//
if
i < argc
then let
//
val arg = argv[i]
//
in
//
case+ arg of
//
| "-h" => let
    val ca =
      CAhelp(arg)
    val res0 =
      cons_vt(ca, res0)
    // end of [val]
  in
    aux(argc, argv, i+1, res0)
  end // end of ...
| "--help" => let
    val ca =
      CAhelp(arg)
    val res0 =
      cons_vt(ca, res0)
    // end of [val]
  in
    aux(argc, argv, i+1, res0)
  end // end of ...
//
| "-i" => let
    val ca =
      CAinput(arg)
    val res0 =
      cons_vt(ca, res0)
    // end of [val]
  in
    aux(argc, argv, i+1, res0)
  end // end of ...
| "--input" => let
    val ca =
      CAinput(arg)
    val res0 =
      cons_vt(ca, res0)
    // end of [val]
  in
    aux(argc, argv, i+1, res0)
  end // end of ...
//
| _ (*rest*) => let
    val res0 =
      cons_vt(CAgitem(arg), res0)
    // end of [val]
  in
    aux(argc, argv, i+1, res0)
  end // end of [...]
//
end // end of [then]
else res0 // end of [else]
//
end // end of [aux]
//
in
//
list_vt_reverse
  (aux(argc, argv, 0, nil_vt(*void*)))
//
end // end of [patsolve_cmdline]

(* ****** ****** *)

fun
patsolve_help() =
{
//
val () = prerrln! ("patsolve_help: ...")
//
} (* end of [patsolve_help] *)

(* ****** ****** *)

typedef
state_struct =
@{
//
  fopen_inp= int
, inpfil_ref= FILEref
//
} (* end of [state_struct] *)

(* ****** ****** *)

local
//
var
the_state: state_struct?
//
val () = the_state.fopen_inp := 0
val () = the_state.inpfil_ref := stdin_ref
//
val
the_state
  : ref(state_struct) =
  ref_make_viewptr(view@the_state | addr@the_state)
//
fun
process_arg
  (x: commarg): void = let
//
val () =
fprintln!
  (stdout_ref, "patsolve_commarglst: process_arg: x = ", x)
// end of [val]
//
in
//
case+ x of
| CAhelp _ => patsolve_help ()
(*
| CAgitem(str) => fprint! (out, "CAgitem(", str, ")")
| CAinput(str) => fprint! (out, "CAinput(", str, ")")
| CAoutput(str) => fprint! (out, "CAoutput(", str, ")")
| CAscript(str) => fprint! (out, "CAscript(", str, ")")
*)
| _ (*rest-of-CA*) => ()
//
end // end of [process_arg]
//
in (* in-of-local *)

implement
patsolve_commarglst
  (xs) = let
(*
val () = println! ("patsolve_commarglst")
*)
in
//
case+ xs of
| ~list_vt_nil
    ((*void*)) => ()
| ~list_vt_cons
    (x, xs) => let
    val () = process_arg(x)
  in
    patsolve_commarglst (xs)
  end // end of [list_vt_cons]
//
end // end of [patsolve_commarglst]

end // end of [local]

(* ****** ****** *)

(* end of [patsolve_commarg.dats] *)
