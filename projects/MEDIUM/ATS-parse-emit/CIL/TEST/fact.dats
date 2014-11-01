(* ****** ****** *)
//
// AS-2014-09:
// A running example
// from ATS2 to CIL
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2CIL}/staloadall.hats"
//
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "fact_dynload"
//
(* ****** ****** *)
//
extern
fun fact : int -> int = "ext#fact"
//
implement
fact (n) = if n > 0 then n * fact(n-1) else 1
//
(* ****** ****** *)
//
val N = 10
val () = println! ("fact(", N, ") = ", fact(N))
//
(* ****** ****** *)

%{^

// TODO: include IL files for arithmetic, etc.?

%} // end of [%{^]

(* ****** ****** *)

%{$

.method static public void Main() {
.maxstack 1
.entrypoint
call void Postiats.fact::fact_dynload()
ret
} // end of [Main]

%} // end of [%{$]

(* ****** ****** *)

(* end of [fact.dats] *)