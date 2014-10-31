(* ****** ****** *)
//
// AS-2014-10:
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
typedef cfun (a:t0p, b:t0p) = a -<cloref1> b
//
extern
fun
{a:t0p}
{b:t0p}
list_map{n:int}
  (xs: list(a, n), f: cfun(a, b)): list (b, n) = "ext#%"
//
implement{a}{b}
list_map{n} (xs, f) =
(
case+ xs of
| list_nil () => list_nil ()
| list_cons (x, xs) => list_cons (f(x), list_map (xs, f))
) (* end of [list_map] *)
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
//
extern
fun
test : (int, int) -> List0(int) = "ext#test"
//
implement
test (m, n) = let
  val xs = fromto (m, n)
in
  list_map<int><int> (xs, lam x => m * n * x)
end // end of [test]
//
(* ****** ****** *)
//
extern
fun
test_printed : (int, int) -> void = "ext#test_printed"
//
implement
test_printed (m, n) = let
//
  fun aux (xs: List0 (int)): void =
    case+
    xs of
    | list_cons (x, xs) =>
      (
        print(x);
        print_newline ();
        aux (xs)
      ) (* end of [list_cons] *)
    | list_nil () => ()
  // end of [aux]
//
  val xs = test (m, n)
in
  aux (xs)
end // end of [test]
//
(* ****** ****** *)

%{$

.method static public void Main() {
.entrypoint

ldstr "test(5, 10) = "
call void [mscorlib]System.Console::Write(string)
ldc.i4 5
ldc.i4 10
call void Postiats.listmap::test_printed(int32, int32)

ret
} // end of [Main]

%} // end of [%{$]

(* ****** ****** *)

(* end of [listmap.dats] *)
