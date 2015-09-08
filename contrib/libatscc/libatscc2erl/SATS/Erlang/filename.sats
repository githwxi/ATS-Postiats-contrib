(*
** Module [filename]
*)

(* ****** ****** *)
//
// HX-2015-09:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2erlibc_filename_"
//
(* ****** ****** *)
//
staload
"./../../basics_erl.sats"
//
(* ****** ****** *)

typedef filename = string

(* ****** ****** *)
//
fun
absname(filename): filename = "mac#%"
//
(* ****** ****** *)
//
fun
basename(filename): filename = "mac#%"
//
(* ****** ****** *)

fun split(filename): ERLlist(string) = "mac#%"

(* ****** ****** *)

(* end of [filename.sats] *)