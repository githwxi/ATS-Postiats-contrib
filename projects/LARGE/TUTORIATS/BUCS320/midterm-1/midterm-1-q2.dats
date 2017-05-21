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
#define
LIBATSCC2PY3_targetloc
"$PATSHOME\
/contrib/libatscc2py3/ATS2-0.3.2"
//
(* ****** ****** *)
//
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
midterm_1_q2_create(): void = "mac#"
//
(* ****** ****** *)

implement
midterm_1_q2_create() =
{
//
val key = "midterm-1-q2"
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
<h1>BUCASCS320: Midterm-1: Q2</h1>
</center>
") (* gprintln! *)
//
val () =
gprintln!("<hr></hr>\n")
//
val () =
gprintln!("\
<p>
The function
##fun(\"list_prefixes\") returns a list
consisting of all the prefixes of a given list.
For instance, given (0, 1, 2), ##fun(\"list_prefixes\")
returns the following list of lists:
((), (0), (0, 1), (0, 1, 2)). The interface of ##fun(\"list_prefixes\")
is given as follows:
</p>
<p>
<sats2xhtml>//
fun{a:t@ype}
list_prefixes(list0(a)): list0(list0(a))
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
#define
LIBATSCC2JS_targetloc
\"$PATSHOME\\
/contrib/libatscc2js/ATS2-0.3.2\"
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
fun{a:t@ype}
list_prefixes(list0(a)): list0(list0(a))
//
(*
** Please give your implementation as follows:
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
if __name__ == '__main__': midterm_1_q2_create()
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

(* end of [midterm-1-q2.dats] *)
