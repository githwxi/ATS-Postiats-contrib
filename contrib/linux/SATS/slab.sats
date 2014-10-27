(* ****** ****** *)
//
// For applying ATS to
// linux-kernel programming
//
(* ****** ****** *)

%{#
//
#include \
"linux/CATS/slab.cats"
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
kfree
  {l:addr}{n:int}
(
  pfat: b0ytes n @ l, pfgc: kfree_v (l) | ptr l
) :<!wrt> void = "mac#%"

(* ****** ****** *)
//
fun
kmalloc{n:int}
(
  bsz: size_t(n), flags: int
) :<!wrt> [l:addr] (kmalloc_v(n, l) | ptr(l)) = "mac#%"
//
(* ****** ****** *)

(* end of [slab.sats] *)
