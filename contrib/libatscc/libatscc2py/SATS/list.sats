(*
** For writing ATS code
** that translates into Python
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2pypre_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)

staload "./../basics_py.sats"

(* ****** ****** *)
//
#include "{$LIBATSCC}/SATS/list.sats"
//
(* ****** ****** *)
//
fun{a:t0p}
fprint_list
  (PYfile, List(INV(a))): void = "mac#%"
//
fun{}
fprint_list$sep (out: PYfile): void = "mac#%"
//
fun{a:t0p}
fprint_list_sep
  (PYfile, List(INV(a)), sep: string): void = "mac#%"
//
overload fprint with fprint_list of 100
//
(* ****** ****** *)

(* end of [list.sats] *)
