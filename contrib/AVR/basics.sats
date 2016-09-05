(* ****** ****** *)
//
// For applying ATS
// to AVR programming
//
(* ****** ****** *)
//
abstype
register_type(int) =
$extype"voilatile_voidptr"
//
typedef
reg(n:int) = register_type(n)
//
typedef reg8 = reg(8)
typedef reg16 = reg(16)
typedef reg32 = reg(32)
//
(* ****** ****** *)
//
prfun
lemma_register_param{n:int}(reg(n)): [n >= 0] void
//
(* ****** ****** *)

(* end of [basics.sats] *)
