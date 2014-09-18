staload "./atsparemit.sats"
staload "./atsparemit_syntax.sats"

// approach:
// - create an environment for function declarations
//   - this maps ATS C function name to fully qualified .NET function name with its signature
// - create an environment for type declarations
// - create an environment for foreign function definitions (builtins and whatnot)

(*
abstype
cilname_type = ptr
typedef cilname_t = cilname_type

fun print_cilname : (cilname_t) -> void
fun prerr_cilname : (cilname_t) -> void
fun fprint_cilname : fprint_type (cilname_t)

(* ****** ****** *)
//
fun
cilname_make_foreign
(
  assembly: symbol,
  nsp: symbol,
  cls: symbol,
  name: i0de
) : cilname_t // end-of-function
//
fun
cilname_make_local
(
  cls: symbol,
  name: i0de  
) : cilname_t // end-of-function
//
(* ****** ****** *)
*)

fun the_namesp_pop (): string
fun the_namesp_push (namesp: string): void
fun the_namesp_get (): string

fun the_clsname_pop (): string
fun the_clsname_push (namesp: string, cls: string): void
fun the_clsname_get (): string

fun emit2_toplevel (out : FILEref, d0ecls: d0eclist, fname: string, namespace: string) : void

(* ****** ****** *)

(* end of [atsparemit_cil.sats] *)
