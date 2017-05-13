(*
** For trying out some OOP ideas
*)

(* ****** ****** *)
//
#staload
"libats/ML/SATS/basis.sats"
//
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
overload .class with object_get_class

(* ****** ****** *)
//
datatype value =
  | VALnil of ()
  | VALint of int
  | VALfloat of double
  | VALstring of string
  | VALobject of object
//
(*
  | {a:type} VALboxed of (a)
*)
//
typedef valuelst = list0(value)
//
(* ****** ****** *)
//
fun{}
toval_int(x: int): value
fun{}
toval_double(x: double): value
fun{}
toval_string(x: string): value
//
symintr toval
overload toval with toval_int
overload toval with toval_double
overload toval with toval_string
//
(* ****** ****** *)
//
datatype method =
  | MTDnil of ()
  | MTDfun of (valuelst -> value)
  | MTDclo of (valuelst -<cloref1> value)
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
class_getmtd(class, symbol): method
fun
class_setmtd(class, symbol, m0: method): bool
//
(* ****** ****** *)
//
fun
object_getvar(object, symbol): value
fun
object_setvar(object, symbol, v0: value): bool
//
(* ****** ****** *)
//
fun
object_evalmsg_0
  (object, symbol): value
fun
object_evalmsg_1
  (object, symbol, v: value): value
fun
object_evalmsg_2
  (object, symbol, v1: value, v2: value): value
fun
object_evalmsg_3
  (object, symbol, v1: value, v2: value, v3: value): value
//
fun
object_evalmsg_lst
  (object, symbol, vs: valuelst): value
//
overload .evalmsg with object_evalmsg_0
overload .evalmsg with object_evalmsg_1
overload .evalmsg with object_evalmsg_2
overload .evalmsg with object_evalmsg_3
overload .evalmsg with object_evalmsg_lst
//
(* ****** ****** *)

fun theEnv_get_class(symbol): Option_vt(class)

(* ****** ****** *)

(* end of [OOPLATS.sats] *)
