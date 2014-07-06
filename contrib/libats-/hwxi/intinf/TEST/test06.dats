(*
**
//
// Generic factorial
//
** Author: Hongwei Xi
** Authoremail: hwxi AT gmail DOT com
** Start Time: July, 2014
**
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./../SATS/intinf.sats"
staload "./../SATS/intinf_t.sats"

(* ****** ****** *)
//
staload "./../DATS/gintinf_t.dats"
//
staload _ = "./../DATS/intinf_t.dats"
staload _ = "./../DATS/intinf_vt.dats"
//
(* ****** ****** *)

extern
fun{a:t@ype} gfib (x: int): a

(* ****** ****** *)

implement
{a}(*tmp*)
gfib (x) = let
//
macdef ggt = ggt_val<a>
//
macdef gadd = gadd_val<a>
//
macdef gint = gnumber_int<a>
//
fun loop (x: int, res1: a, res2: a): a =
  if x >= 1 then loop (x-1, res2, res1 \gadd res2) else res1
//
in
  loop (x, gint(0), gint(1))
end // end of [gfib]

(* ****** ****** *)

implement
main0 () =
{
//
val out = stdout_ref
val () = fprintln! (out, "fib(100) = ", gfib<intinf> (1000))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test06.dats] *)
