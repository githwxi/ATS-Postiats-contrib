(* ****** ****** *)
//
// For testing libatscc2php
//
(* ****** ****** *)
//
#include
"./../staloadall.hats"
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
val () = foreach(3, lam(i) =<cloref1> println!(i, ": Hello, world!"))

(* ****** ****** *)

%{$
include "./../libatscc2php_all.php";
%} // end of [%{$]

(* ****** ****** *)

%{$
test01_dynload();
%} // end of [%{$]

(* ****** ****** *)

(* end of [test01.dats] *)