(* ****** ****** *)
//
// For applying ATS to
// linux-kernel programming
//
(* ****** ****** *)

%{#
//
#include \
"linux/CATS/linux/kdev_t.cats"
//
%} // end of [%{#]

(* ****** ****** *)

#define
ATS_EXTERN_PREFIX "atslxkrnl_"

(* ****** ****** *)

staload "./types.sats"

(* ****** ****** *)

fun MAJOR (dev_t): uint = "mac#%"
fun MINOR (dev_t): uint = "mac#%"

(* ****** ****** *)

fun MKDEV (major: intGte(0), minor: intGte(0)): dev_t

(* ****** ****** *)

(* end of [kdev_t.sats] *)
