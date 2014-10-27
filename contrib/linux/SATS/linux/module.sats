(* ****** ****** *)
//
// For applying ATS to
// linux-kernel programming
//
(* ****** ****** *)

%{#
//
#include \
"linux/CATS/linux/module.cats"
//
%} // end of [%{#]

(* ****** ****** *)
//
abstype
module_ptr(l:addr) = ptr(l)
abst@ype
module_struct = $extype"module_struct"
//
typedef module_ptr0 = [l:agez] module_ptr(l)
typedef module_ptr1 = [l:addr | l > null] module_ptr(l)
//
(* ****** ****** *)

(* end of [module.sats] *)
