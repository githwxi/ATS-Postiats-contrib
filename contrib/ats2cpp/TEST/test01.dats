(*
** For testing ats2cpp
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
extern
fun
fact(n: int): int = "ext#"
//
implement
fact(n) = if n > 0 then n * fact(n-1) else 1
//
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

(* end of [test01.dats] *)
