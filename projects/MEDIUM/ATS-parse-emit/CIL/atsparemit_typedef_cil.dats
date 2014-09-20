(* ****** ****** *)
//
// ATS-parse-emit-CIL
//
(* ****** ****** *)
//
// AS-2014-09-12: start
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./atsparemit_cil.sats"

(* ****** ****** *)

staload
NSP = {
//
#include
"share/atspre_define.hats"
//
staload "./atsparemit_cil.sats"
//
typedef T = string
//
#include "{$LIBATSHWXI}/globals/HATS/gstacklst.hats"
//
implement
the_namesp_pop () = pop_exn ()
implement
the_namesp_push (namesp) = push (namesp)
//
implement
the_namesp_get () = get_top_exn ()
//
} (* end of [staload] *)

(* ****** ****** *)

staload
CLS = {
//
#include
"share/atspre_define.hats"
//
staload "./atsparemit_cil.sats"
//
typedef T = string
//
#include "{$LIBATSHWXI}/globals/HATS/gstacklst.hats"
//
implement
the_clsname_pop () = pop_exn ()
implement
the_clsname_push (namesp, classname) = let  
  val fullname = string0_append (namesp, ".")
  val fullname0 = strptr2string (fullname)
  val fullname1 = string0_append (fullname0, classname)
  val sep = string0_copy("::")
  val prefx = strptr_append (fullname1, sep)
  val () = free (sep)
  val () = free (fullname1)
  val-true = strptr_isnot_null (prefx)
  val prefx = strptr2string (prefx)
in
  push (prefx)
end // end of [the_clsname_push]
//
implement
the_clsname_get () = get_top_exn ()
//
} (* end of [staload] *)
