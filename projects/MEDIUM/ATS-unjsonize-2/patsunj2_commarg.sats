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
#define
ATS_PACKNAME "PATSUNJ2"
//
(* ****** ****** *)

datatype
commarg =
  | CAhelp of (string)
  | CAgitem of (string)
  | CAinput of (string)
  | CAoutput of (string)
  | CAscript of (string)
  | CAargend of ((*void*))
// end of [commarg]

(* ****** ****** *)
//
typedef
commarglst = List0 (commarg)
vtypedef
commarglst_vt = List0_vt (commarg)
//
(* ****** ****** *)
//
fun
fprint_commarg
  (out: FILEref, ca: commarg): void
//
overload fprint with fprint_commarg
//
(* ****** ****** *)
//
fun
patsunj2_cmdline
  {n:nat}
  (argc: int(n), argv: !argv(n)): commarglst_vt
//
(* ****** ****** *)
//
fun
patsunj2_commarglst(arglst: commarglst_vt): void
// 
(* ****** ****** *)

(* end of [patsunj2_commarg.sats] *)
