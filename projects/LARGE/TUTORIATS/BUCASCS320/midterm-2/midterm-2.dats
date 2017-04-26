(* ****** ****** *)
//
// HX: 2016-08-09:
// Some PAGEN-functions
// for creating assignments  
// 
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2PY3}/staloadall.hats"
//
staload
"{$LIBATSCC2PY3}/SATS/PYLIBC/random.sats"
staload
"{$LIBATSCC2PY3}/SATS/PYLIBC/datetime.sats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#define
LIBTUTORIATS_targetloc
"$PATSHOMERELOC\
/projects/LARGE/TUTORIATS/libtutoriats"
//
staload
"{$LIBTUTORIATS}/SATS/gprint_html_table.sats"
//
#include
"{$LIBTUTORIATS}/HATS/gprint_html_table.hats"
//
(* ****** ****** *)
//
(*
implement
{}(*tmp*)
gprint_table$open() =
{
//
val () =
gprintln!
("\
<table class=\"table\">\
") (* gprintln! *)
//
} (* end of [gprint_table$open] *)
//
implement
{}(*tmp*)
gprint_table$close() =
{
//
val () =
gprintln! ("</table>")
//
} (* end of [gprint_table$close] *)
*)
//
(* ****** ****** *)

datatype
mytable =
MYTABLE of
table_b1_data(
table_row_c3_data
  (mytable_1, mytable_2, mytable_3)
) (* table_b1_data *)

and
mytable_0 =
MYTABLE_0 of unit

and
mytable_1 =
MYTABLE_1 of unit

and
mytable_2 =
MYTABLE_2 of
table_b2_data(
  mytable_2_1, mytable_2_2
) (* table_b2_data *)

and
mytable_3 =
MYTABLE_3 of unit

and
mytable_2_1 = MYTABLE_2_1 of unit

and
mytable_2_2 =
MYTABLE_2_2 of
table_bs_data(mytable_2_2_x)

and
mytable_2_2_x = MYTABLE_2_2_x of string

(* ****** ****** *)
//
implement
gprint_val<mytable>
  (MYTABLE(x0)) = gprint(x0) where
{
#include
"{$LIBTUTORIATS}/HATS/gprint_bootstrap_grid.hats"
}
//
(* ****** ****** *)
//
implement
gprint_val<mytable_0>(_) = ()
//
implement
gprint_val<mytable_1>(_) = ()
//
implement
gprint_val<mytable_2>
  (MYTABLE_2(x0)) = gprint(x0) where
{
//
#include
"{$LIBTUTORIATS}/HATS/gprint_bootstrap_grid.hats"
//
}
//
implement
gprint_val<mytable_3>(_) = ()
//
(* ****** ****** *)
//
implement
gprint_val<mytable_2_1>
  (_) = () where
{
val () =
gprintln!
(
"<div class=\"col-md-12\">"
) (* gprintln! *)
val () =
gprintln!("\
<h1>BUCASCS320: Midterm-2</h1>\
")
val () = gprintln!("</div>")
}
//
implement
gprint_val<mytable_2_2>
  (MYTABLE_2_2(x0)) = () where
{
//
#include
"{$LIBTUTORIATS}/HATS/gprint_bootstrap_table.hats"
//
val () = gprintln!("<div class=\"col-md-12\">")
val () = gprint(x0)
val () = gprintln!("</div>")
//
}
implement
gprint_val<mytable_2_2_x>
  (MYTABLE_2_2_x(elt)) =
(
gprintln!("<td class=\"text-center\">", elt, "</td>")
)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table_row$td_open() = gprintln!("<div>")
implement
{}(*tmp*)
gprint_table_row$td_close() = gprintln!("</div>")
//
implement
{}(*tmp*)
gprint_table_row$td_1_open() =
  gprintln!("<div class=\"col-md-2 text-center\">")
implement
{}(*tmp*)
gprint_table_row$td_2_open() =
  gprintln!("<div class=\"col-md-8 text-center\">")
implement
{}(*tmp*)
gprint_table_row$td_3_open() =
  gprintln!("<div class=\"col-md-2 text-center\">")
