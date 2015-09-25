(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./../OOPLATS.sats"

(* ****** ****** *)
//
val-
~Some_vt(int_class) = theEnv_get_class("int_class")
//
val-
~Some_vt(bool_class) = theEnv_get_class("bool_class")
//
val-
~Some_vt(string_class) = theEnv_get_class("string_class")
//
(* ****** ****** *)
//
val Int1 = object_new_int(1)
val Int1_val: value = VALobject(Int1)
val Int2_val: value = object_evalmsg(Int1, "+", $list{value}(Int1_val))
//
(* ****** ****** *)

(* end of [test01.dats] *)
