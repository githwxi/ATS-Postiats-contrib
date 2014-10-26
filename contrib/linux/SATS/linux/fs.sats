(* ****** ****** *)
//
// For applying ATS to
// linux-kernel programming
//
(* ****** ****** *)

%{#
//
#include \
"linux/CATS/linux/fs.cats"
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

fun
register_chrdev_region
(
  first: dev_t, count: uint, name: string
) : interr = "mac#%" // end-of-function

(* ****** ****** *)

(* end of [fs.sats] *)
