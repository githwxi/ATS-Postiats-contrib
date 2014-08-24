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
ATS_EXTERN_PREFIX "ats2js_node_"
//
(* ****** ****** *)

(*
** node.js/process
*)

(* ****** ****** *)
//
staload
"./../../prelude/basics_js.sats"
//
(* ****** ****** *)

val argv : JSarray(string) = "mac#%"

(* ****** ****** *)

(* end of [process.sats] *)
