(* ****** ****** *)

%{#
//
#include \
"APUE/CPTR/CATS/unistd.cats"
//
%} (* end of [%{#] *)

(* ****** ****** *)

staload "./../basics.sats"

(* ****** ****** *)
//
fun
close(fd: fildes): interr = "mac#"
//
(* ****** ****** *)
//
(*
ssize_t
read(int fd, void *buf, size_t nbt);
*)
fun
read
{n1,n2:int|n1 >= n2}
( fd0
: fildes
, buf
: ap2tr(byte, n1)
, nbt: size_t(n2)): ssizeLte(n2) = "mac#"
//
(* ****** ****** *)

(* end of [unistd.sats] *)
