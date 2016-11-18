(*
** For testing ats2cpp
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)

%{^
//
#include <vector>
//
#define \
fvectorptr(eltype) std::vector<eltype>*
//
#define \
fvectorptr_int_new() new std::vector<int>()
//
#define \
fvectorptr_int_get_at(p0, i) \
  (*(static_cast<std::vector<int>*>(p0)))[i]
//
#define \
fvectorptr_int_push_back(p0, elt) \
  static_cast<std::vector<int>*>(p0)->push_back(elt)
//
%} // end of [%{^]

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
absvtype
vectorptr(a:t@ype) = $extype"fvectorptr"(a)
//
extern
fun
{a:t@ype}
vectorptr_new(): vectorptr(a)
extern
fun
{a:t@ype}
vectorptr_get_at(!vectorptr(a), int): a
extern
fun
{a:t@ype}
vectorptr_push_back(!vectorptr(a), a): void
//
implement
vectorptr_new<int>() =
  $extfcall(vectorptr(int), "fvectorptr_int_new")
implement
vectorptr_get_at<int>
  (p0, i) = let
  val p0 = $UNSAFE.castvwtp1{ptr}(p0)
in
  $extfcall(int, "fvectorptr_int_get_at", p0, i)
end // end of [vectorptr_get_at]
implement
vectorptr_push_back<int>
  (p0, x) = let
  val p0 = $UNSAFE.castvwtp1{ptr}(p0)
in
  $extfcall(void, "fvectorptr_int_push_back", p0, x)
end // end of [vectorptr_push_back]
//
(* ****** ****** *)
//
extern
fun
fact(n: int): int = "ext#"
//
(* ****** ****** *)

implement
fact(n) = let
  val p0 =
    vectorptr_new<int>()
  // end of [val]
  val () = loop(p0, 0) where
  {
    fun
    loop
    (
      p0: !vectorptr(int), i: int
    ) : void =
      if i < n then (vectorptr_push_back<int>(p0, i+1); loop(p0, i+1))
    // end of [loop]
  }
  val res = loop(p0, 0, 1) where
  {
    fun
    loop
    (
      p0: !vectorptr(int), i: int, res: int
    ) : int =
      if i < n then loop(p0, i+1, res * vectorptr_get_at<int>(p0, i)) else res
    // end of [loop]
  }
  prval () = $UNSAFE.cast2void(p0)
in
  res
end // end of [fact]

(* ****** ****** *)

(*
implement
main0() =
println! ("fact(10) = ", fact(10))
*)

(* ****** ****** *)

%{$

int main()
{
  printf("fact(10) = %i\n", fact(10)); return 0;
}

%} // end of [%{$]

(* ****** ****** *)

(* end of [test02.dats] *)
