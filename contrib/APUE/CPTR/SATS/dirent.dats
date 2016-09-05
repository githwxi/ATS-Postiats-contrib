(*
**
*)
(* ****** ****** *)

%{#
//
#include <dirent.h>
//
typedef
struct dirent
struct_dirent;
//
%} (* end of [%{#] *)

(* ****** ****** *)

staload "./../basics.sats"

(* ****** ****** *)
//
abst@ype DIR = $extype"DIR"
//
abst@ype dirent = $extype"struct_dirent"
//
(* ****** ****** *)
//
fun
opendir
(
  name: cPtr1(char)
) : cPtr0(DIR) = "mac#"
//
fun
fdopendir(fd: int): cPtr0(DIR) = "mac#"
//        
(* ****** ****** *)

(* end of [dirent.sats] *)
