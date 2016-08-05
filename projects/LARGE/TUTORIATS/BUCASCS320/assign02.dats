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
staload "./PAGEN-assign.dats"
//
(* ****** ****** *)
//
extern
fun
assign02_create(): void = "mac#"
//
(* ****** ****** *)
//
implement
{}(*tmp*)
PAGENassign_title
  (key) =
{
//
val () =
gprintln! ("\
<title>BUCASCS320-")(key)("</title>\
") (* gprintln! *)
//
} (* PAGENassign_title *)
//
(* ****** ****** *)

implement
{}(*tmp*)
PAGENassign_body_top
  (key) =
{
//
val () =
gprintln! ("\
<h1>Assignment #2</h1>
") (* gprintln! *)
//
} (* end of [PAGENassign_body_top] *)

(* ****** ****** *)

implement
PAGENassign_descript<>
  (key) =
{
//
val () =
gprintln!("\
<p>
The following function ##fun(\"fib\")
computes Fibonacci numbers:

<p></p>

<div>
<dats2xhtml>//
fun
fib(n: int): int =
  if n >= 2 then fib(n-1) + fib(n-2) else n
//</dats2xhtml>
</div>

<p></p>

Clearly, ##fun(\"fib\") is recursive but not tail-recursive:
Neither of the two recursive calls in the body of ##fun(\"fib\")
is a tail-call. Please give a tail-recursive implementation
of ##fun(\"fib_trec\") that also computes Fibonacci numbers:

<p></p>

<div>
<sats2xhtml>//
fun fib_trec(n: int): int
//</sats2xhtml>
</div>

</p>
") (* gprintln! *)
//
} (* end of [PAGENassign_descript] *)

(* ****** ****** *)
//
implement
PAGENassign_descript2<>
  (key) =
{
//
val () =
gprintln!("<hr></hr>")
//
val () =
gprintln!("\
Please do your implementation in the following window:<br>
") (* gprintln! *)
//
val () =
PAGENassign_source_table
(
"assign02"
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
extern
fun
fib_trec (n: int): int
//
val () = println! (\"fib_trec(10) = \", fib_trec(10))
val () = println! (\"fib_trec(20) = \", fib_trec(20))
//
(*
** Please add your code below this comment:
*)
//\
"
) (* PAGENassign_source_table *)
//
} (* end of [PAGENassign_descript2] *)
//
(* ****** ****** *)

implement
PAGENassign_descript3<>
  (key) =
{
//
val () =
gprintln!("\
<hr></hr>
<p>
The functionalities of the above buttons
can be briefly described as follows:
</p>\
") (* gprintln! *)
//
val () =
gprintln!("\
<ul>
<li> Patsopt-tc: for typechecking ATS code.
<li> Patsopt-cc: for typechecking and compiling ATS code to C.
<li> Patsopt-cc2js: for compiling ATS code to JS and then evaluating the JS code.
<li> Pats2xhtml-toggle: for syntax-hiliting ATS code and adding/removing line numbers.
</ul>\
") (* gprintln! *)
//
} (* end of [PAGENassign_descript3] *)

(* ****** ****** *)

implement
assign02_create() =
{
//
val key = "assign02"
//
implement
gprint_string<>
  (x0) = print_string(x0)
//
implement
gprint_newline<> = print_newline
//
val () = PAGENassign_html(key)
//
} (* end of [assign02_create] *)

(* ****** ****** *)

%{$
//
if __name__ == '__main__': assign02_create()
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

(* end of [assign02.dats] *)
