(* ****** ****** *)
//
// AS-2014-10:
// A running example
// from ATS2 to CIL
//
(* ****** ****** *)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#include
"{$LIBATSCC2CIL}/staloadall.hats"
//
(* ****** ****** *)

typedef I (a:t@ype) = a -<cloref1> a

(* ****** ****** *)

fn{a:t0p}
twice (f: I(a)):<cloref> I(a) = lam (x) => f (f (x))

(* ****** ****** *)

typedef I0 = int
typedef I1 = I(I0)
typedef I2 = I(I1)
typedef I3 = I(I2)

(* ****** ****** *)
//
extern
fun
main_cil (): void = "ext#main_cil"
//
implement
main_cil () =
{
val Z = 0
val S = lam (x: int): int =<cloref1> x + 1
//
val ans0 = twice<I0>(S)(Z)
val ((*void*)) = println! ("ans0(2) = ", ans0)
//
val ans1 = twice<I1>(twice<I0>)(S)(Z)
val ((*void*)) = println! ("ans1(4) = ", ans1)
//
val ans2 = twice<I2>(twice<I1>)(twice<I0>)(S)(Z)
val ((*void*)) = println! ("ans2(16) = ", ans2)
//
val ans3 = twice<I3>(twice<I2>)(twice<I1>)(twice<I0>)(S)(Z)
val ((*void*)) = println! ("ans3(65536) = ", ans3)
//
} (* end of [main_cil] *)

(* ****** ****** *)

%{$

.method static public void Main() {
.entrypoint

call void Postiats.twice::main_cil()

ret
} // end of [Main]

%} // end of [%{$]

(* ****** ****** *)

(* end of [twice.dats]  *)
