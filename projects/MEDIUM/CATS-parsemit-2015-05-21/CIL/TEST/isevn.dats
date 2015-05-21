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
fnx isevn_ (n: int): bool =
  if n > 0 then isodd_(n-1) else true
and isodd_ (n: int): bool =
  if n > 0 then isevn_(n-1) else false
//
(* ****** ****** *)
//
extern
fun isevn
  : (int) -> bool = "ext#isevn"
extern
fun isodd
  : (int) -> bool = "ext#isodd"
//
implement isevn (x) = isevn_(x)
implement isodd (x) = if x > 0 then isevn_(x-1) else false
//
(* ****** ****** *)

%{$

.method static public void Main(string[] args) {
.entrypoint
.locals (int32 tmp0)

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
stloc tmp0

ldloc tmp0
call int8 Postiats.isevn::isevn(int32)
call void [mscorlib]System.Console::Write(int32)
call void [mscorlib]System.Console::WriteLine()

ldloc tmp0
call int8 Postiats.isevn::isodd(int32)
call void [mscorlib]System.Console::Write(int32)
call void [mscorlib]System.Console::WriteLine()

br IL2

IL1:
ldstr "Usage: isevn <integer>"
call void [mscorlib]System.Console::Write(string)
call void [mscorlib]System.Console::WriteLine()

IL2:
ret
}

%} // end of [%{$]

(* ****** ****** *)

(* end of [isevn.dats] *)
