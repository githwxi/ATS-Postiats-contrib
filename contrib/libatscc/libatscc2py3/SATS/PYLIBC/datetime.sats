(*
** For writing ATS code
** that translates into Python
*)

(* ****** ****** *)
//
// HX-2016-07:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX
"ats2pylibc_datetime_"
//
(* ****** ****** *)
//
staload "./../../basics_py.sats"
//
(* ****** ****** *)

abstype date_object
typedef date = date_object

(* ****** ****** *)
//
fun
date_make_ymd
(
  y: int, m: int, d: int
) : date = "mac#%" // end-of-fun
//
fun date_today(): date = "mac#%"
//
(* ****** ****** *)
//
fun date_ctime(date): string = "mac#%"
//
overload .ctime with date_ctime
//
(* ****** ****** *)

(* end of [datetime.sats] *)
