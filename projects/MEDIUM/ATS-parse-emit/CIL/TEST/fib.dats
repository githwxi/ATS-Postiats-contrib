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
fun
fib : int -> int = "ext#fib"
//
implement
fib (n) = let
//
fun aux (ff: '(int, int), n: int): int =
  if n > 0 then aux ( '(ff.1, ff.0 + ff.1), n-1 ) else ff.0
//
in
  aux ( '(0, 1), n )
end // end of [fib]
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
call int32 Postiats.fib::fib(int32)
call void [mscorlib]System.Console::Write(int32)
call void [mscorlib]System.Console::WriteLine()
br IL2

IL1:
ldstr "Usage: fib <integer>"
call void [mscorlib]System.Console::Write(string)
call void [mscorlib]System.Console::WriteLine()

IL2:
ret
} // end of [Main]

%} // end of [%{$]

(* ****** ****** *)

(* end of [fib.dats] *)
