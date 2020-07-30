(* ****** ****** *)

%{#
//
#include \
"APUE/CPTR/CATS/fcntl.cats"
//
%} (* end of [%{#] *)

(* ****** ****** *)
//
#staload "./../basics.sats"
//
(* ****** ****** *)

#staload "./sys/types.sats"

(* ****** ****** *)
//
(*
int
creat
(const char *path, mode_t mode);
*)
//
fun
creat
( path: string
, mode: mode_t): interr = "mac#"
//
(* ****** ****** *)

(* end of [fcntl.sats] *)
