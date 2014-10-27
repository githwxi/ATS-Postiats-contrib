(* ****** ****** *)
//
// For applying ATS to
// linux-kernel programming
//
(* ****** ****** *)

%{#
//
#include \
"linux/CATS/cdev.cats"
//
%} // end of [%{#]

(* ****** ****** *)

#define
ATS_EXTERN_PREFIX "atslxkrnl_"

(* ****** ****** *)

staload "./types.sats"

(* ****** ****** *)
//
abstype
cdev_ptr(l:addr) = ptr(l)
abst@ype
cdev_struct = $extype"cdev_struct"
//
typedef cdev_ptr0 = [l:agez] cdev_ptr(l)
typedef cdev_ptr1 = [l:addr | l > null] cdev_ptr(l)
//
(* ****** ****** *)

(* end of [cdev.sats] *)
