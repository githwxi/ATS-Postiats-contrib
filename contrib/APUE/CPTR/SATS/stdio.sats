(* ****** ****** *)

%{#
//
#include \
"APUE/CPTR/CATS/stdio.cats"
//
%} (* end of [%{#] *)

(* ****** ****** *)

staload "./../basics.sats"

(* ****** ****** *)

absvt0ype FILE = $extype"FILE"

(* ****** ****** *)
//
fun
fopen
(
  path: string, mode: string
) : cPtr0(FILE) = "mac#"
fun
fdopen
(
  fildes: intGte(0), mode: string
) : cPtr0(FILE) = "mac#"
fun
freopen
(
  path: string, mode: string, stream: cPtr1(FILE)
) : cPtr0(FILE) = "mac#"
//
(* ****** ****** *)
               
(* end of [stdio.sats] *)
