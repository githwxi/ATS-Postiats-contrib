(*
** For trying out some OOP ideas
*)

(* ****** ****** *)

(*
abstype symbol_type
typedef symbol = symbol_type
*)
typedef symbol = string

(* ****** ****** *)

abstype class_type = ptr
typedef class = class_type

(* ****** ****** *)

abstype class_vars = ptr
abstype class_methods = ptr

(* ****** ****** *)

abstype object_type = ptr
typedef object = object_type

(* ****** ****** *)

abstype object_state = ptr

(* ****** ****** *)

fun class_get_vars (class): class_vars
fun class_get_methods (class): class_methods

(* ****** ****** *)

fun object_new(class): object

(* ****** ****** *)

fun object_get_class(object): class
fun object_get_state(object): object_state

(* ****** ****** *)
//
fun
object_get_var(object, symbol): Option_vt(var)
fun
object_set_var(object, symbol, data: object): bool
//
(* ****** ****** *)

fun theEnv_get_class(symbol): Option_vt(class)

(* ****** ****** *)

(* end of [OOPLATS.sats] *)
