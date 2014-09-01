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
staload
"{$LIBATSCC2PY}/basics_py.sats"
staload
"{$LIBATSCC2PY}/SATS/integer.sats"
staload
"{$LIBATSCC2PY}/SATS/string.sats"
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
}

(* ****** ****** *)

%{^
import sys
######
from basics_cats import *
from integer_cats import *
from string_cats import *
######
sys.setrecursionlimit(1000000)
%} // end of [%{^]

(* ****** ****** *)

%{$
main0_py()
%} // end of [%{$]

(* ****** ****** *)

(* end of [weekday.dats] *)
