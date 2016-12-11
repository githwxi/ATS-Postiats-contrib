(* ****** ****** *)
//
// HX-2016-12:
// For testing
// STL/deque_queue
//
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#staload
"./../DATS/deque_queue.dats"
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
val Q0 =
  queue_make_nil<int>()
//
val-(0) = sz2i(length(Q0))
//
val () = Q0.insert(1)
//
val-(1) = sz2i(length(Q0))
//
val () = Q0.insert(2)
//
val-(2) = sz2i(length(Q0))
//
val-(1) = Q0.takeout()
//
val (1) = sz2i(length(Q0))
//
val-(2) = Q0.takeout()
//
val (0) = sz2i(length(Q0))
//
val ((*freed*)) = queue_free_nil(Q0)
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
std::cout << "Hello from [test_deque_queue]!" << std::endl;
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

(* end of [test_deque_queue.dats] *)
