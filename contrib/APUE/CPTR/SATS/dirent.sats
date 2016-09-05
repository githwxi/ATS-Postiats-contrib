(* ****** ****** *)

%{#
//
#include \
"APUE/CPTR/CATS/dirent.cats"
//
%} (* end of [%{#] *)

(* ****** ****** *)

staload "./../basics.sats"

(* ****** ****** *)
//
absvt0ype DIR = $extype"DIR"
//
absvt0ype dirent = $extype"struct_dirent"
//
(* ****** ****** *)
//
fun
dirent_get_d_name
  (ent: cPtr1(dirent)): string = "mac#"
//
overload .d_name with dirent_get_d_name
//
(* ****** ****** *)
//
fun
opendir(name: string): cPtr0(DIR) = "mac#"
//
(* ****** ****** *)
//
fun
fdopendir(fildes: int): cPtr0(DIR) = "mac#"
//        
(* ****** ****** *)

fun
closedir(dirp: cPtr0(DIR)): interr = "mac#"
 
(* ****** ****** *)
//
fun
readdir
  (dirp: cPtr1(DIR)): cPtr0(dirent) = "mac#"
//
fun
readdir_r
(
  dirp: cPtr1(DIR)
, entry: cPtr1(dirent), result: cPPtr10(dirent)
) : interr = "mac#" // end of [readdir_r]
//          
(* ****** ****** *)

(* end of [dirent.sats] *)
