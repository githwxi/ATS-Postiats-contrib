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
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
listlen
  : List0 (a) -> int
//
implement{a}
listlen
  (xs) = let
//
prval () = lemma_list_param (xs)
//
fun
loop{i,j:nat} .<i>.
(
  xs: list (a, i), res: int(j)
) : int(i+j) = let
//
in
//
case+ xs of
| list_nil () => res | list_cons (_, xs) => loop (xs, res+1)
//
end // end of [loop]
//
in
  loop (xs, 0)
end // end of [listlen]
//
(* ****** ****** *)
//
extern
fun listlenf : List0 int -> int = "ext#"
//
implement
  listlenf (xs) = listlen<int> (xs)
// end of [listlenf]
//
(* ****** ****** *)
//
extern
fun
fromto
  : (int, int) -> List0 (int) = "ext#fromto"
//
implement
fromto (m, n) =
if m < n
  then list_cons (m, fromto (m+1, n)) else list_nil ()
// end of [if]
//
(* ****** ****** *)

%{$

.method static public void Main() {
.entrypoint
.locals (object xs)

ldc.i4 0
ldc.i4 10
call object Postiats.listlen::fromto(int32, int32)
stloc xs

ldstr "listlen("
call void [mscorlib]System.Console::Write(string)
ldloc xs
call void [mscorlib]System.Console::Write(object)
ldstr ") = "
call void [mscorlib]System.Console::Write(string)

ldloc xs
call int32 Postiats.listlen::listlenf(object)
call void [mscorlib]System.Console::Write(int32)
call void [mscorlib]System.Console::WriteLine()

ret
} // end of [Main]

%} // end of [%{$]

(* ****** ****** *)

(* end of [listlen.dats] *)
