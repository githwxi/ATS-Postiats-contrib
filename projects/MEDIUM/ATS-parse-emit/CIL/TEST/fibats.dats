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
dataprop FIB (int, int) =
  | FIB0 (0, 0) | FIB1 (1, 1)
  | {n:nat} {r0,r1:int}
    FIB2 (n+2, r0+r1) of (FIB (n, r0), FIB (n+1, r1))
// end of [FIB]
//
(* ****** ****** *)
//
extern
fun
fibats 
  : {n:nat} int(n) -> [r:int] (FIB(n,r) | int(r)) = "ext#"
//
implement
fibats{n}(n) = let
//
fun loop
  {i:nat | i <= n}{r0,r1:int} .<n-i>.
(
  pf0: FIB (i, r0)
, pf1: FIB (i+1, r1)
| ni: int (n-i), r0: int r0, r1: int r1
) : [r:int] (FIB (n, r) | int r) =
(
  if ni > 0 then
    loop {i+1} (pf1, FIB2 (pf0, pf1) | ni - 1, r1, r0 + r1)
  else (pf0 | r0)
) (* end of [loop] *)
//
in
  loop {0} (FIB0 (), FIB1 () | n, 0, 1)
end // end of [fibats]
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
call int32 Postiats.fibats::fibats(int32)
call void [mscorlib]System.Console::Write(int32)
call void [mscorlib]System.Console::WriteLine()
br IL2

IL1:
ldstr "Usage: fibats <integer>"
call void [mscorlib]System.Console::Write(string)
call void [mscorlib]System.Console::WriteLine()

IL2:
ret

}

%} // end of [%{$]

(* ****** ****** *)

(* end of [fibats.dats] *)
