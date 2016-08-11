(* ****** ****** *)
//
// HX: 2016-08-10:
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
gprint_table$open<>
(
// argumentless
) = gprintln!("<table class=\"table\">")
//
implement
gprint_table$close<>() = gprintln!("</table>")
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table$thead_open() = gprintln!("<thead>")
implement
{}(*tmp*)
gprint_table$thead_close() = gprintln!("</thead>")
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table$tbody_open() = gprintln!("<tbody>")
implement
{}(*tmp*)
gprint_table$tbody_close() = gprintln!("</tbody>")
//
(* ****** ****** *)

implement
{}(*tmp*)
gprint_table$tr_open() = gprintln!("<tr>")
implement
{}(*tmp*)
gprint_table$tr_close() = gprintln!("</tr>")

(* ****** ****** *)

(* end of [gprint_bootstrap_table.hats] *)
