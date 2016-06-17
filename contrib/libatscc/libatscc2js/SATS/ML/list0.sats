(*
** For writing ATS code
** that translates into JavaScript
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2jspre_ML_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)

staload "./../../basics_js.sats"

(* ****** ****** *)
//
#include "{$LIBATSCC}/SATS/ML/list0.sats"
//
(* ****** ****** *)
//
fun{a:t0p}
fprint_list0
  (JSfilr, list0(INV(a))): void = "mac#%"
//
fun{}
fprint_list0$sep(out: JSfilr): void = "mac#%"
//
fun{a:t0p}
fprint_list0_sep
  (JSfilr, list0(INV(a)), sep: string): void = "mac#%"
//
overload fprint with fprint_list0 of 100
//
(* ****** ****** *)

(* end of [list0.sats] *)
