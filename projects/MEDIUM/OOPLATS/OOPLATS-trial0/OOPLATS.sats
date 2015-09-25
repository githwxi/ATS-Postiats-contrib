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
//
fun object_new(class): object
//
fun object_new_int(int): object
fun object_new_float(double): object
fun object_new_string(string): object
//
(* ****** ****** *)

fun object_get_class(object): class
fun object_get_state(object): object_state

(* ****** ****** *)
//
datatype value =
  | VALnil of ()
  | VALint of int
  | VALfloat of double
  | VALstring of string
  | VALobject of object
//
typedef valuelst = List0 (value)
//
(* ****** ****** *)
//
fun print_value : value -> void
fun fprint_value: fprint_type(value)
//
fun print_object : object -> void
fun fprint_object: fprint_type(object)
//
overload print with print_value
overload fprint with fprint_value
//
overload print with print_object
overload fprint with fprint_object
//
(* ****** ****** *)
//
fun
object_getvar(object, symbol): value
fun
object_setvar(object, symbol, v0: value): bool
//
(* ****** ****** *)

fun
object_evalmsg(object, symbol, valuelst): value

(* ****** ****** *)

fun theEnv_get_class(symbol): Option_vt(class)

(* ****** ****** *)

(* end of [OOPLATS.sats] *)
