(*
** For reasoning
** about real numbers
*)

(* ****** ****** *)

datasort real = (* abstract *)

(* ****** ****** *)

stacst neg_real : (real) -> real

(* ****** ****** *)

stacst
add_real_real : (real, real) -> real
stacst
sub_real_real : (real, real) -> real
stacst
mul_real_real : (real, real) -> real
stacst
div_real_real : (real, real) -> real

(* ****** ****** *)

stadef ~ = neg_real
stadef + = add_real_real
stadef - = sub_real_real
stadef * = mul_real_real
stadef / = div_real_real

(* ****** ****** *)

stacst real_of_int : (int) -> real
stacst real_of_float : (float) -> real

(* ****** ****** *)

stadef i2r = real_of_int
stadef f2r = real_of_float

(* ****** ****** *)

stacst
lt_real_real : (real, real) -> bool
stacst
lte_real_real : (real, real) -> bool
stacst
gt_real_real : (real, real) -> bool
stacst
gte_real_real : (real, real) -> bool
stacst
eq_real_real : (real, real) -> bool
stacst
neq_real_real : (real, real) -> bool

(* ****** ****** *)

stadef < = lt_real_real
stadef <= = lte_real_real
stadef > = gt_real_real
stadef >= = gte_real_real
stadef == = eq_real_real
stadef != = neq_real_real

(* ****** ****** *)

(* end of [real.sats] *)
