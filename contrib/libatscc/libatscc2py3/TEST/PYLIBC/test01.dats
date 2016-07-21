(* ****** ****** *)
//
// Trying libatscc2py/PYLIBC
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Starting time: May 23, 2016
//
(* ****** ****** *)
//
(*
#include
"share/atspre_define.hats"
*)
//
#include"./../../staloadall.hats"
//
(* ****** ****** *)
//
staload "./../../SATS/PYLIBC/datetime.sats"
//
(* ****** ****** *)
//
extern
fun
test01_main
(
// argless
) : void = "mac#"
//
(* ****** ****** *)

implement
test01_main() =
{
//
val today = date_today()
val ((*void*)) = println! ("today.ctime() = ", today.ctime())
val ((*void*)) = println! ("today.weekday() = ", today.weekday())
val ((*void*)) = println! ("today.isoweekday() = ", today.isoweekday())
//
val today = datetime_today()
val ((*void*)) = println! ("today.ctime() = ", today.ctime())
//
} (* end of [test01_main] *)

(* ****** ****** *)

%{^
######
from libatscc2py_all import *
######
from ats2pylibc_datetime_cats import *
######
sys.setrecursionlimit(1000000)
%} // end of [%{^]

(* ****** ****** *)

%{$
if __name__ == '__main__': test01_main()
%} // end of [%{$]

(* ****** ****** *)

(* end of [test01.dats] *)
