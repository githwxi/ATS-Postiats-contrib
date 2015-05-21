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
staload
"{$LIBATSCC2CIL}/SATS/basics_cil.sats"
//
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "refcount_dynload"
//
(* ****** ****** *)
//
datatype MyTuple(a:t@ype) = Tup of (a, a)
fun myfun {a:t@ype} (x : a) : MyTuple (a) = Tup (x, x)
fun myfun2 {a,b:t@ype} (x : MyTuple (a), f : a -> b) : b = let
  val+Tup (a,b) = x
in
  f a
end
////
//
extern
fun
refcount : () -> int = "ext#refcount"
//
local
//
val theCount = ref{int}(0)
//
in
//
implement
refcount () = let
  val n = theCount[]; val () = theCount[] := n+1 in n
end // end of [refcount]
//
end // end of [local]

(* ****** ****** *)

val () = println! ("refcount() = ", refcount())
val () = println! ("refcount() = ", refcount())
val () = println! ("refcount() = ", refcount())
val () = println! ("refcount() = ", refcount())
val () = println! ("refcount() = ", refcount())

(* ****** ****** *)

%{$

.method static public void Main() {
.entrypoint

call void Postiats.refcount::refcount_dynload()

ret

} // end of [Main]

%} // end of [%{$]

(* ****** ****** *)

(* end of [refcount.dats] *)
