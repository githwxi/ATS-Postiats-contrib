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

val env : JSdict(string) = "mac#%"

(* ****** ****** *)

val pid : int = "mac#%" // of the node process

(* ****** ****** *)

val version : string = "mac#%"
val versions : JSdict(string) = "mac#%"

(* ****** ****** *)

fun cwd (): string = "mac#%"
fun chdir (dir: string): void = "mac#%"

(* ****** ****** *)

fun getgid (): int = "mac#%"
fun setgid (id: int): void = "mac#%"

(* ****** ****** *)

fun getuid (): int = "mac#%"
fun setuid (id: int): void = "mac#%"

(* ****** ****** *)

fun uptime (): int = "mac#%"  
fun hrtime (): JSarray(int) = "mac#%"  
  
(* ****** ****** *)

(* end of [process.sats] *)
