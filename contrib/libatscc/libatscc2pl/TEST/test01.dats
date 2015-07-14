(* ****** ****** *)
//
// For testing libatscc2pl
//
(* ****** ****** *)
//
#include "./../staloadall.hats"
//
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "test01_dynload"
#define
ATS_STATIC_PREFIX "test01__"
//
(* ****** ****** *)

val () = repeat(3, $delay(println!("Hello, world!")))
val () = (3).foreach()(lam(i) =<cloref1> println!(i, ": Hello, world!"))

(* ****** ****** *)

%{^
//
require "./../libatscc2pl_all.pl";
//
%} // end of [%{^]

(* ****** ****** *)

%{$
test01_dynload();
%} // end of [%{$]

(* ****** ****** *)

(* end of [test01.dats] *)