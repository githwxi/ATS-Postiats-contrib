(* ****** ****** *)
//
// For applying ATS to
// linux-kernel programming
//
(* ****** ****** *)

%{#
//
#include \
"linux/CATS/fs.cats"
//
%} // end of [%{#]

(* ****** ****** *)

#define
ATS_EXTERN_PREFIX "atslxkrnl_"

(* ****** ****** *)

staload "./types.sats"

(* ****** ****** *)

typedef interr = intLte(0)

(* ****** ****** *)
//
abstype
file_ptr(l:addr) = ptr(l)
abst@ype
file_struct = $extype"file_struct"
//
typedef file_ptr0 = [l:agez] file_ptr(l)
typedef file_ptr1 = [l:addr | l > null] file_ptr(l)
//
(* ****** ****** *)
//
abstype
dentry_ptr(l:addr) = ptr(l)
abst@ype
dentry_struct = $extype"dentry_struct"
//
typedef dentry_ptr0 = [l:agez] dentry_ptr(l)
typedef dentry_ptr1 = [l:addr | l > null] dentry_ptr(l)
//
(* ****** ****** *)
//
abstype
inode_ptr(l:addr) = ptr(l)
abst@ype
inode_struct = $extype"inode_struct"
//
typedef inode_ptr0 = [l:agez] inode_ptr(l)
typedef inode_ptr1 = [l:addr | l > null] inode_ptr(l)
//
(* ****** ****** *)

fun imajor (inode_ptr1): uint = "mac#%"
fun iminor (inode_ptr1): uint = "mac#%"

(* ****** ****** *)

fun
alloc_chrdev_region
(
  dev: &dev_t? >> _
, firstminor: uint, count: uint, name: string
) : interr = "mac#%" // end-of-function

(* ****** ****** *)

fun
register_chrdev_region
(
  first: dev_t, count: uint, name: string
) : interr = "mac#%" // end-of-function

(* ****** ****** *)

fun
unregister_chrdev_region
  (first: dev_t, count: uint): void = "mac#%"
// end of [unregister_chrdev_region]

(* ****** ****** *)

(* end of [fs.sats] *)
