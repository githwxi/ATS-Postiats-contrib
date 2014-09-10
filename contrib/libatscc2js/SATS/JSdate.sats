(*
** For writing ATS code
** that translates into JavaScript
*)

(* ****** ****** *)
//
// HX-2014-09:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2jspre_"
//
(* ****** ****** *)

staload "./../basics_js.sats"

(* ****** ****** *)
//
fun
Date_new_0 (): JSdate = "mac#%"
//
fun
Date_new_1_int (ms: int): JSdate = "mac#%"
fun
Date_new_1_string (date: string): JSdate = "mac#%"
//
fun
Date_new_7 (
  year: int, mon: int, day: int, hour: int, min: int, sec: int, ms: int
) : JSdate = "mac#%"
//
symintr Date_new
overload Date_new with Date_new_0
overload Date_new with Date_new_1_int
overload Date_new with Date_new_1_string
overload Date_new with Date_new_7
//
(* ****** ****** *)

(* end of [JSdate.sats] *)
