(* ****** ****** *)

(*
** For testing
** csv_parsing_line
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
#include "./../HATS/mygrading.hats"
//
(* ****** ****** *)

implement
main0() = {
//
local
implement(a)
stream_vt_foreach$fwork<a><void>
  (x0, env) = let
  val x0 =
    $UN.castvwtp0{Strptr1}(x0)
  // end of [val]
  val x1 = $UN.strptr2string(x0)
//
  val ents = csv_parse_line(x1)
//
  local
  implement
  fprint_list$sep<>(out) = fprint(out, "; ")
  in
  val ((*void*)) =
  println!(
    "ents = "
  , $UNSAFE.castvwtp1{stringlst}(ents)
  ) (* println! *)
  end // end of [local]
//
  val ((*freed*)) = strptrlst_free(ents)
//
  val ((*freed*)) = strptr_free(x0)
in
  // nothing
end // end of [stream_vt_foreach$fwork]
//
in
//
val
lines =
streamize_fileref_line(stdin_ref)
//
val-~stream_vt_nil() = stream_vt_foreach(lines)
//
end // end of [local]
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test02.dats] *)
