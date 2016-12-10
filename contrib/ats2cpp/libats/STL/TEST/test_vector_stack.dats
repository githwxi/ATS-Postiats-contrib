(* ****** ****** *)
//
// HX-2016-12:
// For testing STL/vector_stack
//
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#staload
"./../DATS/vector_stack.dats"
//
(* ****** ****** *)

extern
fun
mytest(): void = "mac#"
//
implement
mytest() =
{
//
val S0 = stack_make_nil<int>()
//
val () = S0.insert(1)
val () = S0.insert(2)
val-(2) = S0.takeout()
val-(1) = S0.takeout()
//
val ((*freed*)) = stack_free_nil(S0)
//
} (* end of [mytest] *)

(* ****** ****** *)
//
%{$
//
#include <iostream>
//
int
main(int argc, int argv)
{
//
std::cout << "Hello from [test_vector_stack]!" << std::endl;
//
mytest();
//
return 0;
//
} /* end of [main0] */
//
%} // end of [%{^]
//
(* ****** ****** *)

(* end of [test_vector_stack.dats] *)
