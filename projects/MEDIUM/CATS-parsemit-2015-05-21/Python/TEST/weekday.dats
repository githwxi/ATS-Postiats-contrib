(* ****** ****** *)
//
// HX-2014-08:
// A running example
// from ATS2 to Python3
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2PY}/staloadall.hats"
//
(* ****** ****** *)

datatype
weekday =
  | Monday of ()
  | Tuesday of ()
  | Wednesday of ()
  | Thursday of ()
  | Friday of ()
  | Saturday of ()
  | Sunday of ()
// end of [weekday]

(* ****** ****** *)

fun
isweekend
  (x: weekday): bool =
(
  case+ x of
  | Saturday () => true | Sunday () => true | _ => false 
) (* end of [isweekend] *)

(* ****** ****** *)

extern
fun main0_py (): void = "mac#"

(* ****** ****** *)

implement
main0_py () =
{
  val () = println! ("isweekend(Monday) = ", isweekend(Monday))
  val () = println! ("isweekend(Saturday) = ", isweekend(Saturday))
}

(* ****** ****** *)

%{^
import sys
sys.setrecursionlimit(1000000)
######
from ats2pypre_basics_cats import *
from ats2pypre_integer_cats import *
from ats2pypre_bool_cats import *
from ats2pypre_string_cats import *
from ats2pypre_print_cats import *
######
%} // end of [%{^]

(* ****** ****** *)

%{$
main0_py()
%} // end of [%{$]

(* ****** ****** *)

(* end of [weekday.dats] *)
