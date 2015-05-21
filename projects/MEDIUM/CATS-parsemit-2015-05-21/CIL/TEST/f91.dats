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
extern fun f91 : int -> int = "ext#f91"
//
implement
f91 (x) = if x >= 101 then x - 10 else f91(f91(x+11))
//
(* ****** ****** *)

%{$

.method static public void Main(string[] args) {
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
call int32 int32::Parse(string)
call int32 Postiats.f91::f91(int32)
call void [mscorlib]System.Console::Write(int32)
call void [mscorlib]System.Console::WriteLine()
br IL2

IL1:
ldstr "Usage: f91 <integer>"
call void [mscorlib]System.Console::Write(string)
call void [mscorlib]System.Console::WriteLine()

IL2:
ret
}

%} // end of [%{$]

(* ****** ****** *)

(* end of [f91.dats] *)
