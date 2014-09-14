(*
**
** HX-2014-09-14:
** [weboxy] is a small package that
** does webpage layout by generating CSS;
** it also generats HTML for reviewing purpose
**
*)

(* ****** ****** *)

abstype webox_type
typedef webox = webox_type
typedef weboxlst = List (webox)
typedef weboxopt = Option (webox)

(* ****** ****** *)

abstype color_type
typedef color = color_type

(* ****** ****** *)

datatype
tabstyle =
  | TSnone of () | TShbox of () | TSvbox of ()
// end of [tabstyle]

(* ****** ****** *)
//
// HX-2014-09-13:
// uid: unique indentification
//
fun webox_get_uid (webox): int
//
// HX-2014-09-13:
// name: name given by the user
//
fun webox_get_name (webox): string
//
overload .uid with webox_get_uid
overload .name with webox_get_name
//
(* ****** ****** *)
//
fun webox_get_width (webox): int
fun webox_set_width (webox, width: int): void
//
overload .width with webox_get_width
overload .width with webox_set_width
//
(* ****** ****** *)
//
fun webox_get_height (webox): int
fun webox_set_height (webox, height: int): void
//
overload .height with webox_get_height
overload .height with webox_set_height
//
(* ****** ****** *)
//
fun webox_get_color (webox): int
fun webox_set_color (webox, color: int): void
//
overload .color with webox_get_color
overload .color with webox_set_color
//
(* ****** ****** *)
//
fun webox_get_bgcolor (webox): int
fun webox_set_bgcolor (webox, bgcolor: int): void
//
overload .bgcolor with webox_get_bgcolor
overload .bgcolor with webox_set_bgcolor
//
(* ****** ****** *)
//
fun webox_isrt (x: webox): bool
fun webox_get_parent (webox): weboxopt
fun webox_set_parent (webox, opt: weboxopt): void
//
overload .isrt with webox_isrt
overload .parent with webox_get_parent
overload .parent with webox_set_parent
//
(* ****** ****** *)
//
fun webox_get_children (webox): weboxlst
fun webox_set_children (webox, xs: weboxlst): void
//
overload .children with webox_get_children
overload .children with webox_set_children
//
(* ****** ****** *)
//
fun webox_get_tabstyle (webox): weboxlst
fun webox_set_tabstyle (webox, sty: tabstyle): void
//
overload .tabstyle with webox_get_tabstyle
overload .tabstyle with webox_set_tabstyle
//
(* ****** ****** *)

fun webox_make_name (name: string): webox
fun webox_make_name_width (name: string, width: int): webox

(* ****** ****** *)

(* end of [weboxy.sats] *)
