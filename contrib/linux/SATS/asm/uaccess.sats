(* ****** ****** *)
//
// For applying ATS to
// linux-kernel programming
//
(* ****** ****** *)

%{#
//
#include \
"linux/CATS/asm/uaccess.cats"
//
%} // end of [%{#]

(* ****** ****** *)

#define
ATS_EXTERN_PREFIX "atslxkrnl_"

(* ****** ****** *)
//
staload
"./../../basics.sats"
//
staload "./../types.sats"
//
(* ****** ****** *)

typedef interr = intLte(0)

(* ****** ****** *)
//
fun
copy_to_user_unsafe
  (to: uPtr1, from: Ptr1, count: ulint): ulint = "mac#%"
fun
copy_from_user_unsafe
  (to: uPtr1, from: Ptr1, count: ulint): ulint = "mac#%"
//
(* ****** ****** *)

(* end of [uaccess.sats] *)
