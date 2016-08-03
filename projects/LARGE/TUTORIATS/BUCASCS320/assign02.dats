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

implement
assign02_create() =
{
//
implement
gprint_string<>
  (x0) = print_string(x0)
//
implement
gprint_newline<> = print_newline
//
val () = PAGENassign_html()
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
