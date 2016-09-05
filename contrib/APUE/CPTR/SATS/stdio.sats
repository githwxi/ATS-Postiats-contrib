(*
**
*)
(* ****** ****** *)

%{#
//
#include <stdio.h>
//
%} (* end of [%{#] *)

(* ****** ****** *)

staload "./../basics.sats"

(* ****** ****** *)

absvt0ype FILE = $extype"FILE"

(* ****** ****** *)
//
fun
fopen(path: string, mode: string): cPtr0(FILE)
fun
fdopen(fildes: int, mode: string): cPtr0(FILE)
fun
freopen(path: string, mode: string, stream: cPtr1(FILE)): cPtr0(FILE)
//
(* ****** ****** *)
               
(* end of [stdio.sats] *)
