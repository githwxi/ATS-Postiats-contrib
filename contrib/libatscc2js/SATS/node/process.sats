(*
** For writing ATS code
** that translates into JavaScript
*)

(* ****** ****** *)

(*
** Node.js/process
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2js_node_process_"
//
(* ****** ****** *)
//
staload "./../../basics_js.sats"
//
(* ****** ****** *)

val argv : JSarray(string) = "mac#%"

(* ****** ****** *)

val execPath : string = "mac#%"
val execArgv : JSarray(string) = "mac#%"

(* ****** ****** *)

fun cwd (): string = "mac#%"
fun chdir (dir: string): void = "mac#%"

(* ****** ****** *)

val pid : int = "mac#%"

(* ****** ****** *)

fun getgid (): int = "mac#%"
fun setgid (id: int): void = "mac#%"

(* ****** ****** *)

fun getuid (): int = "mac#%"
fun setuid (id: int): void = "mac#%"

(* ****** ****** *)

val version : string = "mac#%"
val versions : JSdict(string) = "mac#%"

(* ****** ****** *)

(* end of [process.sats] *)
