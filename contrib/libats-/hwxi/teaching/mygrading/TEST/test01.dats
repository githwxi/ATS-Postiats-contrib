(* ****** ****** *)

(*
** For testing csv_parsing_line
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#include "./../HATS/mygrading.hats"
//
(* ****** ****** *)

implement
main0() = {
//
val inp = "\
Total,245,307,536,422,301,487,395,383,307,407,0,584,120,65,325.6428571,555\
" // end of [val]
//
implement
fprint_list$sep<>
  (out) = fprint(out, "; ")
//
val xs0 = csv_parse_line(inp)
val ((*void*)) =
  println!("xs0 = ", $UNSAFE.castvwtp1{stringlst}(xs0))
val ((*freed*)) = strptrlst_free(xs0)
//
val inp = "\
Total,0, \"0, 0\",\"0, \"\"0\"\"\"
" // end of [val]
val xs0 = csv_parse_line(inp)
val ((*void*)) =
  println!("xs0 = ", $UNSAFE.castvwtp1{stringlst}(xs0))
val ((*freed*)) = strptrlst_free(xs0)
//
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01.dats] *)

