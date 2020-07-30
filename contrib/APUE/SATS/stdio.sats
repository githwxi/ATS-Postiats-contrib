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
abstflt
FILE_t0 = $extype"FILE"
typedef FILE = FILE_t0
(* ****** ****** *)
//
fun
fopen
(
  path: string, mode: string
) : ptr0(FILE) = "mac#"
fun
fdopen
(
  fdes: fildes, mode: string
) : ptr0(FILE) = "mac#"
fun
freopen
(
  path: string, mode: string, stream: ptr1(FILE)
) : ptr0(FILE) = "mac#"
//
(* ****** ****** *)
               
(* end of [stdio.sats] *)
