(*
** source: gdkcairo.h
*)

(* ****** ****** *)
//
#define
LIBCAIRO_targetloc
"$PATSHOME/npm-utils\
/contrib/atscntrb-libcairo"
//
(* ****** ****** *)
//
staload
XR = "{$LIBCAIRO}/SATS/cairo.sats"
//
vtypedef cairo_ref1 = $XR.cairo_ref1
//
(* ****** ****** *)
//
fun
gdk_cairo_create
{c:cls |
 c <= GdkDrawable}
{l:agz}
  (drawable: !gobjref(c, l)): cairo_ref1 = "mac#%"
//
(* ****** ****** *)

(* end of [gdkcairo.sats] *)
