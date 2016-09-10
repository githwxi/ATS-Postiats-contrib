(*
** For trying out some OOP ideas
*)

(* ****** ****** *)

staload "./OOPLATS.sats"

(* ****** ****** *)

abstype state_type = ptr
typedef state = state_type

(* ****** ****** *)
//
extern
fun
state_search (symbol): Option_vt(value)
extern
fun
state_insert (symbol, v0: value): Option_vt(value)
//
(* ****** ****** *)

extern
fun
object_get_state(object): state
//
overload .state with object_get_state
//
(* ****** ****** *)

implement
object_getvar
  (obj, name) = let
//
val
opt = state_search(name)
//
in
//
case+ opt of
| ~None_vt() => VALnil()
| ~Some_vt(value) => value
//
end // end of [object_getvar]

(* ****** ****** *)

implement
object_setvar
  (obj, name, v0) = let
//
val
opt = state_insert(name, v0)
//
in
//
case+ opt of
| ~None_vt() => false | ~Some_vt _ => true
//
end // end of [object_setvar]

(* ****** ****** *)

implement
object_evalmsg_lst
  (obj, name, args) = let
//
val
mtd =
class_getmtd(obj.class(), name)
//
in
//
case+ mtd of
| MTDnil() => VALnil()
| MTDfun(f_fun) => f_fun(args)
| MTDclo(f_clo) => f_clo(args)
//
end // end of [object_evalmsg]

(* ****** ****** *)

(* end of [OOPLATS_object.dats] *)
