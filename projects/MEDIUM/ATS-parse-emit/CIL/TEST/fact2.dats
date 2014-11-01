(* ****** ****** *)
//
// AS-2014-09:
// A running example
// from ATS2 to CIL
//
(* ****** ****** *)
//
#define ATS_DYNLOADFLAG 0
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
extern
fun
fact : double -> double = "ext#fact"
//
implement
fact (n) = let
//
fun loop
(
  n: double, res: double
) : double =
  if n > 0.0 then loop (n-1.0, n*res) else res
//
in
  loop (n, 1.0)
end // end of [fact]

(* ****** ****** *)

%{$

.method static public void Main(string[] args) {
.maxstack 1
.entrypoint

IL0:

ldarg args
ldlen
conv.i4
ldc.i4.1
blt IL1

ldarg args
ldc.i4.0
ldelem.ref
call float64 float64::Parse(string)
call float64 Postiats.fact2::fact(float64)
call void [mscorlib]System.Console::Write(float64)
call void [mscorlib]System.Console::WriteLine()
br IL2

IL1:
ldstr "Usage: fact <integer>"
call void [mscorlib]System.Console::Write(string)
call void [mscorlib]System.Console::WriteLine()

IL2:
ret
} // end of [Main]

%} // end of [%{$]

(* ****** ****** *)

(* end of [fact2.dats] *)
