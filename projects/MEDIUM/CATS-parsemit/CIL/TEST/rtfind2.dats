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
rtfind (f: int -> int): int = "ext#rtfindf"
//
implement
rtfind (f) = let
//
fun loop
  (i: int): int =
  if f (i) = 0 then i else loop (i+1)
//
in
  loop (0(*i*))
end // end of [rtfind]

(* ****** ****** *)

%{$

.method static public int32 poly0(int32 x) cil managed {
//poly0 = lambda x: x*x + x - 6
  .locals (int32 tmp0, int32 tmp1, int32 tmp2)

  ldarg x
  ldarg x
  mul
  stloc tmp0
  
  ldloc tmp0
  ldarg x
  add
  stloc tmp1
  
  ldloc tmp1
  ldc.i4 6
  sub
  stloc tmp2
  
  ldloc tmp2
  ret 
}
.method static public int32 poly1(int32 x) cil managed {
//poly1 = lambda x: x*x - x - 6
  .locals (int32 tmp0, int32 tmp1, int32 tmp2)

  ldarg x
  ldarg x
  mul
  stloc tmp0
  
  ldloc tmp0
  ldarg x
  sub
  stloc tmp1
  
  ldloc tmp1
  ldc.i4 6
  sub
  stloc tmp2
  
  ldloc tmp2
  ret
}
.method static public int32 poly2(int32 x) cil managed {
//poly2 = lambda x: x*x + 2*x - 99
  .locals (int32 tmp0, int32 tmp1, int32 tmp2, int32 tmp3)
  ldarg x
  ldarg x
  mul
  stloc tmp0

  ldc.i4 2
  ldarg x
  mul
  stloc tmp1

  ldloc tmp0
  ldloc tmp1
  add
  stloc tmp2

  ldloc tmp2
  ldc.i4 99
  sub
  stloc tmp3

  ldloc tmp3
  ret
}
.method static public int32 poly3(int32 x) cil managed {
//poly3 = lambda x: x*x - 2*x - 99
  .locals (int32 tmp0, int32 tmp1, int32 tmp2, int32 tmp3)

  ldarg x
  ldarg x
  mul
  stloc tmp0

  ldc.i4 2
  ldarg x
  mul
  stloc tmp1

  ldloc tmp0
  ldloc tmp1
  sub
  stloc tmp2

  ldloc tmp2
  ldc.i4 99
  sub
  stloc tmp3

  ldloc tmp3
  ret
}

.method static public void Main(string[] args) cil managed {
.entrypoint
//
ldstr "rtfind2(lam x => x*x + x - 6) = "
call void [mscorlib]System.Console::Write(string)
ldnull
ldftn int32 Postiats.rtfind2::poly0(int32)
newobj instance void class [mscorlib]System.Func`2<int32,int32>::.ctor(object, native int)
call int32 Postiats.rtfind2::rtfindf([mscorlib]System.Delegate)
call void [mscorlib]System.Console::Write(int32)
call void [mscorlib]System.Console::WriteLine()
//
ldstr "rtfind2(lam x => x*x - x - 6) = "
call void [mscorlib]System.Console::Write(string)
ldnull
ldftn int32 Postiats.rtfind2::poly1(int32)
newobj instance void class [mscorlib]System.Func`2<int32,int32>::.ctor(object, native int)
call int32 Postiats.rtfind2::rtfindf([mscorlib]System.Delegate)
call void [mscorlib]System.Console::Write(int32)
call void [mscorlib]System.Console::WriteLine()
//
ldstr "rtfind2(lam x => x*x + 2*x - 99) = "
call void [mscorlib]System.Console::Write(string)
ldnull
ldftn int32 Postiats.rtfind2::poly2(int32)
newobj instance void class [mscorlib]System.Func`2<int32,int32>::.ctor(object, native int)
call int32 Postiats.rtfind2::rtfindf([mscorlib]System.Delegate)
call void [mscorlib]System.Console::Write(int32)
call void [mscorlib]System.Console::WriteLine()
//
ldstr "rtfind2(lam x => x*x - 2*x - 99) = "
call void [mscorlib]System.Console::Write(string)
ldnull
ldftn int32 Postiats.rtfind2::poly3(int32)
newobj instance void class [mscorlib]System.Func`2<int32,int32>::.ctor(object, native int)
call int32 Postiats.rtfind2::rtfindf([mscorlib]System.Delegate)
call void [mscorlib]System.Console::Write(int32)
call void [mscorlib]System.Console::WriteLine()
//
ret
} // end of [Main]

%} // end of [%{$]

(* ****** ****** *)

(* end of [rtfind2.dats] *)
