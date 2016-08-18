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
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./PAGEN-midterm.dats"
//
(* ****** ****** *)
//
extern
fun
midterm_1_q3_create(): void = "mac#"
//
(* ****** ****** *)

implement
midterm_1_q3_create() =
{
//
val key = "midterm-1-q3"
//
implement
gprint_string<>
  (x0) = print_string(x0)
//
implement
gprint_newline<> = print_newline
//
val () =
gprintln!("<!DOCTYPE html>")
//
val () = gprintln!("<html>")
//
val () = PAGENmidterm_head()
//
val () = gprintln!("<body>")
//
val () =
gprintln!
("\
<div
 class=\"container-fluid\">\
") (* gprintln! *)
//
val () =
gprintln!("<div class=\"row\">")
//
val () =
gprintln!("<div class=\"col-md-1\"></div>")
//
val () =
gprintln!
("\
<div class=\"col-md-10\">
<center>
<h1>BUCASCS320: Midterm-1: Q3</h1>
</center>
") (* gprintln! *)
//
val () =
gprintln!("<hr></hr>\n")
//
val () =
gprintln!("\
<p>
Given a list ##arg(xs) of integers, the function
##fun(\"mylist_submaxord\") returns the longest leftmost
subsequence of ##arg(xs) that is ordered.
For instance,
if ##arg(xs) is (1, 3, 2, 4), then the result is (1, 3, 4);
if ##arg(xs) is (4, 1, 2, 3, 8, 9, 5, 6, 7), then the result
is (1, 2, 3, 5, 6, 7). The interface for ##fun(\"list_submaxord\")
is given as follows:
</p>
<p>
<sats2xhtml>//
fun
list_submaxord(xs: list0(int)): list0(int)
//</sats2xhtml>
</p>
") (* end of [gprintln!] *)
//
val () =
PAGENmidterm_source_table
(
key
,
"\
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME \"my_dynload\"
//
#include
\"share/atspre_define.hats\"
#include
\"{$LIBATSCC2JS}/staloadall.hats\"
//
staload
\"{$LIBATSCC2JS}/SATS/print.sats\"
//
%{$
//
ats2jspre_the_print_store_clear();
my_dynload();
alert(ats2jspre_the_print_store_join());
//
%} // end of [%{$]
//
#define :: list0_cons
//
extern
fun
list_submaxord(xs: list0(int)): list0(int)
//
(*
** Please add your code below this comment:
*)
//\
"
) (* PAGENmidterm_source_table *)
//
val () =
gprintln!("<hr></hr>")
//
val () =
gprintln!("\
<p>
The Python3 code generating this page is prepared with atscc2py3.
</p>
") (* gprintln! *)
//
val () = gprintln!("</div><!--col-md-10-->")
//
val () = gprintln!("<div class=\"col-md-1\"></div>")
//
val () = gprintln!("</div><!--row-->")
//
val () = gprintln!("</div><!--containier-fluid-->")
//
val () =
gprintln!("\
<script
 src=\"https://ats-lang.github.io/LIBRARY/libtutoriats/libtutoriats_assign02_patsopt_services_dats.js\">
</script>
<script>
$(document).ready(function(){pats2xhtmlize_process_all();return;});
$(document).ready(function(){assign02_patsopt_services_initize(\"")(key)("\");return;});
</script>\
") (* gprintln! *)
//
val () = gprintln!("</body>")
val () = gprintln!("</html>")
//
} (* end of [assign02_create] *)

(* ****** ****** *)

%{$
//
if __name__ == '__main__': midterm_1_q3_create()
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

(* end of [midterm-1-q3.dats] *)
