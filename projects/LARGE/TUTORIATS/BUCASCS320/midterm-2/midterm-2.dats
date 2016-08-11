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
table_b3_data(
  mytable_2_2_1, mytable_2_2_2, mytable_2_2_3
) (* TABLE_B3_DATA *)

and
mytable_2_2_1 = MYTABLE_2_2_1 of unit
and
mytable_2_2_2 = MYTABLE_2_2_2 of unit
and
mytable_2_2_3 = MYTABLE_2_2_3 of unit

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
gprint_val<mytable_0>
  (_) = ((*void*))
//
implement
gprint_val<mytable_1>
  (_) = gprint("mytable_1")
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
gprint_val<mytable_3>
  (_) = gprint("mytable_3")
//
(* ****** ****** *)
//
implement
gprint_val<mytable_2_1>
  (_) = () where
{
val () = gprintln!("<div class=\"col-md-12\">")
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
gprint_val<mytable_2_2_1>
  (_) = gprint("<td class=\"text-center\">mytable_2_2_1</td>")
implement
gprint_val<mytable_2_2_2>
  (_) = gprint("<td class=\"text-center\">mytable_2_2_2</td>")
implement
gprint_val<mytable_2_2_3>
  (_) = gprint("<td class=\"text-center\">mytable_2_2_3</td>")
//
(* ****** ****** *)
//
implement
{}(*tmp*)
gprint_table_row$td_open() =gprintln!("<div>")
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
mytable_2_2_1 = MYTABLE_2_2_1(u)
val
mytable_2_2_2 = MYTABLE_2_2_2(u)
val
mytable_2_2_3 = MYTABLE_2_2_3(u)
//
val
mytable_2_2 =
MYTABLE_2_2(
TABLE_B3_DATA
(
  mytable_2_2_1, mytable_2_2_2, mytable_2_2_3
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

gprint_val
(
MYTABLE(
TABLE_B1_DATA
(
TABLE_ROW_C3_DATA
  (mytable_1, mytable_2, mytable_3)
)
)(* MYTABLE *)
)

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
sys.setrecursionlimit(1000000)
######
#
from libatscc2py_all import *
#
######
%} (* end of [%{^] *)

(* ****** ****** *)

(* end of [midterm-2.dats] *)
