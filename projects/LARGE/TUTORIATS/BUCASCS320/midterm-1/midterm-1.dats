(* ****** ****** *)
//
// HX: 2016-08-03:
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
midterm_1_create(): void = "mac#"
//
(* ****** ****** *)

implement
midterm_1_create() =
{
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
gprintln!
("\
<div class=\"col-md-2\"></div>\
")
//
val () =
gprintln!
("\
<div class=\"col-md-8\">
<center>
<h1>BUCASCS320: Midterm-1</h1>
</center>
") (* gprintln! *)
//
val () =
gprintln!
("\
<p
 style=\"text-align:left\">
There are 10 questions in this exam.
You may assume that each program is
<em>syntactically</em> correct unless specified otherwise.  Assume a question
Q is assigned X points.
<ul
 style=\"text-align:left\">
<li>
If you answer Q correctly, you receive X points.
</li>
<li>
If you answer Q incorrectly, you receive 0 points.
</li>
<li>
If you do not answer Q, you receive X/5 points.
</li>
</ul>
</p>
<p
 style=\"text-align:left\">
Please read a question carefully before answering it.
</p>
") (* gprintln! *)
//
val () =
gprintln!
("\
<center>
<table
 class=\"table\"
 width=\"50%\">
<thead>
<tr>
<th class=\"text-left\">No.</th>
<th class=\"text-center\">Points</th>
<th class=\"text-center\">Score</th>
</tr>
</thead>
<tbody>
<tr>
<td>Q1</td><td class=\"text-center\">10</td><td></td>
</tr>
<tr>
<td>Q2</td><td class=\"text-center\">10</td><td></td>
</tr>
<tr>
<td>Total</td><td class=\"text-center\">20</td><td></td>
</tr>
</tbody>
</table>
</center>
")
//
val () = gprintln!
("\
<h2>Question 1</h2>
<p>
A list is a sublist of another list if the former can be obtained from
removing some elements in the latter. For instance, [1,3,5] is a sublist
of [1,2,3,4,5] but [1,1] is not a sublist of [1,2,3].
Given two lists [xs] and [ys], the function sublist_test(xs, ys) returns
true if and only if [ys] is a sublist of [xs]. The interface for sublist_test
is given as follows:
<sats2xhtml>//
fun sublist_test(xs: list0(int), ys: list0(int)): bool
//</sats2xhtml>
</p>
") (* end of [gprintln!] *)
//
val () = gprintln!
("\
<h2>Question 2</h2>
") (* end of [gprintln!] *)
//
val () = gprintln!
("\
<h2>
Academic Integrity
</h2>
<p
 style=\"text-align:left\">
We adhere strictly to the standard BU guidelines for academic
integrity. For this course, it is perfectly acceptable for you to
discuss the general concepts and principles behind an assignment with
other students. However, it is not proper, without prior authorization
of the instructor, to arrive at collective solutions. In such a case,
each student is expected to develop, write up and hand in an
individual solution and, in doing so, gain a sufficient understanding
of the problem so as to be able to explain it adequately to the
instructor (if asked). Under no circumstances should a student copy,
partly or wholly, the completed solution of another student.
</p>
") (* end of [gprintln!] *)
//
val () = gprintln!("</div><!--col-md-8-->")
//
val () = gprintln!("<div class=\"col-md-2\"></div>")
//
val () = gprintln!("</div><!--row-->")
//
val () = gprintln!("</div><!--containier-fluid-->")
//
val () =
gprintln!("<hr></hr>")
//
//
val () =
gprintln!("\
<script>
$(document).ready(function(){pats2xhtmlize_process_all();return;});
</script>\
") (* gprintln! *)
//
val () = gprintln!("</body>")
val () = gprintln!("</html>")
//
} (* midterm_1_create *)

(* ****** ****** *)

%{$
//
if __name__ == '__main__': midterm_1_create()
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

(* end of [midterm-1.dats] *)
