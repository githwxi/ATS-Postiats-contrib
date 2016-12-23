(* ****** ****** *)

%{#
//
#include \
"libcats/CATS/stdio.cats"
//
%} (* end of [%{#] *)

(* ****** ****** *)

staload "./../basics.sats"

(* ****** ****** *)

absvt0ype FILE = $extype"FILE"

(* ****** ****** *)

typedef fildes = [i:int | i >= 0] int(i)

(* ****** ****** *)
//
fun
fopen
(path: string, mode: string): wptr0(FILE) = "mac#"
fun
fdopen
(fild: fildes, mode: string): wptr0(FILE) = "mac#"
fun
freopen
(path: string, mode: string, filp: wptr1(FILE)): wptr0(FILE) = "mac#"
//
(* ****** ****** *)
//
fun
fclose(filp: wptr1(FILE)): interr = "mac#"
//
(* ****** ****** *)
//
fun
fileno(filp: wptr1(FILE)): interr = "mac#"
//
(* ****** ****** *)

fun
fgetc(finp: wptr1(FILE)):<!wrt> interr = "mac#"

(* ****** ****** *)
//
fun
fgets
{n1:int;n2:nat|n1 >= n2}
(buf: wptrn1(byte, n1), n2: int(n2), finp: wptr1(FILE)): ptr0 = "mac#"
//
(* ****** ****** *)

(* end of [stdio.sats] *)
