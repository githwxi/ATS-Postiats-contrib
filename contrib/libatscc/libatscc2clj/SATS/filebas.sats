(*
** For writing ATS code
** that translates into Clojure
*)

(* ****** ****** *)
//
// HX-2016-07:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2cljpre_"
//
(* ****** ****** *)

staload "./../basics_clj.sats"

(* ****** ****** *)

fun stdin_get(): CLJfilr = "mac#%"
fun stdout_get(): CLJfilr = "mac#%"
fun stderr_get() : CLJfilr = "mac#%"

(* ****** ****** *)

(* end of [filebas.sats] *)
