(*
** Some testing code for real.sats
*)

(* ****** ****** *)

staload "./../SATS/real.sats"

(* ****** ****** *)
//
(*
A*x*x + B*x + C =
A*(x+2*B/A)*(x+2*B/A)-(B*B-4*A*C)/(4*A*A)
*)
//
extern
fun
lemma_quadratic_equation
{ A,B,C:real
| A != i2r(0);
  B*B - i2r(4)*A*C >= i2r(0)
} (): [x:real | A*x*x + B*x + C == i2r(0)] ()
//
(* ****** ****** *)

(* end of [test01.dats] *)
