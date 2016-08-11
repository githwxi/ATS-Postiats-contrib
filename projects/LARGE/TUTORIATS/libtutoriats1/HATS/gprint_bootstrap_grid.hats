(* ****** ****** *)
//
// HX: 2016-08-09:
// for generating bootstrap grids
// 
(* ****** ****** *)
(*
//
staload
"./SATS/gprint_html_table.sats"
//
*)
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table$open() = ()
implement
{}(*tmp*)
gprint_table$close() = ()
//
(* ****** ****** *)

implement
{}(*tmp*)
gprint_table$thead_open() = ()
implement
{}(*tmp*)
gprint_table$thead_close() = ()

(* ****** ****** *)

implement
{}(*tmp*)
gprint_table$tbody_open() = ()
implement
{}(*tmp*)
gprint_table$tbody_close() = ()

(* ****** ****** *)

implement
{}(*tmp*)
gprint_table$tr_open() =
{
//
val () =
gprintln!
  ("<div class=\"row\">")
//
} (* gprint_table$tr_open *)

(* ****** ****** *)

implement
{}(*tmp*)
gprint_table$tr_close() =
{
//
val () = gprintln!("</div>")
//
} (* gprint_table$tr_close *)

(* ****** ****** *)

(* end of [gprint_bootstrap_grid.hats] *)