//
(* ****** ****** *)
//
extern
fun
midterm_2_create
(
// argmentless
) : void = "mac#"
//
(* ****** ****** *)

implement
midterm_2_create
(
) = let
//
val u = unit
//
implement
gprint_string<>
  (x0) = print_string(x0)
//
implement
gprint_newline<> = print_newline
//
val
mytable_0 = MYTABLE_0(u)
//
val
mytable_1 = MYTABLE_1(u)
//
val
mytable_2_1 = MYTABLE_2_1(u)
//
val
mytable_2_2_1 = MYTABLE_2_2_x("mytable_2_2_x:1")
val
mytable_2_2_2 = MYTABLE_2_2_x("mytable_2_2_x:2")
val
mytable_2_2_3 = MYTABLE_2_2_x("mytable_2_2_x:3")
//
val
mytable_2_2 =
MYTABLE_2_2(
TABLE_BS_DATA
(
  cons(mytable_2_2_1, cons(mytable_2_2_2, cons(mytable_2_2_3, nil())))
)
)(* MYTABLE_2_2 *)
//
val
mytable_2 =
MYTABLE_2(
  TABLE_B2_DATA(mytable_2_1, mytable_2_2)
)(* MYTABLE_2 *)
//
val
mytable_3 = MYTABLE_3(u)
//
in (* in-of-let *)

gprintln!("<!DOCTYPE html>");

gprintln!("<html>");

gprintln!("\
<head>
<title>BUCASCS320-midterm-1</title>
<meta content=\"text/html; charset=UTF-8\" />
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />
<link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">

<style type=\"text/css\">
  .patsyntax {width:100%;margin:auto;}
  .patsyntax {color:#808080;background-color:#E0E0E0;}
  .patsyntax span.keyword {color:#000000;font-weight:bold;}
  .patsyntax span.comment {color:#787878;font-style:italic;}
  .patsyntax span.extcode {color:#A52A2A;}
  .patsyntax span.neuexp  {color:#800080;}
  .patsyntax span.staexp  {color:#0000F0;}
  .patsyntax span.prfexp  {color:#603030;}
  .patsyntax span.dynexp  {color:#F00000;}
  .patsyntax span.stalab  {color:#0000F0;font-style:italic}
  .patsyntax span.dynlab  {color:#F00000;font-style:italic}
  .patsyntax span.dynstr  {color:#008000;font-style:normal}
  .patsyntax span.stacstdec  {text-decoration:none;}
  .patsyntax span.stacstuse  {color:#0000CF;text-decoration:underline;}
  .patsyntax span.dyncstdec  {text-decoration:none;}
  .patsyntax span.dyncstuse  {color:#B80000;text-decoration:underline;}
  .patsyntax span.dyncst_implement  {color:#B80000;text-decoration:underline;}
</style>
<script
 src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js\">
</script>
<script
 src=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\">
</script>
<script
 src=\"https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2014-11-29/FileSaver.min.js\">
</script>
<script
 src=\"https://ats-lang.github.io/LIBRARY/libatscc2js/libatscc2js_all.js\">
</script>
<script
 src=\"https://ats-lang.github.io/LIBRARY/libatscc2js/libatscc2js_print_store_cats.js\">
</script>
<script
 src=\"https://ats-lang.github.io/LIBRARY/ats2langweb/pats2xhtmlize_dats.js\">
</script>
</head>
"); (* gprintln! *)

gprintln!("<body>");

gprintln!("<div class=\"container-fluid\">");


gprint_val
(
MYTABLE(
TABLE_B1_DATA
(
TABLE_ROW_C3_DATA
  (mytable_1, mytable_2, mytable_3)
)
)(* MYTABLE *)
); (* gprint_val *)

gprintln!("</div><!--container-fluid-->");

gprintln!("</body>");
gprintln!("</html>");

end // end of [midterm_2_create]

(* ****** ****** *)

%{$
//
if __name__ == '__main__': midterm_2_create()
//
%} // end of [%{$]

(* ****** ****** *)

%{^
######
import os
import sys
######
#
from libatscc2py3_all import *
#
######
sys.setrecursionlimit(1000000)
######
%} (* end of [%{^] *)

(* ****** ****** *)

(* end of [midterm-2.dats] *)
