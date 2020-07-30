(* ****** ****** *)

%{#
//
#include \
"APUE/CATS/dirent.cats"
//
%} (* end of [%{#] *)

(* ****** ****** *)

staload "./../basics.sats"

(* ****** ****** *)
//
abstflt
DIR_t0 = $extype"DIR"
typedef DIR = DIR_t0
typedef DIR_ptr0 = p2tr0(DIR)
typedef DIR_ptr1 = p2tr1(DIR)
//
abstflt
dirent_t0 =
$extype"struct_dirent"
typedef dirent = dirent_t0
typedef dirent_ptr0 = p2tr0(dirent)
typedef dirent_ptr1 = p2tr1(dirent)
typedef dirent_cptr1 = cp2tr1(dirent)
//
(* ****** ****** *)
//
fun
dirent_get_d_name
( ent
: dirent_cptr1): string = "mac#"
//
overload
.d_name with dirent_get_d_name
//
(* ****** ****** *)
//
fun
opendir
(nm: string): DIR_ptr0 = "mac#"
//
(* ****** ****** *)
//
fun
fdopendir
(fd: fildes): DIR_ptr0 = "mac#"
//        
(* ****** ****** *)

fun
closedir
(dirp: DIR_ptr0): interr = "mac#"
 
(* ****** ****** *)
//
fun
readdir
( dirp
: DIR_ptr1): dirent_ptr0 = "mac#"
//
fun
readdir_r
( dirp
: p2tr1(DIR)
, entry
: p2tr1(dirent)
, result
: p2tr1(dirent_ptr0)): interr = "mac#"
//          
(* ****** ****** *)

(* end of [dirent.sats] *)
