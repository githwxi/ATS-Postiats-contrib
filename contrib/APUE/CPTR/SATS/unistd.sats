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
close(fd: int): interr
//
(* ****** ****** *)
//
(*
ssize_t
read(int fd, void *buf, size_t nbytes);
*)
fun
read
{n1,n2:int|n1 >= n2}
(
  fd: int, buf: caPtr1(byte, n1), nbytes: size_t(n2)
) : ssizeLte(n2) = "mac#"
//
(* ****** ****** *)

(* end of [unistd.sats] *)
