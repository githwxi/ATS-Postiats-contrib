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
extern
fun acker : (int, int) -> int = "ext#acker"
//
implement
acker (m, n) =
(
case+
  (m, n) of 
| (0, _) => n + 1
| (_, 0) => acker(m-1, 1)
| (_, _) => acker(m-1, acker(m, n-1)) 
)
//
(* ****** ****** *)

%{$

.method static public void Main(string[] args) {
.entrypoint

IL0:
ldarg args
ldlen
conv.i4
ldc.i4 2
blt IL1

ldarg args
ldc.i4.0
ldelem.ref
call int32 int32::Parse(string)

ldarg args
ldc.i4.1
ldelem.ref
call int32 int32::Parse(string)

call int32 Postiats.acker::acker(int32, int32)
call void [mscorlib]System.Console::Write(int32)
call void [mscorlib]System.Console::WriteLine()
br IL2

IL1:
ldstr "Usage: acker <integer> <integer>"
call void [mscorlib]System.Console::Write(string)
call void [mscorlib]System.Console::WriteLine()

IL2:
ret

}

%} // end of [%{$]

(* ****** ****** *)

(* end of [acker.dats] *)
