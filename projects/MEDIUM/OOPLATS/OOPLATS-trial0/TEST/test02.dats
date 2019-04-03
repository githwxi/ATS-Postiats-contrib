(* ****** ****** *)
//
#staload
"libats/ML/SATS/basis.sats"
//
#staload "./../OOPLATS.sats"
//
#staload _ = "./../OOPLATS_basics.dats"
#staload _ = "./../OOPLATS_object.dats"
//
(* ****** ****** *)

abstype symbol(t@ype)

(* ****** ****** *)
//
extern
val
symbol$print :
  symbol(cfun(class, value, void))
extern
val
symbol$fprint :
  symbol(cfun(class, FILEref, value, void))
//
(* ****** ****** *)
//
extern
fun
class_getsym{a:t@ype}(class, symbol(a)): a
//
(* ****** ****** *)

fun
evalmsg$print
  (class, value): void = let
//
val
fprint_mtd =
class_getsym (class, symbol$fprint)
//
in
  fprint_mtd (class, stdout_ref, value)
end // end of [evalmsg$print]

(* ****** ****** *)
//
extern
val
the_object_class : class
//
(* ****** ****** *)
//
(*
val () =
class_setmtd
  (the_object_class, symbol$print, evalmsg$print)
*)
//
(* ****** ****** *)
//
extern
fun tocls_int(x: int): class
extern
fun tocls_double(x: double): class
extern
fun tocls_string(x: string): class
//
symintr tocls
//
overload tocls with tocls_int
overload tocls with tocls_double
overload tocls with tocls_string
//
(* ****** ****** *)
//
fun
print_int
  (x: int): void =
  evalmsg$print(tocls(x), toval(x))
fun
print_double
  (x: double): void =
  evalmsg$print(tocls(x), toval(x))
fun
print_string
  (x: string): void =
  evalmsg$print(tocls(x), toval(x))
//
(* ****** ****** *)

implement main0() = { (*nothing*) }

(* ****** ****** *)

(* end of [test02.dats] *)
